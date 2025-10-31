#!/bin/bash

set -x

PREFIX=/usr/local
SRC_DIR=amd-SDL

cd ${SRC_DIR}
mkdir -p build
cd build
../configure --prefix=${PREFIX} --enable-video-wayland
make -j$(nproc)
make install
