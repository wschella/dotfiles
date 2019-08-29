# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#------------------------------------------------------------------------------
# Sourcing  
#------------------------------------------------------------------------------
# Doing this to avoid clutter

if [ -f $HOME/.bashrc_default ]; then
    source $HOME/.bashrc_default
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# Prompt
eval "$(starship init bash)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#------------------------------------------------------------------------------
# Path / CD tweaks
#------------------------------------------------------------------------------
# Correct small typo's
shopt -s cdspell 

# Complete only directories
# complete -d cd

shopt -s cdable_vars

# I like these dirs
export CDPATH=":/media/wout/Data/Workspace:/media/wout/Data"

# Local
export PATH="$PATH:$HOME/.local/bin"

# Fix yarn
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Fix rbenv
eval "$(rbenv init -)"

# Add julia to Path
export PATH="$PATH:/opt/julia/bin"