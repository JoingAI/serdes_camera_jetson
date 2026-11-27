# Jetson AGX Thor Devkits — DTS Overlays (JetPack 7.2 / R39.2)

本目录提供 Jetson AGX Thor Devkits（P3971 / P3834）SerDes 相机使用的 **device tree overlay（DTBO 源文件）**。文件命名规则：

```
tegra264-p3971-camera-fg-<CH>ch-overlay.dts
```

- `tegra264` — Tegra264 平台（Thor）
- `p3971` — Jetson AGX Thor Devkit 载板（兼容 `p3834` 模组）
- `<CH>` — 接入的虚拟通道 / 相机路数（`2ch` 或 `4ch`）

> overlay 加载后 `overlay-name` 会作为 `/proc/device-tree/overlay-name` 显示，可用于确认当前生效的 DTBO。

## 1. 文件清单

| 文件 | overlay-name | 通道数 | lane 数 | 适用模组 |
| --- | --- | --- | --- | --- |
| [tegra264-p3971-camera-fg-2ch-overlay.dts](tegra264-p3971-camera-fg-2ch-overlay.dts) | `Jetson Camera Thor_FG_2CH` | 2 CH | 4 lanes | FG-2CH |
| [tegra264-p3971-camera-fg-4ch-overlay.dts](tegra264-p3971-camera-fg-4ch-overlay.dts) | `Jetson Camera Thor_FG_4CH` | 4 CH | 4 lanes | FG-4CH |

## 2. 通用说明

- 目标平台：Jetson AGX Thor（P3971 + P3834，compatible `nvidia,p3971-0089+p3834-0008` 等）
- 物理接口：Jetson AGX CSI Connector
- 虚拟通道（VC）：通过 `vc-id` 区分，每路相机对应独立 VC（4CH 模组使用 VC 0/1/2/3）
- I2C 总线：
  - `i2c@810c6a0000`（Bus-9）：接入 `0x3a` / `0x3b`（2CH、4CH 模组前两组）
  - `i2c@810c6d0000`（Bus-12）：接入 `0x3a` / `0x3b`（2CH、4CH 模组后两组）；4CH 还会扩到 `0x3c` / `0x3d`
- CSI 接口映射：`port-index = <2>` 对应 `serial_c`、`port-index = <0>` 对应 `serial_a`
- 摄像头控制 GPIO（暂时未启用，源码已注释）：
  - `CAM1_PWDN` = `TEGRA264_MAIN_GPIO(V, 5)`（Pin93 — MAX9296_1 PWDN/17）
  - `CAM2_PWDN` = `TEGRA264_MAIN_GPIO(V, 2)`（Pin95 — MAX9296_2 PWDN/18）
- 输出格式：YUV422 (`mode_type = "yuv"`, `pixel_phase = "uyvy"`)，分辨率 3840×2160 @30fps
- 时钟：传感器主时钟来自 `TEGRA264_CLK_EXTPERIPH1`（37.125 MHz）；`serdes_pix_clk_hz = 375000000`

## 3. 编译成 DTBO

每个 JetPack 版本目录下对应的升级包（如 `fg.*.sh`）通常已自带编译好的 DTBO，此目录主要用于查看/修改源码。手动编译示例：

```bash
# 1. 拷贝到内核源码的硬件目录
sudo cp tegra264-p3971-camera-fg-2ch-overlay.dts \
        /usr/src/linux-headers-$(uname -r)/arch/arm64/boot/dts/../hardware/nvidia/platform/t26x/rootfs/kernel-dts/

# 2. 编译
cd /usr/src/linux-headers-$(uname -r)
sudo make dtbs
# 产物: arch/arm64/boot/dts/../hardware/.../tegra264-p3971-camera-fg-2ch-overlay.dtbo
```

## 4. 加载与验证

```bash
# 加载 overlay
sudo fdtoverlay -i /boot/dtb/tegra264-p3971-0089-p3834-0008.dtb \
                -o /boot/tegra264-p3971-0089-p3834-0008-fzcam.dtb \
                tegra264-p3971-camera-fg-2ch-overlay.dtbo

# 确认生效
cat /proc/device-tree/overlay-name
# 期望: Jetson Camera Thor_FG_2CH  或  Jetson Camera Thor_FG_4CH
```

## 5. 选择建议

- 2CH 模组 → 使用 `*-fg-2ch-overlay.dts`
- 4CH 模组 → 使用 `*-fg-4ch-overlay.dts`
- 当前 lane 数固定为 4（`CAM_LANES = 4`），请确保硬件排线接到对应的 CSI 通道
- 实际使用时请同步使用 JetPack 7.2 / R39.2 对应的升级包（驱动、`fzcam_app`、DTBO），保持一致

## 6. 解串板 POC Enable 配置

- 2CH 模组（FG96-2CH）配置 POC Enable

```c
#define DESER_MAX9296_ADDR 0x48

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

- 4CH 模组（FG12-4CH / FG24-4CH）配置 POC Enable

```c
#define DESER_MAX96724_ADDR 0x27  // FG24-4CH
#define DESER_MAX96712_ADDR 0x29  // FG12-4CH

static DeSer_reg MAX4CH_FG24_4CH_POC_Enable[] =  //FG24-4CH
{
  {DESER_MAX96724_ADDR, 0x08A5, 0x3F}, // Switch MIPI Polarity
  {DESER_MAX96724_ADDR, 0x08A6, 0x3F},
  {DESER_MAX96724_ADDR, 0x0001, 0xE0}, // Enable POC IO
  {DESER_MAX96724_ADDR, 0x0319, 0x80},
  {GMSL_WAIT_MS, 10},
  {DESER_MAX96724_ADDR, 0x0319, 0x90}, // Enable POC MFP8 High
  {GMSL_WAIT_MS, 200},
};
static DeSer_reg MAX4CH_FG12_4CH_POC_Enable[] =  //FG12-4CH
{
  {DESER_MAX96724_ADDR, 0x08A5, 0x3F}, // Switch MIPI Polarity
  {DESER_MAX96724_ADDR, 0x08A6, 0x3F},
  {DESER_MAX96724_ADDR, 0x0001, 0xE0}, // Enable POC IO
  {DESER_MAX96724_ADDR, 0x0326, 0x80},  //MFP12
  {GMSL_WAIT_MS, 10},
  {DESER_MAX96724_ADDR, 0x0326, 0x90}, // Enable POC MFP12 High
  {GMSL_WAIT_MS, 200},
};
```
