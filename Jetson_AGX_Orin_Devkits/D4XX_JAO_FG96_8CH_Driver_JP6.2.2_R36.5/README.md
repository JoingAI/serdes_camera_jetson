
on target Jetson Devkit Copy them to the right places:

```
unzip D457_JAO_FG96_8CH_Driver_JP6.2.2_R36.5*.zip 

cd D457_JAO_FG96_8CH_Driver_JP6.2.2_R36.5

# AGX_Orin + D457x4/x8 + FG96_8CH_GMSL

sh copy_d4xx_to_target.fg96.8ch.sh


#####################################################################################
# 4xD457 （D457 on CAM0/2/4/6, All data channel)
sudo cp tegra234-p3737-camera-4xd4xx-fg96-8ch-overlay.dtbo  /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_D457x4"

# 8xD457 （D457 on CAM0~7, Depth+RGB channel)
sudo cp tegra234-p3737-camera-8xd4xx-fg96-8ch-overlay.dtbo  /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_D457x8"

```

