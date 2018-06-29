#!/bin/sh

echo 'CA="https://acme-staging.api.letsencrypt.org"
CA="https://acme-v01.api.letsencrypt.org"
ACL=('\''/var/www/html/web/.well-known/acme-challenge'\'') #web for yii
USE_SINGLE_ACL="true"
DOMAIN_CERT_LOCATION="/etc/ssl/'$1'.crt"
DOMAIN_KEY_LOCATION="/etc/ssl/'$1'.key"
CA_CERT_LOCATION="/etc/ssl/chain.crt"
#DOMAIN_CHAIN_LOCATION="" # this is the domain cert and CA cert
#DOMAIN_PEM_LOCATION="" # this is the domain_key, domain cert and CA cert
RELOAD_CMD="systemctl reload nginx"
SERVER_TYPE="https"
CHECK_REMOTE="true"
USE_SINGLE_ACL="true"
DOMAIN_CERT_LOCATION="/etc/ssl/'$1'.crt"
DOMAIN_KEY_LOCATION="/etc/ssl/'$1'.key"
CA_CERT_LOCATION="/etc/ssl/chain.crt"
#DOMAIN_CHAIN_LOCATION="" # this is the domain cert and CA cert
#DOMAIN_PEM_LOCATION="" # this is the domain_key, domain cert and CA cert
RELOAD_CMD="systemctl reload nginx"
SERVER_TYPE="https"
CHECK_REMOTE="true"' > ~/.getssl/$1/getssl.cfg
