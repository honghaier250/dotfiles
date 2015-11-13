#!/bin/sh

rm -rf ~/.indent.pro
ln -s /root/.dotfiles/indent/custom/.indent.pro ~/.indent.pro
cp -a /root/.dotfiles/indent/custom/indent_custom /usr/local/bin/
