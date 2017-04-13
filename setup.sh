#!/usr/bin/bash

REPO=http://github.com/SirDestrox/dotfiles
DEST="$HOME/.dotfiles"

if [[ -d $DEST ]];then
  cd $DEST && git pull origin master && cd -
else
  echo "cloning repo: $REPO into dir: $DEST"
  git clone $REPO $DEST
fi

echo "Linking dotfiles"

dotfiles=(
)

basicdotfiles=(
)

if [ $1 == "-e" ];then
  for dotfile in ${dotfiles[@]}; do
	  ln -sfn $DEST/$dotfile $HOME/.$dotfile
  done
else
  for dotfile in ${basicdotfiles[@]}; do
    ln -sfn $DEST/$dotfile $HOME/.$dotfile
  done
fi
