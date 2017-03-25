if [[ `uname` == 'Darwin' ]]; then
  ./brew_setup.sh

  # Sound effects for trash
  sudo mv "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/dock/drag to trash.aif" "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/dock/drag to trash.aif.bak"
  sudo cp "drag to trash.aif" "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/dock/drag to trash.aif"
  sudo mv "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/finder/empty trash.aif" "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/finder/empty trash.aif.bak"
  sudo cp "empty trash.aif" "/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/finder/empty trash.aif"

  ./defaults_setup.sh

elif [[ `uname` == 'Linux' && `cat /proc/version` =~ .*Ubuntu.* ]]; then
  echo "Apt setup"
  sudo apt-get update && apt-get upgrade
  sudo apt-get -y install zsh make python python-pip git unzip zip git-lfs spell xclip ncdu htop silversearcher-ag mediainfo imagemagick members pastebinit optipng jpegoptim cloc
fi

echo "Setup python"
pip install -U pip
pip install docopt Pygments six virtualenv virtualenvwrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

./shell_setup.sh
