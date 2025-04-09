OS="$(uname -s)"

if [ $OS = "Darwin" ]; then
	SW_VERS="$(sw_vers -productVersion | cut -d. -f1-2)"
	echo $SW_VERS
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export STARSHIP_CONFIG=~/.starship-config.toml
export WORKON_HOME=$HOME/.virtualenvs
export GOPATH=$HOME/go
export PATH=/opt/homebrew/bin:$PATH:$GOPATH/bin
if [[ $SW_VERS = 15.* ]]; then
	export PATH=~/Library/Python/3.9/bin:$PATH
fi

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"

source <(kubectl completion zsh)
source <(kubebuilder completion zsh)

V=`which virtualenvwrapper.sh`
source ${V}

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
