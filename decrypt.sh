#!/bin/bash
gpg --output config --decrypt config.gpg
gpg --output .gitconfig --decrypt .gitconfig.gpg
