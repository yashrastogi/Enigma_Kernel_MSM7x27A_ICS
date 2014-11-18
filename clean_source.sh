find ./ -name '*~' | xargs rm
export ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
make clean
make mrproper
ls -l
