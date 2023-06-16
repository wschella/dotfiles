# This this file is in ~, it gets sourced instead of .profile.

if [ -f "$HOME/.config/shell/bash_profile_default.sh" ]; then
    . "$HOME/.config/shell/bash_profile_default.sh"
fi

if [ -f "$HOME/.config/home-manager/nixhomeprofile.sh" ]; then
    . "$HOME/.config/home-manager/nixhomeprofile.sh"
fi

if [ -f "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi