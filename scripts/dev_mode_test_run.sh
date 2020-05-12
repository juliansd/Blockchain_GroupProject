# create the identitites for the orgs
chmod 777 /opt/trade/createIdentity.sh
/opt/trade/createIdentity.sh

# install and instantiate chaincode
peer chaincode install -p chaincodedev/chaincode/trade_workflow_v1 -n tw -v 0
peer chaincode instantiate -n tw -v 0 -c '{"Args":["init","Buyer", "100000","Seller","200000","Middleman","200000", "Warehouse","50000", "Carrier", "10000"]}' -C tradechannel
sleep 2

