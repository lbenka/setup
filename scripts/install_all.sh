# if any of the steps (not in a block construction) fail (exit with non-zero), the whole script should halt in place and the script will exit with the failure message of the failed step.
set -euo pipefail

echo "get brew"
if [ ! `command -v brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Setup rosseta
softwareupdate --install-rosetta --agree-to-license

# activate brew 
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "install brew bundle"
brew bundle

# https://github.com/ohmyzsh/ohmyzsh#unattended-install
echo "install oh my zshell"
rm -rf $HOME/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "mkfile for secrets" 
touch $HOME/.secrets

echo "link .zshrc"
rm -f "$HOME/.zshrc"
ln -sf "$HOME/code/setup/home/.zshrc" $HOME 

echo "linking dotfiles"
ln -sf $HOME/code/setup/home/.gitconfig $HOME/.gitconfig
ln -sf $HOME/code/setup/home/.gitignore_global $HOME/.gitignore_global

mkdir $HOME/code/work
ln -sf $HOME/code/setup/home/.gitconfig_work $HOME/code/secfo/.gitconfig_work
ln -sf $HOME/code/setup/home/.allowedSigners $HOME/.allowedSigners

# VIM 
echo "adjust vim"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

# install npm

npm install -g pyright
