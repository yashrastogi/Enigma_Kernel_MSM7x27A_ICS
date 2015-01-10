#!/bin/bash
source ./cross-compiler-settings
export ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE
echo 'Starting source code cleaner...'
make clean
echo '10%'
echo '24% '
echo '33% '
make mrproper
echo '41% '
echo '48% '
echo '58% '
make distclean
echo '67% '
echo '74% '
echo '100% '
read -p 'Press [Enter] to exit...'
ls -l
