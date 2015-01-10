#!/bin/bash
source ./cross-compiler-settings
export ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE
ls
J=6
make clean && make mrproper && make distclean
make Enigma_TAP_defconfig
make -j $J
cat './arch/arm/boot/zImage' > './AACOMPILE/zImage_tipo'
cd AACOMPILE
./ELFZIPKERN_tipo.sh
read -p "Check AACOMPILE directory for compiled zip. If it does not exist then kernel did not compile succesfully. Press [Enter] to exit."
