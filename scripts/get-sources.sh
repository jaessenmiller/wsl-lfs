#!/bin/bash

./config.sh

if( -d $LFS/sources) {
    cd $LFS/sources
    wget -c http://www.linuxfromscratch.org/lfs/view/stable/wget-list
    wget --input-file=wget-list --continue --directory-prefix=$LFS/sources
}