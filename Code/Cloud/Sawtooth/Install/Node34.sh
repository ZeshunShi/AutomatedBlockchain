#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8AA7AF1F1091A5FD
add-apt-repository 'deb [arch=amd64] http://repo.sawtooth.me/ubuntu/bumper/stable xenial universe'

curl -sL https://repos.influxdata.com/influxdb.key |  sudo apt-key add -
apt-add-repository "deb https://repos.influxdata.com/ubuntu xenial stable"

apt-get update
rm  /var/lib/dpkg/lock

apt-get install -y sawtooth python3-sawtooth-identity
apt-get install -y sawtooth-raft-engine sawtooth-pbft-engine python3-sawtooth-poet-cli python3-sawtooth-poet-engine python3-sawtooth-poet-families
apt-get install -y telegraf

sawtooth keygen
sawadm keygen

chmod -R 777 /var/log/sawtooth/
chmod -R 777 /var/lib/sawtooth/

############configure for validator
cat > /etc/sawtooth/validator.toml << EOF
bind = [
  "network:tcp://192.168.10.10:8800",
  "component:tcp://127.0.0.1:4004",
  "consensus:tcp://127.0.0.1:5050"
]

peering = "static"

endpoint = "tcp://192.168.10.10:8800"

peers = ["tcp://192.168.10.10:8800","tcp://192.168.10.11:8800","tcp://192.168.10.12:8800","tcp://192.168.10.13:8800","tcp://192.168.10.14:8800","tcp://192.168.10.15:8800","tcp://192.168.10.16:8800","tcp://192.168.10.17:8800","tcp://192.168.10.18:8800","tcp://192.168.10.19:8800","tcp://192.168.10.20:8800","tcp://192.168.10.21:8800","tcp://192.168.10.22:8800","tcp://192.168.10.23:8800","tcp://192.168.10.24:8800","tcp://192.168.10.25:8800","tcp://192.168.10.26:8800","tcp://192.168.10.27:8800","tcp://192.168.10.28:8800","tcp://192.168.10.29:8800","tcp://192.168.10.30:8800","tcp://192.168.10.31:8800","tcp://192.168.10.32:8800","tcp://192.168.10.33:8800","tcp://192.168.10.34:8800","tcp://192.168.10.35:8800","tcp://192.168.10.36:8800","tcp://192.168.10.37:8800","tcp://192.168.10.38:8800","tcp://192.168.10.39:8800","tcp://192.168.10.40:8800","tcp://192.168.10.41:8800","tcp://192.168.10.42:8800","tcp://192.168.10.43:8800","tcp://192.168.10.45:8800","tcp://192.168.10.46:8800","tcp://192.168.10.47:8800","tcp://192.168.10.48:8800","tcp://192.168.10.49:8800","tcp://192.168.10.50:8800","tcp://192.168.10.51:8800","tcp://192.168.10.52:8800","tcp://192.168.10.53:8800","tcp://192.168.10.54:8800","tcp://192.168.10.55:8800","tcp://192.168.10.56:8800","tcp://192.168.10.57:8800","tcp://192.168.10.58:8800","tcp://192.168.10.59:8800"]

scheduler = 'parallel'

network_public_key = 'wFMwoOt>yFqI/ek.G[tfMMILHWw#vXB[Sv}>l>i)'
network_private_key = 'r&oJ5aQDj4+V]p2:Lz70Eu0x#m%IwzBdP(}&hWM*'

# The minimum number of peers required before stopping peer search.
minimum_peer_connectivity = 1

# The maximum number of peers that will be accepted.
maximum_peer_connectivity = 100

opentsdb_url = "http://192.168.10.5:8086"
opentsdb_db = "metrics"
opentsdb_username  = "lrdata"
opentsdb_password  = "test"
EOF

############configure for rest_api
cat > /etc/sawtooth/rest_api.toml << EOF
opentsdb_url = "http://192.168.10.5:8086"
opentsdb_db = "metrics"
opentsdb_username  = "lrdata"
opentsdb_password  = "test"
EOF

############configure for telegraf
sed -i '/\[outputs.influxdb\]/a \ \ urls = \[\"http://192.168.10.5:8086\"\]\n  database = \"metrics\"\n  username = \"lrdata\"\n  password = \"test\"' /etc/telegraf/telegraf.conf
sed -i '/\[inputs.system\]/a [[inputs.net]]\n[[inputs.procstat]]\n  exe = \"sawtooth\"\n  prefix = \"sawtooth\"' /etc/telegraf/telegraf.conf










