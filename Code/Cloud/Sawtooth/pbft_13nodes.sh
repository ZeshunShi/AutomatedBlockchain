# generate genesis block (PBFT 13 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 13 nodes)
for (( i=0; i <= 12; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done