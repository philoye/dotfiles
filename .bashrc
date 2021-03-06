export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Android Tools on the Path:
export PATH="/Applications/android-sdk/tools:$PATH"

export ARCHFLAGS="-arch x86_64"
export EDITOR="mvim -f"
export VISUAL='mvim -f'
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Color is good
# http://www.geekology.co.za/blog/2009/04/enabling-bash-terminal-directory-file-color-highlighting-mac-os-x/
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Window title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}"; echo -ne "\007"'

# fuck that you have new mail shit
unset MAILCHECK

#aliases
alias ..="cd .."
alias ...="cd ..; cd .."
alias l="ls -lpF"
alias la="ls -apF"
alias ll="ls -lapFh"
alias bb="bbedit"
alias m="mate"
alias v="mvim"
alias c="clear"
alias gx="gitx --all"
alias serve="python -m SimpleHTTPServer"
alias pg="pg_ctl -D /usr/local/var/postgres"
alias rr="touch tmp/restart.txt"
alias be="bundle exec"
alias bake="bundle exec rake"
alias ti="$HOME/Library/Application\ Support/Titanium/mobilesdk/osx/1.7.1/iphone/builder.py"
alias rails="bundle exec rails"
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias fixairplay="sudo pkill coreaudiod"

# mvimf is a bash script: /Users/philoye/bin/mvim -f "$@"
alias crone="EDITOR=/usr/local/bin/mvimf crontab -e"

# My hack of Lachlan's hacked together prompt from:
# http://blogs.atlassian.com/developer/2009/03/gitting-dirty.html
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "[*]"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
export PS1='\h \[\033[0;36m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ];
then echo "\[\033[0;33m\]$(parse_git_branch)"; fi) \[\033[0;36m\]\$ \[\033[00m\]'

# Now you don't have to require 'rubygems'
#export RUBYOPT=rubygems

# Source the shell environment variables
test -r ~/.shenv &&
      . ~/.shenv

# chruby
RUBIES=(/Users/philoye/.rubies/rub*)
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
