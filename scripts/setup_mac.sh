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
# defaults write com.apple.dock autohide -boolean true

# Minimalize effect scale
defaults write com.apple.dock mineffect -string scale

# Show indicators
defaults write com.apple.dock show-process-indicators -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# scroll in iterm
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true

defaults write com.apple.dock persistent-apps -array
for app in \
  "/System/Library/CoreServices/Finder.app" \
  "/System/Applications/Calendar.app" \
  "/Applications/Google Chrome.app" \
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
networksetup -setdnsservers Wi-Fi 1.1.1.1 8.8.8.8

# install pip tools
pip3 install pip-tools

# activate shell
source "$HOME/.zshrc"

