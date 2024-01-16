#!/bin/bash

# FILES
FILES=" 
.bash_profile
.bashrc
.vimrc
.tmux.conf
.ansible.cfg
.zshrc
.starship-config.toml
.gitconfig
.gitignore
"

for file in $FILES; do
	printf "comparing $file - "
	cmp --silent $file ~/$file
	if [ $? = "1" ]; then
		diff $file ~/$file
		printf "files are NOT the same. copy $file over to ~/ manually \n"
		printf "\ncp $file ~/$file \n"
	else
		printf "files are the same. copying $file over to ~/ for you \n"
		cp $file ~/$file
	fi
done

if [ ! -d ~/.config/tmux-powerline ]; then
	mkdir -p ~/.config/tmux-powerline
fi

printf "\ncomparing config.sh ~/.config/tmux-powerline/config.sh\n"
cmp --silent config.sh ~/.config/tmux-powerline/config.sh
if [ $? = "1" ]; then
	diff config.sh ~/.config/tmux-powerline/config.sh
	printf "files are NOT the same. copy config.sh over to  ~/.config/tmux-powerline manually \n"
	printf "\ncp config.sh ~/.config/tmux-powerline/config.sh \n"
else
	printf "files are the same. copying config.sh over to ~/.config/tmux-powerline for you \n"
	cp config.sh ~/.config/tmux-powerline/config.sh
fi
