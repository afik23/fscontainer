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
RUN echo "root:toor123" | chpasswd
#CMD ["start_smb.sh"]
