#!/bin/bash

cd "$LFS/sources"
tar -xzvf binutils-2.30.tar.xz
cd binutils-2.30
mkdir -v build
cd build
../configure --prefix=/tools            \
             --with-sysroot=$LFS        \
             --with-lib-path=/tools/lib \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror;
make

case $(uname -m) in 
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac
make install
