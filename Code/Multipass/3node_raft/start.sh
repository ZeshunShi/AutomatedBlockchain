// start multipass VMs

multipass launch --name node0 16.04
multipass launch --name node1 16.04
multipass launch --name node2 16.04
multipass launch --name monitor 16.04

// start consensus protocal and genesis block on node0
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch

cat /etc/sawtooth/keys/validator.pub

sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"02ec5efaa22a329c48a460f9ec0bf110b3a60f80eb494ea81d9c4be06316eb4b3a\",\"0335fe5c3b8b9cecfc3407e91aace4c9f1e7c92c35eddd53563eb4000463a87bfe\",\"025615ee7e788de66cdd568c28a3ecd7a091ed9dc3b573d05df6ac440c3cafcf8c\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch


// start service on node0, node1, and node2
systemctl start sawtooth-rest-api.service
systemctl start sawtooth-settings-tp.service
systemctl start sawtooth-identity-tp.service
systemctl start sawtooth-intkey-tp-python.service
systemctl start sawtooth-validator.service
systemctl start sawtooth-raft-engine.service

// stop service on node0, node1, and node2
systemctl stop sawtooth-rest-api.service
systemctl stop sawtooth-settings-tp.service
systemctl stop sawtooth-identity-tp.service
systemctl stop sawtooth-intkey-tp-python.service
systemctl stop sawtooth-validator.service
systemctl stop sawtooth-raft-engine.service

// node IP address
node0                   Running           192.168.64.4     Ubuntu 16.04 LTS
node1                   Running           192.168.64.5     Ubuntu 16.04 LTS
node2                   Running           192.168.64.6     Ubuntu 16.04 LTS
monitor                 Running           192.168.64.7     Ubuntu 16.04 LTS