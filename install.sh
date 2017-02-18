#!/bin/bash
cd ~/

# nano rc
git clone https://github.com/nanorc/nanorc.git
cd nanorc
make install
cd ..
rm -rf nanorc

# z.sh
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh

# Copy over files
cp .* ~/
