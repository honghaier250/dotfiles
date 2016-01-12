#!/bin/sh

rm -rf ~/.tmux.conf ~/.tmux
ln -s /root/.dotfiles/tmux/custom/.tmux.conf ~/.tmux.conf
ln -s /root/.dotfiles/tmux/custom/.tmux ~/.tmux
