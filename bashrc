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

# Add spark to Path
SPARK_HOME=/usr/local/spark
export PATH="$PATH:$SPARK_HOME/bin"

# Set the Hadoop Related Environment variables
export HADOOP_HOME="/usr/local/hadoop"
export PATH="$PATH:$HADOOP_HOME/bin"