# FG12-4CH/FG24-4CH FZCAM JetPack 6.x (R36.5.x) SOP

目录：JetPack_6.2.2_R36.5_4CH_YUV_Cameras

## 1. 目标

- 在 Jetson Orin NX/Nano + FG12-4CH/FG24-4CH SerDes 套件上完成固件/应用升级。
- 支持 2lane / 4lane 两种 CSI 接法：
  - 2lane：官方 CAM0 接口
  - 4lane：官方 CAM1 接口

## 2. 升级包内容说明

- 升级脚本
  - fg.4ch.onx.2lane.R36.5.x.sh
  - fg.4ch.onx.4lane.R36.5.x.sh
- 驱动与 dtbo
  - `rootfs/lib/modules/*/updates/drivers/media/i2c/fzcam.ko`
  - `rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-2lanes.dtbo`
  - `rootfs/boot/tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dtbo`
- 应用与配置
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg.2lane`
  - `fzcam_app/usr/local/bin/fzcam_cfg.4lane`
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`
- 视频流验证
  - JoingAI-4Channel-SERDES-Cameras-Operate-Video.webm

## 3. 在 Jetson 上执行升级

将整个目录拷贝到 Jetson（任选一种方式）：

```bash
scp -r JetPack_6.2.2_R36.5_4CH_YUV_Cameras nvidia@<JETSON_IP>:
```

在 Jetson 上进入目录并执行升级脚本（需要 sudo）：

### 3.1 2lane（接 CAM0）

```bash
cd ~/JetPack_6.2.2_R36.5_4CH_YUV_Cameras
sudo bash fg.4ch.onx.2lane.R36.5.x.sh
```

### 3.2 4lane（接 CAM1）

```bash
cd ~/JetPack_6.2.2_R36.5_4CH_YUV_Cameras
sudo bash fg.4ch.onx.4lane.R36.5.x.sh
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

选择 GMSL 位置（根据 CSI 排线接入位置选择）：
- CAM1 → 对应 `/dev/video4/5/6/7`
- CAM0 → 对应 `/dev/video0/1/2/3`

按 UI 选择厂商/型号后：
- 点击“保存配置”
- 再点击“运行配置”
- 观察 Link status 是否为 1（表示链路已锁定并有视频数据）

![4CH FZCAM UI](pics_videos/4channel-fzcam-ui.png)

### 4.2 GStreamer 快速验证

以 CAM1 的 video4（示例）：

```bash
gst-launch-1.0 v4l2src device=/dev/video4 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

## 5. 常见问题

### 5.1 JetPack 版本不匹配

脚本会检查 `/etc/nv_tegra_release` 是否为 R36.5.0/5.1/5.2/5.3，若不匹配会退出。

### 5.2 2lane / 4lane 选错

表现：没有视频节点/节点与预期不符/无图。
处理：确认 CSI 排线接入 CAM0 还是 CAM1，重新执行对应脚本并重启。