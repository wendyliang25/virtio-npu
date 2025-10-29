#!/bin/bash

# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2025, Advanced Micro Devices, Inc.
#

source_path=$(cd "$(dirname -- "$0")"; pwd)

qemu_dir="$source_path/qemu"
virgl_dir="$source_path/virglrenderer"

$(source_path)/build-virglrenderer.sh
if [ $? -ne 0 ]; then
    echo "Failed to build virglrenderer"
    exit 255
fi

$(source_path)/build-qemu.sh
if [ $? -ne 0 ]; then
    echo "Failed to build QEMU"
    exit 255
fi
