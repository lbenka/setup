# Brew 

if [ "$(arch)" = "i386" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
   export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl@1.1/lib/
else 
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/opt/openssl/lib/
fi


export PYENV_ROOT="$HOME/.pyenv" 
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -zsh)"

# debug info 
# echo $(which brew)
# echo $(which poetry)
# echo $(arch)


# prompt spaceship
# https://spaceship-prompt.sh/
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
SPACESHIP_TIME_SHOW=true
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_CONTEXT_SHOW=true

# podman 
# alias docker=podman

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
plugins=(git github brew macos git-extras tig docker kubectl)

# Action!
# ---
source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Rust
source "$HOME/.cargo/env"

# Shortcuts 
# --- 
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

alias 3="python3"
alias py="python3"

alias k9="k9s"
alias poc="poetry cache clear --all ."

alias drm="docker rm $(docker ps -a -q)"

# micropython
alias upy="screen /dev/tty.SLAB_USBtoUART 115200"

# Adjust PATH
# ---
export PATH="/Users/lukasbenka/bin:/usr/local/sbin:$PATH"

# pycurl
export PYCURL_SSL_LIBRARY=openssl

export LDFLAGS="-L$(brew --prefix openssl)/lib -L/usr/local/opt/openssl/lib"
export CFLAGS="-I$(brew --prefix openssl)/include"
export CPPFLAGS="-I$(brew --prefix openssl)/include"

# dji mavic air to google photos timestamp fix
alias exif_fix='exiftool "-MediaCreateDate<filemodifydate" "-MediaModifyDate<filemodifydate" "-TrackCreateDate<filemodifydate" "-TrackModifyDate<filemodifydate" "-CreateDate<filemodifydate" "-ModifyDate<filemodifydate" -tagsfromfile @ -mditemfscreationdate -overwrite_original -P -r . -ext .mp4' 

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/lukasbenka/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Created by `pipx` on 2023-12-12 07:47:32
export PATH="$PATH:/Users/lukasbenka/.local/bin"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
