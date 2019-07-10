#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "copying files to /home/futurisa/"
cp -r $DIR/atomicpi/doc /home/futurisa/
cp -r $DIR/atomicpi/samples /home/futurisa/
ln -s /home/futurisa/samples /home/futurisa/Desktop
ln -s /home/futurisa/doc /home/futurisa/Desktop
echo "copying files to /usr/src/"
sudo cp -r $DIR/src/* /usr/src/
echo "copying files to /usr/lib/"
sudo cp -r $DIR/lib/node /usr/lib/
sudo cp -r $DIR/lib/nodejs /usr/lib/
sudo cp  $DIR/lib/*.sh /usr/lib/
sudo chmod a+x /usr/lib/atomicpi.sh
sudo chmod a+x /usr/lib/gpio-present.sh
sudo chmod a+x /usr/lib/i2c-gpio-custom-filter.sh
sudo chmod a+x /usr/lib/spi-gpio-custom-filter.sh
echo "copying files to /usr/bin/"
sudo cp $DIR/bin/* /usr/bin/
echo "copying files to /usr/sbin/"
sudo cp $DIR/sbin/* /usr/sbin/
echo "copying files to /etc/default/grub.d/"
sudo cp $DIR/grub.d/* /etc/default/grub.d/
echo "copying files to /etc/initramfs-tools/"
sudo cp $DIR/initramfs-tools/modules /etc/initramfs-tools/
echo "copying files to /etc/initramfs-tools/conf.d"
sudo cp $DIR/conf.d/000-no-resume.conf /etc/initramfs-tools/conf.d/
echo "copying files to /etc/systemd/system/"
sudo cp $DIR/system/* /etc/systemd/system/
echo "copying files /etc/modules-load.d"
sudo cp $DIR/modules-load.d/* /etc/modules-load.d/
echo "firing services"
sudo systemctl enable i2c-gpio-custom.service
sudo systemctl start i2c-gpio-custom.service
sudo systemctl status i2c-gpio-custom.service
sudo systemctl enable spi-gpio-custom.service
sudo systemctl start spi-gpio-custom.service
sudo systemctl status spi-gpio-custom.service
sudo systemctl enable atomicpi-hold-mic.service
sudo systemctl start atomicpi-hold-mic.service
sudo systemctl status atomicpi-hold-mic.service
sudo systemctl enable atomicpi-hold-xmos.service
sudo systemctl start atomicpi-hold-xmos.service
sudo systemctl status atomicpi-hold-xmos.service
echo "done"
