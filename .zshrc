# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
#日本語ファイルを表示可能にする
setopt print_eight_bit
#タブ間でhistoryを共有
setopt share_history
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#補完
autoload -U compinit; compinit
# プロンプトに色を付ける
autoload -U colors; colors
# プロンプト
PROMPT="%{${fg[cyan]}%}%n: %{${fg[cyan]}%}%c %{${fg[magenta]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[yellow]}%} %_ > %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"

#エイリアス
alias note='jupyter notebook'

# Python関係
eval "$(pyenv init -)"
export PYTHONDONTWRITEBYTECODE=TRUE

