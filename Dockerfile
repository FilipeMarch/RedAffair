FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 \
    ANDROID_HOME=/root/.buildozer/android/platform/android-sdk \
    ANDROID_NDK_HOME=/root/.buildozer/android/platform/android-ndk-r27c \
    ANDROIDNDK=/root/.buildozer/android/platform/android-ndk-r27c \
    ANDROID_NDK=/root/.buildozer/android/platform/android-ndk-r27c \
    PATH="/usr/bin:/usr/local/bin:/bin:/sbin:/usr/sbin" \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk-headless \
    python3.11 \
    python3.11-dev \
    python3.11-venv \
    python3-pip \
    ca-certificates \
    git \
    wget \
    unzip \
    build-essential \
    autoconf \
    automake \
    libtool \
    m4 \
    pkg-config \
    libffi-dev \
    libssl-dev \
    libncurses5 \
    libncurses5-dev \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1

RUN python3.11 -m pip install --upgrade --no-cache-dir \
    pip==24.0 \
    setuptools==70.0.0 \
    wheel==0.42.0

RUN python3.11 -m pip install --no-cache-dir \
    cython==0.29.36 \
    buildozer==1.5.0

RUN mkdir -p /root/.buildozer/android/platform && \
    cd /root/.buildozer/android/platform && \
    wget -q https://dl.google.com/android/repository/android-ndk-r27c-linux.zip && \
    unzip -q android-ndk-r27c-linux.zip && \
    rm android-ndk-r27c-linux.zip

WORKDIR /app
COPY . /app

RUN mkdir -p /root/.buildozer/android/platform/android-sdk/licenses && \
    echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > /root/.buildozer/android/platform/android-sdk/licenses/android-sdk-license

CMD ["/bin/bash", "-c", "cd /app && \
    export PYTHONPATH=/usr/lib/python3.11:/usr/lib/python3/dist-packages && \
    export BUILDOZER_ACCEPT_ROOT_USER=1 && \
    export ANDROID_SDK_ROOT=/root/.buildozer/android/platform/android-sdk && \
    export ANDROID_NDK_ROOT=/root/.buildozer/android/platform/android-ndk-r27c && \
    rm -rf .buildozer/android/build* .buildozer/android/platform/build-* && \
    yes | PYTHON=/usr/bin/python3.11 buildozer android debug 2>&1 | tee build.log && \
    echo '=== BUILD COMPLETE ===' && \
    ls -lh bin/*.apk || echo 'APK not found'"]
