FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV BUILDOZER_ACCEPT_ROOT_USER=1
ENV ANDROID_ACCEPT_SDK_LICENSE=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-17-jdk-headless \
    python3.14 python3.14-dev python3.14-venv python3-pip \
    git wget unzip build-essential autoconf automake libtool \
    pkg-config libffi-dev libssl-dev libncurses5-dev libjpeg-dev zlib1g-dev \
    lib32stdc++6 lib32z1 libncurses5 libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash builder

USER builder
WORKDIR /home/builder

RUN python3.14 -m venv /home/builder/venv && \
    /home/builder/venv/bin/pip install --upgrade pip setuptools wheel && \
    /home/builder/venv/bin/pip install git+https://github.com/kivy/buildozer.git@master

ENV PATH="/home/builder/venv/bin:$PATH"

COPY . /home/builder/app
WORKDIR /home/builder/app

CMD ["bash", "-c", "buildozer android debug"]