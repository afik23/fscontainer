FROM centos:latest
RUN yum update -y
RUN yum install samba -y
WORKDIR /
COPY temp001 temp001
ENV CFG=/etc/samba/smb.conf
ENV CFGADD=/temp001/cfgadd.conf
RUN cat "$CFGADD" >> "$CFG"
RUN firewall-cmd --permanent --add-port=139/tcp
RUN service firewalld restart
RUN service smb start
RUN service smb enable