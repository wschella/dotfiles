# The following lines were added by compinstall
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
bindkey -e
# End of lines configured by zsh-newuser-install
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

autoload colors
colors

#alias
alias ls='ls -G'
alias please='eval "sudo $(fc -ln -1)"'
alias pacman='sudo pacman'

setopt prompt_subst
PROMPT='[%T]%{$fg[red]%} %n@%m %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} %(?.✔.✗) '
export EDITOR=vim

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
          vim)    vim ~/.vimrc ;;
          xinit)    vim ~/.xinitrc ;;
          xresources) vim ~/.Xresources && xrdb ~/.Xresources ;;
          zathura)  vim ~/.config/zathura/zathurarc ;;
          theme2)   vim ~/.themes/FlatStudioCustom/gtk-2.0/gtkrc ;;
          theme3)   vim ~/.themes/FlatStudioCustom/gtk-3.0/gtk.css ;;
          gtk2)   vim ~/.gtkrc-2.0 ;;
          gtk3)   vim ~/.config/gtk-3.0/settings.ini ;;
          tint2)    vim ~/.config/tint2/xmonad.tint2rc ;;
          zsh)    vim ~/.zshrc && source ~/.zshrc ;;
          hosts)    sudoedit /etc/hosts ;;
          vhosts)   sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
          httpd)    sudoedit /etc/httpd/conf/httpd.conf ;;
          *)      echo "Unknown application: $1" ;;
  esac
}


