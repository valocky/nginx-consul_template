FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.100:8500

ADD start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

RUN rm -v /etc/nginx/conf.d/*.conf

ADD https://github.com/hashicorp/consul-template/archive/v0.7.0.tar.gz /usr/bin/

RUN tar -C /usr/local/bin --strip-components 1 -zxf /usr/bin/v0.7.0.tar.gz

ADD service.ctmpl /templates/service.ctmpl