# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.local/go/bin/" ]; then
    PATH="$HOME/.local/go/bin:$PATH"
fi

if [ -d "$HOME/.local/nvim/bin/" ]; then
    PATH="$HOME/.local/nvim/bin:$PATH"
fi
export GOROOT="$HOME/.local/go/"
export GOPATH="$HOME/go/"
# set up z3
export PYTHONPATH="$HOME/Documents/Code/OSS/zee3/build/python/"
export LD_LIBRARY_PATH="$HOME/.local/lib/:$HOME/Documents/Code/OSS/zee3/build/"
export DYLD_LIBRARY_PATH="$HOME/.local/lib/"
unset HISTFILE

export BROWSER=~/Software/firefox/firefox-bin
export EDITOR=/usr/local/bin/vim
export NNN_USE_EDITOR=1
export PG_OF_PATH=/home/a/Desktop/of_v0.9.8_linux64_release
