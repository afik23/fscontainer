#!/bin/sh
#SMBUSER=smb1
#PASS=123456
#SHARENAME=share002
source /var.cfg
adduser $SMBUSER
echo "$SMBUSER:$PASS" | chpasswd
mkdir -p /home/$SMBUSER/$SHARENAME
chown -R $SMBUSER /home/$SMBUSER
chgrp -R $SMBUSER /home/$SMBUSER
echo -ne "$PASS\n$PASS\n" | smbpasswd -a -s $SMBUSER

/usr/sbin/smbd start
/usr/sbin/smbd enable

/bin/bash
