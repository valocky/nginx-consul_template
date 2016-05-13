FROM nginx:latest


EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.100:8500

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y unzip

ADD consul-template /usr/bin/consul-template
RUN chmod +x /usr/bin/consul-template
ADD service.ctmpl /templates/service.ctmpl


ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

RUN bash /usr/bin/start.sh
RUN rm -v /etc/nginx/conf.d/*.conf



