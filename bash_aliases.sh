alias python="python3"

alias fuck="sudo $(fc -ln -1)"

alias please="sudo $(fc -ln -1)"

alias latexwatch="latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pvc -pdf"

alias ls="ls -ahGl --color=auto"

alias nanocl="bundle exec nanoc live"

alias rebash="dotter -d ~/.dotfiles deploy && bash"

alias gti="git"
alias g="git"

alias coqide='export OPAMROOT=~/opam-coq.8.8.1; eval $(opam config env); coqide&
'

alias c="xclip -selection clipboard"
alias v="xclip -o -selection clipboard"

# https://lelutin.ca/posts/Using_password-store_with_an_alternate_directory/
alias zpass='PASSWORD_STORE_DIR=~/.zeus-wachtwoord-winkel pass'

alias java8="/usr/lib/jvm/java-8-openjdk-amd64/bin/java -jar"

# Project CompBio
alias smap="python3 ./meta/smap.py"