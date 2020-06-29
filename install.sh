#!/bin/sh
# zsh
cp ./zsh/aliases ~/.aliases
cp ./zsh/profile ~/.profile
cp ./zsh/zshrc ~/.zshrc
mkdir -p ~/.misc/antigen
curl -L https://git.io/antigen > ~/.misc/antigen/antigen.zsh 

# vim
mkdir -p ~/.config/nvim
cp ./vim/vimrc ~/.vimrc
cp ./vim/init.vim ~/.config/nvim/init.vim

# tmux
cp ./tmux/tmux.conf ~/.tmux.conf

# regolith
cp -r ./regolith ~/.config/
