# serdes_camera_jetson
JoingAI Serdes board support cameras based on NVIDIA Jetson

## Project Overview
This project provides support for JoingAI Serdes boards and cameras on NVIDIA Jetson platforms, including comprehensive firmware, drivers, and applications for different camera configurations.

## Supported Platforms

### Jetson AGX Orin Devkits
- **JetPack_6.x_JAO_FG96_8CH_YUV_Cameras**: 8-channel YUV camera support for FG96 SerDes board

### Jetson Orin NX/Nano Devkits
- **JetPack_6.x_4CH_YUV_Cameras**: 4-channel YUV camera support

## Quick Start

### For Jetson AGX Orin + FG96 8CH YUV Cameras
1. Navigate to the `Jetson_AGX_Orin_Devkits/JetPack_6.x_JAO_FG96_8CH_YUV_Cameras` directory
2. Follow the instructions in `README-EN.md` for detailed setup and configuration

### For Jetson Orin NX/Nano + 4CH YUV Cameras
1. Navigate to the `Jetson_Orin_NX_Nano_Devkits/JetPack_6.x_4CH_YUV_Cameras` directory
2. Follow the instructions in `README-EN.md` for detailed setup and configuration

## Directory Structure

```
serdes_camera_jetson/
├── README.md                   # This file
├── Jetson_AGX_Orin_Devkits/
│   └── JetPack_6.x_JAO_FG96_8CH_YUV_Cameras/
│       ├── README-CN.md        # Chinese documentation
│       ├── README-EN.md        # English documentation
│       ├── fg96.8ch.JAO.R36.4.x.sh  # Upgrade script
│       ├── fzcam_app/          # Application files
│       └── rootfs/             # Driver and configuration files
└── Jetson_Orin_NX_Nano_Devkits/
    └── JetPack_6.x_4CH_YUV_Cameras/
        ├── README-CN.md        # Chinese documentation
        ├── README-EN.md        # English documentation
        ├── fg.4ch.onx.2lane.R36.4.x.sh  # 2-lane upgrade script
        ├── fg.4ch.onx.4lane.R36.4.x.sh  # 4-lane upgrade script
        ├── fzcam_app/          # Application files
        └── rootfs/             # Driver and configuration files
```

## Features
- Support for multiple camera channels (4CH and 8CH configurations)
- YUV format camera support
- Easy-to-use upgrade scripts
- User-friendly UI configuration tool
- GStreamer integration for video streaming
- Comprehensive documentation in both English and Chinese

## Requirements
- NVIDIA Jetson platform (AGX Orin, Orin NX, or Orin Nano)
- JetPack 6.x (R36.4.x)
- JoingAI Serdes board and compatible cameras

## Support
For issues or questions, please refer to the documentation in each directory or contact JoingAI support with contact@joingai.com.

