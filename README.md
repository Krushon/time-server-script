# Организация сервера точного времени
**Конфигурация машины.**<br>
Для сервера времени достаточно будет CPU 1 core, HDD 5Gb, RAM 512Mb<br>
<br>
**Предлагаемый софт для установки:**<br>
mc - MidnightCommander - полноэкранный текстовый файловый менеджер<br>
net-tools - важные инструменты управления сетевой подсистемой ядра Linux<br>
ntp - Network Time Protocol - сетевая служба времени и вспомогательные программы<br>
ntpdate - клиент для получения системного времени с серверов NTP<br>
ntpstat - отображает состояние NTP<br>
<br>
**Описание скриптов:**<br>
Скрипты автоматизации процесса настройки точного времени для использования в локальной сети.<br>
<br>
**Содержимое скриптов:**<br>
0-script-prepare - Подготовка vds-машины: загрузка скриптов, обновление ssh-конфига. Возможно использования сгенерированного ssh-ключа authorized_keys.<br>
1-script-upgrade - Обновление ОС. Выполняется проверка версии дистрибутива. Если версия 8, то обновляется до 9. Если 9, то просто обновляется.<br>
2-script-install - Установка ПО.<br>
3-script-ntpd - Генерация конфигурационного файла, запуск сервера времени в работу.<br>
<br>
**Работа со скриптами:**
1. На сервер загружаем скрипт 0_script-prepare.sh (и ключ authorized_keys) через терминал.
```bash
$ scp 0_script-prepare.sh root@айпи:~
```
2. Подключаемся по ssh, устанавливаем права на запуск скрипта, запускаем скрипт.
```bash
ssh root@айпи
chmod +x 0_script-prepare.sh
./0_script-prepare.sh
```
Скачаются скрипты установки ПО и генерации конфига с github.

3. Запускаем скрипты по очереди.
```bash
ssh root@айпи -i ключ.key
./1_script-upgrade.sh
./2_script-install.sh
./3_script-ntpd.sh
```
