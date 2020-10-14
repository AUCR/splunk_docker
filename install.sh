#!/usr/bin/env bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common python3 -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker $USER
sudo curl -L https://github.com/docker/compose/releases/download/1.27.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo mkdir /opt/splunk
sudo mkdir /opt/splunk/var
sudo mkdir /opt/splunk/etc
sudo mkdir /opt/splunk/plugins
sudo cp plugins/* /opt/splunk/plugins
sudu chown -R $USER:docker /opt/splunk/
IPADDY=$(ip a |grep "state UP" -A 2 |grep inet |cut -c 10-25 |cut -f 1 -d '/'| head -1) || true
export IPADDY
echo "$IPADDY splunk.aucr.local" >> /etc/hosts
cp standalone/docker-compose.yml /opt/splunk/
cp splunk.env /opt/splunk/
python3 "app_list.py" >> /opt/splunk/splunk.env
cd /opt/splunk/
sudo docker-compose up -d
