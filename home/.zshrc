# Brew 
eval "$(/opt/homebrew/bin/brew shellenv)"

# prompt spaceship
# https://spaceship-prompt.sh/
#ZSH_THEME="spaceship"
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
plugins=(git github brew macos git-extras tig docker aws kubectl)

# Action!
# ---
source $ZSH/oh-my-zsh.sh
source $(brew --prefix nvm)/nvm.sh
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias 3="python3.9"

# micropython
alias upy="screen /dev/tty.SLAB_USBtoUART 115200"

# Adjust PATH
# ---
export PATH="/Users/lukasbenka/bin:/usr/local/sbin:$PATH"

# pycurl
export PYCURL_SSL_LIBRARY=openssl
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

alias drm_all="docker rm $(docker ps -a -q)"

eval $(thefuck --alias)

# dji mavic air to google photos timestamp fix
alias exif_fix='exiftool "-MediaCreateDate<filemodifydate" "-MediaModifyDate<filemodifydate" "-TrackCreateDate<filemodifydate" "-TrackModifyDate<filemodifydate" "-CreateDate<filemodifydate" "-ModifyDate<filemodifydate" -tagsfromfile @ -mditemfscreationdate -overwrite_original -P -r . -ext .mp4' 
