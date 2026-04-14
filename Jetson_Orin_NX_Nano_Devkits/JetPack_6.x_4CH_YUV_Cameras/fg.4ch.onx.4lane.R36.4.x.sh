#!/bin/bash
<<COMMENT
#
# 2024-06-30 Orin NX/Nano and CVB Orin firmware upgrade shell v1.0 
# 2024-06-30 Orin NX/Nano and CVB Orin 固件升级脚本V1.0 
#
COMMENT

clear
str_ver0="# R36 (release), REVISION: 4.0"
str_ver3="# R36 (release), REVISION: 4.3"
str_ver4="# R36 (release), REVISION: 4.4"
str_ver7="# R36 (release), REVISION: 4.7"

red_print() {
    echo -e "\e[1;31m$1\e[0m"
}

green_print() {
    echo -e "\e[1;32m$1\e[0m"
}

red_print "------------Orin NX-16/8GB and Nano-8/4GB FG24/FG12-4CH Firmware Upgrade 固件升级----------------------"
echo ''

str=$(cat /etc/nv_tegra_release)
if [[ $str == *$str_ver0* ]]; then
	echo $str_ver0
	green_print 'JetPack is corret, JetPack版本匹配自动升级'
else
	if [[ $str == *$str_ver3* ]]; then
		echo $str_ver3
		green_print 'JetPack R36.4.3 is corret, JetPack版本匹配自动升级'
	else
		if [[ $str == *$str_ver4* ]]; then
			echo $str_ver4
			green_print 'JetPack R36.4.4 is corret, JetPack版本匹配自动升级'
		else
			if [[ $str == *$str_ver7* ]]; then
				echo $str_ver7
				green_print 'JetPack R36.4.7 is corret, JetPack版本匹配自动升级'
			else
				red_print 'JetPack is not corret check and run again, JetPack版本不匹配,检查后再运行'
				exit
			fi
		fi
	fi
fi

green_print 'Press Enter to continue'
read key

echo '' 
sudo cp rootfs/lib/modules/$(uname -r)/updates/drivers/media/i2c/fzcam.ko /lib/modules/$(uname -r)/updates/drivers/media/i2c/
sudo insmod /lib/modules/$(uname -r)/updates/drivers/media/i2c/fzcam.ko
sudo depmod

sudo cp fzcam_app/etc/fzcam_cfg.ini /etc/
sudo cp fzcam_app/usr/local/bin/fzcam_cfg.4lane /usr/local/bin/fzcam_cfg
sudo cp fzcam_app/usr/local/bin/fzcam_ui /usr/local/bin/
sudo chmod +x /usr/local/bin/fzcam_ui
sudo chmod +x /usr/local/bin/fzcam_cfg

sudo cp fzcam_app/fzcam_cfg.service /etc/systemd/system/
sudo chmod 644 /etc/systemd/system/fzcam_cfg.service 
sudo systemctl enable  /etc/systemd/system/fzcam_cfg.service 
sudo systemctl daemon-reload

sudo cp rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dtbo /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Camera FG-4CH-4Lanes-YUV"

green_print 'Please press and key to reboot Jetson, after setting dtbo'
read key

sudo reboot

