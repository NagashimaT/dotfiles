set shell=/bin/zsh

" 文字コード
set encoding=utf8
scriptencoding utf8
set fileencoding=utf-8
set termencoding=utf8
set fileencodings=utf-8,ucs-boms,euc-jp,ep932
set fileformats=unix,dos,mac
set ambiwidth=double
set nobomb
set t_Co=256

" インデント
set expandtab                      " タブ入力を複数のスペースに置換(ソフトタブ)
set tabstop=4                      " タブ文字の表示幅
set smartindent                    " 自動インデント
set shiftwidth=4                   " 自動インデントの幅

" UI
set number                         " 行番号を表示
set title                          " タイトルを表示
set ruler                          " 現在のカーソル位置を表示
set showmatch                      " 対応する括弧を強調表示
set vb t_vb=                       " ビープ音を消す
set whichwrap=b,s,h,l,<,>,[,]      " カーソルを行をまたいで移動
set backspace=indent,eol,start     " バックスペースの削除拡張

" 検索
set ignorecase                     " 検索時に大文字小文字を区別しない
set smartcase                      " 大文字が含まれる場合は大文字小文字を区別する
set wrapscan                       " 検索がファイル末尾まで進んだら先頭に戻る
set incsearch                      " インクリメンタルサーチ
set hlsearch                       " 検索結果をハイライト表示
nnoremap <Esc><Esc> :nohlsearch<CR><ESC> 


" キーバインド -----------------------------------------------
"emacs
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" バッファ
nnoremap <silent> , :bprev<CR>
nnoremap <silent> . :bnext<CR>
nnoremap bd :bd<CR>

" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" ------------------------------------------------------------


" plugin manager ---------------------------------------------
if &compatible
  set nocompatible
endif

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundles')

" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" tomlセット
let s:toml_dir=expand('~/.dein/')
let s:toml=s:toml_dir . 'dein.toml'
let s:toml_lazy=s:toml_dir . 'dein-lazy.toml'

" プラグインのロード
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml)
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" インストールしていないプラグインがあればインストールを実行
if dein#check_install()
  call dein#install()
endif

" ------------------------------------------------------------


" その他
set clipboard=unnamed,unnameplus
set mouse=a

syntax on
colorscheme molokai

