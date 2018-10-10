### myansible
* Ansible repository with certain roles and applications

#### docker_setup
	
	cd docker_setup && bash setup.sh
	
	#### create an ansible environment with 1 server and 2 client$
 	docker-compose up -d
 
	#### Testing, go inside ansible server container and ping to clients
	docker exec -it ansible /bin/bash
		ansible ansibleclient1 -m ping
		ansible ansibleclient2 -m ping
		
	#### To bring down the environment
	docker-compose down