// start multipass VMs

multipass launch --name node0 16.04
multipass launch --name node1 16.04
multipass launch --name node2 16.04
multipass launch --name monitor 16.04

// start consensus protocal and genesis block on node0
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"03ad44bc90ea8ebcd1476e31e06c2693c129cd1cbed32fd20e260e3ae30b5b8fb4\",\"029f9d8a1f0c2b25fb82c6e6728e26b8b97a1a85e972865605d744abbc4afaefdb\",\"026b6cc6b49f1f8539b8d40470d5eec56d1cdba603650597e832ec423f189ff30c\"]
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o raft-settings.batch sawtooth.consensus.raft.heartbeat_tick=2 sawtooth.consensus.raft.election_tick=20 sawtooth.consensus.raft.period=3500
sawadm genesis config-genesis.batch config-consensus.batch raft-settings.batch


// start service on node0, node1, and node2
systemctl start sawtooth-rest-api.service
systemctl start sawtooth-settings-tp.service
systemctl start sawtooth-identity-tp.service
systemctl start sawtooth-intkey-tp-python.service
systemctl start sawtooth-validator.service
systemctl start sawtooth-raft-engine.service

// node IP address
node0                   Running           192.168.64.4     Ubuntu 16.04 LTS
node1                   Running           192.168.64.5     Ubuntu 16.04 LTS
node2                   Running           192.168.64.6     Ubuntu 16.04 LTS
monitor                 Running           192.168.64.7     Ubuntu 16.04 LTS