# D457 + FG96 8CH (JetPack 6.2.2 / R36.5) Deployment Guide

Package folder: `D457_JAO_FG96_8CH_Driver_JP6.2.2_R36.5`

## 1. Contents

- DTBO
  - `tegra234-p3737-camera-4xd4xx-fg96-8ch-overlay.dtbo` (4x D457)
  - `tegra234-p3737-camera-8xd4xx-fg96-8ch-overlay.dtbo` (8x D457)
- Kernel modules
  - `tegra-camera.ko`
  - `capture-ivc.ko`
  - `nvhost-nvcsi-t194.ko`
  - `videodev.ko`
  - `d4xx.ko`
  - `max9295.ko`
  - `max9296.ko`
- Helper script
  - `copy_d4xx_to_target.fg96.8ch.sh`

## 2. Copy package to Jetson

```bash
scp -r D457_JAO_FG96_8CH_Driver_JP6.2.2_R36.5 nvidia@<JETSON_IP>:
```

On Jetson:

```bash
cd ~/D457_JAO_FG96_8CH_Driver_JP6.2.2_R36.5
```

## 3. Install kernel modules

Run the helper script:

```bash
sudo bash copy_d4xx_to_target.fg96.8ch.sh
```

## 4. Apply DTBO (Jetson-IO) and reboot

### 4.1 4x D457 (CAM0/2/4/6, data-only channels)

```bash
sudo cp tegra234-p3737-camera-4xd4xx-fg96-8ch-overlay.dtbo /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_D457x4"
sudo reboot
```

### 4.2 8x D457 (CAM0~7, depth + RGB channels)

```bash
sudo cp tegra234-p3737-camera-8xd4xx-fg96-8ch-overlay.dtbo /boot/
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson Camera FG96_8CH_D457x8"
sudo reboot
```

## 5. Quick checks after reboot

```bash
uname -r
lsmod | egrep 'd4xx|max9295|max9296|tegra_camera|capture_ivc|nvhost_nvcsi' || true
ls -l /dev/video* || true
```

