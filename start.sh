#!/bin/bash

service nginx start

JSON=`curl -XGET $CONSUL_URL/v1/catalog/service/elk |  jq '.[0].ServiceAddress'`

RES="${JSON//\"/}"
echo $RES

curl -XPUT 'http://$RES:9200/_template/filebeat?pretty' -d@/usr/bin/filebeat.template.json

consul-template -consul=$CONSUL_URL -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:service nginx reload"

sudo ./usr/bin/filebeat -c /usr/bin/filebeat.yml -v -e