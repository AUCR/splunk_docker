# splunk_docker
A Dockerized Splunk Project

## How to install with Ubuntu 18.04/20.04

### Open a new Terminal and Clone the repo

    git clone https://github.com/aucr/splunk_docker

### Navigate to the splunk_docker directory

    cd splunk_docker

### All in one Setup Script

    sudo bash install.sh

### Access Web UI


    http://splunk.aucr.local:8000
    username:admin
    password:P@ssword*1234! 

#### Manual Setup
1. Install [docker](https://docs.docker.com/engine/install/ubuntu/)
2. Install [docker-compose](https://docs.docker.com/compose/install/)
3. Make required directory's

        sudo mkdir /opt/ && sudo mkdir /opt/splunk/ && sudo mkdir /opt/splunk/etc && sudo mkdir /opt/splunk/var && sudo mkdir /opt/splunk/plugins
4. Modify app_info.txt and comment out which plugins you want to disable. To enable a plugin simply remove the #.
   -  To import from a file import the .tgz file into the plugins directory.



            cp plugins/*.tgz /opt/splunk/plugins


5. Customize splunk.env for your needs
6. Setup permissions on the splunk directories

        sudo chown -R $USER:docker /opt/splunk/


7. Start container services with docker-compose

        sudo docker-compose up -d 


## TroubleShooting

### Navigate to the main splunk_docker directory

    cd ~
    cd splunk_docker

### Splunk service inspection with docker-compose logs

        sudo docker-compose logs -f