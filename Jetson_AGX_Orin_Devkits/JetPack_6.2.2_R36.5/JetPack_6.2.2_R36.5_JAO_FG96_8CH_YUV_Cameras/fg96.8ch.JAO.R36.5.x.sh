#!/bin/bash
<<COMMENT
#
# 2025-06-10 AGX Orin JetPack6.x 固件升级脚本V1.0_方竹科技
#
COMMENT

clear
str_ver0="# R36 (release), REVISION: 5.0"
str_ver3="# R36 (release), REVISION: 5.3"
str_ver4="# R36 (release), REVISION: 5.4"
str_ver7="# R36 (release), REVISION: 5.7"

red_print() {
    echo -e "\e[1;31m$1\e[0m"
}

green_print() {
    echo -e "\e[1;32m$1\e[0m"
}

red_print "------------FG96-8CH AGX Orin Devkit 固件升级Firmware Upgrade----------------------"
echo ''

str=$(cat /etc/nv_tegra_release)
if [[ $str == *$str_ver0* ]]; then
	echo $str_ver
	green_print 'JetPack is corret, JetPack版本匹配自动升级'
else
	if [[ $str == *$str_ver3* ]]; then
		echo $str_ver
		green_print 'JetPack R36.5.3 is corret, JetPack版本匹配自动升级'
	else
		if [[ $str == *$str_ver4* ]]; then
			echo $str_ver
			green_print 'JetPack R36.5.4 is corret, JetPack版本匹配自动升级'
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
sudo rm /usr/local/bin/fzcam_cfg 
sudo rm /usr/local/bin/fzcam_ui
sudo cp fzcam_app/usr/local/bin/fzcam_cfg /usr/local/bin/
sudo cp fzcam_app/usr/local/bin/fzcam_ui /usr/local/bin/
sudo chmod +x /usr/local/bin/fzcam_ui
sudo chmod +x /usr/local/bin/fzcam_cfg

sudo cp fzcam_app/fzcam_cfg.service /etc/systemd/system/
sudo chmod 644 /etc/systemd/system/fzcam_cfg.service 
sudo systemctl enable  /etc/systemd/system/fzcam_cfg.service 
sudo systemctl daemon-reload

sudo cp rootfs/boot/tegra234-p3737-camera-fzcam-fg96-8ch-4lanes.dtbo /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH"

green_print 'Upgrade FW success, please press Enter to reboot Jetson Orin'
read key

sudo reboot

