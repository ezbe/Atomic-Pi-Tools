#!/bin/bash
#GPIO0 24/26 335 	1 IN 	STATUS IN3
#GPIO1 25/26 332	1 OUT
#GPIO2 26/26 338	1 IN 	SIREN IN2
#GPIO3 18/26 329	1 IN 
#GPIO4 19/26 336	1 OUT 	BEEP IN1
#GPIO7 20/26 330	0 OUT 	FAN IN4
EXPORT=/sys/class/gpio/export
GPIO=/sys/class/gpio/
GPIO0=335
GPIO1=332
GPIO2=338
GPIO3=329
GPIO4=336
GPIO7=330
GPIO0D=/sys/class/gpio/gpio335/direction
GPIO1D=/sys/class/gpio/gpio332/direction
GPIO2D=/sys/class/gpio/gpio338/direction
GPIO3D=/sys/class/gpio/gpio329/direction
GPIO4D=/sys/class/gpio/gpio336/direction
GPIO7D=/sys/class/gpio/gpio330/direction
GPIO0V=/sys/class/gpio/gpio335/value
GPIO1V=/sys/class/gpio/gpio332/value
GPIO2V=/sys/class/gpio/gpio338/value
GPIO3V=/sys/class/gpio/gpio329/value
GPIO4V=/sys/class/gpio/gpio336/value
GPIO7V=/sys/class/gpio/gpio330/value
SDA=476
SCL=480
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
sudo su <<EOF
echo -e "${GREEN}Exporting ATOMICPI_ISH_GPIO_0${NC}"
echo $GPIO0 > $EXPORT
echo -e "${GREEN}Exporting ATOMICPI_ISH_GPIO_1${NC}"
echo $GPIO1 > $EXPORT
echo -e "${GREEN}Exporting ATOMICPI_ISH_GPIO_2${NC}"
echo $GPIO2 > $EXPORT
echo -e "${GREEN}Exporting ATOMICPI_ISH_GPIO_3${NC}"
echo $GPIO3 > $EXPORT
echo -e "${GREEN}Exporting ATOMICPI_ISH_GPIO_4${NC}"
echo $GPIO4 > $EXPORT
echo -e "${GREEN}Exporting ATOMICPI_ISH_GPIO_7${NC}"
echo $GPIO7 > $EXPORT
echo -e "${GREEN}Exporting I2C2_3P3_SDA${NC}"
echo $SDA > $EXPORT
echo -e "${GREEN}Exporting I2C2_3P3_SCL${NC}"
echo $SCL > $EXPORT
echo -e "${RED}Setting Custom  Directions${NC}"
echo out > $GPIO0D
echo "Reset pins to high"
echo 1 > $GPIO0V
echo 1 > $GPIO1V
echo 1 > $GPIO4V
echo 1 > $GPIO7V
echo "Set ownership for HA"
sudo chown -R root:homeassistant $GPIO
sudo chown -R root:homeassistant /sys/devices/platform/INT33FF:02
sudo chmod -R 777 $GPIO/*
sudo chmod -R 777 /sys/devices/platform/INT33FF:02/*
ls -l $GPIO
ls -l /sys/devices/platform/INT33FF:02
echo out > $GPIO3D
cat $GPIO3D
echo 0 > $GPIO3V
sleep 1
echo 1 > $GPIO3V
sleep 1
echo 1 > $GPIO3V
echo "DONE!"
EOF
