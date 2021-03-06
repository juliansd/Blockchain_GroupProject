#!/bin/bash
#
# Copyright 2018 IBM All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

ORG_NAME="buyer"

fabric-ca-client enroll -u http://admin:adminpw@ca:7054 --mspdir admin

fabric-ca-client register --id.name ${ORG_NAME} --id.secret pwd1 --id.type user \
    --id.attrs "role=buyer" -u http://ca:7054

fabric-ca-client enroll -u http://${ORG_NAME}:pwd1@ca:7054 \
    --enrollment.attrs "role,email:opt" --mspdir ${ORG_NAME}

mkdir ~/.fabric-ca-client/${ORG_NAME}/admincerts
cp -p ~/.fabric-ca-client/${ORG_NAME}/signcerts/* ~/.fabric-ca-client/${ORG_NAME}/admincerts

ORG_NAME="admin"
mkdir ~/.fabric-ca-client/${ORG_NAME}/admincerts
cp -p ~/.fabric-ca-client/${ORG_NAME}/signcerts/* ~/.fabric-ca-client/${ORG_NAME}/admincerts

ORG_NAME="seller"
fabric-ca-client register --id.name ${ORG_NAME} --id.secret pwd1 --id.type user \
    --id.attrs "role=seller" -u http://ca:7054
fabric-ca-client enroll -u http://${ORG_NAME}:pwd1@ca:7054 \
    --enrollment.attrs "role,email:opt" --mspdir ${ORG_NAME}
mkdir ~/.fabric-ca-client/${ORG_NAME}/admincerts
cp -p ~/.fabric-ca-client/${ORG_NAME}/signcerts/* ~/.fabric-ca-client/${ORG_NAME}/admincerts

ORG_NAME="middleman"
fabric-ca-client register --id.name ${ORG_NAME} --id.secret pwd1 --id.type user \
    --id.attrs "role=middleman" -u http://ca:7054
fabric-ca-client enroll -u http://${ORG_NAME}:pwd1@ca:7054 \
    --enrollment.attrs "role,email:opt" --mspdir ${ORG_NAME}
mkdir ~/.fabric-ca-client/${ORG_NAME}/admincerts
cp -p ~/.fabric-ca-client/${ORG_NAME}/signcerts/* ~/.fabric-ca-client/${ORG_NAME}/admincerts

ORG_NAME="carrier"
fabric-ca-client register --id.name ${ORG_NAME} --id.secret pwd1 --id.type user \
    --id.attrs "role=carrier" -u http://ca:7054
fabric-ca-client enroll -u http://${ORG_NAME}:pwd1@ca:7054 \
    --enrollment.attrs "role,email:opt" --mspdir ${ORG_NAME}
mkdir ~/.fabric-ca-client/${ORG_NAME}/admincerts
cp -p ~/.fabric-ca-client/${ORG_NAME}/signcerts/* ~/.fabric-ca-client/${ORG_NAME}/admincerts

ORG_NAME="warehouse"
fabric-ca-client register --id.name ${ORG_NAME} --id.secret pwd1 --id.type user \
    --id.attrs "role=warehouse" -u http://ca:7054
fabric-ca-client enroll -u http://${ORG_NAME}:pwd1@ca:7054 \
    --enrollment.attrs "role,email:opt" --mspdir ${ORG_NAME}
mkdir ~/.fabric-ca-client/${ORG_NAME}/admincerts
cp -p ~/.fabric-ca-client/${ORG_NAME}/signcerts/* ~/.fabric-ca-client/${ORG_NAME}/admincerts
