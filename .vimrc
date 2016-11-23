"==========================
" Start Neobundle Settings.
"==========================
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  " bundleで管理するディレクトリを指定
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'


"----- Necbundle List -----

" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'Shougo/neocomplcache-rsense.vim'

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" 既存のコマンドを独自のものに置き換える
NeoBundle 'tyru/vim-altercmd' " フォーク版

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" ctags自動更新
NeoBundle 'soramugi/auto-ctags.vim'

" vim に非同期処理を提供してくれる縁の下の力持ち多数のプラグインがこいつを頼りに高速化
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

"----- /Necbundle List -----


call neobundle#end()

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck
"==========================
" End Neobundle Settings.
"==========================

" -------------------------
" Rsense
" -------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" -------------------------
" neocomplete.vim
" -------------------------
let g:acp_enableAtStartup = 0                                 " AutoComplPopを無効にする
let g:neocomplete#enable_at_startup = 1                       " neocompleteを有効にする
let g:neocomplete#enable_smart_case = 1                       " smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_auto_select = 1                      " 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplete#min_keyword_length = 3                      " 3文字以上の単語に対して補完を有効にする
let g:neocomplete#enable_auto_delimiter = 1                   " 区切り文字まで補完する
let g:neocomplete#auto_completion_start_length = 2            " 2文字目の入力から補完のポップアップを表示
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"      " 補完候補をTABで選択（進む）
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"  " 補完候補をTABで選択（戻る）
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" -------------------------
" rubocop
" -------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

"--------------------------
" ctags
"--------------------------
let g:auto_ctags = 1
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" unite-tagsの設定
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif


"==========================
" Start Base Settings.
"==========================
set encoding=utf-8            " vim内部で使われる文字エンコーディングをutf-8に設定する
set fileformats=unix,dos,mac  " 想定される改行コードの指定する
syntax enable                 " ハイライトを有効化する

inoremap <silent> jj <ESC>    " jjでエスケープ
cnoremap tree NERDTree        " NERDTree を開く

" 画面表示の設定
set number                    " 行番号を表示する
set cursorline                " カーソル行にラインを表示する
set cmdheight=2               " メッセージ表示欄を2行確保
set showmatch                 " 対応する括弧を強調表示
set laststatus=2              " ステータス行を常に表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータス行に表示させる情報の指定

" ファイル処理関連の設定
set confirm                   " 保存されていないファイルがあるときは終了前に保存確認
set hidden                    " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread                  " 外部でファイルに変更がされた場合は読みなおす
set nobackup                  " ファイル保存時にバックアップファイルを作らない
set noswapfile                " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定
set hlsearch                  " 検索文字列をハイライトする
set incsearch                 " インクリメンタルサーチを行う
set ignorecase                " 大文字と小文字を区別しない
set smartcase                 " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan                  " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault                  " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定
set expandtab                 " 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set autoindent                " 新しい行を開始したとき、新しい行のインデントを現在行と同じにする

" Rails viewタグ挿入
inoremap <C-p> <lt>%=  %><Left><Left><Left>
inoremap <C-e> <lt>% end %>

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

" vim-rails用のキーバインディング
call altercmd#load() " コマンド設定より前に書く
autocmd User Rails AlterCommand s S
autocmd User Rails AlterCommand sc Scontroller  " 画面を横分割して関連するcontrollerファイルを開く
autocmd User Rails AlterCommand sm Smodel       " 画面を横分割して関連するmodelファイルを開く
autocmd User Rails AlterCommand sv Sview        " 画面を横分割して関連するviewファイルを開く
autocmd User Rails AlterCommand v V
autocmd User Rails AlterCommand vc Vcontroller  " 画面を縦分割して関連するcontrollerファイルを開く
autocmd User Rails AlterCommand vm Vmodel       " 画面を縦分割して関連するmodelファイルを開く
autocmd User Rails AlterCommand vv Vview        " 画面を縦分割して関連するviewファイルを開く
"==========================
" End Base Settings.
"==========================

"---------------------------------------------------
" クリップボードからペーストする時だけインデントしないようにする
"---------------------------------------------------
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"---------------------------------------------------
" 前回のカーソル位置を復元
"---------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
