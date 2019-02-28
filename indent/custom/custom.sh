#!/bin/sh

rm -rf ~/.indent.pro
ln -s ~/.dotfiles/indent/custom/.indent.pro.kr.style ~/.indent.pro
cp -a ~/.dotfiles/indent/custom/indent_custom /usr/local/bin/
