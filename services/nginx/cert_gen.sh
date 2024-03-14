#!/bin/bash

if [ ! -d certs ]; then
  mkdir certs
fi

## Generate server key
openssl genrsa -out certs/key.pem 2048

## Generate Certificate Signing Request (CSR)
#  -sha256
openssl req \
  -new \
  -key certs/key.pem \
  -config openssl.cnf \
  -out server.csr

## Sign CSR using CA
openssl x509 \
  -req \
  -sha256 \
  -CA $HOME/.ssl/ca.cert.pem \
  -CAkey $HOME/.ssl/ca.key.pem \
  -CAcreateserial \
  -in server.csr \
  -extensions req_ext \
  -extfile openssl.cnf \
  -days 360 \
  -out certs/cert.pem

## Remove CSR
rm server.csr
