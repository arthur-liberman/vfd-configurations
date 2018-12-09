# This file must be renamed to vfd.conf and placed in the /storage/.config/ folder.
#
# Zoomtak Upro S912 configuration
#--------------------
#gpio_xxx:
# [0] 0 = &gpio, 1 = &gpio_ao.
# [1] pin number - https://github.com/openSUSE/kernel/blob/master/include/dt-bindings/gpio/meson-gxl-gpio.h
# [0] Reserved - must be 0.

vfd_gpio_clk='0,71,0'
vfd_gpio_dat='0,72,0'
vfd_gpio_stb='0,73,0'

#chars:
# < DHHMM > Order of display chars (D=dots, represented by a single char)

vfd_chars='4,0,1,2,3'

#dot_bits:
# Order of dot bits. Typical configurations:
# Display Type 0, 1 usually has Alarm, USB, Play, Pause, Col, Ethernet, Wifi dots
# Alarm = 0, USB = 1, Play = 2, Pause = 3, Col = 4, Eth = 5, Wifi = 6
# Display Type 2 usually has APPS, USB, SETUP, CARD, Col, HDMI, CVBS dots
# APPS = 0, USB = 1, SETUP = 2, CARD = 3, Col = 4, HDMI = 5, CVBS = 6
# Display Type 3 Power, LAN, Col, Low Wifi, High Wifi
# N/A = 0, N/A = 1, Power = 2, LAN = 3, Col = 4, Low Wifi = 5, High Wifi = 6

vfd_dot_bits='0,1,2,3,4,5,6'

#display_type:
# [0] - Display type.
# [1] - Reserved - must be 0..
# [2] - Flags. (bit 0 = '1' - Common Anode display)
# [3] - Controller.

vfd_display_type='0x02,0x00,0x01,0x00'
