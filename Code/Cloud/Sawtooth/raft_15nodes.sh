# generate genesis block (Raft 15 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.23 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.24 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 15 nodes)
for (( i=0; i <= 14; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done