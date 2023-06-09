# Should be sourced for home-manager with standalone (i.e. non-NixOS) installs
# https://nix-community.github.io/home-manager/index.html#sec-install-standalone
if [ -d "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ] ; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

# This is usefull on multi user installations 
# https://github.com/NixOS/nix/issues/2033
# export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels