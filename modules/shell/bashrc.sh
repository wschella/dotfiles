# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#------------------------------------------------------------------------------
# Sourcing  
#------------------------------------------------------------------------------
# Doing this to avoid clutter

if [ -f $HOME/.config/shell/bashrc_default.sh ]; then
    . $HOME/.config/shell/bashrc_default.sh
fi

if [ -f $HOME/.config/shell/bash_aliases.sh ]; then
    . $HOME/.config/shell/bash_aliases.sh
fi

if [ -f $HOME/.config/shell/bash_prompt.sh ]; then
    . $HOME/.config/shell/bash_prompt.sh
fi

if [ -f $HOME/.config/shell/bash_local.sh ]; then
    . $HOME/.config/shell/bash_local.sh
fi

if [ -f $HOME/.config/shell/nixhome.sh ]; then
    . $HOME/.config/shell/nixhome.sh
fi

if [ -f $HOME/.config/shell/nixoshome.sh ]; then
    . $HOME/.config/shell/nixoshome.sh
fi


#------------------------------------------------------------------------------
# Path / CD tweaks
#------------------------------------------------------------------------------
# Correct small typo's
shopt -s cdspell 

# Complete only directories
# complete -d cd

export PIPENV_VENV_IN_PROJECT=1

shopt -s cdable_vars

# Add node
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="~/.npm-packages/bin:$PATH"
export NODE_PATH="$NODE_PATH:~/.npm-packages/lib/node_modules"

# Add cargo
if [ -f "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

# Add julia to Path
export PATH="$PATH:/opt/julia/bin"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# https://stackoverflow.com/questions/6569478/detect-if-executable-file-is-on-users-path
if command -v "github-copilot-cli" &> /dev/null ; then
    eval "$(github-copilot-cli alias -- "$0")"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wout/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wout/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wout/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wout/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

