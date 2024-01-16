#!/bin/bash

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
popeye
postgresql
pstree
pwgen
pylint
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
