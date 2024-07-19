#!/bin/bash
# Устанавливаем пакеты MidnightCommander, сетевые утилиты и NTPsec для синхронизации часов.
SECONDS=0
printf "\033c"
systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd
echo "Устанавливаем необходимое ПО..."
apt update
apt install mc net-tools ntpsec -y
apt autoclean && apt clean
# Изменяем временную зону на свою
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
echo
echo -e "***** Script \033[33;1m2\033[0m of \033[33;1m3\033[0m COMPLETED in $SECONDS seconds *****"
echo
