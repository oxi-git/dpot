# dpot 🍯
> A centralized but distributed honeypot system inspired by `telekom-security/tpotce`

## Introduction

Based on the T-Pot Honeypot framework, this projects makes it easy to deploy and monitor a distributed honeypot infrastructure.

## Infrastructure:

<img src="doc/assets/dpot_infrastructure.png" style="display: block; margin-left: auto; margin-right: auto; width: 70%"/>

## Collector

### Components:

- ELK Stack
- Elastic Curator

### Installation

1) Set your username and password in `.env` file
2) Generate certificates for Logstash and sensors Filebeat with `generate.sh`
3) `$ docker-compose up -d`

## Sensor

### Components:

- Filebeat
- Cowrie
- Mailhoney
- ElasticPot
- Dionaea / Heralding
- Suricata

### Installation:

1)

---