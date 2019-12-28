set shell=/bin/zsh
syntax on
colorscheme molokai

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

" キーバインド
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" visulaモードでインデント調整後に選択範囲を開放しない
vnoremap > >gv
vnoremap < <gv

" その他
set clipboard=unnamed,unnameplus
set mouse=a
