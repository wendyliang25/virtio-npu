#!/bin/bash

set -x

PREFIX=/usr/local
SRC_DIR=weston

cd ${SRC_DIR}
meson setup build --prefix=${PREFIX} \
  -Dbackend-rdp=false \
  -Dbackend-pipewire=false \
  -Dbackend-x11=false \
  -Dxwayland=false \
  -Dremoting=false \
  -Dpipewire=false \
  -Dcolor-management-lcms=false \
  -Dbackend-drm-screencast-vaapi=false \
  -Ddemo-clients=false \

ninja -C build
ninja -C build install
