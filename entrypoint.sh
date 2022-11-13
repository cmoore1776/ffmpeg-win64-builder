#!/bin/bash -e

cd ffmpeg-windows-build-helpers

./cross_compile_ffmpeg.sh \
  --build-amd-amf=y \
  --build-dependencies=y \
  --build-dvbtee=n \
  --build-ffmpeg-shared=y \
  --build-ffmpeg-static=y \
  --build-intel-qsv=y \
  --build-ismindex=n \
  --build-libmxf=n \
  --build-lsw=n \
  --build-mp4box=n \
  --build-mplayer=n \
  --build-svt=y \
  --build-vlc=n \
  --build-x264-with-libav=n \
  --compiler-flavors=win64 \
  --disable-nonfree=n \
  --enable-gpl=y \
  --ffmpeg-git-checkout-version=master \
  --ffmpeg-git-checkout=https://github.com/FFmpeg/FFmpeg.git \
  --gcc-cpu-count=$(nproc) \
  --git-get-latest=y \
  --prefer-stable=y \
  --sandbox-ok=y \
  --x265-git-checkout-version=master

cp -R /ffmpeg-windows-build-helpers/sandbox/win64/ffmpeg_git_with_fdk_aac_master_shared/bin /host