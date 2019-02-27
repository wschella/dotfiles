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

if [ -f $HOME/.zpass.bash_completion ]; then
    . $HOME/.zpass.bash_completion
fi

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_prompt ]; then
    . $HOME/.bash_prompt
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#------------------------------------------------------------------------------
# Path / CD tweaks
#------------------------------------------------------------------------------
shopt -s cdspell # Correct small typo's
# complete -d cd # Complete only directories
shopt -s cdable_vars
export CDPATH=":/media/wout/Data/Workspace:/media/wout/Data"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(rbenv init -)"