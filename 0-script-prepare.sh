#!/bin/bash
# Подготавливаем машину для работы.
SECONDS=0
printf "\033c"
#### Раскомментируйте этот блок, если хотите подключаться по ключу
#mkdir /root/.ssh
#mv /root/authorized_keys /root/.ssh
#chmod 700 /root/.ssh
#chmod 600 /root/.ssh/authorized_keys
# Генерация файла sshd_config для доступа по ssh-ключу
#mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
#touch /etc/ssh/sshd_config
#echo -en "Port 22\nProtocol 2\nHostKey /etc/ssh/ssh_host_rsa_key\nHostKey /etc/ssh/ssh_host_dsa_key\n" >> /etc/ssh/sshd_config
#echo -en "HostKey /etc/ssh/ssh_host_ecdsa_key\nHostKey /etc/ssh/ssh_host_ed25519_key\nUsePrivilegeSeparation yes\n" >> /etc/ssh/sshd_config
#echo -en "KeyRegenerationInterval 3600\nServerKeyBits 1024\nSyslogFacility AUTH\nLogLevel INFO\nLoginGraceTime 120\n" >> /etc/ssh/sshd_config
#echo -en "StrictModes yes\nRSAAuthentication yes\nPubkeyAuthentication yes\nAuthorizedKeysFile      %h/.ssh/authorized_keys\n" >> /etc/ssh/sshd_config
#echo -en "RhostsRSAAuthentication no\nIgnoreRhosts yes\nHostbasedAuthentication no\nPermitEmptyPasswords no\nChallengeResponseAuthentication no\n" >> /etc/ssh/sshd_config
#echo -en "X11Forwarding yes\nX11DisplayOffset 10\nPrintMotd no\nPrintLastLog yes\nTCPKeepAlive yes\nAcceptEnv LANG LC_*\n" >> /etc/ssh/sshd_config
#echo -en "Subsystem sftp /usr/lib/openssh/sftp-server\nUsePAM yes\n" >> /etc/ssh/sshd_config
#chmod 644 /etc/ssh/sshd_config
####
wget https://raw.githubusercontent.com/Krushon/time-server-script/master/1_script-upgrade.sh
wget https://raw.githubusercontent.com/Krushon/time-server-script/master/2-script-install.sh
wget https://raw.githubusercontent.com/Krushon/time-server-script/master/3_script-ntpd.sh
chmod +x 1_script-upgrade.sh 2_script-install.sh 3_script-ntpd.sh
echo
echo "***** Script COMPLETED in $SECONDS seconds *****"
echo
