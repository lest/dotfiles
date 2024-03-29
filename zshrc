# -*- mode: shell-script -*-

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
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler heroku lein redis-cli)

BUNDLED_COMMANDS=(mina)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct_all

# aliases
alias grep='grep --color=always'
alias less='less -R'
alias pwgen='pwgen -1cnsB'

alias open='reattach-to-user-namespace open'
alias pbcopy='reattach-to-user-namespace pbcopy'
alias pbpaste='reattach-to-user-namespace pbpaste'
alias brew='reattach-to-user-namespace brew'

# editor
export EDITOR='vim'

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

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

if [ -d "$HOME/Library/Android/sdk/platform-tools" ]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
fi

if which keychain > /dev/null; then eval "$(keychain --quiet --noask --eval)"; fi
