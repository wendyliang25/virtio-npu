#!/bin/bash

set -x

PREFIX=/usr/local
SRC_DIR=wayland-protocols

cd ${SRC_DIR}
meson setup build --prefix=${PREFIX} --buildtype=release
ninja -C build
ninja -C build install
