///Raft

# generate genesis block (Raft 3 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 3 nodes)
for (( i=0; i <= 2; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



# generate genesis block (Raft 5 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 5 nodes)
for (( i=0; i <= 4; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



# generate genesis block (Raft 7 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 7 nodes)
for (( i=0; i <= 6; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



# generate genesis block (Raft 9 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 9 nodes)
for (( i=0; i <= 8; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



# generate genesis block (Raft 11 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 11 nodes)
for (( i=0; i <= 10; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



# generate genesis block (Raft 13 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 13 nodes)
for (( i=0; i <= 12; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



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



# generate genesis block (Raft 17 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.23 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.24 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.25 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.26 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 17 nodes)
for (( i=0; i <= 16; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done



# generate genesis block (Raft 19 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.23 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.24 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.25 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.26 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.27 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.28 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch
# start all the service (Raft 19 nodes)
for (( i=0; i <= 18; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-raft-engine.service"
    sleep 10
done






///PBFT
# generate genesis block (PBFT 5 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 5 nodes)
for (( i=0; i <= 4; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



# generate genesis block (PBFT 7 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 7 nodes)
for (( i=0; i <= 6; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



# generate genesis block (PBFT 9 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 9 nodes)
for (( i=0; i <= 8; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



# generate genesis block (PBFT 11 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 11 nodes)
for (( i=0; i <= 10; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



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



# generate genesis block (PBFT 15 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.23 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.24 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 15 nodes)
for (( i=0; i <= 14; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



# generate genesis block (PBFT 17 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.23 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.24 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.25 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.26 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 17 nodes)
for (( i=0; i <= 16; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



# generate genesis block (PBFT 19 nodes)
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members=[\"$(ssh root@192.168.10.10 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.11 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.12 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.13 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.14 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.15 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.16 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.17 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.18 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.19 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.20 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.21 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.22 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.23 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.24 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.25 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.26 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.27 "cat /etc/sawtooth/keys/validator.pub")\",\"$(ssh root@192.168.10.28 "cat /etc/sawtooth/keys/validator.pub")\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o pbft-settings.batch sawtooth.consensus.pbft.block_publishing_delay=1000 sawtooth.consensus.pbft.commit_timeout=10000 sawtooth.consensus.pbft.forced_view_change_interval=100 sawtooth.consensus.pbft.idle_timeout=30000 sawtooth.consensus.pbft.view_change_duration=5000
sawadm genesis config-genesis.batch config-consensus.batch pbft-settings.batch
# start all the service (PBFT 19 nodes)
for (( i=0; i <= 18; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-pbft-engine.service"
    sleep 10
done



///PoET
# generate genesis block (PoET 5 nodes)

sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=PoET sawtooth.consensus.algorithm.version=0.1 sawtooth.poet.report_public_key_pem="$(cat /etc/sawtooth/simulator_rk_pub.pem)" sawtooth.poet.valid_enclave_measurements=$(poet enclave measurement) sawtooth.poet.valid_enclave_basenames=$(poet enclave basename)
poet registration create --key /etc/sawtooth/keys/validator.priv -o poet.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o poet-settings.batch sawtooth.poet.target_wait_time=5 sawtooth.poet.initial_wait_time=25 sawtooth.publisher.max_batches_per_block=100
sawadm genesis config-genesis.batch config-consensus.batch poet.batch poet-settings.batch

chmod -R 777 /var/log/sawtooth/
chmod -R 777 /var/lib/sawtooth/

# start all the service (PoET 5 nodes)
for (( i=0; i <= 4; i++ ))
do
    ssh root@Node$i "systemctl start sawtooth-rest-api.service"
    ssh root@Node$i "systemctl start sawtooth-settings-tp.service"
    ssh root@Node$i "systemctl start sawtooth-identity-tp.service"
    ssh root@Node$i "systemctl start sawtooth-intkey-tp-python.service"
    ssh root@Node$i "systemctl start sawtooth-validator.service"
    ssh root@Node$i "systemctl start sawtooth-poet-validator-registry-tp.service"
    ssh root@Node$i "systemctl start sawtooth-poet-engine.service"
    ssh root@Node$i "systemctl restart telegraf"
    sleep 10
done
