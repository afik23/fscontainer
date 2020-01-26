FROM centos:latest
RUN mkdir /home/root
RUN mkdir /home/root/share001
RUN yum install -y samba
RUN yum install -y lsof
WORKDIR /
COPY temp001 temp001
COPY start_smb.sh start_smb.sh
ENV CFG=/etc/samba/smb.conf
ENV CFGADD=/temp001/cfgadd.conf
RUN cat "$CFGADD" >> "$CFG"
RUN chmod +x start_smb.sh
RUN ls -la /
ENTRYPOINT ["start_smb.sh"]
