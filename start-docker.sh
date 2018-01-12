#!/bin/bash -e

#
# Build and start docker container running DavMail linked to by a /etc/hosts entry "exchange-gateway.local"
# (sudo'er user required)
#

cd $(dirname $0)

sudo docker build --tag davmail:latest .

sudo docker run -d --rm --name exchange-gateway davmail:latest 

# Remove and re-insert /etc/hosts entry 'exchange-gateway.local'
GATEWAY_IP=$(sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' exchange-gateway)

sudo sed -E '/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+[ \t]+exchange-gateway.local[ \t]*$/d' \
         -i /etc/hosts

echo "$GATEWAY_IP    exchange-gateway.local" | sudo tee -a /etc/hosts

# Errors from the container might be visible here?
sudo docker logs exchange-gateway

echo "Exchange gateway startup complete"
