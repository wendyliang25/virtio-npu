#!/bin/bash

set -x

PREFIX=/scratch1/wendy/usr/local
SRC_DIR=wayland

cd ${SRC_DIR}
meson setup build --prefix=${PREFIX} --buildtype=release
ninja -C build install
