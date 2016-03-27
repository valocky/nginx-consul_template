FROM nginx:latest

EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.101:8500

RUN rm -v /etc/nginx/conf.d/*.conf

ADD https://github.com/hashicorp/consul-template/releases/download/v0.7.0/consul-template_0.7.0_linux_amd64.tar.gz /usr/bin/
RUN tar -C /usr/local/bin --strip-components 1 -zxf /usr/bin/consul-template_0.7.0_linux_amd64.tar.gz

RUN service nginx start
RUN consul-template -consul=$CONSUL_URL -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:service nginx reload"