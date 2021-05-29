.PHONY: zsh vim tmux regolith ssh scripts git gdb pyenv

all: zsh vim tmux regolith ssh scripts gdb pyenv

zsh:
	cp ./zsh/aliases ~/.aliases
	cp ./zsh/profile ~/.profile
	cp ./zsh/zshrc ~/.zshrc
	mkdir -p ~/.config/zsh/antigen
	@git clone https://github.com/zsh-users/antigen.git ~/.config/zsh/antigen | true
	git -C ~/.config/zsh/antigen pull

vim:
	mkdir -p ~/.config/nvim ~/.vim/
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp ./vim/vimrc ~/.vimrc
	cp ./vim/*.vim ~/.config/nvim/
	vim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qa

tmux:
	cp ./tmux/tmux.conf ~/.tmux.conf

regolith:
	cp -r ./regolith ~/.config/
	./utils/fix_i3xrocks_config

ssh:
	cp ./ssh/config ~/.ssh/config
	touch ~/.ssh/hosts
	./scripts/hosts > ~/.ssh/autogenerated-hosts

scripts:
	mkdir -p ~/bin
	cp ./scripts/* ~/bin

git:
	cp ./git/gitconfig ~/.gitconfig
	cp ./git/gitmessage ~/.gitmessage

gdb:
	wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
	echo source ~/.gdbinit-gef.py >> ~/.gdbinit

pyenv:
	 @git clone https://github.com/pyenv/pyenv.git ~/.pyenv | true
	 git -C ~/.pyenv pull
