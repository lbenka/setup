# New Mac Setup

```bash
git clone git@github.com:lbenka/setup.git && cd setup
bash ./scripts/install_all.sh
source "$HOME/.zshrc"
bash ./scripts/setup_mac.sh  # optional: sets macOS defaults
```

Edit `Brewfile` before running to customize packages. Add secrets to `~/.secrets`.

## Scripts

- `install_all.sh` — Homebrew, packages, Oh My Zsh, dotfiles
- `setup_mac.sh` — macOS system defaults (Finder, Dock, security)

## Config

- `Brewfile` — Packages to install
- `home/.zshrc` — Shell config (aliases, PATH, Spaceship prompt)
- `iterm_profile.json` — iTerm2 theme

Load iTerm profile via iTerm UI. VS Code syncs via GitHub.

## Thanks to

[mathiasbynens](https://github.com/mathiasbynens/dotfiles/)

[strajk](https://github.com/Strajk/setup/)
