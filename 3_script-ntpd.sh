#!/bin/bash
# Настраиваем конфиг сервера точного времени
SECONDS=0
printf "\033c"
# Индикатор процесса (прикольная крутилка)
for procent in {0..100}
do
    for i in "-" "\\" "|" "/"
    do
	tput civis
	tput sc
	tput setf 2
	echo -n Loading...  \( "$procent"% "$i" \)
	tput rc
	sleep 0.008
    done
done
tput cnorm
tput setf 7
# Генерируем конфиг ntp
mv /etc/ntpsec/ntp.conf /etc/ntpsec/ntp.conf.bak
touch /etc/ntpsec/ntp.conf
chmod 644 /etc/ntpsec/ntp.conf

echo -en "driftfile /var/lib/ntpsec/ntp.drift\nleapfile /usr/share/zoneinfo/leap-seconds.list\n" >> /etc/ntpsec/ntp.conf
echo -en "tos maxclock 11\ntos minclock 4 minsane 3\n" >> /etc/ntpsec/ntp.conf
echo -en "pool ntp1.stratum2.ru iburst\npool ntp2.stratum2.ru iburst\n" >> /etc/ntpsec/ntp.conf
echo -en "pool ntp3.stratum2.ru iburst\npool ntp4.stratum2.ru iburst\n" >> /etc/ntpsec/ntp.conf
echo -en "pool ntp5.stratum2.ru iburst\npool 0.ru.pool.ntp.org iburst\n" >> /etc/ntpsec/ntp.conf
echo -en "restrict default kod nomodify nopeer noquery limited\nrestrict 127.0.0.1\nrestrict ::1\n" >> /etc/ntpsec/ntp.conf

# old ntp config
#echo -en "driftfile /var/lib/ntp/ntp.drift\n#logfile /var/log/ntpstats\n#statsdir /var/log/ntpstats/\n" >> /etc/ntp.conf
#echo -en "statistics loopstats peerstats clockstats\nfilegen loopstats file loopstats type day enable\n" >> /etc/ntp.conf
#echo -en "filegen peerstats file peerstats type day enable\nfilegen clockstats file clockstats type day enable\n" >> /etc/ntp.conf
#echo -en "server ntp1.stratum2.ru iburst\nserver ntp2.stratum2.ru iburst\nserver ntp3.stratum2.ru iburst\n" >> /etc/ntp.conf
#echo -en "server ntp4.stratum2.ru iburst\nserver ntp5.stratum2.ru iburst\npool 0.ru.pool.ntp.org iburst\n" >> /etc/ntp.conf
#echo -en "pool 1.ru.pool.ntp.org iburst\npool 2.ru.pool.ntp.org iburst\npool 3.ru.pool.ntp.org iburst\n" >> /etc/ntp.conf
#echo -en "pool 0.europe.pool.ntp.org\npool 1.europe.pool.ntp.org\nrestrict default ignore\n" >> /etc/ntp.conf
#echo -en "restrict ntp1.stratum2.ru	nomodify notrap\nrestrict ntp2.stratum2.ru	nomodify notrap\n" >> /etc/ntp.conf
#echo -en "restrict ntp3.stratum2.ru	nomodify notrap\nrestrict ntp4.stratum2.ru	nomodify notrap\nrestrict ntp5.stratum2.ru	nomodify notrap\n" >> /etc/ntp.conf
#echo -en "restrict 0.ru.pool.ntp.org		nomodify notrap\nrestrict 1.ru.pool.ntp.org		nomodify notrap\n" >> /etc/ntp.conf
#echo -en "restrict 2.ru.pool.ntp.org		nomodify notrap\nrestrict 3.ru.pool.ntp.org		nomodify notrap\n" >> /etc/ntp.conf
#echo -en "restrict 0.europe.pool.ntp.org		nomodify notrap\nrestrict 1.europe.pool.ntp.org		nomodify notrap\n" >> /etc/ntp.conf
#echo -en "restrict −4 default kod notrap nomodify nopeer noquery\nrestrict −6 default kod notrap nomodify nopeer noquery\n" >> /etc/ntp.conf
#echo -en "restrict 192.168.102.0 mask 255.255.255.0	nomodify notrap nopeer\nrestrict 10.1.1.0 mask 255.255.255.0	nomodify notrap nopeer\n" >> /etc/ntp.conf
#echo -en "restrict 127.0.0.1			nomodify notrap\nrestrict ::1\nrestrict source notrap nomodify noquery\n" >> /etc/ntp.conf

# Запускаем
systemctl restart ntpsec
systemctl enable ntpsec
echo
echo -e "***** Script \033[33;1m3\033[0m of \033[33;1m3\033[0m COMPLETED in $SECONDS seconds *****"
echo
