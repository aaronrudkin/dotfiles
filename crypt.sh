#!/bin/bash
gpg --cipher-algo AES256 --symmetric -c config
gpg --cipher-algo AES256 --symmetric -c .gitconfig
gpg --cipher-algo AES256 --symmetric -c id_rsa
gpg --cipher-algo AES256 --symmetric -c id_rsa.pub

