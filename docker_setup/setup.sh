#!/usr/bin/env bash

#### Create ssh public private keypair
ssh-keygen -t rsa -f ansibleserver/id_rsa -q -N ""
mv ansibleserver/id_rsa.pub ansibleclient/.

#### build ansibleserver image
docker build --no-cache -t ansibleserver:2.2 ansibleserver/.

#### build ansibleclient image
docker build --no-cache -t ansibleclient:1.0 ansibleclient/.
