#!/bin/bash

# req \                                       # certificate request
# -x509 \                                     # create a self-signed certificate rather than a certificate request.
# -nodes \                                    # avoid encrypt the private keys with passphrase
# -days 365                                   # validity of the cerificate days
# -newkey rsa:2048 -keyout certs/nginx.key \  # generates a new RSA private key of 2048 bits
# -out certs/nginx.crt \                      # the file where the self-signed certificate will be saved.
# -subj "/CN=localhost"                       # the subject of the certificate


SCRIPT_DIR="$(dirname "$(realpath "$0")")"
CERTS_DIR="$SCRIPT_DIR/../conf/certs"

mkdir -p $SCRIPT_DIR/../conf/certs

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTS_DIR/nginx.key -out $CERTS_DIR/nginx.crt -subj "/CN=localhost"
