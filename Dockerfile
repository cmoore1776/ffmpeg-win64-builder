FROM --platform=linux/amd64 ubuntu:20.04

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
    libc6-dev \
    libglib2.0-0 \
    libtool \
    lsb-release \
    make \
    meson \
    mingw-w64 \
    nasm \
    p7zip-full \
    pax \
    pkg-config \
    python-is-python3 \
    python3-distutils \
    python3-setuptools \
    ragel \
    subversion \
    texinfo \
    unzip \
    wget \
    yasm \
    zlib1g-dev && \
  git clone https://github.com/rdp/ffmpeg-windows-build-helpers.git && \
  sed -i 's/config_options+=" --enable-libsvthevc"/# config_options+=" --enable-libsvthevc"/' /ffmpeg-windows-build-helpers/cross_compile_ffmpeg.sh && \
  sed -i 's/generic_configure "--build=\$host_target"/generic_configure "--host=\$host_target"/' /ffmpeg-windows-build-helpers/cross_compile_ffmpeg.sh && \
  sed -i 's#libwebp_git "origin/main"#libwebp_git v1.2.4#' /ffmpeg-windows-build-helpers/cross_compile_ffmpeg.sh && \
  sed -i 's#rdp/amf_headers.git#GPUOpen-LibrariesAndSDKs/AMF.git#' /ffmpeg-windows-build-helpers/cross_compile_ffmpeg.sh && \
  chmod +x /entrypoint.sh && \
  rm -rf /var/lib/apt/lists/

ENTRYPOINT [ "/entrypoint.sh" ]