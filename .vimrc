set nocompatible

"==========================
" Start Neobundle Settings.
"==========================
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"***********************
" Neobundle List
"***********************
" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'

" 括弧を入力した際、自動的にとじ括弧を挿入
NeoBundle 'Townk/vim-autoclose'

" 「さっき開いてたあれ、もう1回みたいなー」っていう過去のファイルを開きたいとき
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {
 \ 'depends' : 'Shougo/unite.vim'
 \ }

" 入力時に文字を自動補完
" NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'

" ヤンク履歴を保持
NeoBundle 'LeafCage/yankround.vim'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

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

"***********************
" End
"***********************

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
"==========================
" End Neobundle Settings.
"==========================


"--------------------------
" Detail Settings
"--------------------------

"*** [start] unite.vim ***
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
" ファイル一覧
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
" 最近使ったファイルの一覧
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
"nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを横に分割して開く
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q

"noremap <C-U><C-F> :Unite -buffer-name=file file<CR> " ファイル一覧
"noremap <C-U><C-R> :Unite file_mru<CR> " 最近使ったファイル一覧
"au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split') " ウィンドウを分割して開く
"au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"---
"1. +:ファイルの閲覧履歴を表示
"2. i:インサートモードに変更
"3. 検索ワードを入力
"4. 対象のファイルパス上でctr+i
"*** [end] ***

"*** [start] neocomplcache.vim ***
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
" 補完ウィンドウの設定
set completeopt=menuone
" 補完ウィンドウの設定
set completeopt=menuone
" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
" " let g:rsenseHome = '/usr/local/lib/rsense-0.3'
" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"*** [end] ***

"*** [start] yankround.vim ***
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
"*** [end] ***

"*** [start] vim-fugitive ***
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
"*** [end] ***

"*** [start] vim-indent-guides ***
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup = 1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level = 2
" ガイドの幅
let g:indent_guides_guide_size = 1
" 自動カラー無効
let g:indent_guides_auto_colors=0
" Required: カラースキーマ
colorscheme default
" 奇数番目のインデントの色
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
"*** [end] ***

"*** [start] ctags ***
let g:auto_ctags = 1
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" unite-tagsの設定
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif
"*** [end] ***


"==========================
" Various Settings.
"==========================
" 画面表示の設定
set number         " 行番号を表示する
set cursorline     " カーソル行にラインを表示する
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set laststatus=2   " ステータス行を常に表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータス行に表示させる情報の指定
" set statusline+=%{fugitive#statusline()} " ステータス行に現在のgitブランチを表示する
" set cursorcolumn   " カーソル位置の縦ラインの背景色を変える
" set list           " 不可視文字を表示
" " 不可視文字の表示記号指定
" set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

" カーソル移動関連の設定
" set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
" set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
" set scrolloff=8                " 上下8行の視界を確保
" set sidescrolloff=16           " 左右スクロール時の視界を確保
" set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定
" set expandtab     " タブ入力を複数の空白入力に置き換える
" set tabstop=2     " 画面上でタブ文字が占める幅
" set shiftwidth=2  " 自動インデントでずれる幅
" set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
" set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定
" set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しでYank, Put 出来るようにする
" set mouse=a                       " マウスの入力を受け付ける
" set shellslash                    " Windows でもパスの区切り文字を /にする
" set iminsert=2                    " インサートモードから抜けると自動的にIMEをオフにする

" コマンドラインの設定
" set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
" set history=1000                        " コマンドラインの履歴を1000件保存する

" ビープの設定
" set visualbell t_vb=                   "ビープ音すべてを無効にする
" set noerrorbells                       "エラーメッセージの表示時にビープを鳴らさない

inoremap <silent> jj <ESC>  " jjでエスケープ
cnoremap tree NERDTree  " NERDTree を開く

" Rails viewタグ挿入
"inoremap <C-p> <lt>p><lt>/p><Left><Left><Left><Left>
inoremap <C-p> <lt>%=  %><Left><Left><Left>
inoremap <C-e> <lt>% end %>

" autoindent有効時にコード貼り付けでインデントがぐっちゃぐちゃになるのを防ぐ
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>

"==========================
" 全角スペースの表示
"==========================
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

"==========================
" 挿入モード時、ステータスラインの色を変更
"==========================
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction
