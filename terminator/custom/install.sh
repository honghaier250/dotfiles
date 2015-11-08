#!/bin/sh

mkdir -p /root/.config/terminator/
rm -rf /root/.config/terminator/config
ln -s /root/.dotfiles/terminator/custom/config /root/.config/terminator/config
