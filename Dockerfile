FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk-headless \
    python3.11 python3.11-dev python3.11-venv python3-pip \
    git wget unzip build-essential autoconf automake libtool m4 \
    pkg-config libffi-dev libssl-dev libncurses5-dev libjpeg-dev zlib1g-dev \
    lib32stdc++6 lib32z1

RUN useradd -m -s /bin/bash builder && \
    echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER builder
WORKDIR /home/builder

RUN python3.11 -m venv /home/builder/venv && \
    /home/builder/venv/bin/pip install --upgrade pip setuptools wheel && \
    /home/builder/venv/bin/pip install buildozer==1.5.0 python-for-android==2024.06.15

ENV ANDROIDNDK_ROOT=/home/builder/.buildozer/android/platform/android-ndk-r27c
RUN mkdir -p $(dirname $ANDROIDNDK_ROOT) && \
    cd $(dirname $ANDROIDNDK_ROOT) && \
    wget -q https://dl.google.com/android/repository/android-ndk-r27c-linux.zip && \
    unzip -q android-ndk-r27c-linux.zip && rm android-ndk-r27c-linux.zip

ENV ANDROID_SDK_ROOT=/home/builder/.buildozer/android/platform/android-sdk
RUN mkdir -p $ANDROID_SDK_ROOT/licenses && \
    echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > $ANDROID_SDK_ROOT/licenses/android-sdk-license && \
    echo "84831b9409646a918e304b584427f8c8" > $ANDROID_SDK_ROOT/licenses/android-sdk-preview-license

COPY . /home/builder/app
WORKDIR /home/builder/app

ENV PATH="/home/builder/venv/bin:$PATH"
ENV BUILDOZER_ACCEPT_ROOT_USER=1
ENV ANDROID_ACCEPT_SDK_LICENSE=1

CMD ["bash", "-c", "buildozer android debug 2>&1 | tee build.log && ls -lh bin/*.apk || true"]
