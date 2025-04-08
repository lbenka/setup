# New mac setup

just run

```bash
mkdir $HOME/code 
git clone git@github.com:lbenka/setup.git

./install_all.sh
source "$HOME/.zshrc"

# in case of problems run
sudo xcodebuild -license accept

# and repeat
zsh ./setup_mac.sh
source "$HOME/.zshrc"
```

## shell

powered by awesome [spaceship project](https://spaceship-prompt.sh/)

next update you iTerm profile just by loading [profile](./iterm_profile.json) into iTerm
when in doubt check out [this guide](https://blog.larsbehrenberg.com/the-definitive-iterm2-and-oh-my-zsh-setup-on-macos)

## vscode

just login everything is synced via github

## Thanks to

[mathiasbynens](https://github.com/mathiasbynens/dotfiles/)

[strajk](https://github.com/Strajk/setup/)
