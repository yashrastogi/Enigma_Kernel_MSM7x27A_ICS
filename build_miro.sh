ls
find ./ -name '*~' | xargs rm
export ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
make clean && make mrproper && make distclean
make Enigma_MES_defconfig
make -j 6
cat './arch/arm/boot/zImage' > './AACOMPILE/zImage_miro'
cd AACOMPILE
./ELFZIPKERN_miro.sh
