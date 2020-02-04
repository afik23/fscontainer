FROM centos:latest
RUN yum install -y samba
ENV SMBUSER=smb1
ENV PASS=123456
ENV SHARENAME=share
ENV CFG=/etc/samba/smb.conf
ENV CFGADD=/cfgadd.conf
COPY start_smb.sh start_smb.sh
RUN chmod +x start_smb.sh
ENTRYPOINT ["./start_smb.sh"]
