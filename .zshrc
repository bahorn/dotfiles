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

. /home/a/torch/install/bin/torch-activate

bindkey -v

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/a/.sdkman"
[[ -s "/home/a/.sdkman/bin/sdkman-init.sh" ]] && source "/home/a/.sdkman/bin/sdkman-init.sh"
