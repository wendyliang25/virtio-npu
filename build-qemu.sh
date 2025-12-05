#!/bin/bash

source_path=$(cd "$(dirname -- "$0")"; pwd)
qemu_dir="$source_path/qemu"

export CFLAGS="-I/opt/xilinx/xrt/include"
export LDFLAGS="-L/opt/xilinx/xrt/lib"
export PKG_CONFIG_PATH="/opt/xilinx/xrt/lib/pkgconfig:$PKG_CONFIG_PATH"
QEMU_CONF_OPTS=" \
  --target-list=x86_64-softmmu \
  --enable-kvm \
  --enable-opengl \
  --enable-virglrenderer \
  --enable-wayland \
  --enable-sdl \
  --enable-drm-accel \
"

pkgconf_dir=`find $source_path/build | grep pkgconfig$`
cd $qemu_dir
PKG_CONFIG_PATH=$pkgconf_dir:${PKG_CONFIG_PATH}			\
./configure ${QEMU_CONF_OPTS}
make -j${nproc}
