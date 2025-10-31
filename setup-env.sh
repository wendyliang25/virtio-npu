PATH_ROOT=/scratch1/wendy
PREFIX_ROOT=${PATH_ROOT}/usr/local

export PKG_CONFIG_PATH=${PREFIX_ROOT}/lib/x86_64-linux-gnu/pkgconfig:/${PREFIX_ROOT}/lib/pkgconfig:${PREFIX_ROOT}/share/pkgconfig:${PKT_CONFIG_PATH}
export LD_LIBRARY_PATH=${PREFIX_ROOT}/lib/x86_64-linux-gnu:${PREFIX_ROOT}/lib:${LD_LIBRARY_PATH}
export CMAKE_PREFIX_PATH=${PREFIX_ROOT}:${CMAKE_PREFIX_PATH}
export PATH=${PREFIX_ROOT}/bin:${PATH}
