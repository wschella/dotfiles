# Utilities
alias fuck="sudo $(fc -ln -1)"
alias please="sudo $(fc -ln -1)"
alias l="ls -ahGl --color=auto"

alias sshpub="cat ~/.ssh/id_rsa.pub | c"

alias latexwatch="latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pvc -pdf"

alias redotter="(cd ~/.dotfiles/ && dotter deploy)"
alias rebash="redotter  && source ~/.bashrc"
alias rehome="rebash && home-manager switch"
alias renix="nixos-rebuild switch"

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
alias condcre="conda env create --prefix .env -f environment.yml"
alias condupt="conda env update --prefix ./env --file environment.yml  --prune"
alias condact="conda activate ./.env"
alias conddact="conda deactivate"

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