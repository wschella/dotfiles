#!/bin/bash

REPO=http://github.com/wschella/dotfiles
DEST="$HOME/.dotfiles"

if [[ -d $DEST ]];then
  cd $DEST && git pull origin master && cd -
else
  echo "cloning repo: $REPO into dir: $DEST"
  git clone $REPO $DEST
fi

echo "Linking dotfiles"

dotfiles=(
  pylintrc
)

basicdotfiles=(
  ssh/config
  gitconfig
  bashrc
  bashrc_default
  bash_aliases
  inputrc
  bash_prompt
)

if [[ $1 == "-e" ]];then
  for dotfile in ${dotfiles[@]}; do
    echo "Linking $dotfile"
    ln -sfn $DEST/$dotfile $HOME/.$dotfile
  done
else
  for dotfile in ${basicdotfiles[@]}; do
    echo "Linking $dotfile"
    ln -sfn $DEST/$dotfile $HOME/.$dotfile
  done
fi
