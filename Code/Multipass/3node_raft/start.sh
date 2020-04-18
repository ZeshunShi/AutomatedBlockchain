// start multipass VMs

multipass launch --name node0 16.04
multipass launch --name node1 16.04
multipass launch --name node2 16.04
multipass launch --name monitor 16.04

// start consensus protocal and genesis block on node0
sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch


sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=raft sawtooth.consensus.algorithm.version=0.1.1 sawtooth.consensus.raft.peers=[\"02edb7c28f93cef054ecfeca145a4781183862b0e68a67ca9a8375819cb1ef3c63\",\"0283ea2064b2a0023fadceb9ccf12727bb3bea6e9a920a893fde880f3a53ded7e3\",\"03dae9d25d3926fe520522441466e207a7937ff49e1924ec59e234cb038280e34d\"]
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