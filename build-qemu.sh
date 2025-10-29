#!/bin/bash

source_path=$(cd "$(dirname -- "$0")"; pwd)
qemu_dir="$source_path/qemu"

QEMU_CONF_OPTS=" \
  --enable-drm-accel --enable-vhost-user --target-list=x86_64-softmmu \
  --enable-opengl \
  --enable-virglrenderer \
  --enable-virtio-gpu-drm-native-context \
  --enable-sdl \
"

pkgconf_dir=`find $source_path/build | grep pkgconfig$`
cd $qemu_dir
PKG_CONFIG_PATH=$pkgconf_dir			\
./configure ${QEMU_CONFIG_OPTS}
make
