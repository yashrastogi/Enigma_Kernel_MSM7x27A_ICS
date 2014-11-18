now=`date '+%d-%m-%y_%H:%M'`

rm miro_*
python mkelf.py -o miro_$now.elf zImage_miro@0x00208000 ramdisk.cpio.gz@0x01400000,ramdisk bootcmd@cmdline
rm -R modules_miro
mkdir modules_miro
cd ..
find ./ -name "*.ko" -exec cp {} './AACOMPILE/modules_miro/' \;
cd AACOMPILE

rm zImage_miro
rm zipkernel/ENIGKERN.img
cp miro_* zipkernel/ENIGKERN.img
rm -r zipkernel/system/lib/modules
cp -r modules_miro/ zipkernel/system/lib/modules/
rm ENGIMA_miro_*
cd zipkernel
zip -r ENIGMA_miro_$now.zip ./
cd ..
mv zipkernel/ENIGMA_miro_* ./
rm zipkernel/ENIGMA_miro_*
rm miro_*
rm -r zipkernel/system/lib/modules
mkdir zipkernel/system/lib/modules
rm zipkernel/ENIGKERN.img
