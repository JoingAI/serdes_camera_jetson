# D457 + D405 + FG12-12CH（JetPack 6.2.0 / R36.4.3）操作手册

包目录：`Realsense_D4XX_JAO_FG12_12CH_Driver_JP6.2.0_R36.4.3`

## 1. 概述

本固件包用于在 FG12 12CH 载板上点亮 Intel RealSense D457 / D405 相机。

- 板卡：Jetson AGX Orin（p3737 + p3701）
- 解串器：2 × MAX96712
  - 总线 9（dser_a）→ 接 D457
  - 总线 10（dser_b）→ 接 D405
- 每台相机 7 个 video 节点：depth / depth-md / color / color-md / ir / ir-md / imu
- 两台相机均接上时，共 14 个 `/dev/video-rs-*` 节点
- Librealsense 版本必须 >= v2.58.+ (否则会导致相机RGB偏色)

## 2. 包含内容

### 内核模块（ko）
- `tegra-camera.ko`
- `capture-ivc.ko`
- `nvhost-nvcsi-t194.ko`
- `videodev.ko`
- `d4xx.ko`
- `max9295.ko`
- `max9296.ko`
- `max96712.ko`
- `max96717.ko`

### 设备树 overlay（dtbo）
- `tegra234-camera-d4xx-overlay-fg12-12ch-cams-0-4.dtbo`

### 辅助脚本
- `copy_d4xx_to_target.fg12_12ch.sh`

## 3. 部署步骤

### 3.1 拷贝到 Jetson

```bash
scp -r Realsense_D4XX_JAO_FG12_12CH_Driver_JP6.2.0_R36.4.3 nvidia@<JETSON_IP>:
```

在 Jetson 上：

```bash
cd ~/Realsense_D4XX_JAO_FG12_12CH_Driver_JP6.2.0_R36.4.3
```

### 3.2 执行安装脚本（需要 sudo）

```bash
sudo bash copy_d4xx_to_target.fg12_12ch.sh
```

脚本会自动：备份并安装各内核模块、拷贝 dtbo 到 `/boot/`、通过 jetson-io 配置 overlay（`Jetson Camera FG12_12CH D4XX-CAM0-4`）。

### 3.3 重启

```bash
sudo reboot
```

## 4. 验证

```bash
lsmod | egrep 'd4xx|max9295|max9296|max96712|max96717|tegra_camera|capture_ivc|nvhost_nvcsi'
ls -l /dev/video-rs-*
```

预期（两台相机均接上）共 14 个节点：

```
video-rs-depth-0/1, video-rs-depth-md-0/1
video-rs-color-0/1, video-rs-color-md-0/1
video-rs-ir-0/1,    video-rs-ir-md-0/1
video-rs-imu-0/1
```

## 5. 调试记录

- **POC 寄存器地址**：FG12 12CH 使用 `0x319`（`F306_POC_ADDR`），不是 FG12 4CH 的 `0x326`。
- **CAM0_PWDN / CAM1_PWDN GPIO**（曾写反，已修正）：
  - `CAM0_PWDN = TEGRA234_MAIN_GPIO(H, 3)` → Pin93 / 397 / MAX96724_1 PWDN
  - `CAM1_PWDN = TEGRA234_MAIN_GPIO(H, 6)` → Pin95 / 394 / MAX96724_2 PWDN
- **d4xx 流启动超时阈值**：`DS5_START_MAX_TIME` 由 2000 → 5000，覆盖相机 FW 冷启动唤醒时间，避免首次打开 depth 流超时。

## 6. Realsense Viewer

![D4XX Realsense Viewer](./D4XX_Realsense-viewer.png)

<br />
