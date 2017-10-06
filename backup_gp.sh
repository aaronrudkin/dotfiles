#!/bin/bash
mkdir ~/Desktop/Gamepedia_Backup
cd ~/Library/Application\ Support/Gamepedia 
cp Database.gamepd ~/Desktop/Gamepedia_Backup/
cp autofill.xml ~/Desktop/Gamepedia_Backup/
cp -r Covers ~/Desktop/Gamepedia_Backup/
cd ~/Desktop/Gamepedia_Backup
zip -r gamepedia_backup.zip .
