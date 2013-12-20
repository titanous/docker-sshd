FROM ubuntu

ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

EXPOSE 22
CMD /usr/sbin/sshd -Dd
