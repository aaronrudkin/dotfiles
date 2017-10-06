  echo "System defaults"

  echo "Turn off manu icons"
  defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array \
	"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
	"/System/Library/CoreServices/Menu Extras/Volume.menu" \
	"/System/Library/CoreServices/Menu Extras/User.menu"

  echo "Disable natural scrolling"
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  echo "Fix save dialogue"
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  echo "Fix text auto-correction"
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

  echo "Fix tap to click on touchpad."
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  echo "Save screenshots to desktop as PNG"
  defaults write com.apple.screencapture location -string "${HOME}/Desktop"
  defaults write com.apple.screencapture type -string "png"

  echo "Fix Finder status bar and switch folders to list mode"
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  echo "Disable DS_Store files"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  echo "Disable disk image verification"
  defaults write com.apple.frameworks.diskimages skip-verify -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

  echo "Disable dashboard"
  defaults write com.apple.dashboard mcx-disabled -bool true
  defaults write com.apple.dock dashboard-in-overlay -bool true

  echo "Setup hot corners"
  defaults write com.apple.dock wvous-tl-corner -int 11 # 11 = Launchpad
  defaults write com.apple.dock wvous-tl-modifier -int 0

  echo "Password delay"
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 60

  echo "Show file extensions"
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  echo "No more .DS_Store"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores true

  echo "Show library folder"
  chflags nohidden ~/Library

  echo "Setup dock -- autohide, small size, large size"
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock largesize -int 104
  defaults write com.apple.dock tilesize -int 16
  killall Dock
  killall Finder
