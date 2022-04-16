DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) cfg.sh
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all: install

help:
	@echo "make list           #=> Show dot files in this repo"
	@echo "make deploy         #=> Create symlink to home directory"
	@echo "make init           #=> Setup environment settings"
	@echo "make test           #=> Test dotfiles and init scripts"
	@echo "make update         #=> Fetch changes for this repo"
	@echo "make install        #=> Run make update, deploy, init"
	@echo "make clean          #=> Remove the dot files and this repo"

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy:
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), rsync -avz $(abspath $(val)) $(HOME)/$(val);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

test:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install: deploy
	@exec $$SHELL

clean:
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

## Get Username
username := $(shell whoami)
HOME_BIN := $(HOME)/.local/bin
## Enable passwordless sudo
sudo: /etc/sudoers.d/$(username) ; @echo "Enable sudo"
/etc/sudoers.d/$(username):
	@echo "$(username) ALL=(ALL) NOPASSWD: ALL" | sudo tee $@ > /dev/null
# Setup user for git
$(HOME)/.gitconfig.user:
	@git config --file $(HOME)/.gitconfig.user user.name "iladin"
	@git config --file $(HOME)/.gitconfig.user user.email "iladin@gmail.com"

# Install pip local
get-pip.py: ; curl https://bootstrap.pypa.io/$@ -o $@ ## Download get-pip to current directory
$(HOME_BIN)/pip3: get-pip.py ; python3 $< --user ## Install pip3
$(HOME_BIN)/ansible: $(HOME_BIN)/pip3; python3 -m pip install --user $@ # install ansible

#TODO change depending on system
conda_debs: ; apt-get -yy install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
CONDA_SCRIPT := Anaconda3-2021.11-Linux-x86_64.sh
$(CONDA_SCRIPT): ; curl https://repo.anaconda.com/archive/$@ -o $@
/root/anaconda: $(CONDA_SCRIPT); ./$<
CONDA_SCRIPT: $(CONDA_SCRIPT)
