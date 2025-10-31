#!/bin/bash

source_path=$(cd "$(dirname -- "$0")"; pwd)
qemu_dir="$source_path/qemu"

QEMU_CONF_OPTS=" \
  --target-list=x86_64-softmmu \
  --enable-opengl \
  --enable-virglrenderer \
  --enable-wayland \
  --enable-sdl \
"

pkgconf_dir=`find $source_path/build | grep pkgconfig$`
cd $qemu_dir
PKG_CONFIG_PATH=$pkgconf_dir			\
./configure ${QEMU_CONF_OPTS}
make -j${nproc}
