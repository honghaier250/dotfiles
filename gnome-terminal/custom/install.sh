#!/bin/sh

rm -rf /root/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
ln -s /root/.dotfiles/gnome-terminal/custom/%gconf.xml /root/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml
