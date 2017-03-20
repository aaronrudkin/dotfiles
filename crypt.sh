#!/bin/bash
gpg --cipher-algo AES256 --symmetric -c config
gpg --cipher-algo AES256 --symmetric -c .gitconfig
