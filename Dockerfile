FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.100:8500

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y unzip

ADD https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip /usr/bin/

RUN unzip /usr/bin/consul-template_0.14.0_linux_amd64.zip

ADD service.ctmpl /templates/service.ctmpl

ADD start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

RUN rm -v /etc/nginx/conf.d/*.conf



