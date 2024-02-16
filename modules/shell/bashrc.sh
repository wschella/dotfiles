# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#------------------------------------------------------------------------------
# Set path
#------------------------------------------------------------------------------
# We do this before sourcing, so the necessary tools are available already.

# Includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Add node
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="~/.npm-packages/bin:$PATH"
export NODE_PATH="$NODE_PATH:~/.npm-packages/lib/node_modules"

# Add julia
export PATH="$PATH:/opt/julia/bin"

# Add bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH


#------------------------------------------------------------------------------
# Sourcing  
#------------------------------------------------------------------------------
# In external files to avoid clutter.

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

#------------------------------------------------------------------------------
# Source external
#------------------------------------------------------------------------------
# Add cargo
if [ -f "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

# Add asdf (if it exists)
if [ -f "$HOME/.asdf/asdf.sh" ] ; then
    . "$HOME/.asdf/asdf.sh"
fi

if [ -f "$HOME/.asdf/completions/asdf.bash" ] ; then
    . "$HOME/.asdf/completions/asdf.bash"
fi

# Rye
if [ -f "$HOME/.rye/env" ] ; then
    . "$HOME/.rye/env"
fi

# Copilot
# https://stackoverflow.com/questions/6569478/detect-if-executable-file-is-on-users-path
if command -v "github-copilot-cli" &> /dev/null ; then
    eval "$(github-copilot-cli alias -- "$0")"
fi

#------------------------------------------------------------------------------
# CD tweaks
#------------------------------------------------------------------------------
# Correct small typo's
shopt -s cdspell 

# Complete only directories
# complete -d cd

shopt -u cdable_vars

#------------------------------------------------------------------------------
# Varia
#------------------------------------------------------------------------------

export PIPENV_VENV_IN_PROJECT=1
