# get brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brew bundle
brew bundle

# install oh my zshell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#link .zshrc
rm -f "$HOME/.zshrc" && ln -s "$HOME/Code/setup/home/.zshrc" $HOME && source "$HOME/.zshrc"

# link .dotfiles
echo "linking dotfiles"
ln -s $HOME/Code/setup/home/.gitconfig $HOME/.gitconfig
ln -s $HOME/Code/setup/home/.gitignore_global $HOME/.gitignore_global

echo "install nvm"
# setup nvm
nvm ls-remote | tail

# Install it (it should use it & set as default automatically)
nvm install v12.4.0

# Make sure
nvm list
nvm current

# setup shell visuals and activate
npm i -g spaceship-prompt

# adjust vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true


# Default folder to $HOME
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder.
chflags nohidden ~/Library

# Show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network & USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Other
# ---

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Sleep the display after 5 minutes
sudo pmset -a displaysleep 5

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES
killall SystemUIServer

# Customize dock
# ---

# Set the icon size of Dock items to 45 pixels
defaults write com.apple.dock tilesize -int 45

#Autohide Dock
defaults write com.apple.dock autohide -boolean true

# Minimalize effect scale
defaults write com.apple.dock mineffect -string scale

# Show indicators
defaults write com.apple.dock show-process-indicators -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock persistent-apps -array
for app in \
  "/System/Library/CoreServices/Finder.app" \
  "/System/Applications/Calendar.app" \
  "/Applications/Google Chrome.app" \
  "/Applications/Firefox.app" \
  "/Applications/Slack.app" \
  "/Applications/1Password 7.app" \
  "/Applications/Spotify.app" \
  "/Applications/iTerm.app" \
  "/Applications/Visual Studio Code.app" \
  "/System/Applications/System Preferences.app" \
  ; do
  if [ "$app" "==" "spacer" ]; then
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}'
  else
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  fi
done

killall Dock

# set DNS servers
networksetup -setdnsservers Wi-Fi 8.8.8.8 1.1.1.1

# install pip tools
pip3 install pip-tools

# New machine - new ssh key
eval "$(ssh-agent -s)"

ln -s $HOME/Code/setup/home/ssh_config $HOME/.ssh/config

ssh-keygen -t rsa -b 4096 -C "benka.lukas@gmail.com"

ssh-add -K ~/.ssh/id_rsa

# activate shell
source "$HOME/.zshrc"

