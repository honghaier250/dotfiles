#!/bin/sh

AppName=cscope
Package=cscope-15.6-6.ky3.x86_64.rpm
Path=/root/.dotfiles/cscope/srcpkg/

#判断是否已安装
apt-get remove -y vim
ln -s /usr/local/vim/bin/vim /usr/bin/vim
