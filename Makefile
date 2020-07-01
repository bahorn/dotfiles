.PHONY: zsh vim tmux regolith

zsh:
	cp ./zsh/aliases ~/.aliases
	cp ./zsh/profile ~/.profile
	cp ./zsh/zshrc ~/.zshrc
	mkdir -p ~/.misc/antigen
	curl -L https://git.io/antigen > ~/.misc/antigen/antigen.zsh

vim:
	mkdir -p ~/.config/nvim ~/.vim/
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp ./vim/vimrc ~/.vimrc
	cp ./vim/*.vim ~/.config/nvim/

tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf

regolith:
	cp -r ./regolith ~/.config/

