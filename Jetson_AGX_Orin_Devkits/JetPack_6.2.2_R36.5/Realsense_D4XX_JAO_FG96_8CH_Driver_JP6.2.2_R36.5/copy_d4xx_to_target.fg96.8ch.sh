#!/bin/bash

## copy tegra-camera.ko file ##
tegra_camera_dir=/lib/modules/$(uname -r)/updates/drivers/media/platform/tegra/camera
sudo cp $tegra_camera_dir/tegra-camera.ko.orig $tegra_camera_dir/tegra-camera.ko

# enable metadata:
## copy videodev.ko file ##
videodev_dir=/lib/modules/$(uname -r)/kernel/drivers/media/v4l2-core
sudo cp $videodev_dir/videodev.ko.orig $videodev_dir/videodev.ko

## copy capture-ivc.ko file ##
capture_ivc_dir=/lib/modules/$(uname -r)/updates/drivers/platform/tegra/rtcpu
sudo cp $capture_ivc_dir/capture-ivc.ko.orig $capture_ivc_dir/capture-ivc.ko

## copy nvhost-nvcsi-t194.ko file ##
nvhost_nvcsi_t194_dir=/lib/modules/$(uname -r)/updates/drivers/video/tegra/host/nvcsi/
sudo cp $nvhost_nvcsi_t194_dir/nvhost-nvcsi-t194.ko.orig $nvhost_nvcsi_t194_dir/nvhost-nvcsi-t194.ko

## copy max9296.ko file ##
max9296_dir=/lib/modules/$(uname -r)/updates/drivers/media/i2c/
sudo cp $max9296_dir/max9296.ko.orig $max9296_dir/max9296.ko

## copy max9295.ko file ##
max9295_dir=/lib/modules/$(uname -r)/updates/drivers/media/i2c/
sudo cp $max9296_dir/max9295.ko.orig $max9296_dir/max9295.ko

## copy Image file ##
sudo cp /boot/Image.orig /boot/Image

###################################################################
if [ -e /lib/modules/$(uname -r)/updates/drivers/media/i2c/d4xx.ko ];then
    sudo rm /lib/modules/$(uname -r)/updates/drivers/media/i2c/d4xx.ko
fi
if [ -e /lib/modules/$(uname -r)/updates/drivers/media/i2c/fzcam.ko ];then
    sudo rm /lib/modules/$(uname -r)/updates/drivers/media/i2c/fzcam.ko
fi

## copy tegra-camera.ko file ##
tegra_camera_dir=/lib/modules/$(uname -r)/updates/drivers/media/platform/tegra/camera
if [ ! -f $tegra_camera_dir/tegra-camera.ko.orig ];then
    echo "bakckup tegra-camera.ko"
    sudo cp $tegra_camera_dir/tegra-camera.ko $tegra_camera_dir/tegra-camera.ko.orig
fi
sudo cp tegra-camera.ko $tegra_camera_dir

# enable metadata:
## copy videodev.ko file ##
videodev_dir=/lib/modules/$(uname -r)/kernel/drivers/media/v4l2-core
if [ ! -f $videodev_dir/videodev.ko.orig ];then
    echo "bakckup videodev.ko"
    sudo cp $videodev_dir/videodev.ko $videodev_dir/videodev.ko.orig
fi
sudo cp videodev.ko $videodev_dir

## copy capture-ivc.ko file ##
capture_ivc_dir=/lib/modules/$(uname -r)/updates/drivers/platform/tegra/rtcpu
if [ ! -f $capture_ivc_dir/capture-ivc.ko.orig ];then
    echo "bakckup capture-ivc.ko"
    sudo cp $capture_ivc_dir/capture-ivc.ko $capture_ivc_dir/capture-ivc.ko.orig
fi
sudo cp capture-ivc.ko $capture_ivc_dir

## copy nvhost-nvcsi-t194.ko file ##
nvhost_nvcsi_t194_dir=/lib/modules/$(uname -r)/updates/drivers/video/tegra/host/nvcsi/
if [ ! -f $nvhost_nvcsi_t194_dir/nvhost-nvcsi-t194.ko.orig ];then
    echo "bakckup nvhost-nvcsi-t194.ko"
    sudo cp $nvhost_nvcsi_t194_dir/nvhost-nvcsi-t194.ko $nvhost_nvcsi_t194_dir/nvhost-nvcsi-t194.ko.orig
fi
sudo cp nvhost-nvcsi-t194.ko $nvhost_nvcsi_t194_dir

## copy max9296.ko file ##
max9296_dir=/lib/modules/$(uname -r)/updates/drivers/media/i2c/
if [ ! -f $max9296_dir/max9296.ko.orig ];then
    echo "bakckup max9296.ko"
    sudo cp $max9296_dir/max9296.ko $max9296_dir/max9296.ko.orig
fi
sudo cp max9296.ko $max9296_dir

## copy max9295.ko file ##
max9295_dir=/lib/modules/$(uname -r)/updates/drivers/media/i2c/
if [ ! -f $max9296_dir/max9295.ko.orig ];then
    echo "bakckup max9295.ko"
    sudo cp $max9296_dir/max9295.ko $max9296_dir/max9295.ko.orig
fi
sudo cp max9295.ko $max9295_dir
sudo cp d4xx.ko $max9295_dir
sudo cp fzcam.ko $max9295_dir

## copy Image file ##
#if [ ! -f "/boot/Image.orig" ];then
#    echo "bakckup Image"
#    sudo cp /boot/Image /boot/Image.orig
#fi
#sudo cp Image /boot/Image


# 4xD457
sudo cp tegra234-p3737-camera-4xd4xx-fg96-8ch-overlay.dtbo  /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_D457x4"

# 8xD457
#sudo cp tegra234-p3737-camera-8xd4xx-fg96-8ch-overlay.dtbo  /boot/
#sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_D457x8"

# 1xD457 + 6RGB
#sudo cp tegra234-p3737-camera-1xd4xx-6xRGB-fg96-8ch-overlay.dtbo  /boot/
#sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_1xD457_6xRGB"

# 2xD457 + 6RGB
#sudo cp tegra234-p3737-camera-2xd4xx-6xRGB-fg96-8ch-overlay.dtbo  /boot/
#sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_2xD457_6xRGB"

# 4xD457 + 4RGB
#sudo cp tegra234-p3737-camera-4xd4xx-4xRGB-fg96-8ch-overlay.dtbo  /boot/
#sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_4xD457_4xRGB"

sudo depmod
echo 'Reboot AGX Orin to enable firmrware'
###############################################


