FROM ubuntu:14.04
RUN apt-get update -y
RUN apt-get install haproxy
#RUN apt-get install rsyslog
COPY haproxy.cfg /etc/haproxy/haproxy.cfg 
COPY haproxy /etc/default/haproxy 
#working directory.
WORKDIR /etc/haproxy
# Define default command.
EXPOSE 80
CMD ["/usr/sbin/haproxy","-db", "-f", "/etc/haproxy/haproxy.cfg"]
