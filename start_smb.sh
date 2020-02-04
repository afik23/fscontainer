#!/bin/sh

#create cfgadd.conf
echo "[$SHARENAME]" >> /cfgadd.conf
echo -e "\t comment = $SHARENAME" >> /cfgadd.conf
echo -e "\t path = /home/$SMBUSER/$SHARENAME" >> /cfgadd.conf
echo -e "\t writeable = yes" >> /cfgadd.conf
echo -e "\t valid users = $SMBUSER" >> /cfgadd.conf
echo -e "\t read only = no" >> /cfgadd.conf
echo -e "\t browseable = yes" >> /cfgadd.conf

#adding configurations to /etc/samba/smb.conf
cat "$CFGADD" >> "$CFG"

#create unix user with the same $SMBUSER name
useradd -m $SMBUSER

#change unix user password by the ENV
echo "$SMBUSER:$PASS" | chpasswd

mkdir /home/$SMBUSER/$SHARENAME
chown -R $SMBUSER /home/$SMBUSER
chgrp -R $SMBUSER /home/$SMBUSER

#create smb user with the same $SMBUSER name
echo -ne "$PASS\n$PASS\n" | smbpasswd -a -s $SMBUSER

#start and enable smbd service
/usr/sbin/smbd start
/usr/sbin/smbd enable

#must run this unless the container will be exited with code 0
/bin/bash
