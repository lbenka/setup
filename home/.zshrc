# Secrets
# ---
source $HOME/.secrets

export ZSH=$HOME/.oh-my-zsh

export NVM_DIR=$HOME/.nvm

# hstr
# https://github.com/dvorka/hstr
# ---
export HISTFILE=$HOME/.zsh_history
export HH_CONFIG=hicolor

# Plugins
# ---
plugins=(git github brew osx git-extras tig docker)

# Action!
# ---
source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh
alias brewup="brew update; brew upgrade; brew prune; brew cleanup; brew doctor"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias 3="python3.8"
alias upy="screen /dev/tty.SLAB_USBtoUART 115200"
alias vpn="sudo openfortivpn -c /etc/forti.conf"

# Adjust PATH
# ---
export PATH="/Users/lukasbenka/bin:/usr/local/sbin:$PATH"

# pycurl
export PYCURL_SSL_LIBRARY=openssl
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit

prompt spaceship
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

alias lift="$HOME/Code/liftago_gmail_count/venv/bin/python $HOME/Code/liftago_gmail_count/liftago.py"
