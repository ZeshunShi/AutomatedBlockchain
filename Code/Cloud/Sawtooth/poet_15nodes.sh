///PoET
# generate genesis block (PoET 15 nodes)

sawset genesis --key /etc/sawtooth/keys/validator.priv -o config-genesis.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=PoET sawtooth.consensus.algorithm.version=0.1 sawtooth.poet.report_public_key_pem="$(cat /etc/sawtooth/simulator_rk_pub.pem)" sawtooth.poet.valid_enclave_measurements=$(poet enclave measurement) sawtooth.poet.valid_enclave_basenames=$(poet enclave basename)
poet registration create --key /etc/sawtooth/keys/validator.priv -o poet.batch
sawset proposal create --key /etc/sawtooth/keys/validator.priv -o poet-settings.batch sawtooth.poet.target_wait_time=5 sawtooth.poet.initial_wait_time=25 sawtooth.publisher.max_batches_per_block=100
sawadm genesis config-genesis.batch config-consensus.batch poet.batch poet-settings.batch

chmod -R 777 /var/log/sawtooth/
chmod -R 777 /var/lib/sawtooth/

# start all the service (PoET 15 nodes)
for (( i=0; i <= 14; i++ ))
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