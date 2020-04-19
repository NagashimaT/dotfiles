# General
export LANG=ja_JP.UTF-8
export LC_TIME=C
export EDITOR=vim

bindkey -e 
set bell-style none; setopt nobeep; setopt nolistbeep  # No beep
setopt print_eight_bit        # Enable Japanese file name

# History
export HISTFILE=${HOME}/.zsh-history
export HISTSIZE=1000000         # Number of saved history on memory
export SAVEHIST=1000000         # Number of saved history

setopt hist_ignore_dups       # Ignore duplicated history
setopt hist_ignore_space      # Ignore command starts with white spaces
setopt hist_no_store          # Ignore history command
setopt hist_reduce_blanks     # Strip white spaces
setopt share_history          # Share history across multi processes
setopt extended_history       # Save timestamp

# Alias
alias c='clear'
alias t='tmux'
alias vi='vim'
alias le='less'
alias ga='git add'
alias gb='git branch'
alias gl='git log'
alias gch='git checkout'
alias gst='git status'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gpull='git pull'
alias gpush='git push'

#ls
if [ $(uname) = 'Darwin' ]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -alh'
else
  if [ -e ~/.colorrc ]; then
    eval `dircolors ~/.colorrc`
  fi
  alias ls='ls --color=auto'
  alias la='ls -a'
  alias ll='ls -alh'
fi

# peco
if which peco &> /dev/null; then
  function peco-select-history {
    BUFFER=`history -n -r 1 | peco --query "$LBUFFER"`
    CURSOR=$#BUFFER
    zle reset-prompt
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

# diff
if which colordiff &> /dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# less
export LESS='-iMR'

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[alias]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=green,bold
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
fi

# Completion
autoload -Uz compinit && compinit -u

setopt auto_menu              # Toggle complement candidates using TAB
setopt auto_param_slash       # Insert / after a complemented directory name
setopt correct                # Do spell check
setopt list_packed            # Use compackt style candidates viewer mode
setopt list_types             # Show kinds of file using marks
setopt magic_equal_subst      # Even option args are complemented
setopt complete_aliases       # Expand aliases before completing

# Git status
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats "%{${fg_bold[green]}%}[%b]"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# Prompt color
autoload -U colors; colors

PROMPT="${REMOTE_PROMPT}%{${fg_bold[green]}%}%n: %{${fg_bold[green]}%}%c %{${fg_bold[green]}%}%# "
PROMPT2="%{${fg_bold[green]}%} %_ > %{${reset_color}%}"
RPROMPT='${vcs_info_msg_0_}'
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

if [ ${SSH_CLIENT:-undefined} = "undefined" ] && [ ${SSH_CONECTION:-undefined} = "undefined" ]; then
    REMOTE_PROMPT=""
  else
    REMOTE_PROMPT="%F{red}[REMOTE]%f "
fi

# asdf
if [ -e /usr/local/opt/asdf/asdf.sh ]; then
  # Do not use `. $(brew --prefix asdf)/asdf.sh` due to performance issues.
  . /usr/local/opt/asdf/asdf.sh
fi
