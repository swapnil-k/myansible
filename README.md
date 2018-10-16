### myansible
* Ansible repository with certain roles and applications

#### Docker infra setup
	
	cd docker_setup && bash setup.sh
	
	#### create an ansible environment with 1 server and 2 client$
 	docker-compose up -d
 
	#### Testing, go inside ansible server container and ping to clients
	docker exec -it ansible /bin/bash
		ansible ansibleclient1 -m ping
		ansible ansibleclient2 -m ping
		
	#### To bring down the environment
	docker-compose down
	
#### Run common.yml playbook
* It will create `sysadmin` user on `target=<remote_host>` server
* It will disable ssh `root` login
* It will copy *root* ssh keys into *sysadmin* home directory so that same keys and password will work
	
		docker cp common.yml ansible:/root/
		docker cp hosts ansible:/etc/ansible/hosts
	
* docker exec -it ansible /bin/bash
		
		#### run common.yml playbook
		ansible-playbook --extra-vars "target=ansibleclient" common.yml
		
		#### Testing
		ssh sysadmin@ansibleclient1 hostname -i