#!/bin/bash

service nginx start

consul-template -consul=$CONSUL_URL -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:service nginx reload"
sudo ./usr/bin/filebeat -e -c /usr/bin/filebeat.yml