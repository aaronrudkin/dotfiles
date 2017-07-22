  echo "Installing Brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew update
  brew upgrade

  echo "Installing brew commands"
  brew install coreutils moreutils findutils
  brew install ffmpeg gifsicle git git-lfs python wget zsh cloc optipng htop mediainfo pngcheck john tree tmux
  brew install ncdu jpegoptim pastebinit gpg micro zsh-completions the_silver_searcher dockutil youtube-dl
  brew install imagemagick jq

  brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv qlimagesize webpquicklook mactex texshop
  brew cask install google-chrome 1password rstudio dropbox
  brew cask install grandperspective the-unarchiver skype vlc spectacle
  brew cask install vanilla

  # Fixing some of the quick-look stuff
  sudo chown -R aaronrudkin ~/Library/QuickLook/qlImageSize.qlgenerator
  sudo chmod 0755 ~/Library/QuickLook/qlImageSize.qlgenerator

  brew tap caskroom/fonts
  brew cleanup
