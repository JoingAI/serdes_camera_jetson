# RealSense D457 / D585 固件升级包 — JetPack 7.2.1 (L4T R39.2.1)

适用：Jetson Orin NX/Nano Devkit（p3768-0000 + p3767-xxxx），内核 6.8.12-1021-tegra，
FangZhu FG12-4CH / FG24-4CH 载板 × RealSense D457 / D585。

## 安装

```bash
tar xzf serdes_camera_fg4ch_d4xx_d5xx_r39.2.1.tar.gz
cd serdes_camera_fg4ch_d4xx_d5xx_r39.2.1
sudo ./install.sh            # 自动识别板型(fg12/fg24) + 相机(d457/d585)
sudo reboot
```

装完 `DEFAULT` 会指向识别到的组合。

## 实测结果（2026-11-15/16，DUT 192.168.112.64）

| 组合 | 结果 |
|---|---|
| FG24-4CH + D457 | SDK depth/color/IR/IMU 可用；三路并发 5 分钟 **8969 帧 / 29.9 fps / 0 错误**；viewer 桌面验证正常 |
| FG24-4CH + D585 | SDK depth/color/IR 三路并发 5 分钟 **8959 帧 / 29.9 fps / 0 错误 / 0 内核错误** |
| FG12-4CH + D585 | SDK depth/color/IR 三路并发正常（1280x720） |

> D585 的 IMU（`video3` 256x1）在 R39 上读不到帧；**DUT .70 的 D585 同样 0 帧**，属 D585+R39 已知限制。

## 内容

- 4 个 dtbo：`tegra234-camera-d4xx-overlay-{fg12,fg24}-4ch{,-d5xx}.dtbo`
- 7 个 ko：d4xx / max9295 / max9296 / max96712 / max96717 / max96724 / tegra-camera
- `install.sh`

## 关键修复（相对旧包）

### D457
1. lane/clock：mode0 `num_lanes=2`、`serdes_pix_clk_hz=125M`、deser `lane_cnt=2`，
   `max96712` 2-lane 用 `BACKTOP25_1000Mbps(0xa)`。
2. `vi5_formats.h`：`(UYVY8_1X16, Z16)` 表项放到 `(Y16_1X16, Z16)` 之前（否则 SDK 无 Depth profile）。
3. `d4xx.c`：TRY_FMT 结果本地缓存（tegra VI 传 NULL subdev state 时不再挂死）。
4. `d4xx.c`：推流中跳过 AE_MODE/AE_SETPOINT/AE_ROI 的 HWMC（FW 拒绝 + I2C 重试堵 GMSL）。
5. `sensor_common.c`：`grey_y8/grey_y16/grey_z16` pixel_t 映射。

### D585
- overlay 与 JP6.2.2 一致（4 lane、`serdes_pix_clk_hz=325M`、`pixel_t=grey_y16`），R39 无需改 lane/clock。
- v4l2 **默认模式是 640x360**，直接 `--stream-mmap` 会 PIXEL_INCOMPLETE；必须显式
  `--set-fmt-video=width=1280,height=720,pixelformat="Y8I "`。SDK 自动选 1280x720，viewer 正常。

## 验证方法

```bash
rs-enumerate-devices          # 应看到 Depth/Color/IR/IMU
rs-capture                    # 或 realsense-viewer
```

详见知识库 `cases/CASE-20261115-y303-fg24-4ch-d457-r39.2.1.md`。

---

## 宣传 / 技术文档

| 文件 | 说明 |
|---|---|
| `docs/Y303_FG4CH_D585_D457_promo_CN.md` | 技术版中文宣传文案（架构、实测数据表、关键修复） |
| `docs/Y303_FG4CH_D585_D457_promo_EN.md` | 技术版英文宣传文案 |
| `docs/Y303_FG4CH_arch.png` | 架构图（软硬件分层 + VC 映射 + 实测数据 + 关键修复） |
