#!/bin/sh
# zsh
cp ./zsh/aliases ~/.aliases
cp ./zsh/profile ~/.profile
cp ./zsh/zshrc ~/.zshrc

# vim
mkdir -p ~/.config/nvim
cp ./vim/vimrc ~/.vimrc
cp ./vim/init.vim ~/.config/nvim/init.vim

# tmux
cp ./tmux/tmux.conf ~/.tmux.conf

# regolith
cp -r ./regolith ~/.config/
