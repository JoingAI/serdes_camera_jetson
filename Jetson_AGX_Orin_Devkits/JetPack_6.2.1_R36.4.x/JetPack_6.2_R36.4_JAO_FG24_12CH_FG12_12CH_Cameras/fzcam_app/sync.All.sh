#此示例为软件模拟PWM的Demo，可产生25Hz左右的PWM信号

sudo busybox devmem 0x0c302048 32 0x6

sudo sh -c 'echo timer > /sys/class/leds/camsyncall-gpio/trigger'

sudo sh -c 'echo 10 > /sys/class/leds/camsyncall-gpio/delay_on; echo 20 > /sys/class/leds/camsyncall-gpio/delay_off'


