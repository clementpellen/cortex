#!/usr/bin/env bash

# Attendre quelques secondes que le réseau soit opérationnel
sleep 10

# Télécharger le script officiel d'installation Docker
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
chmod +x /tmp/get-docker.sh

# Installer docker-compose
sudo apt-get install -y docker-compose

# Exécuter le script officiel
/tmp/get-docker.sh
