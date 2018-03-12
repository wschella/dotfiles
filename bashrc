# Include the standard .bashrc
# It's in a seperate file to avoid clutter
if [ -f $HOME/.bashrc_default ]; then
    source $HOME/.bashrc_default
fi


# WSL doesn't correctly apply umask
# umask 022

# Export graphic session to WSL
# export DISPLAY=:0

# Set some cd aliases and cdpath things
shopt -s cdable_vars
export work="/mnt/d/Workspace/"
export CDPATH=":/mnt/d/Workspace/:/home/wout/data/Workspace/"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Add Python Userbase to PATH
export PATH=$PATH:$HOME/.local/bin

# Fix NPM global install problems
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Save gems userlocal
GEM_HOME=$HOME/.gems
GEM_PATH=$HOME/.gems:/usr/lib/ruby/gems/2.3

# Bash on Windows sounds are horrible
set bell-style none

# Include aliases from a seperate file
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

if [[ $- =~ i ]]; then
    # Include prompt from a seperate file
    if [ -f $HOME/.bash_prompt/gitprompt.sh ]; then
        # GIT_PROMPT_ONLY_IN_REPO=1
        source ~/.bash_prompt/gitprompt.sh
    fi
fi

# Include Rust env
if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi


