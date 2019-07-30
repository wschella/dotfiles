# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source by https://github.com/mitsuhiko/dotfiles/blob/master/bash/bashrc

__DEFAULT_COLOR="[00m"
__GRAY_COLOR="[37m"
__PINK_COLOR="[35m"
__GREEN_COLOR="[32m"
__ORANGE_COLOR="[33m"
__RED_COLOR="[31m"
__BLUE_COLOR="[34m"

# If user id is zero (you are root, color brightly)
if [ `id -u` == '0' ]; then
  __USER_COLOR=$__RED_COLOR
else
  __USER_COLOR=$__PINK_COLOR
fi

# https://github.com/sscherfke/rust-vcprompt
export VCP_PREFIX=""
export VCP_NAME=""  # You can use "value" or "symbol" here
export VCP_BRANCH="{blue}{value}{reset}"
export VCP_OPERATION="{red}{value}{reset}"
export VCP_BEHIND="↓{value}"
export VCP_AHEAD="↑{value}"
export VCP_SEPARATOR=" "
export VCP_STAGED="{red}●{value}"
export VCP_CONFLICTS="{red}✖{value}"
export VCP_CHANGED="{blue}✚{value}"
export VCP_UNTRACKED="{reset}…{value}"
export VCP_CLEAN="{green}{bold}✔"
export VCP_SUFFIX="{reset}"
__VC_PROMPT=$' on \033[34m%n\033[00m:\033[00m%[unknown]b\033[32m'
__VC_PROMPT_EX="$__VC_PROMPT%m%u"
if hash vcprompt 2> /dev/null; then
  __HAVE_VCPROMPT=1
else
  __HAVE_VCPROMPT=0
fi

wschellas_stashed_git() {
  local num_stashed=0
  num_stashed="$(git stash list | wc --line)"
  if [ $num_stashed != 0 ]; then
    echo -n "$num_stashed⚑"
  fi
}

mitsuhikos_vcprompt() {
  path=`pwd`
  prompt="$__VC_PROMPT_EX"
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  if [ $__HAVE_VCPROMPT == 1 ] && [ "$inside_git_repo" ]; then
    echo -n "on $(vcprompt $prompt) `wschellas_stashed_git`"
  fi
}

mitsuhikos_lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37m exited \033[31m'
    echo -n $code
    echo -n $'\033[37m'
  fi
}

mitsuhikos_backgroundjobs() {
  jobs|python -c 'if 1:
    import sys
    items = ["\033[36m%s\033[37m" % x.split()[2]
             for x in sys.stdin.read().splitlines()]
    if items:
      if len(items) > 2:
        string = "%s, and %s" % (", ".join(items[:-1]), items[-1])
      else:
        string = ", ".join(items)
      print("\033[37m running %s" % string)
  '
}

mitsuhikos_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    if [[ $VIRTUAL_ENV == *.virtualenvs/* ]]; then
      ENV_NAME=`basename "${VIRTUAL_ENV}"`
    else
      folder=`dirname "${VIRTUAL_ENV}"`
      ENV_NAME=`basename "$folder"`
    fi
    echo -n $' \033[37mworkon \033[31m'
    echo -n $ENV_NAME
    echo -n $'\033[00m'
    # Shell title
    echo -n $'\033]0;venv:'
    echo -n $ENV_NAME
    echo -n $'\007'
  fi

  # Also setup our readline properly constantly since
  # stuff tends to overwrite this.
  stty werase undef
  bind '"\C-w": unix-filename-rubout'
}

export __BASEPROMPT='\e]0;\007\n\e${__USER_COLOR}\u \
\e${__GRAY_COLOR}at \e${__ORANGE_COLOR}\h \
\e${__GRAY_COLOR}in \e${__GREEN_COLOR}\w\
`mitsuhikos_lastcommandfailed`\
\e${__GRAY_COLOR} `mitsuhikos_vcprompt`\
`mitsuhikos_backgroundjobs`\
`mitsuhikos_virtualenv`\
\e${__DEFAULT_COLOR}'
export PS1="\[\033[G\]${__BASEPROMPT}
$ "