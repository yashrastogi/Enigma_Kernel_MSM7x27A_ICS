ls
export ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
make clean && make mrproper
make Enigma_TAP_defconfig
make -j 6
cat './arch/arm/boot/zImage' > './AACOMPILE/zImage_tipo'
cd AACOMPILE
./ELFZIPKERN_tipo.sh
