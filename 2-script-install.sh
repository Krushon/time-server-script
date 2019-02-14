#!/bin/bash
# Устанавливаем пакеты OpenVPN, MidnightCommander, почтовые утилиты и NTP для синхронизации часов.
SECONDS=0
printf "\033c"
echo "Устанавливаем необходимое ПО..."
apt-get update
apt-get install mc ntpdate ntp net-tools -y
apt-get autoclean && apt-get clean
#/etc/init.d/ntp stop && ntpdate pool.ntp.org && /etc/init.d/ntp start
# Изменяем временную зону
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
echo
echo -e "***** Script \033[33;1m2\033[0m of \033[33;1m3\033[0m COMPLETED in $SECONDS seconds *****"
echo
