#!/bin/bash

###
### Leverage brew - homebrew for mac and linux
###

OS="$(uname -s)"

if [ $OS = "Darwin" ]; then
	echo "Darwin"

	echo "Checking if brew is already installed..."
	which brew &>/dev/null
	if [ $? -eq 1 ]; then
		echo >&2 "brew is not installed. installing brew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	else
		echo "brew is already installed!"
	fi
fi

if [ $OS = "Linux" ]; then
	OS_LINUX_FLAVOR="$(cat /etc/os-release | head -1)"
	if [[ ${OS_LINUX_FLAVOR} = *"Ubuntu"* ]] || [[ ${OS_LINUX_FLAVOR} = *"CentOS"* ]]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi
fi

### check if brew was actually installed
if ! command -v brew &>/dev/null; then
	echo "brew could not be found."
	exit
fi

### Setup paths for go
mkdir -p $HOME/go/{bin,src}

###
### PACKAGES
###

PACKAGES_BREW="
ansible-lint
apr
apr-util
autopep8
awscli
cilium
cmctl
cdpr
cloud-nuke
direnv
docker-buildx
dos2unix
fing
fluxcd/tap/flux
fontconfig
fping
freetype
gd
gdbm
gettext
gh
git
gmp
go
graphviz
helm
htop
hubble
icu4c
ifstat
iftop
instalooter
iperf
jpeg
jq
k9s
keepassxc
kubebuilder
kubectl
kubecm
lens
libevent
libpng
libtiff
libtool
lrzsz
lynx
macdown
minicom
mtr
ncdu
netcat
nettle
nmap
node
oniguruma
openssl
ranger
packer
perl
postgresql
pstree
pwgen
pylint
python
python3
readline
shfmt
sqlite
starship
stoken
subversion
terraform
terraformer
terragrunt
tfenv
tfk8s
tflint
tmux
tree
vault
vim
vnstat
watch
webp
whatmask
xz
youtube-dl
"

printf "\ninstalling packages via brew...\n"
for package in $PACKAGES_BREW; do
	echo "${package}"
	brew install ${package}
done

brew install --cask mark-text

# MacOS - Fix for marktext
# https://github.com/marktext/marktext/issues/2983
xattr -cr /Applications/MarkText.app
