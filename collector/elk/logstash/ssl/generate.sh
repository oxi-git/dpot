#!/bin/bash

sudo apt install openssl

#CA
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 3650 -out ca.crt

#Logstash
openssl genrsa -out logstash.key 2048
openssl req -sha512 -new -key logstash.key -out logstash.csr -config logstash.conf

#Get CA Serial Number
openssl x509 -in ca.crt -text -noout -serial | grep serial | awk -F= '{ print $2 }' > serial

#Sign Logstash Cert
openssl x509 -days 3650 -req -sha512 -in logstash.csr -CAserial serial -CA ca.crt -CAkey ca.key -out logstash.crt -extensions v3_req -extfile logstash.conf

#Convert to Logstash format
mv logstash.key logstash.key.pem && openssl pkcs8 -in logstash.key.pem -topk8 -nocrypt -out logstash.key

#Move to out folder and cleanup
mv ca.crt logstash.crt logstash.key ./out/
rm -rf ca.key logstash.csr logstash.key.pem serial