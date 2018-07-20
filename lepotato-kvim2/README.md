# Le Potato
	Display  Board  
	VCC      5V                    - Pin #2
	GND      GND                   - Pin #6
	SCL      GPIODV_27 - I2C_SCK_B - Pin #28
	SDA      GPIODV_26 - I2C_SDA_B - Pin #27
![](https://i0.wp.com/libre.computer/wp-content/uploads/2018/05/mmexport1510488638659.jpg?w=1000&ssl=1)  
![](https://i0.wp.com/libre.computer/wp-content/uploads/2018/05/Screenshot-from-2018-05-21-11-48-00.png?w=336&ssl=1)
### [GPIO Headers Reference for AML-S905X-CC](https://libre.computer/2018/05/19/gpio-headers-reference-for-aml-s905x-cc/)

# Khadas VIM2
	Display  Board
	VCC      5V                    - Pin #2
	GND      GND                   - Pin #5
	SCL      GPIODV_27 - I2C_SCK_B - Pin #25
	SDA      GPIODV_26 - I2C_SDA_B - Pin #26  
## Pinout map(V12)
	SIGNAL 	      PIN       PIN     SIGNAL
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
### [VIM2 GPIO Pinout](https://docs.khadas.com/vim2/GPIOPinout.html)