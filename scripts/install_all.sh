#!/bin/bash
# Exit on any error, undefined variables, or pipe failures
set -euo pipefail

# Pre-flight checks
if [ ! -d "$HOME/code/setup" ]; then
  echo "Error: This script must be run from ~/code/setup"
  exit 1
fi

echo "get brew"
if [ ! `command -v brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Setup rosseta
softwareupdate --install-rosetta --agree-to-license

# activate brew
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "install brew bundle"
# Brew bundle may fail if taps are unavailable; continue if it does
brew bundle || true

echo "install Nookat"
LATEST_NOOKAT=$(curl -s https://api.github.com/repos/nookat-io/nookat/releases/latest | grep 'browser_download_url.*dmg' | cut -d '"' -f 4 | head -1)
if [ ! -z "$LATEST_NOOKAT" ]; then
  curl -L "$LATEST_NOOKAT" -o /tmp/Nookat.dmg
  hdiutil attach /tmp/Nookat.dmg
  cp -r /Volumes/Nookat/Nookat.app /Applications/
  hdiutil detach /Volumes/Nookat
  rm /tmp/Nookat.dmg
fi

# https://github.com/ohmyzsh/ohmyzsh#unattended-install
echo "install oh my zshell"
[ -d "$HOME/.oh-my-zsh" ] && rm -rf "$HOME/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "mkfile for secrets"
touch $HOME/.secrets

echo "link .zshrc"
rm -f "$HOME/.zshrc"
ln -sf "$HOME/code/setup/home/.zshrc" $HOME

echo "linking dotfiles"
ln -sf $HOME/code/setup/home/.gitconfig $HOME/.gitconfig
ln -sf $HOME/code/setup/home/.gitignore $HOME/.gitignore
ln -sf $HOME/code/setup/home/.gitignore_global $HOME/.gitignore_global

mkdir -p $HOME/code/work
ln -sf $HOME/code/setup/home/.gitconfig_work $HOME/code/work/.gitconfig_work
ln -sf $HOME/code/setup/home/.allowedSigners $HOME/.allowedSigners

# VIM
echo "adjust vim"
[ -d "$HOME/.vim_runtime" ] && rm -rf "$HOME/.vim_runtime"
git clone --depth=1 https://github.com/amix/vimrc.git "$HOME/.vim_runtime"
sh "$HOME/.vim_runtime/install_basic_vimrc.sh"

# Global npm packages
echo "install pyright"
npm install -g pyright

echo "✓ Setup complete. Run: source ~/.zshrc"
