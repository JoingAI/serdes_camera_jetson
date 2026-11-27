# Y309 RealSense (D585 + D405) - JetPack 7.2.1 / L4T R39.2.1

Y309 carrier (Orin NX 16GB + 2x MAX96724) RealSense GMSL firmware upgrade package.

- D585 on U6 (i2c-0, CSI-A, MAX96717F): Depth/RGB/IR 1280x720@30 verified,
  30 min concurrent soak 29.92 fps with zero CSI errors. IMU 100 Hz (frame truncation known).
- D405 on U7 (i2c-2, CSI-C, MAX9295): probe/I2C/GMSL link OK, camera refuses START_STREAM
  (VIDEO_LOCK=0), not lit yet.

Package: y309_realsense_upgrade_r39.2.1_v1.tar.gz (binary only: dtbo + 14 ko + tools).
Install: tar xzf ...; cd ...; sudo ./install.sh --set-default; sudo reboot

Case: CASE-20261121-y309-d585-d405-96724.md (knowledge base).
