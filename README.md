# Minimal environment files
Set of scripts to copy dotfiles and to setup configs for a minimal environment. 

## Instructions

### Mac bootstrap
Verified with Monterey on Intel and Sonoma on Apple Silicon

```
### Mac bootstrap
chsh -s /bin/bash
mkdir meh
cd meh
curl -LO https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-main/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-main
./setup.bash
cp .zshrc ~/.zshrc
logout
# open new shell
```

### CentOS bootstrap
Verified with CentOS Stream 9

```
### CentOS bootstrap
sudo dnf install wget unzip gcc make vim python3-pip git-core zsh -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### Ubuntu bootstrap
Verified with Ubuntu 22.04

```
### Ubuntu bootstrap
sudo apt install unzip gcc make vim curl git zsh virtualenvwrapper -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup.bash
logout
# open new shell
```

### RHEL bootstrap
Verified with RHEL8

```
### RHEL  bootstrap
sudo dnf install wget unzip gcc make vim python3-pip git-core zsh -y
mkdir meh
cd meh
wget https://github.com/baldwinsung/MinimalEnvironment/archive/master.zip
unzip master.zip
cd MinimalEnvironment-master/
./update.bash
#mv ~/.bashrc ~/.bashrc_local
logout
# open new shell
cd meh/MinimalEnvironment-master
./setup_minimal.bash
logout
# open new shell
```

### SSH Keys
General information and generating ssh key pairs and copying the public key to a host

```
ssh-keygen
```

```
ssh-copy-id
```

