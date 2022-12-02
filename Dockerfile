FROM --platform=amd64 ubuntu:20.04

VOLUME [ "/host" ]

COPY entrypoint.sh /

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt update && \
  apt install -y \
    autoconf \
    autoconf-archive \
    autogen \
    automake \
    bison \
    bzip2 \
    clang \
    cmake \
    curl \
    cvs \
    ed \
    flex \
    g++ \
    gcc \
    git \
    gperf \
    libavresample-dev \
    libtool \
    lsb-release \
    make \
    meson \
    nasm \
    p7zip-full \
    pax \
    pkg-config \
    python-is-python3 \
    python3-distutils \
    ragel \
    subversion \
    texinfo \
    unzip \
    wget \
    yasm \
    zlib1g-dev && \
  git clone https://github.com/rdp/ffmpeg-windows-build-helpers.git && \
  sed -i 's/config_options+=" --enable-libsvthevc"/# config_options+=" --enable-libsvthevc"/' /ffmpeg-windows-build-helpers/cross_compile_ffmpeg.sh && \
  chmod +x /entrypoint.sh && \
  rm -rf /var/lib/apt/lists/

ENTRYPOINT [ "/entrypoint.sh" ]