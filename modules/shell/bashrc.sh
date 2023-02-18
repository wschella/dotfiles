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
    . $HOME/.bashrc_default
fi

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_prompt ]; then
    . $HOME/.bash_prompt
fi

if [ -f $HOME/.bash_local ]; then
    . $HOME/.bash_local
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

# I like these dirs
export CDPATH=":/media/wout/Data/Workspace:/media/wout/Data"

# Fix yarn
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add cargo
export PATH="$HOME/.cargo/bin:$PATH"

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

# Source Nix config & tools
if [ -f "/etc/profile.d/nix.sh" ] ; then
    source "/etc/profile.d/nix.sh"
fi

if [ -d "/nix" ] ; then
    export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"

    if [ -f "$HOME/.config/nixpkgs/home.nix" ] ; then
        source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    fi
fi
if [ -d "/etc/nixos" ] ; then
    export LOCALE_ARCHIVE="/run/current-system/sw/lib/locale/locale-archive"
fi

if command -v fzf-share >/dev/null; then
    source "$(fzf-share)/key-bindings.bash"
    source "$(fzf-share)/completion.bash"
fi

# This is usefull on multi user installations 
# https://github.com/NixOS/nix/issues/2033
export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels

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

