# Jetson Orin NX / Nano Devkits — DTS Overlays

本目录提供 Jetson Orin NX / Orin Nano Devkits（P3768）SerDes 相机使用的 **device tree overlay（DTBO 源文件）**。文件命名规则：

```
tegra234-p3767-camera-p3768-serdes-<CH>ch-<LANES>lanes.dts
```

- `p3767` — Jetson Orin NX / Nano Devkit 载板
- `p3768` — Jetson Orin NX / Nano 板子
- `<CH>` — 接入的虚拟通道 / 相机路数
- `<LANES>` — 每条 CSI 通道的 lane 数

> overlay 加载后 `overlay-name` 会作为 `/proc/device-tree/overlay-name` 显示，可用于确认当前生效的 DTBO。

## 1. 文件清单

| 文件 | overlay-name | 通道数 | lane 数 | 适用板子 |
| --- | --- | --- | --- | --- |
| [tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dts](tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dts) | `Camera FG96-2CH-4Lanes-YUV` | 2 CH | 4 lanes | FG96-2CH |
| [tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dts](tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dts) | `Camera FG-4CH-4Lanes-YUV` | 4 CH | 4 lanes | FG12-4CH / FG24-4CH |

## 2. 通用说明

- 目标平台：Jetson Orin NX / Orin Nano Devkits（`JETSON_COMPATIBLE_P3768`）
- 物理接口：Jetson 22pin CSI Connector
- 虚拟通道（VC）：通过 `vc-id` 区分，每路相机对应独立 VC
- I2C：使用 `cam_i2cmux`（GPIO 切换），MCU 地址为 `0x3a / 0x3b`（2CH）或 `0x3a / 0x3b / 0x3c / 0x3d`（4CH）
- 输出格式：YUV422 (`mode_type = "yuv"`, `pixel_phase = "uyvy"`)，分辨率 1920×1080 @30fps
- 例如：2CH overlay 中 `port-index = <2>` 对应 `serial_c`，`port-index = <0>` 对应 `serial_a`

## 3. 编译成 DTBO

每个 JetPack 版本目录下对应的升级包（如 `fg.*.sh`）通常会自带编译好的 DTBO，本目录主要用于查看/修改源码。手动编译示例：

```bash
# 1. 拷贝到内核源码的硬件目录
sudo cp tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dts \
        /usr/src/linux-headers-$(uname -r)/arch/arm64/boot/dts/../hardware/nvidia/platform/t23x/concord/kernel-dts/

# 2. 编译
cd /usr/src/linux-headers-$(uname -r)
sudo make dtbs
# 产物: arch/arm64/boot/dts/../hardware/.../tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dtbo
```

## 4. 加载与验证

```bash
# 加载 overlay
sudo fdtoverlay -i /boot/dtb/tegra234-p3767-0000-p3768-0000-a0.dtb \
                -o /boot/tegra234-p3767-0000-p3768-0000-a0-fzcam.dtb \
                tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dtbo

# 确认生效
cat /proc/device-tree/overlay-name
# 期望: Camera FG96-2CH-4Lanes-YUV  或  Camera FG-4CH-4Lanes-YUV
```

## 5. 选择建议

- 2CH 板子（FG96-2CH）→ 使用 `*-2ch-4lanes.dts`
- 4CH 板子（FG12-4CH / FG24-4CH）→ 使用 `*-4ch-4lanes.dts`
- 2lane / 4lane 区别：CSI 排线接法不同，请根据板子硬件选择对应的 lane 版本
- 实际使用时请同步使用 JetPack 版本对应的升级包（驱动、`fzcam_app`、DTBO），保持一致

## 6. 解串板POC Enable配置
- 2CH 板子（FG96-2CH） 配置POC Enable
```c
static DeSer_reg FG96_2CH_MAX2CH_POC_Enable[] =
{
  {DESER_MAX9296_ADDR, 0x0003, 0x40},
  {GMSL_WAIT_MS, 10},
  {DESER_MAX9296_ADDR, 0x0005, 0x80},
  {DESER_MAX9296_ADDR, 0x02BC, 0x90}, // Disable POC set MFP4 High
  {DESER_MAX9296_ADDR, 0x02BC, 0x80}, // Enable POC set MFP4 Low
  {GMSL_WAIT_MS, 200},
};
static DeSer_reg FG96_2CH_MAX2CH_POC_Disable[] =
{
  {GMSL_WAIT_MS, 2},
  {DESER_MAX9296_ADDR, 0x0003, 0x40},
  {GMSL_WAIT_MS, 10},
  {DESER_MAX9296_ADDR, 0x0005, 0x80},
  {DESER_MAX9296_ADDR, 0x02BC, 0x90}, // Disable POC set MFP4 High
  {GMSL_WAIT_MS, 200},
};
```
- 4CH 板子（FG12-4CH / FG24-4CH） 配置POC Enable
```c
static DeSer_reg MAX4CH_FG24_4CH_POC_Enable[] =  //FG24-4CH
{
  {DESER_MAX96724_ADDR, 0x08A5, 0x3F}, // Switch MIPI Polarit
  {DESER_MAX96724_ADDR, 0x08A6, 0x3F},
  {DESER_MAX96724_ADDR, 0x0001, 0xE0}, // Enable POC IO
  {DESER_MAX96724_ADDR, 0x0319, 0x80},
  {GMSL_WAIT_MS, 10},
  {DESER_MAX96724_ADDR, 0x0319, 0x90}, // Enable POC MFP8 High
  {GMSL_WAIT_MS, 200},
};
static DeSer_reg MAX4CH_FG12_4CH_POC_Enable[] =  //FG12-4CH
{
  {DESER_MAX96724_ADDR, 0x08A5, 0x3F}, // Switch MIPI Polarit
  {DESER_MAX96724_ADDR, 0x08A6, 0x3F},
  {DESER_MAX96724_ADDR, 0x0001, 0xE0}, // Enable POC IO
  {DESER_MAX96724_ADDR, 0x0326, 0x80},  //MFP12
  {GMSL_WAIT_MS, 10},
  {DESER_MAX96724_ADDR, 0x0326, 0x90}, // Enable POC MFP12 High
  {GMSL_WAIT_MS, 200},
};
```
