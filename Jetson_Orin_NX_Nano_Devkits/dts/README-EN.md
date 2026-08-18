# Jetson Orin NX / Nano Devkits — DTS Overlays

This directory contains the **device tree overlay (DTBO source files)** for SerDes cameras used with Jetson Orin NX / Orin Nano Devkits (P3768). File naming convention:

```
tegra234-p3767-camera-p3768-serdes-<CH>ch-<LANES>lanes.dts
```

- `p3767` — Jetson Orin NX / Nano Devkit carrier board
- `p3768` — Jetson Orin NX / Nano module
- `<CH>` — Number of virtual channels / camera inputs
- `<LANES>` — Number of lanes per CSI channel

> Once loaded, the `overlay-name` appears in `/proc/device-tree/overlay-name`, which can be used to verify the active DTBO.

## 1. File List

| File | overlay-name | Channels | Lanes | Module |
| --- | --- | --- | --- | --- |
| [tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dts](tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dts) | `Camera FG96-2CH-4Lanes-YUV` | 2 CH | 4 lanes | FG96-2CH |
| [tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dts](tegra234-p3767-camera-p3768-serdes-4ch-4lanes.dts) | `Camera FG-4CH-4Lanes-YUV` | 4 CH | 4 lanes | FG12-4CH / FG24-4CH |

## 2. General Information

- Target platform: Jetson Orin NX / Orin Nano Devkits (`JETSON_COMPATIBLE_P3768`)
- Physical interface: Jetson 22pin CSI Connector
- Virtual channels (VC): Distinguished by `vc-id`, each camera corresponds to a unique VC
- I2C: Uses `cam_i2cmux` (GPIO-switched), MCU addresses are `0x3a / 0x3b` (2CH) or `0x3a / 0x3b / 0x3c / 0x3d` (4CH)
- Output format: YUV422 (`mode_type = "yuv"`, `pixel_phase = "uyvy"`), resolution 1920×1080 @30fps
- CSI interface mapping: `port-index = <2>` maps to `serial_c`, `port-index = <0>` maps to `serial_a`

## 3. Compiling to DTBO

The upgrade packages (e.g., `fg.*.sh`) in each JetPack version directory usually include pre-compiled DTBOs. This directory is mainly for viewing or modifying the source. Manual compilation example:

```bash
# 1. Copy to the kernel source hardware directory
sudo cp tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dts \
        /usr/src/linux-headers-$(uname -r)/arch/arm64/boot/dts/../hardware/nvidia/platform/t23x/concord/kernel-dts/

# 2. Compile
cd /usr/src/linux-headers-$(uname -r)
sudo make dtbs
# Output: arch/arm64/boot/dts/../hardware/.../tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dtbo
```

## 4. Loading and Verification

```bash
# Load overlay
sudo fdtoverlay -i /boot/dtb/tegra234-p3767-0000-p3768-0000-a0.dtb \
                -o /boot/tegra234-p3767-0000-p3768-0000-a0-fzcam.dtb \
                tegra234-p3767-camera-p3768-serdes-2ch-4lanes.dtbo

# Verify active overlay
cat /proc/device-tree/overlay-name
# Expected: Camera FG96-2CH-4Lanes-YUV  or  Camera FG-4CH-4Lanes-YUV
```

## 5. Selection Guide

- 2CH module (FG96) → use `*-2ch-4lanes.dts`
- 4CH module (FG12 / FG24) → use `*-4ch-4lanes.dts`
- 2lane / 4lane difference: Depends on CSI wiring. Choose the matching lane version based on your module hardware
- For actual use, always pair with the matching JetPack version's upgrade package (driver, `fzcam_app`, DTBO)

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
