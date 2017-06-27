# Include the standard .bashrc
# It's in a seperate to avoid clutter
if [ -f $HOME/.bashrc_default ]; then
    source $HOME/.bashrc_default
fi

# Bash on Windows doesn't correctly apply umask
umask 022

# Include aliases from a seperate file
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Include prompt from a seperate file
if [ -f $HOME/.bashrc_prompt ]; then
    source $HOME/.bashrc_prompt
fi

# Include Rust env
if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi
