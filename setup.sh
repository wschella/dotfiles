#!/usr/bin/bash

REPO=http://github.com/SirDestrox/dotfiles
DEST="$HOME/.dotfiles"

if [[ -d $DEST ]];then
  cd $DEST && git pull origin master && cd -
else
  echo "cloning repo: $REPO into dir: $DEST"
  git clone $REPO $DEST
fi

echo "Setting up Vundle"
if [[ -d $HOME/.vim/bundle/vundle ]]; then
  echo "Vundle already installed"
else
  git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "Creating tmp dirs in .vim"
mkdir -p $HOME/.vim/tmp/{backup,swap}

echo "Linking dotfiles"
dotfiles=(
	zshrc
	bashrc
	vimrc
	gitconfig
  xinitrc
  Xresources
  profile
)
for dotfile in ${dotfiles[@]}; do
	ln -sfn $DEST/$dotfile $HOME/.$dotfile
done

echo "updating Bundles"
vim +BundleInstall! +qall

