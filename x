/dts-v1/;

/ {
	overlay-name = "Jetson Camera FG96_8CH_8xYUV";
	jetson-header-name = "Jetson AGX CSI Connector";
	compatible = "nvidia,p3737-0000+p3701-0000\0nvidia,p3737-0000+p3701-0004\0nvidia,p3737-0000+p3701-0005\0nvidia,p3737-0000+p3701-0008";

	fragment@0 {
		status = "okay";
		target-path = "/";

		__overlay__ {
			status = "okay";

			tegra-capture-vi {
				status = "okay";
				num-channels = <0x08>;

				ports {
					status = "okay";
					#address-cells = <0x01>;
					#size-cells = <0x00>;

					port@0 {
						status = "okay";
						reg = <0x00>;

						endpoint {
							status = "okay";
							vc-id = <0x00>;
							port-index = <0x00>;
							bus-width = <0x04>;
							remote-endpoint = <0x01>;
							phandle = <0x0a>;
						};
					};

					port@1 {
						status = "okay";
						reg = <0x01>;

						endpoint {
							status = "okay";
							vc-id = <0x01>;
							port-index = <0x00>;
							bus-width = <0x04>;
							remote-endpoint = <0x02>;
							phandle = <0x0c>;
						};
					};

					port@2 {
						status = "okay";
						reg = <0x02>;

						endpoint {
							status = "okay";
							vc-id = <0x00>;
							port-index = <0x02>;
							bus-width = <0x04>;
							remote-endpoint = <0x03>;
							phandle = <0x0e>;
						};
					};

					port@3 {
						status = "okay";
						reg = <0x03>;

						endpoint {
							status = "okay";
							vc-id = <0x01>;
							port-index = <0x02>;
							bus-width = <0x04>;
							remote-endpoint = <0x04>;
							phandle = <0x10>;
						};
					};

					port@4 {
						status = "okay";
						reg = <0x04>;

						endpoint {
							status = "okay";
							vc-id = <0x00>;
							port-index = <0x04>;
							bus-width = <0x04>;
							remote-endpoint = <0x05>;
							phandle = <0x12>;
						};
					};

					port@5 {
						status = "okay";
						reg = <0x05>;

						endpoint {
							status = "okay";
							vc-id = <0x01>;
							port-index = <0x04>;
							bus-width = <0x04>;
							remote-endpoint = <0x06>;
							phandle = <0x14>;
						};
					};

					port@6 {
						status = "okay";
						reg = <0x06>;

						endpoint {
							status = "okay";
							vc-id = <0x00>;
							port-index = <0x05>;
							bus-width = <0x04>;
							remote-endpoint = <0x07>;
							phandle = <0x16>;
						};
					};

					port@7 {
						status = "okay";
						reg = <0x07>;

						endpoint {
							status = "okay";
							vc-id = <0x01>;
							port-index = <0x05>;
							bus-width = <0x04>;
							remote-endpoint = <0x08>;
							phandle = <0x18>;
						};
					};
				};
			};

			tegra-camera-platform {
				status = "okay";
				compatible = "nvidia, tegra-camera-platform";

				modules {
					status = "okay";

					module0 {
						status = "okay";
						badge = "fzcam_frontl";
						position = "frontl";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@0/fzcam_3a@3a";
						};
					};

					module1 {
						status = "okay";
						badge = "fzcam_frontr";
						position = "frontr";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@0/fzcam_3b@3b";
						};
					};

					module2 {
						status = "okay";
						badge = "fzcam_frontu";
						position = "frontu";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@1/fzcam_3a@3a";
						};
					};

					module3 {
						status = "okay";
						badge = "fzcam_frontd";
						position = "frontd";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@1/fzcam_3b@3b";
						};
					};

					module4 {
						status = "okay";
						badge = "fzcam_rearl";
						position = "rearl";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@2/fzcam_3a@3a";
						};
					};

					module5 {
						status = "okay";
						badge = "fzcam_rearr";
						position = "rearr";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@2/fzcam_3b@3b";
						};
					};

					module6 {
						status = "okay";
						badge = "fzcam_rearu";
						position = "rearu";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@3/fzcam_3a@3a";
						};
					};

					module7 {
						status = "okay";
						badge = "fzcam_reard";
						position = "reard";
						orientation = "1";

						drivernode0 {
							status = "okay";
							pcl_id = "v4l2_sensor";
							sysfs-device-tree = "/sys/firmware/devicetree/base/bus@0/i2c@3180000/tca9546@70/i2c@3/fzcam_3b@3b";
						};
					};
				};
			};

			fzcam_sync {
				compatible = "fz,fzcam_sync";
				ranges = <0x00 0x00 0xc6a0000 0x10000>;
				reg = <0x00 0xc6a0000 0x00 0x18>;
				#address-cells = <0x01>;
				#size-cells = <0x01>;
				status = "okay";
				pwms = <0xffffffff 0x00 0x1fca055>;

				generator@380 {
					reg = <0x380 0x80>;
					freq_hz = <0x1e>;
					duty_cycle = <0x0a>;
					offset_ms = <0x00>;
					gpio_pinmux = <0xffffffff 0x0a 0x01>;
					status = "okay";
				};
			};

			bus@0 {
				status = "okay";

				host1x@13e00000 {
					status = "okay";

					nvcsi@15a00000 {
						status = "okay";
						num-channels = <0x08>;
						#address-cells = <0x01>;
						#size-cells = <0x00>;

						channel@0 {
							status = "okay";
							reg = <0x00>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x21>;

									endpoint@0 {
										status = "okay";
										port-index = <0x00>;
										bus-width = <0x04>;
										remote-endpoint = <0x09>;
										phandle = <0x1a>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x22>;

									endpoint@1 {
										status = "okay";
										remote-endpoint = <0x0a>;
										phandle = <0x01>;
									};
								};
							};
						};

						channel@1 {
							status = "okay";
							reg = <0x01>;
							phandle = <0x23>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x24>;

									endpoint@2 {
										status = "okay";
										port-index = <0x00>;
										bus-width = <0x04>;
										remote-endpoint = <0x0b>;
										phandle = <0x19>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x25>;

									endpoint@3 {
										status = "okay";
										remote-endpoint = <0x0c>;
										phandle = <0x02>;
									};
								};
							};
						};

						channel@2 {
							status = "okay";
							reg = <0x02>;
							phandle = <0x26>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x27>;

									endpoint@4 {
										status = "okay";
										port-index = <0x02>;
										bus-width = <0x04>;
										remote-endpoint = <0x0d>;
										phandle = <0x1c>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x28>;

									endpoint@5 {
										status = "okay";
										remote-endpoint = <0x0e>;
										phandle = <0x03>;
									};
								};
							};
						};

						channel@3 {
							status = "okay";
							reg = <0x03>;
							phandle = <0x29>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x2a>;

									endpoint@6 {
										status = "okay";
										port-index = <0x02>;
										bus-width = <0x04>;
										remote-endpoint = <0x0f>;
										phandle = <0x1b>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x2b>;

									endpoint@7 {
										status = "okay";
										remote-endpoint = <0x10>;
										phandle = <0x04>;
									};
								};
							};
						};

						channel@4 {
							status = "okay";
							reg = <0x04>;
							phandle = <0x2c>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x2d>;

									endpoint@8 {
										status = "okay";
										port-index = <0x04>;
										bus-width = <0x04>;
										remote-endpoint = <0x11>;
										phandle = <0x1e>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x2e>;

									endpoint@9 {
										status = "okay";
										remote-endpoint = <0x12>;
										phandle = <0x05>;
									};
								};
							};
						};

						channel@5 {
							status = "okay";
							reg = <0x05>;
							phandle = <0x2f>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x30>;

									endpoint@10 {
										status = "okay";
										port-index = <0x04>;
										bus-width = <0x04>;
										remote-endpoint = <0x13>;
										phandle = <0x1d>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x31>;

									endpoint@11 {
										status = "okay";
										remote-endpoint = <0x14>;
										phandle = <0x06>;
									};
								};
							};
						};

						channel@6 {
							status = "okay";
							reg = <0x06>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x32>;

									endpoint@12 {
										status = "okay";
										port-index = <0x06>;
										bus-width = <0x04>;
										remote-endpoint = <0x15>;
										phandle = <0x20>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x33>;

									endpoint@13 {
										status = "okay";
										remote-endpoint = <0x16>;
										phandle = <0x07>;
									};
								};
							};
						};

						channel@7 {
							status = "okay";
							reg = <0x07>;

							ports {
								status = "okay";
								#address-cells = <0x01>;
								#size-cells = <0x00>;

								port@0 {
									status = "okay";
									reg = <0x00>;
									phandle = <0x34>;

									endpoint@14 {
										status = "okay";
										port-index = <0x06>;
										bus-width = <0x04>;
										remote-endpoint = <0x17>;
										phandle = <0x1f>;
									};
								};

								port@1 {
									status = "okay";
									reg = <0x01>;
									phandle = <0x35>;

									endpoint@15 {
										status = "okay";
										remote-endpoint = <0x18>;
										phandle = <0x08>;
									};
								};
							};
						};
					};
				};

				gpio@2200000 {

					camera-control-output-low {
						gpio-hog;
						output-low;
						gpios = <0x3e 0x00 0x3b 0x00 0xa0 0x00 0xa1 0x00 0xa7 0x00>;
						label = "cam0-pwdn\0cam1-pwdn\0cam2-pwdn\0cam3-pwdn\0cam-poc";
					};
				};

				i2c@3180000 {
					status = "okay";

					tca9546@70 {
						status = "okay";
						compatible = "nxp,pca9546";
						reg = <0x70>;
						#address-cells = <0x01>;
						#size-cells = <0x00>;
						skip_mux_detect;

						i2c@0 {
							status = "okay";
							reg = <0x00>;
							i2c-mux,deselect-on-exit;
							#address-cells = <0x01>;
							#size-cells = <0x00>;

							fzcam_3b@3b {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3b>;
								channel = <0x00>;
								devnode = "video1";
								sensor_model = "fzcam";

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									status = "okay";
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										status = "okay";
										reg = <0x00>;

										endpoint {
											status = "okay";
											vc-id = <0x01>;
											port-index = <0x00>;
											bus-width = <0x04>;
											remote-endpoint = <0x19>;
											phandle = <0x0b>;
										};
									};
								};
							};

							fzcam_3a@3a {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3a>;
								channel = <0x00>;
								devnode = "video0";
								sensor_model = "fzcam";
								poc-gpios = <0xffffffff 0xa7 0x00>;
								reset-gpios = <0xffffffff 0x3e 0x00>;

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_a";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									status = "okay";
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										status = "okay";
										reg = <0x00>;

										endpoint {
											status = "okay";
											vc-id = <0x00>;
											port-index = <0x00>;
											bus-width = <0x04>;
											remote-endpoint = <0x1a>;
											phandle = <0x09>;
										};
									};
								};
							};
						};

						i2c@1 {
							status = "okay";
							reg = <0x01>;
							i2c-mux,deselect-on-exit;
							#address-cells = <0x01>;
							#size-cells = <0x00>;

							fzcam_3b@3b {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3b>;
								channel = <0x01>;
								devnode = "video3";
								sensor_model = "fzcam";

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										reg = <0x00>;

										endpoint {
											vc-id = <0x01>;
											port-index = <0x02>;
											bus-width = <0x04>;
											remote-endpoint = <0x1b>;
											phandle = <0x0f>;
										};
									};
								};
							};

							fzcam_3a@3a {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3a>;
								channel = <0x01>;
								devnode = "video2";
								sensor_model = "fzcam";
								reset-gpios = <0xffffffff 0x3b 0x00>;

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_c";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										reg = <0x00>;

										endpoint {
											vc-id = <0x00>;
											port-index = <0x02>;
											bus-width = <0x04>;
											remote-endpoint = <0x1c>;
											phandle = <0x0d>;
										};
									};
								};
							};
						};

						i2c@2 {
							status = "okay";
							reg = <0x02>;
							i2c-mux,deselect-on-exit;
							#address-cells = <0x01>;
							#size-cells = <0x00>;

							fzcam_3b@3b {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3b>;
								channel = <0x02>;
								devnode = "video5";
								sensor_model = "fzcam";

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										reg = <0x00>;

										endpoint {
											vc-id = <0x01>;
											port-index = <0x04>;
											bus-width = <0x04>;
											remote-endpoint = <0x1d>;
											phandle = <0x13>;
										};
									};
								};
							};

							fzcam_3a@3a {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3a>;
								channel = <0x02>;
								devnode = "video4";
								sensor_model = "fzcam";
								reset-gpios = <0xffffffff 0xa0 0x00>;

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_e";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										reg = <0x00>;

										endpoint {
											vc-id = <0x00>;
											port-index = <0x04>;
											bus-width = <0x04>;
											remote-endpoint = <0x1e>;
											phandle = <0x11>;
										};
									};
								};
							};
						};

						i2c@3 {
							status = "okay";
							reg = <0x03>;
							i2c-mux,deselect-on-exit;
							#address-cells = <0x01>;
							#size-cells = <0x00>;

							fzcam_3b@3b {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3b>;
								channel = <0x03>;
								devnode = "video7";
								sensor_model = "fzcam";

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "1";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										reg = <0x00>;

										endpoint {
											vc-id = <0x01>;
											port-index = <0x05>;
											bus-width = <0x04>;
											remote-endpoint = <0x1f>;
											phandle = <0x17>;
										};
									};
								};
							};

							fzcam_3a@3a {
								status = "okay";
								compatible = "nvidia,fzcam";
								reg = <0x3a>;
								channel = <0x03>;
								devnode = "video6";
								sensor_model = "fzcam";
								reset-gpios = <0xffffffff 0xa1 0x00>;

								mode0 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode1 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode2 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode3 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode4 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode5 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode6 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode7 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode8 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								mode9 {
									mclk_khz = "37125";
									num_lanes = "4";
									tegra_sinterface = "serial_g";
									vc_id = "0";
									discontinuous_clk = "no";
									dpcm_enable = "false";
									cil_settletime = "0";
									csi_pixel_bit_depth = "16";
									mode_type = "yuv";
									pixel_phase = "uyvy";
									active_w = "3840";
									active_h = "2160";
									readout_orientation = "0";
									line_length = "4400";
									inherent_gain = "1";
									pix_clk_hz = "74250000";
									serdes_pix_clk_hz = "375000000";
									gain_factor = "10";
									min_gain_val = "0";
									max_gain_val = "480";
									step_gain_val = "3";
									default_gain = "0";
									min_hdr_ratio = "1";
									max_hdr_ratio = "1";
									framerate_factor = "1000000";
									min_framerate = "30000000";
									max_framerate = "30000000";
									step_framerate = "1";
									default_framerate = "30000000";
									exposure_factor = "1000000";
									min_exp_time = "30";
									max_exp_time = "660000";
									step_exp_time = "1";
									default_exp_time = "33334";
									embedded_metadata_height = "0";
								};

								ports {
									#address-cells = <0x01>;
									#size-cells = <0x00>;

									port@0 {
										reg = <0x00>;

										endpoint {
											vc-id = <0x00>;
											port-index = <0x05>;
											bus-width = <0x04>;
											remote-endpoint = <0x20>;
											phandle = <0x15>;
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};

	__symbols__ {
		fzcam_vi_in0 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@0/endpoint";
		fzcam_vi_in1 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@1/endpoint";
		fzcam_vi_in2 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@2/endpoint";
		fzcam_vi_in3 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@3/endpoint";
		fzcam_vi_in4 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@4/endpoint";
		fzcam_vi_in5 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@5/endpoint";
		fzcam_vi_in6 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@6/endpoint";
		fzcam_vi_in7 = "/fragment@0/__overlay__/tegra-capture-vi/ports/port@7/endpoint";
		csi_chan0_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@0/ports/port@0";
		fzcam_csi_in0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@0/ports/port@0/endpoint@0";
		csi_chan0_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@0/ports/port@1";
		fzcam_csi_out0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@0/ports/port@1/endpoint@1";
		csi_chan1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@1";
		csi_chan1_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@1/ports/port@0";
		fzcam_csi_in1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@1/ports/port@0/endpoint@2";
		csi_chan1_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@1/ports/port@1";
		fzcam_csi_out1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@1/ports/port@1/endpoint@3";
		csi_chan2 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@2";
		csi_chan2_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@2/ports/port@0";
		fzcam_csi_in2 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@2/ports/port@0/endpoint@4";
		csi_chan2_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@2/ports/port@1";
		fzcam_csi_out2 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@2/ports/port@1/endpoint@5";
		csi_chan3 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@3";
		csi_chan3_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@3/ports/port@0";
		fzcam_csi_in3 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@3/ports/port@0/endpoint@6";
		csi_chan3_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@3/ports/port@1";
		fzcam_csi_out3 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@3/ports/port@1/endpoint@7";
		csi_chan4 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@4";
		csi_chan4_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@4/ports/port@0";
		fzcam_csi_in4 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@4/ports/port@0/endpoint@8";
		csi_chan4_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@4/ports/port@1";
		fzcam_csi_out4 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@4/ports/port@1/endpoint@9";
		csi_chan5 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@5";
		csi_chan5_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@5/ports/port@0";
		fzcam_csi_in5 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@5/ports/port@0/endpoint@10";
		csi_chan5_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@5/ports/port@1";
		fzcam_csi_out5 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@5/ports/port@1/endpoint@11";
		csi_chan6_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@6/ports/port@0";
		fzcam_csi_in6 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@6/ports/port@0/endpoint@12";
		csi_chan6_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@6/ports/port@1";
		fzcam_csi_out6 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@6/ports/port@1/endpoint@13";
		csi_chan7_port0 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@7/ports/port@0";
		fzcam_csi_in7 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@7/ports/port@0/endpoint@14";
		csi_chan7_port1 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@7/ports/port@1";
		fzcam_csi_out7 = "/fragment@0/__overlay__/bus@0/host1x@13e00000/nvcsi@15a00000/channel@7/ports/port@1/endpoint@15";
		fzcam_out1 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@0/fzcam_3b@3b/ports/port@0/endpoint";
		fzcam_out0 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@0/fzcam_3a@3a/ports/port@0/endpoint";
		fzcam_out3 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@1/fzcam_3b@3b/ports/port@0/endpoint";
		fzcam_out2 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@1/fzcam_3a@3a/ports/port@0/endpoint";
		fzcam_out5 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@2/fzcam_3b@3b/ports/port@0/endpoint";
		fzcam_out4 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@2/fzcam_3a@3a/ports/port@0/endpoint";
		fzcam_out7 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@3/fzcam_3b@3b/ports/port@0/endpoint";
		fzcam_out6 = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@3/fzcam_3a@3a/ports/port@0/endpoint";
	};

	__fixups__ {
		pwm8 = "/fragment@0/__overlay__/fzcam_sync:pwms:0";
		gpio_aon = "/fragment@0/__overlay__/fzcam_sync/generator@380:gpio_pinmux:0";
		gpio = "/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@0/fzcam_3a@3a:poc-gpios:0\0/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@0/fzcam_3a@3a:reset-gpios:0\0/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@1/fzcam_3a@3a:reset-gpios:0\0/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@2/fzcam_3a@3a:reset-gpios:0\0/fragment@0/__overlay__/bus@0/i2c@3180000/tca9546@70/i2c@3/fzcam_3a@3a:reset-gpios:0";
	};

	__local_fixups__ {

		fragment@0 {

			__overlay__ {

				tegra-capture-vi {

					ports {

						port@0 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@1 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@2 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@3 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@4 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@5 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@6 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};

						port@7 {

							endpoint {
								remote-endpoint = <0x00>;
							};
						};
					};
				};

				bus@0 {

					host1x@13e00000 {

						nvcsi@15a00000 {

							channel@0 {

								ports {

									port@0 {

										endpoint@0 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@1 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@1 {

								ports {

									port@0 {

										endpoint@2 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@3 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@2 {

								ports {

									port@0 {

										endpoint@4 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@5 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@3 {

								ports {

									port@0 {

										endpoint@6 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@7 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@4 {

								ports {

									port@0 {

										endpoint@8 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@9 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@5 {

								ports {

									port@0 {

										endpoint@10 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@11 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@6 {

								ports {

									port@0 {

										endpoint@12 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@13 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};

							channel@7 {

								ports {

									port@0 {

										endpoint@14 {
											remote-endpoint = <0x00>;
										};
									};

									port@1 {

										endpoint@15 {
											remote-endpoint = <0x00>;
										};
									};
								};
							};
						};
					};

					i2c@3180000 {

						tca9546@70 {

							i2c@0 {

								fzcam_3b@3b {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};

								fzcam_3a@3a {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};
							};

							i2c@1 {

								fzcam_3b@3b {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};

								fzcam_3a@3a {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};
							};

							i2c@2 {

								fzcam_3b@3b {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};

								fzcam_3a@3a {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};
							};

							i2c@3 {

								fzcam_3b@3b {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};

								fzcam_3a@3a {

									ports {

										port@0 {

											endpoint {
												remote-endpoint = <0x00>;
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
