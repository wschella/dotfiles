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

#alias
alias ls='ls -G'
alias please='sudo $(fc -ln -1)'
alias pingering='ping -c 3 www.google.com'
alias upingering='ping -c 3 www.ugent.be'
alias pacman='sudo pacman'
alias google-chrome-stable='nohup google-chrome-stable&| exit'
alias firefox='nohup firefox&| exit'
alias LELS='ls'
alias comp='cd /home/wout/Documents/UGent/ComputerGebruik'

#prompt
setopt prompt_subst
PROMPT='[%T]%{$fg[cyan]%} %n@%m %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} %(?.✔.✗) '

#Config shortcuts
conf() {
    case $1 in
          bspwm)    vim ~/.config/bspwm/bspwmrc ;;
          sxhkd)    vim ~/.config/sxhkd/sxhkdrc ;;
          pacman)   svim /etc/pacman.conf ;;
          ranger)   vim ~/.config/ranger/rc.conf ;;
          rifle)    vim ~/.config/ranger/rifle.conf ;;
          tmux)     vim ~/.tmux.conf ;;
          vim)      vim ~/.dotfiles/vimrc ;;
          xinit)    vim ~/.dotfiles/xinitrc ;;
          xresources) vim ~/.dotfiles/Xresources && xrdb ~/.Xresources ;;
          zathura)  vim ~/.config/zathura/zathurarc ;;
          gtk2)   vim ~/.gtkrc-2.0 ;;
          gtk3)   vim ~/.config/gtk-3.0/settings.ini ;;
          zsh)    vim ~/.dotfiles/zshrc ;;
          *)      echo "Unknown application: $1" ;;
  esac
}


