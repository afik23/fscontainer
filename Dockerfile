FROM centos:latest
#RUN mkdir /home/root /home/root/share001 /home/smb1 /home/smb1/share002
RUN yum install -y samba
COPY cfgadd.conf cfgadd.conf
COPY start_smb.sh start_smb.sh
COPY var.cfg var.cfg 
RUN source /var.cfg
ENV CFG=/etc/samba/smb.conf
ENV CFGADD=/cfgadd.conf
RUN cat "$CFGADD" >> "$CFG"
RUN chmod +x start_smb.sh
ENTRYPOINT ["./start_smb.sh"]
