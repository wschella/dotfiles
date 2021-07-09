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

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_prompt ]; then
    . $HOME/.bash_prompt
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

# Add poetry
export PATH="$HOME/.poetry/bin:$PATH"

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

# This is usefull on multi user installations 
# https://github.com/NixOS/nix/issues/2033
export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels
