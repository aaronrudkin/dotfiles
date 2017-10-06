#!/bin/bash
gpg --output config --decrypt config.gpg
gpg --output .gitconfig --decrypt .gitconfig.gpg
gpg --output id_rsa --decrypt id_rsa.gpg
gpg --output id_rsa.pub --decrypt id_rsa.pub.gpg
