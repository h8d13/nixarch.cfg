#!/usr/bin/env bash
# more simplistic setup
pacman -S --needed -noconfirm zram-generator git micro

echo "[zram0]" > /etc/systemd/zram-generator.conf
echo "EDITOR=micro" >> /etc/environment
