FROM nginx:latest

ENTRYPOINT ["/usr/bin/start.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL 192.168.99.100:8500

ADD consul-template /usr/bin/consul-template
RUN chmod +x /usr/bin/consul-template

ADD service.ctmpl /templates/service.ctmpl



ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

RUN rm -v /etc/nginx/conf.d/*.conf

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y sudo

ADD filebeat /usr/bin/filebeat
ADD filebeat.template.json /usr/bin/filebeat.template.json
ADD filebeat.yml /usr/bin/filebeat.yml

RUN chmod +x /usr/bin/filebeat
RUN chmod +x /usr/bin/filebeat.template.json
RUN chmod +x /usr/bin/filebeat.yml

RUN wget http://stedolan.github.io/jq/download/linux64/jq
RUN chmod +x ./jq
RUN sudo cp jq /usr/bin 



