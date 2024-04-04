#!/bin/bash

DEFAULE_CONFIG=rock-3a-rk3568_defconfig

if [[ $1 == "rock-3a" ]]
then
	DEFAULE_CONFIG=rock-3a-rk3568_defconfig
	echo "select rock 3a, config is ${DEFAULE_CONFIG}"
	export ROCKCHIP_TPL=/home/sora/sora_samba/05_radxa/rkbin/bin/rk35/rk3568_ddr_1560MHz_v1.21.bin
	export BL31=/home/sora/sora_samba/05_radxa/rkbin/bin/rk35/rk3568_bl31_v1.44.elf
elif [[ $1 == "rock-3c" ]]
then
	DEFAULE_CONFIG=unlasting-rock3c_defconfig
	export ROCKCHIP_TPL=/home/sora/sora_samba/05_radxa/rkbin/bin/rk35/rk3566_ddr_1056MHz_v1.21.bin
	export BL31=/home/sora/sora_samba/05_radxa/rkbin/bin/rk35/rk3568_bl31_v1.44.elf
	echo "select rock 3c, config is ${DEFAULE_CONFIG}"
else
	echo "err!"
fi

function build_func {
	if [[ $1 == "clean" ]]
	then
		echo "============ clean source code ============"
		# make mrproper
		make clean
		make disclean
	else
		echo "============ start build ============"
		make CROSS_COMPILE=aarch64-linux-gnu- ${DEFAULE_CONFIG}
		make CROSS_COMPILE=aarch64-linux-gnu- --jobs="$(nproc)" all
	fi
}



########## build ###########
if [[ $2 == "clean" ]]
then
	build_func clean
else
	build_func
fi
