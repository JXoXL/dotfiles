case $- in
    *i*) ;;
      *) return;;
esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
HISTSIZE=5000
HISTFILESIZE=10000

shopt -s histappend
shopt -s checkwinsize

PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;208m\]\u\[$(tput sgr0)\]【=◈ ◡ ◈ =】\[$(tput sgr0)\]\[\033[38;5;87m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;216m\]\w\[$(tput sgr0)\]\$ '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

bind 'set show-all-if-ambiguous on'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# PATHS
export PATH="~/.ebcli-virtual-env/executables:$PATH"
export PATH=~/.pyenv/versions/3.7.2/bin:$PATH

# EXPORTS
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-vcs -g "!{node_modules,.git,.idea,target,dist,out-tsc}"'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GRAALVM_HOME=$HOME/Tools/graalvm/
export VISUAL=vim
export EDITOR="$VISUAL"
export NPM_PACKAGES="${HOME}/.npm-packages"
export JAVA_HOME="/usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/"
#export JAVA_HOME="/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/"


# ALIASES
# Software overrides
alias python=python3.8
alias vim="nvim"
#
# I forget about how to do stuff aliases
alias filesize="du -sh"
alias whoisusingports="sudo lsof -i -P -n | grep LISTEN"
#
# Git aliases
alias prettylog="git log --graph --decorate --oneline"
alias whathaveibeenupto="git log --author=\"$(git config user.email)\" --pretty=format:\"%C(magenta)%an%Creset %C(green)%<(20)%ar%Creset  %C(blue) %s %Creset\" --no-merges"
#
# Dev aliases
alias devserver="npx @web/dev-server --node-resolve --watch --open"
# I'm a lazy shit aliases
alias vimplugins="vim ~/.vim/rcfiles/plugins.vim"
#
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
