FROM centos:latest
RUN mkdir /home/root
RUN mkdir /home/root/share001
RUN yum install -y samba
RUN yum install -y lsof
COPY cfgadd.conf cfgadd.conf
COPY start_smb.sh start_smb.sh
ENV CFG=/etc/samba/smb.conf
ENV CFGADD=/cfgadd.conf
RUN cat "$CFGADD" >> "$CFG"
RUN chmod +x start_smb.sh
RUN echo "root:123456" | chpasswd
ENV PASS=123456
ENV SMBUSER=root
RUN echo -ne "$PASS\n$PASS\n" | smbpasswd -a -s $SMBUSER
ENTRYPOINT ["./start_smb.sh"]
