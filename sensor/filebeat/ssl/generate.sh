#!/bin/bash

if [ ! -f ca.crt ] || [ ! -f ca.key ] || [ ! -f serial ]; then
    echo "Error: no CA files found."
    echo "Generate and copy CA Certificate, Key and Serial files from your collector config before running this script"
    exit 1
fi
sudo apt install openssl

#Filebeat
openssl genrsa -out filebeat.key 2048

#Sign filebeat Cert
openssl req -sha512 -new -key filebeat.key -out filebeat.csr -config filebeat.conf
openssl x509 -days 3650 -req -sha512 -in filebeat.csr -CAserial serial -CA ca.crt -CAkey ca.key -out filebeat.crt -extensions v3_req -extensions usr_cert -extfile filebeat.conf

# #Move to out folder and cleanup
mv filebeat.crt filebeat.key ca.crt ./out/
rm -rf filebeat.csr filebeat.key.pem ca.key serial