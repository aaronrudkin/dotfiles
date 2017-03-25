echo "Switch to ZSH"
chsh -s $(which zsh)

echo "Generate SSH key and start an agent"
cd ~/
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "junk_signups@rudkin.ca"
  ssh-add ~/.ssh/id_rsa
  sudo service ssh-agent start
fi

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

# Setup symlinks
ln -sF ~/.dotfiles/.zshrc ~/.zshrc
ln -sF ~/.dotfiles/.hushlogin ~/.hushlogin
ln -sF ~/.dotfiles/.nanorc ~/.nanorc

# Decrypt encrypted stuff
cd ~/.dotfiles
./decrypt.sh

# Setup more symlinks
ln -sF ~/.dotfiles/config ~/.ssh/config
ln -sF ~/.dotfiles/.gitconfig ~/.gitconfig

# Deploy the bin file.
mkdir ~/bin
ln -sF ~/.dotfiles/writecheck ~/bin/writecheck
