# FG96-2CH FZCAM JetPack 6.2.2 (R36.5.x) SOP (English)

Directory: JetPack_6.2.2_R36.5_2CH_YUV_Cameras

## 1. Objectives

- Complete driver/DTBO/application upgrade on Jetson Orin NX/Nano + FG96-2CH (YUV) SerDes kit.
- Support two CSI connection methods: 2lane / 4lane:
  - 2lane: Official CAM0 interface
  - 4lane: Official CAM1 interface

## 2. Package Content

- Upgrade scripts
  - fg.2ch.onx.2lane.R36.5.x.sh
  - fg.2ch.onx.4lane.R36.5.x.sh
- Drivers and dtbo
  - `rootfs/lib/modules/*/updates/drivers/media/i2c/fzcam.ko`
  - Default dtbo filenames used by scripts:
    - `rootfs/boot/tegra234-p3767-camera-p3768-fzcam-fg96-2ch-2lanes.dtbo`
    - `rootfs/boot/tegra234-p3767-camera-p3768-fzcam-fg96-2ch-4lanes.dtbo`
  - If your directory contains these names instead, align the script with the actual filenames (edit the script or rename files):
    - `rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-2lanes.dtbo`
    - `rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dtbo`
- Applications and configuration
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg.2lane`
  - `fzcam_app/usr/local/bin/fzcam_cfg.4lane`
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`

## 3. Execute Upgrade on Jetson

Copy the entire directory to Jetson:

```bash
scp -r JetPack_6.2.2_R36.5_2CH_YUV_Cameras nvidia@<JETSON_IP>:
```

Enter the directory on Jetson and execute the upgrade script (sudo required):

### 3.1 2lane (connected to CAM0)

```bash
cd ~/JetPack_6.2.2_R36.5_2CH_YUV_Cameras
sudo bash fg.2ch.onx.2lane.R36.5.x.sh
```

### 3.2 4lane (connected to CAM1)

```bash
cd ~/JetPack_6.2.2_R36.5_2CH_YUV_Cameras
sudo bash fg.2ch.onx.4lane.R36.5.x.sh
```

What the script does (key points):
- Install driver `fzcam.ko` and run `insmod` / `depmod`
- Install configuration file `/etc/fzcam_cfg.ini`
- Install applications:
  - 2lane: `/usr/local/bin/fzcam_cfg` ← `fzcam_cfg.2lane`
  - 4lane: `/usr/local/bin/fzcam_cfg` ← `fzcam_cfg.4lane`
  - `/usr/local/bin/fzcam_ui`
- Install and enable systemd service: `/etc/systemd/system/fzcam_cfg.service`
- Copy the corresponding dtbo to `/boot/` and call jetson-io to select the hardware item
- Restart after secondary confirmation

## 4. Post-restart Configuration and Image Verification

### 4.1 Run UI Configuration

```bash
sudo fzcam_ui
```

FG96-2CH kits typically use only the first two GMSL groups. Missing `/dev/i2c-11`/`/dev/i2c-12` can be normal.

Select GMSL position (based on CSI cable connection position):
- CAM1 → typically `/dev/video4/5`
- CAM0 → typically `/dev/video0/1`

### 4.2 GStreamer Quick Verification

Taking CAM0's video0 as an example:

```bash
gst-launch-1.0 v4l2src device=/dev/video0 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

If your camera is not 1920x1080/UYVY, please adjust `width/height/format` accordingly.

## 5. Common Issues

### 5.1 JetPack Version Mismatch

The script will check if `/etc/nv_tegra_release` is R36.5.0/5.1/5.2/5.3, and exit if it doesn't match.

### 5.2 Wrong 2lane / 4lane Selection

Symptoms: No video nodes / nodes not as expected / no image.
Solution: Confirm whether the CSI cable is connected to CAM0 or CAM1, re-execute the corresponding script and restart.
