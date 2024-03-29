# Add cargo
if [ -f "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

if command -v starship &> /dev/null ; then
    eval "$(starship init bash)"
fi

if command -v fzf &> /dev/null ; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

if command -v fzf-share &> /dev/null ; then
    source "$(fzf-share)/key-bindings.bash"
    source "$(fzf-share)/completion.bash"
fi
