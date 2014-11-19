find ./ -name '*~' | xargs rm
export ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
echo ' '
make clean
echo ' '
echo ' '
echo ' '
make mrproper
echo ' '
echo ' '
echo ' '
make distclean
echo ' '
echo ' '
echo ' '
ls -l
