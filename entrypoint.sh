#!/bin/bash -e

cd ffmpeg-windows-build-helpers

./cross_compile_ffmpeg.sh \
  --build-ffmpeg-shared=y \
  --build-ffmpeg-static=y \
  --build-intel-qsv=y \
  --build-ismindex=n \
  --build-svt-hevc=y \
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