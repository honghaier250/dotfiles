#!/bin/sh

if [ -z /etc/profile.d/autojump.zsh ]; then
    ln -s /root/.dotfiles/autojump/custom/autojump.zsh /etc/profile.d/autojump.zsh
fi
