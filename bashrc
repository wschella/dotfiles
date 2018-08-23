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
    source $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_prompt ]; then
    source $HOME/.bash_prompt
fi

#------------------------------------------------------------------------------
# Path / CD tweaks
#------------------------------------------------------------------------------

shopt -s cdable_vars
export CDPATH=":/media/wout/Data/Workspace:/media/wout/Data"

