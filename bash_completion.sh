# Add alias for alternate password-store
. /usr/share/bash-completion/completions/pass
_zpass() {
  # trailing / is required for the password-store dir.
  PASSWORD_STORE_DIR=~/.zeus-wachtwoord-winkel/ _pass
}

complete -o filenames -o nospace -F _zpass zpass