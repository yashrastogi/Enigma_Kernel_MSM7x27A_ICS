now=`date '+%d-%m-%y.%H:%M'`

rm tipo_*
python mkelf.py -o tipo_$now.elf zImage_tipo@0x00208000 ramdisk.cpio.gz@0x01400000,ramdisk bootcmd@cmdline
rm -R modules_tipo
mkdir modules_tipo
cd ..
find ./ -name "*.ko" -exec cp {} './AACOMPILE/modules_tipo/' \;
cd AACOMPILE

rm zImage_tipo
rm zipkernel/ENIGKERN.img
cp tipo_* zipkernel/ENIGKERN.img
rm -r zipkernel/system/lib/modules
cp -r modules_tipo/ zipkernel/system/lib/modules/
rm ENGIMA_tipo_*
cd zipkernel
zip -r ENIGMA_tipo_$now.zip ./
cd ..
mv zipkernel/ENIGMA_tipo_* ./
rm zipkernel/ENIGMA_tipo_*
rm tipo_*
rm -r zipkernel/system/lib/modules
mkdir zipkernel/system/lib/modules
rm zipkernel/ENIGKERN.img
