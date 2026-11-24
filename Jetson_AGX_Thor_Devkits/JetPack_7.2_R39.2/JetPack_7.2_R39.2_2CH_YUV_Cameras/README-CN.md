# FG96-2CH FZCAM Jetson AGX Thor JetPack 7.2 (R39.2) SOP

目录：JetPack_7.2_R39.2_2CH_YUV_Cameras

## 1. 目标

- 在 Jetson **AGX Thor (P3971-0000 + P3834-xxxx 载板)** + FG96-2CH（YUV）SerDes 套件上完成驱动 / DTBO / 应用升级。
- 当前包只提供 **4-lane** 接法；CSI 排线接 AGX Thor 的 CSI 接头（jetson-io header 索引 = 1）。
- 兼容 JetPack 版本：**L4T R39.2.x**（`/etc/nv_tegra_release` 中 `# R39 (release), REVISION: 2.0`）。
- 内核：**6.8.12-1021-tegra**。

## 2. 升级包内容说明

- 升级脚本
  - `fg.2ch.thor.R39.2.x.sh`
- 驱动与 dtbo
  - `rootfs/lib/modules/6.8.12-1021-tegra/updates/drivers/media/i2c/fzcam.ko`
  - `rootfs/boot/tegra264-p3971-camera-fg-2ch-overlay.dtbo`
    - 内含 `overlay-name = "Jetson Camera Thor_FG96_2CH"`、`jetson-header-name = "Jetson AGX CSI Connector"`
    - `compatible` 涵盖 `p3971-0089+p3834-0008` / `p3971-0050+p3834-0005` / `p3971-0080+p3834-0008` / `p3834-0008` / `tegra264`
- 应用与配置
  - `fzcam_app/usr/local/bin/fzcam_ui`
  - `fzcam_app/usr/local/bin/fzcam_cfg`   （已统一为单文件，不再区分 2lane/4lane）
  - `fzcam_app/etc/fzcam_cfg.ini`
  - `fzcam_app/fzcam_cfg.service`
- 刷机QSPI 使能I2C-BUS9 在pinmux dtsi添加
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

## 3. 在 Jetson 上执行升级

将整个目录拷贝到 Jetson：

```bash
scp -r JetPack_7.2_R39.2_2CH_YUV_Cameras nvidia@<JETSON_IP>:
```

在 Jetson 上：

```bash
cd ~/JetPack_7.2_R39.2_2CH_YUV_Cameras
sudo bash fg.2ch.thor.R39.2.x.sh
```

脚本做的事情（关键点）：
- 检查 `/etc/nv_tegra_release` 是否为 R39.2.x，不匹配直接退出。
- 安装驱动 `fzcam.ko` 到 `/lib/modules/$(uname -r)/updates/drivers/media/i2c/`，并 `depmod -a`。
- 若 `lsmod | grep fzcam` 不存在，则 `modprobe fzcam`（失败时回退 `insmod`）。
- 安装 `/etc/fzcam_cfg.ini`、`/usr/local/bin/fzcam_cfg`、`/usr/local/bin/fzcam_ui`（用 `install` 带权限位）。
- 安装 systemd unit：`/etc/systemd/system/fzcam_cfg.service`，`daemon-reload` + `enable`。
  > 脚本不会 `start`，因为下一步就是 reboot；建议 reboot 成功后再手动 `sudo systemctl start fzcam_cfg.service`。
- 拷贝 dtbo 到 `/boot/`，并调用：
  ```bash
  sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 1="Jetson Camera Thor_FG96_2CH"
  ```
  （Thor 上只有一个 CSI header，索引为 1；overlay-name 必须严格匹配 dtbo 内字符串。）
- 二次确认后 `sudo reboot`。

## 4. 重启后配置与出图验证

### 4.1 systemd 服务

```bash
systemctl status fzcam_cfg.service
sudo systemctl start fzcam_cfg.service   # 首次启动
```

### 4.2 视频节点

```bash
ls /dev/video*
v4l2-ctl --list-devices

#I2C总线 /dev/i2c-9 对应 /dev/video0/video1
#I2C总线 /dev/i2c-12 对应 /dev/video2/video3
```

### 4.3 运行 UI 配置

```bash
sudo fzcam_ui
```

按 UI 选择厂商/型号后：
- 点击"保存配置"
- 再点击"运行配置"
- 观察 Link status 是否为 1（表示链路已锁定并有视频数据）

### 4.4 GStreamer 快速验证

```bash
gst-launch-1.0 v4l2src device=/dev/video0 ! 'video/x-raw,format=UYVY,width=1920,height=1080' ! videoconvert ! fpsdisplaysink video-sink=xvimagesink sync=false
```

若不是 1920x1080/UYVY，请按实际分辨率/像素格式修改 `width/height/format`。

## 5. 常见问题

### 5.1 JetPack 版本不匹配

脚本只接受 R39.2.x；其它版本会打印错误并退出。请确认烧录的是 JetPack 7.2 / L4T R39.2。

### 5.2 `config-by-hardware.py` 报 `No configuration found`

- 原因：overlay-name 与 dtbo 不一致，或 dtbo 没有拷贝到 `/boot/`。
- 处理：
  ```bash
  ls -l /boot/tegra264-p3971-camera-fg-2ch-overlay.dtbo
  fdtdump /boot/tegra264-p3971-camera-fg-2ch-overlay.dtbo | grep overlay-name
  ```
  必须输出 `Jetson Camera Thor_FG96_2CH`。

### 5.3 fzcam 驱动未加载

```bash
lsmod | grep fzcam
sudo modprobe fzcam
dmesg | tail -50
```

### 5.4 `/boot` 不可写

jetson-io 要求对 `/boot` 有读写权限。脚本必须在 `sudo` 下运行；不要在只读挂载的 `/boot` 上执行。