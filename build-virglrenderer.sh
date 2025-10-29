#!/bin/bash

# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2025, Advanced Micro Devices, Inc.
#

source_path=$(cd "$(dirname -- "$0")"; pwd)
virgl_dir="$source_path/virglrenderer"
IS_REBUILD=0
MESON_CONFIG_CMD=setup

ARGS=$(getopt -o r --long rebuild -n "$0" -- "$@")

if [ $? -ne 0 ]; then
  echo "Error parsing options" >&2
  exit 255
fi

eval set -- "$ARGS"

while true; do
  case "$1" in
    -r|--rebuild)
      IS_REBUILD=1
      shift
      ;;
    --)
      shift;
      break
      ;;
    *)
      echo "Invalid option: $1" >&2
      exit 255
      ;;
  esac
done

if [ ${IS_REBUILD} -eq 1 ]; then
  MESON_CONFIG_CMD=configure
fi

set -x
cd $virgl_dir
meson ${MESON_CONFIG_CMD} build \
  --prefix $source_path/build \
  -Ddrm-renderers=amdxdna \
  -Dplatforms=egl \
  -Dminigbm_allocation=false \
  -Dhsakmt-amdgpu-experimental=false \

cd build
ninja install
