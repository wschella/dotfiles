# Should be sourced for home-manager with standalone (i.e. non-NixOS) installs
# https://nix-community.github.io/home-manager/index.html#sec-install-standalone
if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ] ; then
    source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
fi

# We just do this manually, modifying XDG_DATA_DIRS is broke everything

# sudo cp .nix-profile/share/applications/* .local/share/applications/
# sudo cp -r .nix-profile/share/icons/* .local/share/icons/d
