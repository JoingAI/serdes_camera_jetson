# Jetson AGX Thor Devkits — DTS Overlays (JetPack 7.2 / R39.2)

This directory contains the **device tree overlay (DTBO source files)** for SerDes cameras used with Jetson AGX Thor Devkits (P3971 / P3834). File naming convention:

```
tegra264-p3971-camera-fg-<CH>ch-overlay.dts
```

- `tegra264` — Tegra264 platform (Thor)
- `p3971` — Jetson AGX Thor Devkit carrier board (compatible with `p3834` module)
- `<CH>` — Number of virtual channels / camera inputs (`2ch` or `4ch`)

> Once loaded, the `overlay-name` appears in `/proc/device-tree/overlay-name`, which can be used to verify the active DTBO.

## 1. File List

| File | overlay-name | Channels | Lanes | Module |
| --- | --- | --- | --- | --- |
| [tegra264-p3971-camera-fg-2ch-overlay.dts](tegra264-p3971-camera-fg-2ch-overlay.dts) | `Jetson Camera Thor_FG_2CH` | 2 CH | 4 lanes | FG-2CH |
| [tegra264-p3971-camera-fg-4ch-overlay.dts](tegra264-p3971-camera-fg-4ch-overlay.dts) | `Jetson Camera Thor_FG_4CH` | 4 CH | 4 lanes | FG-4CH |

## 2. General Information

- Target platform: Jetson AGX Thor (P3971 + P3834, compatible with `nvidia,p3971-0089+p3834-0008`, etc.)
- Physical interface: Jetson AGX CSI Connector
- Virtual channels (VC): Distinguished by `vc-id`, each camera corresponds to a unique VC (4CH modules use VC 0/1/2/3)
- I2C buses:
  - `i2c@810c6a0000` (Bus-9): Connects `0x3a` / `0x3b` (first two groups of 2CH and 4CH modules)
  - `i2c@810c6d0000` (Bus-12): Connects `0x3a` / `0x3b` (last two groups of 2CH and 4CH modules); 4CH also extends to `0x3c` / `0x3d`
- CSI interface mapping: `port-index = <2>` maps to `serial_c`, `port-index = <0>` maps to `serial_a`
- Camera control GPIOs (currently disabled, source commented out):
  - `CAM1_PWDN` = `TEGRA264_MAIN_GPIO(V, 5)` (Pin93 — MAX9296_1 PWDN/17)
  - `CAM2_PWDN` = `TEGRA264_MAIN_GPIO(V, 2)` (Pin95 — MAX9296_2 PWDN/18)
- Output format: YUV422 (`mode_type = "yuv"`, `pixel_phase = "uyvy"`), resolution 3840×2160 @30fps
- Clock: Sensor master clock from `TEGRA264_CLK_EXTPERIPH1` (37.125 MHz); `serdes_pix_clk_hz = 375000000`

## 3. Compiling to DTBO

The upgrade packages (e.g., `fg.*.sh`) in each JetPack version directory usually include pre-compiled DTBOs. This directory is mainly for viewing or modifying the source. Manual compilation example:

```bash
# 1. Copy to the kernel source hardware directory
sudo cp tegra264-p3971-camera-fg-2ch-overlay.dts \
        /usr/src/linux-headers-$(uname -r)/arch/arm64/boot/dts/../hardware/nvidia/platform/t26x/rootfs/kernel-dts/

# 2. Compile
cd /usr/src/linux-headers-$(uname -r)
sudo make dtbs
# Output: arch/arm64/boot/dts/../hardware/.../tegra264-p3971-camera-fg-2ch-overlay.dtbo
```

## 4. Loading and Verification

```bash
# Load overlay
sudo fdtoverlay -i /boot/dtb/tegra264-p3971-0089-p3834-0008.dtb \
                -o /boot/tegra264-p3971-0089-p3834-0008-fzcam.dtb \
                tegra264-p3971-camera-fg-2ch-overlay.dtbo

# Verify active overlay
cat /proc/device-tree/overlay-name
# Expected: Jetson Camera Thor_FG_2CH  or  Jetson Camera Thor_FG_4CH
```

## 5. Selection Guide

- 2CH module → use `*-fg-2ch-overlay.dts`
- 4CH module → use `*-fg-4ch-overlay.dts`
- Currently the lane count is fixed at 4 (`CAM_LANES = 4`). Make sure the hardware wiring connects to the correct CSI channel
- For actual use, always pair with the matching JetPack 7.2 / R39.2 upgrade package (driver, `fzcam_app`, DTBO)

## 6. Deserializer POC Enable Configuration

- 2CH module (FG96-2CH) POC Enable configuration

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

- 4CH module (FG12-4CH / FG24-4CH) POC Enable configuration

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
