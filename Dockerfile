FROM titanous/ubuntu

ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys && mkdir /var/run/sshd
RUN apt-get update && apt-get install -y openssh-server

EXPOSE 22
CMD ["/sbin/init"]
