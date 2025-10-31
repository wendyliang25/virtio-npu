#!/bin/bash

set -x

PREFIX=/scratch1/wendy/usr/local
SRC_DIR=weston

cd ${SRC_DIR}
meson setup build --prefix=${PREFIX}
ninja -C build
ninja -C build install
