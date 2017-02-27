if [[ `uname` == 'Darwin' ]]; then
  echo "Installing Brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install ffmpeg gifsicle git python wget zsh
elif [[ `uname` == 'Linux' && `cat /proc/version` =~ .*Ubuntu.* ]]; then
  sudo apt-get update && apt-get upgrade
  sudo apt-get -y install zsh make python python-pip git unzip zip git-lfs spell xclip ncdu htop silversearcher-ag mediainfo imagemagick members pastebinit optipng jpegoptim cloc
fi

chsh -s $(which zsh)

cd ~/
ssh-keygen -t rsa -b 4096 -C "junk_signups@rudkin.ca"
ssh-add ~/.ssh/id_rsa
sudo service ssh-agent start

pip install -U pip
pip install cheat docopt Pygments six virtualenv virtualenvwrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
cp .* ~/

git clone git@github.com:aaronrudkin/dotfiles.git
cd dotfiles
./install.sh

git clone https://github.com/nanorc/nanorc.git
cd nanorc
make install
cd ..
rm -rf nanorc
