# FG96 8CH YUV Cameras JetPack 6.x (R36.4.x) SOP

目录：JetPack_6.x_JAO_FG96_8CH_YUV_Cameras

## 1. 目标

- 在 Jetson AGX Orin + FG96 8CH YUV Cameras 套件上完成固件/应用升级。
- 支持 8 通道 YUV 相机的配置和使用。

## 2. 升级包内容说明

- 升级脚本
  - fg96.8ch.JAO.R36.4.x.sh
- 驱动与配置
  - `rootfs/lib/modules/*/updates/drivers/media/i2c/fzcam.ko`
- 应用与配置
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg`
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`

## 3. 在 Jetson 上执行升级

将整个目录拷贝到 Jetson（任选一种方式）：

```bash
scp -r JetPack_6.x_JAO_FG96_8CH_YUV_Cameras nvidia@<JETSON_IP>:
```

在 Jetson 上进入目录并执行升级脚本（需要 sudo）：

```bash
cd ~/JetPack_6.x_JAO_FG96_8CH_YUV_Cameras
sudo bash fg96.8ch.JAO.R36.4.x.sh
```

脚本做的事情（关键点）：
- 安装驱动 `fzcam.ko` 并 `insmod` / `depmod`
- 安装配置文件 `/etc/fzcam_cfg.ini`
- 安装应用：
  - `/usr/local/bin/fzcam_cfg`
  - `/usr/local/bin/fzcam_ui`
- 安装并启用 systemd 服务：`/etc/systemd/system/fzcam_cfg.service`
- 二次确认后重启

## 4. 重启后配置与出图验证

### 4.1 运行 UI 配置

```bash
sudo fzcam_ui
```

按 UI 选择厂商/型号后：
- 点击“保存配置”
- 再点击“运行配置”
- 观察 Link status 是否为 1（表示链路已锁定并有视频数据）

![8CH FZCAM UI](pics_videos/fg96-8ch-fzcam-ui.png)

### 4.2 GStreamer 快速验证

以 video0（示例）：

```bash
gst-launch-1.0 v4l2src device=/dev/video0 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

## 5. 常见问题

### 5.1 JetPack 版本不匹配

脚本会检查 `/etc/nv_tegra_release` 是否为 R36.4.0/4.3/4.4/4.7，若不匹配会退出。

### 5.2 无视频节点/无图

表现：没有视频节点或无法出图。
处理：确认相机连接正确，重新执行升级脚本并重启。