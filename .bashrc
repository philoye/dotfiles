export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"

export ARCHFLAGS="-arch x86_64"
export EDITOR="mate -w"
export LC_CTYPE=en_US.UTF-8

# Color is good
# http://www.geekology.co.za/blog/2009/04/enabling-bash-terminal-directory-file-color-highlighting-mac-os-x/
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad

# Window title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}"; echo -ne "\007"'

#aliases
alias ..="cd .."
alias ...="cd ..; cd .."
alias l="ls -l"
alias la="ls -a"
alias ll="ls -la"
alias bb="bbedit"
alias m="mate"
alias c="clear"
alias ra="touch tmp/restart.txt"
alias gx="gitx --all"
alias serve="python -m SimpleHTTPServer"
alias gs="git st"
alias pg="pg_ctl -D /usr/local/var/postgres"
alias ss="script/server"

# My hack of Lachlan's hacked together prompt from:
# http://blogs.atlassian.com/developer/2009/03/gitting-dirty.html
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "[*]"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
export PS1='\h \[\033[0;36m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ]; 
then echo "\[\033[0;33m\]$(parse_git_branch)"; fi) \[\033[0;36m\]\$ \[\033[00m\]'

# Now you don't have to require 'rubygems'
export RUBYOPT=rubygems

# Source if the shell environment variables
test -r ~/.shenv &&
. ~/.shenv

# Ruby Version Manager
if [[ -s /Users/philoye/.rvm/scripts/rvm ]] ; then source /Users/philoye/.rvm/scripts/rvm ; fi