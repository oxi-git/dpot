#!/bin/bash

openssl req -x509 -batch -nodes -days 3650 -newkey rsa:2048 -keyout ./logstash.key -out ./logstash.crt -config openssl.cnf