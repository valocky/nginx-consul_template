FROM nginx:latest


EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.100:8500

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y unzip

ADD https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip /usr/bin/
ADD service.ctmpl /templates/service.ctmpl

RUN unzip /usr/bin/consul-template_0.14.0_linux_amd64.zip
RUN chmod +x /usr/bin/consul-template

ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

RUN bash /usr/bin/start.sh

RUN rm -v /etc/nginx/conf.d/*.conf



