#!/bin/bash

# Script to generate ca and client certificates and keys etc.

# Ubuntu should have OpenSSL installed already by default.

# The most secure method is to generate the keys and certificates on a seprate secure machine and copy only the poc-x-ca.crt to the poc-x stack server.

#----------------------------------------------------------------------------------------------------

# 1) Generate a certificate authority (CA) key:

openssl ecparam -genkey -name secp384r1 -out poc-x-ca.key;

#----------------------------------------------------------------------------------------------------

# 2) Generate a certificate authority certificate (CA) with expiry of 20 years 
# (7300 days, though this encryption method will without a doubt be useless by then):

openssl req -x509 -new -SHA384 -nodes -key poc-x-ca.key -days 7300 -out poc-x-ca.crt;

#----------------------------------------------------------------------------------------------------

# 3) Generate a client key:

openssl ecparam -genkey -name secp384r1 -out poc-x.key;

#----------------------------------------------------------------------------------------------------

# 4) Generate a CSR (Certificate Signing Request):

openssl req -new -SHA384 -key poc-x.key -nodes -out poc-x.csr;

#----------------------------------------------------------------------------------------------------

# 5a) Create a version 3 certificate extensions file named client-extensions.ext:

touch client-extensions.ext;

# 5b) The contents of the client-extensions.ext file should be:

authorityKeyIdentifier = keyid, issuer
basicConstraints = critical, CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = critical, clientAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = [FQDN]

#----------------------------------------------------------------------------------------------------

# 6) Generate and sign your poc-x.crt. Vaild for 5 years (1825 days):

openssl x509 -req -SHA384 -extfile client-extensions.ext -days 1825 -in poc-x.csr -CA poc-x-ca.crt -CAkey poc-x-ca.key -CAcreateserial -out poc-x.crt;

#----------------------------------------------------------------------------------------------------

# 7) Combine the poc-x key and poc-x certificate as a pkcs12 file:

# For Apple iPads and iPhones (iPads and iPhones do not except pkcs12 with AES)
openssl pkcs12 -export -inkey poc-x.key -in poc-x.crt -out poc-x-des.p12 -legacy;

# For Desktops and Laptops
openssl pkcs12 -export -inkey poc-x.key -in poc-x.crt -out poc-x-aes.p12;

#----------------------------------------------------------------------------------------------------
