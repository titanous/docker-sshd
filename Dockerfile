FROM titanous/ubuntu

RUN apt-get update && apt-get install -y openssh-server sudo &&\
    useradd --create-home -s /bin/bash ubuntu &&\
    adduser ubuntu sudo &&\
    echo "ubuntu:ubuntu" | chpasswd &&\
    sed -re "s/PasswordAuthentication\s.*/PasswordAuthentication yes/g" -i /etc/ssh/sshd_config

EXPOSE 22
CMD ["/sbin/init"]
