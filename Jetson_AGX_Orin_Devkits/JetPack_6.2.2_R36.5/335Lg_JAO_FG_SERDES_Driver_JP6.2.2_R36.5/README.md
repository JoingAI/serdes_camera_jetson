
on target Jetson Devkit Copy them to the right places:

```
unzip $fw_names*.zip 

cd $fw_names

# AGX_Orin + G335Lg + FG12_16CH_GMSL: if use FG12_16CH_GMSL_V2x Dser board and use PWM01/TSC3 generate multi-camera synchronization signals.
sudo bash copy_335Lg_to_target.fg12-16ch.sh

```

