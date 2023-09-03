# Utilities
alias l="ls -ahGl --color=auto"
alias s="sudo"

alias sshpub="cat ~/.ssh/id_rsa.pub | c"

alias latexwatch="latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pvc -pdf"

alias dot="code ~/.dotfiles"
alias vdot="vim ~/.dotfiles"
alias redotter="(cd ~/.dotfiles/ && dotter deploy)"
alias rebash="redotter  && source ~/.bashrc"
alias rehome="rebash && home-manager switch"
alias renix="nixos-rebuild switch"

alias vinix="vim /etc/nixos/configuration.nix"
alias nix-edit="vim ~/.config/nixpkgs/home.nix"

alias occ="nextcloud-occ"

alias mirror="wget --mirror --convert-links --adjust-extension --page-requisites 
--no-parent"

# Version control
alias gti="git"
alias g="git"

# Networking
alias ipa="ip -c a"
alias ip4="ip -c -br -4 a"
alias ip6="ip -c -br -6 a"

# Conda
alias condcre="conda env create --prefix .venv -f environment.yml"
alias condupt="conda env update --prefix .venv --file environment.yml  --prune"
alias condact="conda activate ./.venv"
alias conddact="conda deactivate"

# Virtualenv
alias venvcre="python3 -m venv .venv"
alias venvact="source ./.venv/bin/activate"
alias venvdact="deactivate"

# Copying and pasting yo
alias c="xclip -selection clipboard"
alias v="xclip -o -selection clipboard"

# Password managing
# https://lelutin.ca/posts/Using_password-store_with_an_alternate_directory/
alias zpass='PASSWORD_STORE_DIR=~/.zeus-wachtwoord-winkel pass'

# Programming environements
alias java8="/usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar"
alias nanocl="bundle exec nanoc live"
alias pure="nix-shell --pure"
alias ns="nix-shell"
