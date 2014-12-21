# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit


#Settings
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
bindkey -e
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export EDITOR=vim
export XDG_CONFIG_HOME="/home/wout/.config"

#colors
autoload colors && colors

#oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
source $ZSH/oh-my-zsh.sh
plugins=(command-not-found)


#alias
alias ls='ls -G'
alias please='sudo $(fc -ln -1)'
alias pingering='ping -c 3 www.google.com'
alias pacman='sudo pacman'
alias google-chrome-stable='nohup google-chrome-stable&| exit'
alias firefox='nohup firefox&| exit'
alias LELS='ls'
alias comp='cd /home/wout/Documents/UGent/ComputerGebruik'

#prompt
setopt prompt_subst
PROMPT='[%T]%{$fg[cyan]%} %n@%m %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} %(?.✔.✗) '

#conf shortcutfunctie
conf() {
    case $1 in
          xmonad)   vim ~/.xmonad/xmonad.hs ;;
          bspwm)    vim ~/.config/bspwm/bspwmrc ;;
          sxhkd)    vim ~/.config/sxhkd/sxhkdrc ;;
          conky)    vim ~/.xmonad/.conky_dzen ;;
          homepage) olddir=$(pwd) && cd ~/scripts/homepage.py && vim homepage.py && ./homepage.py; cd $olddir ;;
          menu)   vim ~/scripts/menu ;;
          mpd)    vim ~/.mpdconf ;;
          mutt)   vim ~/.mutt/acct/wei001 ;;
          ncmpcpp)  vim ~/.ncmpcpp/config ;;
          pacman)   svim /etc/pacman.conf ;;
          ranger)   vim ~/.config/ranger/rc.conf ;;
          rifle)    vim ~/.config/ranger/rifle.conf ;;
          tmux)   vim ~/.tmux.conf ;;
          vim)    vim ~/.dotfiles/vimrc ;;
          xinit)    vim ~/.dotfiles/xinitrc ;;
          xresources) vim ~/.dotfiles/Xresources && xrdb ~/.Xresources ;;
          zathura)  vim ~/.config/zathura/zathurarc ;;
          theme2)   vim ~/.themes/FlatStudioCustom/gtk-2.0/gtkrc ;;
          theme3)   vim ~/.themes/FlatStudioCustom/gtk-3.0/gtk.css ;;
          gtk2)   vim ~/.gtkrc-2.0 ;;
          gtk3)   vim ~/.config/gtk-3.0/settings.ini ;;
          tint2)    vim ~/.config/tint2/xmonad.tint2rc ;;
          zsh)    vim ~/.dotfiles/zshrc ;;
          hosts)    sudoedit /etc/hosts ;;
          vhosts)   sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
          httpd)    sudoedit /etc/httpd/conf/httpd.conf ;;
          *)      echo "Unknown application: $1" ;;
  esac
}


