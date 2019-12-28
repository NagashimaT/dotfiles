# General
export LANG=ja_JP.UTF-8
export LC_TIME=C
export EDITOR=vim

setopt print_eight_bit        # Enable Japanese file name

set bell-style none; setopt nobeep; setopt nolistbeep  # No beep

# History
export HISTFILE=${HOME}/.zsh-history
export HISTSIZE=10000         # Number of saved history on memory
export SAVEHIST=100000        # Number of saved history

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

#ls
if [ $(uname) = 'Darwin' ]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
  alias la='ls -a'
  alias ll='ls -alhT'
else
  if [ -e ~/.colorrc ]; then
    eval `dircolors ~/.colorrc`
  fi
  alias ls='ls --color=auto'
  alias la='ls -a'
  alias ll='ls -alh'
fi

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# Prompt color
autoload -U colors; colors

PROMPT="%{${fg[cyan]}%}%n: %{${fg[cyan]}%}%c %{${fg[magenta]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[magenta]}%} %_ > %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

#pyenv
if [ -e ~/.pyenv ]; then
  eval "$(pyenv init -)"
fi
