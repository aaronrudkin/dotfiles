if [[ `uname` == 'Darwin' ]]; then
  echo "Installing Brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade
  echo "Installing brew commands"
  brew install ffmpeg gifsicle git python wget zsh cloc optipng htop mediainfo
  brew install ncdu jpegoptim pastebinit gpg micro zsh-completions the_silver_searcher
  brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv qlimagesize webpquicklook
  brew cask install google-chrome flux 1password spectacle vlc rstudio dockutil
  sudo chown -R aaronrudkin ~/Library/QuickLook/qlImageSize.qlgenerator
  sudo chmod 0755 ~/Library/QuickLook/qlImageSize.qlgenerator
elif [[ `uname` == 'Linux' && `cat /proc/version` =~ .*Ubuntu.* ]]; then
  echo "Apt setup"
  sudo apt-get update && apt-get upgrade
  sudo apt-get -y install zsh make python python-pip git unzip zip git-lfs spell xclip ncdu htop silversearcher-ag mediainfo imagemagick members pastebinit optipng jpegoptim cloc
fi

echo "Switch to ZSH"
chsh -s $(which zsh)

echo "Generate SSH key and start an agent"
cd ~/
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "junk_signups@rudkin.ca"
  ssh-add ~/.ssh/id_rsa
  sudo service ssh-agent start
fi

echo "Setup python"
pip install -U pip
pip install docopt Pygments six virtualenv virtualenvwrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

echo "Install Z"
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
cp .* ~/

echo "Nano RC"
git clone https://github.com/nanorc/nanorc.git
cd nanorc
make install
cd ..
rm -rf nanorc

echo "ZSH Completions"
git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions
mkdir ~/.zsh
mkdir ~/.zsh/completions_used
cd ~/.zsh/completions_used
ln -s ~/.zsh/zsh-completions/src/_ag _ag
ln -s ~/.zsh/zsh-completions/src/_fab _fab
ln -s ~/.zsh/zsh-completions/src/_gas _gas
ln -s ~/.zsh/zsh-completions/src/_gist _gist
ln -s ~/.zsh/zsh-completions/src/_go _go
ln -s ~/.zsh/zsh-completions/src/_google _google
ln -s ~/.zsh/zsh-completions/src/_httpie _httpie
ln -s ~/.zsh/zsh-completions/src/_jq _jq
ln -s ~/.zsh/zsh-completions/src/_language_codes _language_codes
ln -s ~/.zsh/zsh-completions/src/_mina _mina
ln -s ~/.zsh/zsh-completions/src/_redis-cli _redis-cli
ln -s ~/.zsh/zsh-completions/src/_pygmentize _pygmentize
ln -s ~/.zsh/zsh-completions/src/_setup.py _setup.py
ln -s ~/.zsh/zsh-completions/src/_shutdown _shutdown
ln -s ~/.zsh/zsh-completions/src/_ssh-copy-id _ssh-copy-id
ln -s ~/.zsh/zsh-completions/src/_subliminal _subliminal

echo "ZSH Autosuggestions"
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "Clone the whole dotfiles repo"
git clone git@github.com:aaronrudkin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
