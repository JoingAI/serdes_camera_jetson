# serdes_camera_jetson
JoingAI Serdes board support cameras based on NVIDIA Jetson

## Project Overview
This project provides support for JoingAI Serdes boards and cameras on NVIDIA Jetson platforms, including comprehensive firmware, drivers, and applications for different camera configurations.

## Supported Platforms

### Jetson AGX Orin Devkits
- **JetPack_6.2.2_R36.5**: JetPack 6.2.2 (R36.5) support
  - **JetPack_6.2.2_R36.5_JAO_FG96_8CH_YUV_Cameras**: 8-channel YUV camera support for FG96 SerDes board
  - **Realsense_D4XX_JAO_FG96_8CH_Driver_JP6.2.2_R36.5**: Intel RealSense D4XX camera support
- **JetPack_6.2_R36.4.x**: JetPack 6.2 (R36.4.x) support
  - **JetPack_6.2_R36.4_JAO_FG96_8CH_YUV_Cameras**: 8-channel YUV camera support for FG96 SerDes board

### Jetson Orin NX/Nano Devkits
- **JetPack_6.2.2_R36.5**: JetPack 6.2.2 (R36.5) support
  - **JetPack_6.2.2_R36.5_4CH_YUV_Cameras**: 4-channel YUV camera support
- **JetPack_6.2_R36.4.x**: JetPack 6.2 (R36.4.x) support
  - **JetPack_6.1_6.2_6.2.1_4CH_YUV_Cameras**: 4-channel YUV camera support
- **JetPack_6.0_R36.3**: JetPack 6.0 (R36.3) support

## Quick Start

### For Jetson AGX Orin + FG96 8CH YUV Cameras (JetPack 6.2.2)
1. Navigate to the `Jetson_AGX_Orin_Devkits/JetPack_6.2.2_R36.5/JetPack_6.2.2_R36.5_JAO_FG96_8CH_YUV_Cameras` directory
2. Follow the instructions in the documentation files for detailed setup and configuration

### For Jetson AGX Orin + FG96 8CH YUV Cameras (JetPack 6.2)
1. Navigate to the `Jetson_AGX_Orin_Devkits/JetPack_6.2_R36.4.x/JetPack_6.2_R36.4_JAO_FG96_8CH_YUV_Cameras` directory
2. Follow the instructions in the documentation files for detailed setup and configuration

### For Jetson Orin NX/Nano + 4CH YUV Cameras (JetPack 6.2.2)
1. Navigate to the `Jetson_Orin_NX_Nano_Devkits/JetPack_6.2.2_R36.5/JetPack_6.2.2_R36.5_4CH_YUV_Cameras` directory
2. Follow the instructions in the documentation files for detailed setup and configuration

### For Jetson Orin NX/Nano + 4CH YUV Cameras (JetPack 6.2)
1. Navigate to the `Jetson_Orin_NX_Nano_Devkits/JetPack_6.2_R36.4.x/JetPack_6.1_6.2_6.2.1_4CH_YUV_Cameras` directory
2. Follow the instructions in the documentation files for detailed setup and configuration

## Directory Structure

```
serdes_camera_jetson/
├── README.md                                      # This file
├── Jetson_AGX_Orin_Devkits/                       # Jetson AGX Orin support
│   ├── JetPack_6.2.2_R36.5/                       # JetPack 6.2.2 (R36.5)
│   │   ├── JetPack_6.2.2_R36.5_JAO_FG96_8CH_YUV_Cameras/  # 8CH YUV cameras
│   │   └── Realsense_D4XX_JAO_FG96_8CH_Driver_JP6.2.2_R36.5/  # RealSense D4XX
│   └── JetPack_6.2_R36.4.x/                       # JetPack 6.2 (R36.4.x)
│       └── JetPack_6.2_R36.4_JAO_FG96_8CH_YUV_Cameras/  # 8CH YUV cameras
├── Jetson_Orin_NX_Nano_Devkits/                   # Jetson Orin NX/Nano support
│   ├── JetPack_6.2.2_R36.5/                       # JetPack 6.2.2 (R36.5)
│   │   └── JetPack_6.2.2_R36.5_4CH_YUV_Cameras/   # 4CH YUV cameras
│   ├── JetPack_6.2_R36.4.x/                       # JetPack 6.2 (R36.4.x)
│   │   └── JetPack_6.1_6.2_6.2.1_4CH_YUV_Cameras/ # 4CH YUV cameras
│   └── JetPack_6.0_R36.3/                         # JetPack 6.0 (R36.3)
└── script/                                        # Utility scripts
```

## Features
- Support for multiple camera channels (4CH and 8CH configurations)
- YUV format camera support
- Intel RealSense D4XX camera support (AGX Orin only)
- Easy-to-use upgrade scripts
- User-friendly UI configuration tool
- GStreamer integration for video streaming
- Comprehensive documentation in both English and Chinese
- Support for multiple JetPack versions (6.0, 6.2, 6.2.2)

## Requirements
- NVIDIA Jetson platform (AGX Orin, Orin NX, or Orin Nano)
- JetPack 6.0 (R36.3), 6.2 (R36.4.x), or 6.2.2 (R36.5)
- JoingAI Serdes board and compatible cameras

## Support
For issues or questions, please refer to the documentation in each directory or contact JoingAI support with contact@joingai.com.

