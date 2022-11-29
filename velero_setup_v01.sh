curl -L -o /tmp/velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.9.0/velero-v1.9.0-linux-amd64.tar.gz
tar -C /tmp -xvf /tmp/velero.tar.gz
sudo mv /tmp/velero-v1.9.0-linux-amd64/velero /usr/local/bin/velero
sudo chmod +x /usr/local/bin/velero

sudo apt-get update
sudo apt-get install -y awscli
