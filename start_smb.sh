#!/bin/sh
echo "$SMBUSER:$PASS" | chpasswd
mkdir /home/$SMBUSER/$SHARENAME
chown -R $SMBUSER /home/$SMBUSER
chgrp -R $SMBUSER /home/$SMBUSER
echo -ne "$PASS\n$PASS\n" | smbpasswd -a -s $SMBUSER

/usr/sbin/smbd start
/usr/sbin/smbd enable

/bin/bash
