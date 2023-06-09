# # Source Nix config & tools
# if [ -f "/etc/profile.d/nix.sh" ] ; then
#     source "/etc/profile.d/nix.sh"
# fi

# if [ -d "/nix" ] ; then
#     export LOCALE_ARCHIVE="$(readlink ~/.nix-profile/lib/locale)/locale-archive"

#     if [ -f "$HOME/.config/nixpkgs/home.nix" ] ; then
#         source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
#     fi
# fi

# if [ -d "/etc/nixos" ] ; then
#     export LOCALE_ARCHIVE="/run/current-system/sw/lib/locale/locale-archive"
# fi
