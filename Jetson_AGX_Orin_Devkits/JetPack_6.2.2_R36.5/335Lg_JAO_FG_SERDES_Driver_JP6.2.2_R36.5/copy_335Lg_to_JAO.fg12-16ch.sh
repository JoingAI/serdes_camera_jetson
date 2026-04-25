#!/bin/bash

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

sudo cp obc_max9296.ko /lib/modules/$(uname -r)/updates/drivers/media/i2c/
sudo cp obc_max96712.ko /lib/modules/$(uname -r)/updates/drivers/media/i2c/
sudo cp g300.ko /lib/modules/$(uname -r)/updates/drivers/media/i2c/
sudo cp obc_cam_sync.ko /lib/modules/$(uname -r)/updates/drivers/misc/

#8x335Lg
sudo cp tegra234-p3737-camera-g300-fg12-16ch-overlay.dtbo /boot/
#4x335Lg+8xRGB
sudo cp tegra234-p3737-camera-g300-rgb-fg12-16ch-overlay.dtbo /boot/
#C-PHY 8x335Lg
sudo cp tegra234-p3737-camera-g300-fg12-16ch-cphy-overlay.dtbo /boot/


# 让用户选择相机配置模式
echo "请选择相机配置模式："
echo "0) CAM0~8 仅连接 335Lg 相机"
echo "1) CAM0~8 仅连接 335Lg 相机（DEPTH/RGB）"
echo "2) CAM0~8 仅连接 335Lg 且 FG12-16CH 使用 CPHY"
read -p "请输入选项（0/1/2）: " choice

case $choice in
    0)
        # 仅 335Lg
        sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG12_16CH_DPHY_G335Lg"
        ;;
    1)
        # 335Lg + RGB
        sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG12_16CH_DPHY_G335Lg_RGB"
        ;;
    2)
        # 335Lg CPHY
        sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG12_16CH_CPHY_G335Lg"
        ;;
    *)
        echo "无效输入，退出脚本"
        exit 1
        ;;
esac

# 仅在检测到RGB相机接入时执行以下配置，默认跳过
read -p "是否已接入RGB相机？(y/N): " has_rgb
if [[ "$has_rgb" =~ ^[Yy]$ ]]; then
    ## copy fzcam.ko file ##
    fzcam_dir=/lib/modules/$(uname -r)/updates/drivers/media/i2c/
    if [ -f $fzcam_dir/fzcam.ko ];then
        sudo rm $fzcam_dir/fzcam.ko
    fi
    sudo cp fzcam.ko /lib/modules/$(uname -r)/updates/drivers/media/i2c/
    #sudo cp serdes.ko /lib/modules/$(uname -r)/updates/drivers/media/i2c/

    sudo cp fzcam_app/etc/fzcam_cfg.ini /etc/
    sudo cp fzcam_app/usr/local/bin/fzcam_cfg /usr/local/bin/
    sudo cp fzcam_app/usr/local/bin/fzcam_ui /usr/local/bin/
    sudo chmod +x /usr/local/bin/fzcam_ui
    sudo chmod +x /usr/local/bin/fzcam_cfg

    sudo cp fzcam_app/fzcam_cfg.service /etc/systemd/system/
    sudo chmod 644 /etc/systemd/system/fzcam_cfg.service 
    sudo systemctl enable  /etc/systemd/system/fzcam_cfg.service
    sudo systemctl daemon-reload

    #335Lg + RGB Sensor need
    echo "softdep fzcam pre: g300" >> /etc/modprobe.d/g300_depend.conf
    sudo depmod
fi
