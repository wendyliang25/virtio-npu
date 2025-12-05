#!/bin/bash

set -x

PREFIX=/usr/local
SRC_DIR=drm

cd ${SRC_DIR}
meson setup build --prefix=${PREFIX}
ninja -C build install
