# Displays

This folder contains vfd.conf files for the  Khadas VIM2 boards. Each file name consists of the board(s) it is intended for, the controller name and the display configuration.  
[How to connect the display](#khadas-vim2)

## LCDs

HD44780 LCD displays are very basic alphanumeric displays.  
The most commonly available displays are 20x4 and 16x2, meaning they are 20 or 16 characters wide and have 4 or 2 lines of text.  
There are other configurations available, such as 20x2 or 16x4, but they are less common.  
There are 40x4 displays available as well, but those have 2 HD44780 controllers, and are NOT supported.  
You have to make sure that the display you choose has an I2C (also called IIC sometimes) "backpack module", it will allow to convert the 16 pins on the LCD to the 4 pins on your board.

**kvim2-hd44780-1602-vfd.conf:**  
kvim2 - Intended for Khadas VIM2.  
hd44780 - HD44780 controller, alphanumeric LCDs.  
1602 - the display is 16 characters wide and has 2 lines or 16x2.

**kvim2-hd44780-2004-vfd.conf:**  
kvim2 - Intended for Khadas VIM2.  
hd44780 - HD44780 controller, alphanumeric LCDs.  
2004 - the display is 20 characters wide and has 4 lines or 20x4.

## OLEDs

OLED displays are more tricky. There are many different displays available, based on different controllers.  
OpenVFD primarily supports SSD1306 based OLED displays and other controllers with compatible command sets.  
Usually, but not always, the controller used depends on display size. Make sure that you know what controller is on the display before you place an order.  
SSD1306 OLEDs usually come in three configurations:

1. 0.96" and 128x64 resolution.
1. 0.91" and 128x32 resolution.
1. 0.66" and 64x48 resolution.

SSD1309 OLEDs should be 100% compatible with OpenVFD. They are relatively expensive and come in larger sizes, such as 2.42" and 128x64 resolution.

SH1106 OLEDs are a little different. They are almost fully compatible, and therefore OpenVFD can drive this controller as well, but it requires different configuration parameters.  
These OLEDs usually come in two sizes:

1. 1.3" and 128x64 resolution.
1. 0.96" and 128x64 resolution.

They  are most common in 1.3" sizes, though.

**kvim2-sh1106-12864-vfd.conf:**  
kvim2 - Intended for Khadas VIM2.  
sh1106 - SH1106 controller, graphic monochrome OLEDs.  
12864 - Resolution, 128 pixels wide, 64 pixels high. 128x64.

**kvim2-ssd1306-12864-vfd.conf:**  
kvim2 - Intended for Khadas VIM2.  
ssd1306 - SSD1306 controller, graphic monochrome OLEDs.  
12864 - Resolution, 128 pixels wide, 64 pixels high. 128x64.

**kvim2-ssd1306-12832-vfd.conf:**  
kvim2 - Intended for Khadas VIM2.  
ssd1306 - SSD1306 controller, graphic monochrome OLEDs.  
12832 - Resolution, 128 pixels wide, 32 pixels high. 128x32.

## Khadas VIM2

```text
Display  Board
VCC      5V                    - Pin #2
GND      GND                   - Pin #5
SCL      GPIODV_25 - I2C_SCK_A - Pin #22
SDA      GPIODV_24 - I2C_SDA_A - Pin #23
```

### Pinout map(V12)

```text
SIGNAL        PIN       PIN     SIGNAL
5V            1         21      GND
5V            2         22      I2C_SCK_A
HUB_DM1       3         23      I2C_SDA_A
HUB_DP1       4         24      GND
GND           5         25      I2C_SCK_B
GPIODV_21     6         26      I2C_SDA_B
GPIODV_22     7         27      3.3V
GPIODV_23     8         28      GND
GND           9         29      I2S_SCLK
ADC_CH0       10        30      I2S_MCLK
1.8V          11        31      I2S_SDO
ADC_CH2       12        32      I2S_LRCK
SPDIF         13        33      I2S_SDI
GND           14        34      GND
UART_RX_AO_B  15        35      PWM_D
UART_TX_AO_B  16        36      RTC_CLK
GND           17        37      GPIOH_5
Linux_RX      18        38      EXP_INT
Linux_TX      19        39      GPIODV_13
3.3V          20        40      GND
```

### [VIM2 GPIO Pinout](https://docs.khadas.com/vim2/GPIOPinout.html)
