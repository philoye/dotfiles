# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="cloud"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(history history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"
export ARCHFLAGS="-arch x86_64"
export EDITOR="mvim -f"
export VISUAL='mvim -f'
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export BUNDLE_JOBS=3 # number of cores minus 1

# Source the shell environment variables
test -r ~/.shenv &&
      . ~/.shenv

alias v='mvim '
alias m='mate'
alias zshconfig="v ~/.zshrc"
alias reload='source ~/.zshrc'

alias ..="cd .."
alias ...="cd ..; cd .."
alias l="ls -lpF"
alias la="ls -apF"
alias ll="ls -lApFh"

alias pubkey="cat ~/.ssh/*.pub |pbcopy && echo 'Keys copied to clipboard'"
alias pg="pg_ctl -D /usr/local/var/postgres"
alias pgstart="echo 'running \"brew services start postgresql\"' && brew services start postgresql"
alias pgstop="echo 'running \"brew services stop postgresql\"' && brew services stop postgresql"
alias fixairplay="sudo pkill coreaudiod"

alias bs="bundle exec rerun --background --dir app,db,lib --pattern '{**/*.rb}' -- bundle exec sidekiq --verbose"

# shortcut to code directories, with tab-complete
c() { cd ~/Dropbox\ \(Personal\)/code/$1; }
compctl -W ~/Dropbox\ \(Personal\)/code/ -/ c

# shortcut to code directories, with tab-complete
co() { cd ~/Code/$1; }
compctl -W ~/Code/ -/ co

# start a webserver
serve() {
  python -m SimpleHTTPServer ${1:-8000}
}
servephp() {
  php -S localhost:${1:-8000}
}

function syntaxhighlight() {
  if [ -z "$1" ]
    then
      echo "Syntax highlights whatever is in the clipboard.\n"
      echo "Usage: syntaxhighlight [language]"
  else
    pbpaste | highlight -O rtf --syntax $1 --font Menlo --style moria --font-size 18 | pbcopy
    echo "Highlighted $1 copied to clipboard"
  fi
}

# git
alias gst='git status'
alias gco='git checkout'
alias gb='git branch -a'
alias gr='git reset --soft HEAD'
alias gx="gitx --all"
alias cg='cd $(git root)'

# ruby/rails
alias be='bundle exec'

# chruby
RUBIES=(~/.rubies/rub*)
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
if [[ -f ~/.ruby-version ]]; then
  chruby $(cat ~/.ruby-version)
fi

PROMPT='%{$fg_bold[green]%}%~ %{$fg_bold[cyan]%}$(git_prompt_info) %{$fg_bold[cyan]%} ➔ %{$reset_color%}'
RPROMPT='%{$fg_bold[red]%}`ruby -e "puts \"ruby-#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}\""`%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}] ✓"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
