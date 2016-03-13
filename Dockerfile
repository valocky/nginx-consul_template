FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500

ADD start.sh /bin/start.sh
RUN rm -v /etc/nginx/conf.d/*.conf

ADD https://releases.hashicorp.com/consul-template/0.14.0/consul-template_0.14.0_linux_amd64.zip /usr/bin/
ADD https://github.com/hashicorp/consul-template/archive/v0.12.1.tar.gz /usr/bin/

RUN /usr/bin/consul-template_0.14.0_linux_amd64.zip file.zip -d /usr/bin/
RUN tar -C /usr/local/bin --strip-components 1 -zxf /usr/bin/v0.12.1.tar.gz
