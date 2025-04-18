# Bootstrap

## Install git and make

``` bash
sudo dnf install git make rsync
```

## Setup sudo

``` bash
make sudo
```

## Setup python

``` bash
python -m ensurepip
./requirements.txt
```

## Setup Mise

``` bash
makeMise.sh
```

## Docker


``` bash
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
yes | sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo usermod -G docker $(whoami)
```