#!/bin/bash
source ./cross-compiler-settings
export ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE
ls
J=6
make clean && make mrproper && make distclean
make Enigma_MES_defconfig
make -j $J
cat './arch/arm/boot/zImage' > './AACOMPILE/zImage_miro'
cd AACOMPILE
./ELFZIPKERN_miro.sh
read -p "Check AACOMPILE directory for compiled zip. If it does not exist then kernel did not compile succesfully. Press [Enter] to exit."
