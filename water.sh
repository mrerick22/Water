#!/bin/bash

# Baixar o WaterdogPE JAR
curl -o WaterdogPE.jar https://ci.opencollab.dev/job/WaterdogPE/lastSuccessfulBuild/artifact/WaterdogPE-Proxy/target/WaterdogPE.jar

# Criar pasta de plugins
mkdir -p plugins

# Definir porta aleatória segura (entre 20000 e 30000 por exemplo)
PORT=$((20000 + RANDOM % 10000))
echo $PORT > porta.txt

# Gerar o config.yml automaticamente
cat > config.yml <<EOL
bind: 0.0.0.0:$PORT
motd: 'WaterdogPE Proxy'
max_players: 100
servers:
  lobby:
    address: 127.0.0.1:19133
    motd: 'Lobby'
    restricted: false
EOL