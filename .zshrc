source ~/.misc/antigen/antigen.zsh
source ~/.profile
source ~/.aliases
source ~/.misc/nnnquit.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle python
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle virtualenv

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
antigen theme evan
# Tell Antigen that you're done.
antigen apply

bindkey -v

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
nvm() {
    echo "Lazy loading nvm..."
    # Remove nvm function
    unfunction "$0"
    # Load nvm
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    # Load bash_completion
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
    # Call nvm
    $0 "$@"
}
