#!/usr/bin/env bash
set -ex

if [[ "$target_platform" != "$build_platform" ]]; then
  autoreconf -fvi
fi

mkdir build
pushd build
../configure \
   "--prefix=${PREFIX}" \
   "--with-flex" \
   "--with-bison"

if [[ "$target_platform" == "win-64" ]]; then
  patch_libtool
fi

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check
fi
make install
popd
