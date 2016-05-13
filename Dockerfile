FROM nginx:latest

ENTRYPOINT ["/usr/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.100:8500

ADD consul-template /usr/bin/consul-template

ADD service.ctmpl /templates/service.ctmpl


ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

RUN rm -v /etc/nginx/conf.d/*.conf

RUN service nginx start


