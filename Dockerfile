FROM centos:latest
ENV SMBUSER=smb1
ENV PASS=123456
ENV SHARENAME=share002
#RUN mkdir /home/root /home/root/share001 /home/smb1 /home/smb1/share002
RUN yum install -y samba
COPY cfgadd.conf cfgadd.conf
COPY start_smb.sh start_smb.sh
RUN useradd -m $SMBUSER
ENV CFG=/etc/samba/smb.conf
ENV CFGADD=/cfgadd.conf
RUN cat "$CFGADD" >> "$CFG"
RUN chmod +x start_smb.sh
ENTRYPOINT ["./start_smb.sh"]
