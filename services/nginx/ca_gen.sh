#!/bin/bash

## Generate CA certificate/key pair
openssl req \
  -x509 \
  -new \
  -newkey rsa:4096 \
  -nodes \
  -config ca.openssl.cnf \
  -days 3650 \
  -keyout $HOME/.ssl/ca.key.pem \
  -out $HOME/.ssl/ca.cert.pem

## Add CA certificate to keychain
security add-trusted-cert \
  -k $HOME/Library/Keychains/login.keychain-db \
  -r trustRoot \
  $HOME/.ssl/ca.cert.pem
