FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk-headless \
    python3.11 \
    python3.11-dev \
    python3.11-venv \
    python3-pip \
    git \
    wget \
    unzip \
    build-essential \
    libffi-dev \
    libssl-dev \
    libncurses5 \
    libjpeg-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1

RUN python3.11 -m pip install --upgrade pip setuptools wheel && \
    python3.11 -m pip install cython==0.29.37 buildozer==1.5.0

WORKDIR /app

COPY . /app

CMD ["bash", "-lc", "printf 'y\n' | buildozer android debug"]
