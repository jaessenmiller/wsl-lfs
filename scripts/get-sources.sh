#!/bin/bash

. ./config.sh

if [ -d "$LFS/sources" ]; 
then
    cd $LFS/sources;
    wget -c http://www.linuxfromscratch.org/lfs/view/stable/wget-list;
    wget --input-file=wget-list --continue --directory-prefix=$LFS/sources;
else
    echo "$LFS/sources doesn't exist"
fi
