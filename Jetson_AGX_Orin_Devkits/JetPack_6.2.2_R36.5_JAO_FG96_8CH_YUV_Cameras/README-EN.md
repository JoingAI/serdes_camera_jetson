# FG96 8CH YUV Cameras JetPack 6.x (R36.4.x) SOP (English)

Directory: JetPack_6.x_JAO_FG96_8CH_YUV_Cameras

## 1. Objectives

- Complete firmware/application upgrade on Jetson AGX Orin + FG96 8CH YUV Cameras kit.
- Support configuration and usage of 8-channel YUV cameras.

## 2. Upgrade Package Content Description

- Upgrade script
  - fg96.8ch.JAO.R36.4.x.sh
- Drivers and configuration
  - `rootfs/lib/modules/*/updates/drivers/media/i2c/fzcam.ko`
- Applications and configuration
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg`
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`

## 3. Execute Upgrade on Jetson

Copy the entire directory to Jetson (choose any method):

```bash
scp -r JetPack_6.x_JAO_FG96_8CH_YUV_Cameras nvidia@<JETSON_IP>:
```

Enter the directory on Jetson and execute the upgrade script (sudo required):

```bash
cd ~/JetPack_6.x_JAO_FG96_8CH_YUV_Cameras
sudo bash fg96.8ch.JAO.R36.4.x.sh
```

What the script does (key points):
- Install driver `fzcam.ko` and run `insmod` / `depmod`
- Install configuration file `/etc/fzcam_cfg.ini`
- Install applications:
  - `/usr/local/bin/fzcam_cfg`
  - `/usr/local/bin/fzcam_ui`
- Install and enable systemd service: `/etc/systemd/system/fzcam_cfg.service`
- Restart after secondary confirmation

## 4. Post-restart Configuration and Image Verification

### 4.1 Run UI Configuration

```bash
sudo fzcam_ui
```

After selecting the manufacturer/model in the UI:
- Click "Save Configuration"
- Then click "Run Configuration"
- Observe if Link status is 1 (indicating the link is locked and has video data)

![8CH FZCAM UI](pics_videos/fg96-8ch-fzcam-ui.png)

### 4.2 GStreamer Quick Verification

![8CH FZCAM UI](pics_videos/fg96-8ch-fzcam-ui.png)

### 4.3 GStreamer Quick Verification

Taking video0 as an example:

```bash
gst-launch-1.0 v4l2src device=/dev/video0 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

## 5. Common Issues

### 5.1 JetPack Version Mismatch

The script will check if `/etc/nv_tegra_release` is R36.4.0/4.3/4.4/4.7, and exit if it doesn't match.

### 5.2 No Video Nodes / No Image

Symptoms: No video nodes or no image output.
Solution: Confirm the camera connection is correct, re-execute the upgrade script and restart.