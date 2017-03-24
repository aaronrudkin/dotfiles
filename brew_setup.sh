  echo "Installing Brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew update
  brew upgrade

  echo "Installing brew commands"
  brew install ffmpeg gifsicle git git-lfs python wget zsh cloc optipng htop mediainfo pngcheck john
  brew install ncdu jpegoptim pastebinit gpg micro zsh-completions the_silver_searcher dockutil
  brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv qlimagesize webpquicklook
  brew cask install google-chrome flux 1password spectacle vlc rstudio dropbox grandperspective the-unarchiver skype

  # Fixing some of the quick-look stuff
  sudo chown -R aaronrudkin ~/Library/QuickLook/qlImageSize.qlgenerator
  sudo chmod 0755 ~/Library/QuickLook/qlImageSize.qlgenerator
