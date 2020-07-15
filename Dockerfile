
#
# File created by Balaji Venkataraman (xbalaji@gmail.com)
#
#
# auto generated by j2
#   j2 Dockerfile.j2 Dockerfile.yml -o Dockerfile
#
# build command
#   docker build --rm -f <Dockerfile> -t ubsshd .
#   docker build --rm -t ubsshd .
#
# run command
#   docker run --name ub01 -d -t ubsshd
#
# inspect to find ip address
#   docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ub01
#
# exec to go inside
#   docker exec -i -t ub01 /bin/bash
#
# now ssh to the above ip address
#
# remove, delete
#   docker stop ub01
#   docker rm   ub01
#   docker rmi  ubsshd
#

################## start: Dockerfile  ###################

FROM ubuntu
LABEL Description="A container environment for ansible, with sshd and remote login"
LABEL Author="Balaji Venkataraman"
LABEL email="xbalaji@gmail.com"

RUN mkdir /var/run/sshd
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y openssh-server
RUN echo 'root:ubuntu' | chpasswd

# add other logins
RUN useradd -m -s /bin/bash user1 && \
    usermod -aG sudo user1 && \
    echo 'user1:user1pass' | chpasswd
RUN useradd -m -s /bin/bash user2 && \
    usermod -aG sudo user2 && \
    echo 'user2:user2pass' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# ################## end: Dockerfile ###################

