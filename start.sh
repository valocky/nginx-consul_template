#!/bin/bash

service nginx start


RUN curl -XPUT 'http://192.168.99.104:9200/_template/filebeat?pretty' -d@/usr/bin/filebeat.template.json

consul-template -consul=$CONSUL_URL -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:service nginx reload"
