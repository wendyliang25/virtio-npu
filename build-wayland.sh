#!/bin/bash

set -x

PREFIX=/usr/local
SRC_DIR=wayland

cd ${SRC_DIR}
meson setup build --prefix=${PREFIX} --buildtype=release

ninja -C build install
