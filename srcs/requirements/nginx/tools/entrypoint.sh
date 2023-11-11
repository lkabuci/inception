#!/bin/bash

# This entrypoint script will generate a self-signed certificates
# for SSL and run the nginx daemon

CERTS_DIR="/etc/nginx/certs"
mkdir -p "$CERTS_DIR"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTS_DIR/nginx.key -out $CERTS_DIR/nginx.crt -subj "/CN=localhost"

nginx -g "daemon off;"

# req \                                       # certificate request
# -x509 \                                     # create a self-signed certificate rather than a certificate request.
# -nodes \                                    # avoid encrypt the private keys with passphrase
# -days 365                                   # validity of the cerificate days
# -newkey rsa:2048 -keyout certs/nginx.key \  # generates a new RSA private key of 2048 bits
# -out certs/nginx.crt \                      # the file where the self-signed certificate will be saved.
# -subj "/CN=localhost"                       # the subject of the certificate

# -g daemon off    - to keep running in the foreground while applying the config on global
