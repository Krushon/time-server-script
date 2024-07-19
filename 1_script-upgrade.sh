#!/bin/bash
# Checking the debian distribution version. Проверяем версию дистрибутива debian.
SECONDS=0
printf "\033c"
ver=`cat /etc/*-release | grep VERSION_ID | awk -F= '{print $2}'`
# 9  - Support is over. Поддержка версии 9 (stretch) закончилась 30.06.2022.
# 10 - Support is over. Поддержка версии 10 (buster) закончилась 30.06.2024.
# 11 - Support will end on 30.06.2026. Поддержка версии 11 (bullseye) закончится 30.06.2026.
# If 11 then update to 12. Если версия 11, то обновляем до 12.
if [ $ver = '"11"' ]
  then
    #выгружаем список установленных пакетов
    dpkg -l > ~/dpkg-full.list
    echo "OS version is 11. Upgrading to 12..."
    cp /etc/apt/sources.list /etc/apt/sources.list.bak
    sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list
    apt update
    apt upgrade -y
    apt dist-upgrade -y
    apt full-upgrade -y
    apt autoremove -y
#  If 12 then update. Если версия 12, то просто всё обновляем.
elif [ $ver = '"12"' ]
  then
    echo "Updating system..."
    apt update
    apt upgrade -y
    apt autoremove -y    
# If version is not 11,12 and not debian then break. Если версия не 11, 12 и не debian, то скрипт завершается и потребуется ручное вмешательство.
  else
    echo -e "\e[31mSomething went wrong. Meddling required.\e[0m"
    echo -e "\e[31mЧто-то пошло не так. Требуется вмешательство.\e[0m"
    exit 0
fi

# Check for a reboot recommendation after the update. Проверяем на рекомендацию перезагрузки после апдейта
reb=`cat /var/log/apt/term.log | grep Please | awk '{print $1, $2}'`
if [[ $reb == "Please reboot" ]]
  then
    echo -e "\e[1;31m### It would be nice to reboot if possible ###\e[0m"
    echo -e "\e[1;31m###  Хорошо бы ребутнуться по возможности  ###\e[0m"
fi

echo
echo -e "***** Script \033[33;1m1\033[0m of \033[33;1m3\033[0m COMPLETED in $SECONDS seconds *****"
echo