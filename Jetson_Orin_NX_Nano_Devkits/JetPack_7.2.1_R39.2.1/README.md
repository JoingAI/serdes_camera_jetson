# RealSense D457 / D585 固件升级包 v2 — JetPack 7.2.1 (L4T R39.2.1)

适用：Jetson Orin NX/Nano Devkit，内核 6.8.12-1021-tegra，
FangZhu FG12-4CH / FG24-4CH 载板 × RealSense D457 / D585。

## 安装

```bash
tar xzf serdes_camera_fg4ch_d4xx_d5xx_r39.2.1_v2.tar.gz
cd serdes_camera_fg4ch_d4xx_d5xx_r39.2.1_v2
sudo ./install.sh                      # 自动识别板型/相机
# 或显式指定：
sudo ./install.sh --board fg24 --camera d585
sudo reboot
```

## v2 相对 v1 的关键变化（重要）

**v1 在重刷系统后会没有 `/dev/video*`**，v2 已修复：

| 现象 | 根因 | v2 处理 |
|---|---|---|
| 重刷后无 `/dev/video*`，`dmesg` 报 `nvhost_nvcsi: disagrees about version of symbol csi5_fops` | 只装了 `tegra-camera.ko`，没装与它同批构建的 `nvhost-*` 模块；两者的 modversions CRC 不匹配，NVCSI 加载失败 | 包内新增 **nvhost-nvcsi / vi5 / capture / isp5 / pva / nvdla** 六个模块，与 `tegra-camera.ko` 同一次构建，一并安装 |

> 结论：**`tegra-camera.ko` 与 `nvhost-*.ko` 必须同批构建、同批安装**，不能只换其中一个。

## 内容

```
boot/                4 个 dtbo（FG12/FG24 × D5xx/D4xx）
lib/modules/6.8.12-1021-tegra/updates/
  drivers/media/i2c/           d4xx / max9295 / max9296 / max96712 / max96717 / max96724
  drivers/media/platform/tegra/camera/   tegra-camera
  drivers/video/tegra/host/              nvhost-nvcsi / vi5 / capture / isp5 / pva / nvdla
docs/lrs_build_offline.sh   librealsense 离线/弱网编译脚本
install.sh
```

## 实测

| 组合 / 场景 | 结果 |
|---|---|
| FG24-4CH + D457 | SDK depth/color/IR/IMU，三路并发 5 分钟 8,969 帧 / 29.9 fps / 0 错误 |
| FG24-4CH + D585 | 三路并发 5 分钟 8,959 帧 / 29.9 fps / 0 错误 |
| FG12-4CH + D585 | 三路并发 5 分钟 8,965 帧 / 29.9 fps / 0 错误 |
| **FG24-4CH + D585，33 m FAKRA** | 三路并发 5 分钟 **8,955 帧 / 29.9 fps / 0 错误**；`corr_err/uncorr_err/err_data` 全 0；开停流 6/6 成功 |
| **四流并发（viewer）** | Depth + Color + IR + IMU 同时出流正常 |

重刷后复测（2026-11-17）：FG24-4CH + D585，`/dev/video0..3` 正常，
SDK depth/color/IR 三路 1280×720 正常出帧。

## librealsense 编译（重刷后常见坑）

重刷后 DUT 缺依赖且可能无外网，直接 `cmake` 会失败。用包内脚本：

```bash
sudo sh docs/lrs_build_offline.sh /path/to/librealsense-src   # 建议 v2.59.1
```

脚本做四件事：
1. `apt` 安装 `libglfw3-dev / libgtk-3-dev / nlohmann-json3-dev` 等依赖；
2. 用系统 nlohmann 头文件填充 CMake 期望目录，**跳过 GitHub 下载**；
3. 配置时关闭 `CHECK_FOR_UPDATES / ENABLE_AI_ASSISTANT / ENABLE_STATS`（这三项会去 GitHub 克隆 curl，弱网必失败）；
4. 安装 udev 规则并执行 `rs-enum.sh`，生成 `/dev/video-rs-*` 链接（否则 `rs-enumerate-devices` 报 "No device detected"）。

> 版本要求：**librealsense ≥ 2.59.1**。2.58.x 实测无法识别 D585。
