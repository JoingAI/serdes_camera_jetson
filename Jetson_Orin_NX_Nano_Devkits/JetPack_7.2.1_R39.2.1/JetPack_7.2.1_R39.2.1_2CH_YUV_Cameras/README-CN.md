# FG96-2CH FZCAM JetPack 6.2.2 (R36.5.x) SOP

目录：JetPack_6.2.2_R36.5_2CH_YUV_Cameras

## 1. 目标

- 在 Jetson Orin NX/Nano + FG96-2CH（YUV）SerDes 套件上完成驱动/DTBO/应用升级。
- 支持 2lane / 4lane 两种 CSI 接法：
  - 2lane：官方 CAM0 接口
  - 4lane：官方 CAM1 接口

## 2. 升级包内容说明

- 升级脚本
  - fg.2ch.onx.2lane.R36.5.x.sh
  - fg.2ch.onx.4lane.R36.5.x.sh
- 驱动与 dtbo
  - `rootfs/lib/modules/*/updates/drivers/media/i2c/fzcam.ko`
  - 脚本默认使用的 dtbo 文件名：
    - `rootfs/boot/tegra234-p3767-camera-p3768-fzcam-fg96-2ch-2lanes.dtbo`
    - `rootfs/boot/tegra234-p3767-camera-p3768-fzcam-fg96-2ch-4lanes.dtbo`
  - 如果你看到目录里实际是以下文件名，请将脚本中的 dtbo 名称与实际文件对齐（修改脚本或重命名文件）：
    - `rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-2lanes.dtbo`
    - `rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dtbo`
- 应用与配置
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg.2lane`
  - `fzcam_app/usr/local/bin/fzcam_cfg.4lane`
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`

## 3. 在 Jetson 上执行升级

将整个目录拷贝到 Jetson：

```bash
scp -r JetPack_6.2.2_R36.5_2CH_YUV_Cameras nvidia@<JETSON_IP>:
```

在 Jetson 上进入目录并执行升级脚本（需要 sudo）：

### 3.1 2lane（接 CAM0）

```bash
cd ~/JetPack_6.2.2_R36.5_2CH_YUV_Cameras
sudo bash fg.2ch.onx.2lane.R36.5.x.sh
```

### 3.2 4lane（接 CAM1）

```bash
cd ~/JetPack_6.2.2_R36.5_2CH_YUV_Cameras
sudo bash fg.2ch.onx.4lane.R36.5.x.sh
```

脚本做的事情（关键点）：
- 安装驱动 `fzcam.ko` 并 `insmod` / `depmod`
- 安装配置文件 `/etc/fzcam_cfg.ini`
- 安装应用：
  - 2lane：`/usr/local/bin/fzcam_cfg` ← `fzcam_cfg.2lane`
  - 4lane：`/usr/local/bin/fzcam_cfg` ← `fzcam_cfg.4lane`
  - `/usr/local/bin/fzcam_ui`
- 安装并启用 systemd 服务：`/etc/systemd/system/fzcam_cfg.service`
- 拷贝对应 dtbo 到 `/boot/` 并调用 jetson-io 选择对应硬件项
- 二次确认后重启

## 4. 重启后配置与出图验证

### 4.1 运行 UI 配置

```bash
sudo fzcam_ui
```

FG96-2CH 套件通常只使用前两路 GMSL，缺少 `/dev/i2c-11`/`/dev/i2c-12` 属于正常现象。

选择 GMSL 位置（根据 CSI 排线接入位置选择）：
- CAM1 → 通常对应 `/dev/video4/5`
- CAM0 → 通常对应 `/dev/video0/1`

### 4.2 GStreamer 快速验证

以 CAM0 的 video0（示例）：

```bash
gst-launch-1.0 v4l2src device=/dev/video0 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

如果你的相机不是 1920x1080/UYVY，请按实际分辨率与像素格式修改 `width/height/format`。

## 5. 常见问题

### 5.1 JetPack 版本不匹配

脚本会检查 `/etc/nv_tegra_release` 是否为 R36.5.0/5.1/5.2/5.3，若不匹配会退出。

### 5.2 2lane / 4lane 选错

表现：没有视频节点/节点与预期不符/无图。
处理：确认 CSI 排线接入 CAM0 还是 CAM1，重新执行对应脚本并重启。
