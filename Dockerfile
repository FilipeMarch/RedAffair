FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_NDK_VERSION=28.0.12433566
ENV BUILD_TOOLS=35.0.0
ENV ANDROID_API=33
ENV BUILDOZER_ACCEPT_ROOT_USER=1

# Tell p4a to use system libffi (skip autotools nightmare)
ENV LIBFFI_USE_SYSTEM=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk-headless \
    python3.10 python3.10-dev python3.10-venv python3-pip \
    git wget unzip zip curl \
    build-essential autoconf automake libtool \
    pkg-config libffi-dev libssl-dev libncurses5-dev libjpeg-dev zlib1g-dev \
    lib32stdc++6 lib32z1 ccache \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1 && \
    update-alternatives --set python3 /usr/bin/python3.10

RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && \
    cd $ANDROID_SDK_ROOT/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-12266719_latest.zip -O tools.zip && \
    unzip -q tools.zip && \
    mv cmdline-tools latest && \
    rm tools.zip

ENV PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH

RUN SDKMANAGER="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" && \
    sed -i "s|^JAVA_CMD=\"java\"|JAVA_CMD=\"$JAVA_HOME/bin/java\"|" "$SDKMANAGER"

RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses && \
    sdkmanager --sdk_root=$ANDROID_SDK_ROOT \
      "platform-tools" \
      "platforms;android-${ANDROID_API}" \
      "build-tools;${BUILD_TOOLS}" \
      "ndk;${ANDROID_NDK_VERSION}"

RUN mkdir -p /root/.buildozer/android/platform && \
    ln -sf $ANDROID_SDK_ROOT /root/.buildozer/android/platform/android-sdk && \
    ln -sf $ANDROID_SDK_ROOT/cmdline-tools/latest /root/.buildozer/android/platform/android-sdk/tools && \
    ln -sf $ANDROID_SDK_ROOT/ndk/$ANDROID_NDK_VERSION /root/.buildozer/android/platform/android-ndk-r28c

RUN python3 -m pip install --upgrade pip setuptools wheel && \
    python3 -m pip install git+https://github.com/kivy/buildozer.git@master

WORKDIR /app
COPY . /app

CMD ["bash", "-c", "set -o pipefail && yes | buildozer -v android debug 2>&1 | tee build.log"]