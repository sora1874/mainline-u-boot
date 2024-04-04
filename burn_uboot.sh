#!/bin/sh
echo "will burn uboot.bin"


#  参考链接
#
#https://docs.u-boot.org/en/latest/board/rockchip/rockchip.html
#


sudo dd if=u-boot-rockchip.bin of=/dev/sda seek=64
sync



##
##
## dd if=idbloader.img of=rkspi_loader_sata.img seek=64 conv=notrunc
## dd if=u-boot.itb of=rkspi_loader_sata.img seek=16384 conv=notrunc
##
## dd if=idbloader.img of=/dev/mmcblk1 seek=64 conv=notrunc
## dd if=u-boot.itb of=/dev/mmcblk1 seek=16384 conv=notrunc
