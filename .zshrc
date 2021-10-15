# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

source ~/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git laravel5 composer pip python sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias mv="mv -iv"
# alias cp="cp -aiv"
# alias rm="rm -riv"
# alias md="mkdir -pv"
# alias ga="git add -A"
# alias gs="git status"
# alias tree="tree -a -I .git"
# alias cmaf="find * -type f -print0 | xargs -0 chmod 644"
# alias cmad="find * -type d -print0 | xargs -0 chmod 755"
# alias namefix="php -r '\$e=\$argv[1]; \$d=urldecode(\$e); if(!file_exists(\$d)) rename(\$e,\$d);'"
# function mid() {
  if [[ $# -eq 1 ]]; then
    sed -n '1,10p; 11q' $1
  elif [[ $# -eq 2 ]]; then
    sed -n "$2,$(($2+9))p; $(($2+10))q" $1
  elif [[ $# -eq 3 ]]; then
    sed -n "$2,$(($2+$3-1))p; $(($2+$3))q" $1
  else
    return 1
  fi
}

# Used by agnoster theme
DEFAULT_USER="papa"

# Auto load zsh-autosuggestions
source /Users/papa/.zsh-autosuggestions/zsh-autosuggestions.zsh

# Auto load zsh-syntax-highlighting
source /Users/papa/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Need this to run gpg
export GPG_TTY=$(tty)

# Add pyenv init to your shell to enable shims and autocompletion.
# Please make sure `eval "$(pyenv init -)"` is placed toward the end of the shell configuration file
# since it manipulates `PATH` during the initialization.
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
