# FG-4CH FZCAM Jetson AGX Thor JetPack 7.2 (R39.2) SOP (English)

Directory: JetPack_7.2_R39.2_4CH_YUV_Cameras

## 1. Objectives

- Complete driver / DTBO / application upgrade on **Jetson AGX Thor (P3971-0000 + P3834-xxxx carrier)** + FG24/12-4CH (YUV) SerDes kit.
- This package provides the **4-lane** wiring only; the CSI cable connects to the AGX Thor CSI header (jetson-io header index = 1).
- Supported JetPack: **L4T R39.2.x** (string `# R39 (release), REVISION: 2.0` in `/etc/nv_tegra_release`).
- Kernel: **6.8.12-1021-tegra**.

## 2. Package Contents

- Upgrade script
  - `fg.4ch.Thor.4lane.R39.2.sh`
- Driver and DTBO
  - `rootfs/lib/modules/6.8.12-1021-tegra/updates/drivers/media/i2c/fzcam.ko`
  - `rootfs/boot/tegra264-p3971-camera-fg-4ch-overlay.dtbo`
    - Contains `overlay-name = "Jetson Camera Thor_FG_4CH"` and `jetson-header-name = "Jetson AGX CSI Connector"`
    - `compatible` covers `p3971-0089+p3834-0008` / `p3971-0050+p3834-0005` / `p3971-0080+p3834-0008` / `p3834-0008` / `tegra264`
- Applications and configuration
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg` (single binary; no 2lane/4lane variants)
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`

- Flash QSPI to enable I2C-BUS9 in pinmux dtsi
  ```
  Linux_for_Tegra\bootloader\tegra264-mb1-bct-pinmux-p3834-xxxx-p4071-0000.dtsi
    gen9_i2c_scl_pg3 {
      nvidia,pins = "gen9_i2c_scl_pg3";
      nvidia,function = "i2c9_clk";
      nvidia,pull = <TEGRA_PIN_PULL_NONE>;
      nvidia,tristate = <TEGRA_PIN_DISABLE>;
      nvidia,enable-input = <TEGRA_PIN_ENABLE>;
      nvidia,drv-type = <TEGRA_PIN_1X_DRIVER>;
      nvidia,e-io-od = <TEGRA_PIN_DISABLE>;
      nvidia,e-lpbk = <TEGRA_PIN_DISABLE>;
    };	
    gen9_i2c_sda_pg4 {
      nvidia,pins = "gen9_i2c_sda_pg4";
      nvidia,function = "i2c9_dat";
      nvidia,pull = <TEGRA_PIN_PULL_NONE>;
      nvidia,tristate = <TEGRA_PIN_DISABLE>;
      nvidia,enable-input = <TEGRA_PIN_ENABLE>;
      nvidia,drv-type = <TEGRA_PIN_1X_DRIVER>;
      nvidia,e-io-od = <TEGRA_PIN_DISABLE>;
      nvidia,e-lpbk = <TEGRA_PIN_DISABLE>;
    };
    
  #Flash qspi
  sudo ./l4t_initrd_flash.sh --qspi-only jetson-agx-thor-devkit internal
  ```

## 3. Run the Upgrade on Jetson

Copy the whole directory to Jetson:

```bash
scp -r JetPack_7.2_R39.2_4CH_YUV_Cameras nvidia@<JETSON_IP>:
```

Then on Jetson:

```bash
cd ~/JetPack_7.2_R39.2_4CH_YUV_Cameras
sudo bash fg.4ch.Thor.4lane.R39.2.sh
```

What the script does (key points):
- Verifies `/etc/nv_tegra_release` is R39.2.x; exits if not.
- Installs `fzcam.ko` to `/lib/modules/$(uname -r)/updates/drivers/media/i2c/` and runs `depmod -a`.
- If `lsmod | grep fzcam` is empty, runs `modprobe fzcam` (falls back to `insmod`).
- Installs `/etc/fzcam_cfg.ini`, `/usr/local/bin/fzcam_cfg`, `/usr/local/bin/fzcam_ui` with correct permissions via `install`.
- Installs the systemd unit `/etc/systemd/system/fzcam_cfg.service` and runs `daemon-reload` + `enable`.
  > The script does NOT call `start`, because the next step is reboot. Start it manually after the reboot succeeds.
- Copies the DTBO to `/boot/` and runs:
  ```bash
  sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 1="Jetson Camera Thor_FG_4CH"
  ```
  (Thor has a single CSI header, index 1; overlay-name must match the string inside the DTBO exactly.)
- After a second confirmation, runs `sudo reboot`.

## 4. Post-reboot Configuration and Image Verification

### 4.1 systemd service

```bash
systemctl status fzcam_cfg.service
sudo systemctl start fzcam_cfg.service   # first-time start
```

### 4.2 Video nodes

```bashls /dev/video*
v4l2-ctl --list-devices

#I2C Bus /dev/i2c-9 corresponds to /dev/video0~3
#I2C Bus /dev/i2c-12 corresponds to /dev/video4~7
```

FG-4CH kit should expose 4 video nodes (index numbers depend on Thor enumeration).

### 4.3 UI configuration

```bash
sudo fzcam_ui
```

After choosing vendor/model:
- Click "Save Configuration"
- Click "Run Configuration"
- Check that Link status is 1 (link locked, video data flowing).

### 4.4 GStreamer quick check

```bash
gst-launch-1.0 v4l2src device=/dev/video0 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

If your camera is not 1920x1080/UYVY, adjust `width/height/format` accordingly.

## 5. Troubleshooting

### 5.1 JetPack version mismatch

The script only accepts R39.2.x; other versions print an error and exit. Verify the device is flashed with JetPack 7.2 / L4T R39.2.

### 5.2 `config-by-hardware.py` reports `No configuration found`

- Cause: overlay-name does not match the DTBO, or DTBO was not copied to `/boot/`.
- Verify:
  ```bash
  ls -l /boot/tegra264-p3971-camera-fg-4ch-overlay.dtbo
  fdtdump /boot/tegra264-p3971-camera-fg-4ch-overlay.dtbo | grep overlay-name
  ```
  Must print `Jetson Camera Thor_FG_4CH`.

### 5.3 fzcam driver not loaded

```bash
lsmod | grep fzcam
sudo modprobe fzcam
dmesg | tail -50
```

### 5.4 `/boot` not writable

jetson-io requires read/write access to `/boot`. Always run the script under `sudo`. Do not run it on a read-only-mounted `/boot`.