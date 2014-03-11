# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler heroku lein redis-cli)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct_all

# aliases
alias grep='grep --color=always'
alias less='less -R'
alias pwgen='pwgen -1cnsB'
alias ack='ack-grep -a'
alias wget='wget --no-check-certificate'

# editor
export EDITOR='vim'

# RVM
# if [ -s $HOME/.rvm/scripts/rvm ]; then
#     . $HOME/.rvm/scripts/rvm
#     rvm rvmrc load
# fi

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init - zsh)"

# rails command
_script_rails() {
  local check_dir=$PWD
  while [ "$(dirname $check_dir)" != "/" ]; do
    if [ -f "$check_dir/bin/rails" ]; then
      "$check_dir/bin/rails" $@
      return
    fi
    if [ -f "$check_dir/script/rails" ]; then
      "$check_dir/script/rails" $@
      return
    fi
    check_dir="$(dirname $check_dir)"
  done
  rails $@
}
alias rails=_script_rails
