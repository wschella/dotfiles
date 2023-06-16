# Should be sourced for home-manager with standalone (i.e. non-NixOS) installs
# https://nix-community.github.io/home-manager/index.html#sec-install-standalone
if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ] ; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi