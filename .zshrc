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
export PATH=$GOPATH/bin:$PATH
if [[ $SW_VERS = 15.* || $SW_VERS = 26.* ]]; then
	export PATH=~/Library/Python/3.9/bin:$PATH
fi

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

source <(kubectl completion zsh)
source <(kubebuilder completion zsh)

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

V=`which virtualenvwrapper.sh`
source ${V}

