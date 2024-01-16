#!/bin/bash

###
### PACKAGES
###

# terraform... use tfenv to install terraform
PACKAGES_BREW="
cilium-cli
cmake
cmctl
direnv
k9s
kubebuilder
kubectl
kubecm
lens
mtr
popeye
python@3.13
starship
tfenv
vim
watch
"

printf "\ninstalling packages via brew...\n"
for package in $PACKAGES_BREW; do
	echo "${package}"
	brew install ${package}
done

printf "\ninstall latest terraform via tfenv...\n"
tfenv install

