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
tput setf 7 
