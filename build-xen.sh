#!/bin/bash

XENDIR=$1
if [ -z "${XENDIR}" ]; then
  XENDIR=xen
fi

cd ${XENDIR}
mkdir build
./configure \
  --enable-githttp \
  --enable-systemd \
  --enable-ovmf \
  '--with-extra-qemu-configure-args=--enable-sdl --enable-opengl --enable-virglrenderer --enable-system --audio-drv-list=pa --enable-libusb --target-list=x86_64-softmmu' \
  --with-system-qemu=/scratch/xen/qemu-xen \
  --with-system-ovmf=/scratch/xen/ovmf \

make O=build -j$(nproc) debball
