filetype plugin indent on

let g:home = expand('~')
let g:python_home = g:home . '/.pyenv/shims'
let g:python_host_prog = g:python_home . '/python2'
let g:python3_host_prog = g:python_home . '/python3'

"------------------------------------------------------------
"検索関係
"------------------------------------------------------------
"{{{
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
" 検索結果をハイライト表示
set hlsearch
" 逐次検索をオン
set incsearch
" Kでカーソル下の単語のhelpを引く
set keywordprg=:help
"}}}


"------------------------------------------------------------
"編集関係
"------------------------------------------------------------
"{{{
" タブ設定
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" オートインデント
set autoindent
" :make時に自動保存
set autowrite
" オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする。
set backspace=indent,eol,start
" 検索時にファイルの下まで行ったら上まで戻る
set wrapscan
" 閉じ括弧入力時に対応している括弧が画面内にある場合に、一瞬開き括弧にジャンプ
set showmatch
" 対応括弧のハイライト表示を0.1秒に
set matchtime=1
" コマンドライン補完を便利に
set wildmenu
" テキスト挿入の自動折り返しに日本語を対応
set formatoptions+=mM
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm
" ビジュアルモードで文字の無いところにもカーソル移動を可能に
set virtualedit=block
" キーコードはすぐにタイムアウト
set notimeout
" マッピングは200ms待つ
set ttimeout ttimeoutlen=200
" スワップファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nobackup
" undoファイルを作らない
set noundofile
" ローカルカレントディレクトリを自動移動
set autochdir
" バッファ変更時に保存していない場合に確認しない
set hidden
" 対応括弧を追加
set matchpairs& matchpairs+=<:>
" スペルチェック時に日本語を除外
set spelllang=en,cjk
" ファイルを開いた時に，カーソル位置を最後にカーソルがあった位置まで移動
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"}}}

"------------------------------------------------------------
"表示関係
"------------------------------------------------------------
"{{{
" 行番号を表示
set number
set nolist
" マルチバイト文字の表示をいいかんじに
set ambiwidth=double
" 折り返し
set wrap
" 長い行も表示
set display=lastline
" ステータスラインを常に表示する
set laststatus=2
" コマンドラインの高さを2行に
set cmdheight=2
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" タイトル表示
set title
" ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set visualbell
" ビジュアルベルも無効化する
set t_vb=
" フォールディング設定
set foldmethod=marker
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" カーソルが内行の内容を隠蔽しない
set conceallevel=0
" 補完メニューの幅
set pumheight=15
" 補完時の表示オプション
set completeopt=menu
" True color
set termguicolors
" popup window の opacity
set pumblend=20

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
"}}}


" Color
set t_Co=256
syntax enable
set background=dark

"color schemes with plugin
" colorscheme iceberg
" colorscheme PaperColor

let mapleader = "\<Space>"

" Yの動作をDやCと同じにする
map Y y$
" <ESC>2回で検索後の強調表示を解除する
nnoremap <ESC><ESC> :nohl<CR><C-L>
" j k を表示行移動できるよう変更
nnoremap j gj
nnoremap k gk
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" .vimrcを開く
nnoremap ,ev :tabe $HOME/.vimrc<CR>
" .vimrcを再読み込み
nnoremap ,rv :source $HOME/.vimrc<CR>
" ヤンクした文字列でカーソル位置の単語を置換
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" systemのレジスタとヤンクを共有する場合はこっち
nnoremap <silent> <leader>y "*yy
nnoremap <silent> <leader>p "*p
vnoremap <silent> <leader>y "*y

" ウィンドウ幅の変更
nnoremap + 5<C-W>+
nnoremap _ 5<C-W>-
nnoremap > 5<C-W>>
nnoremap < 5<C-W><
" ウィンドウ移動に使用するのでsの元の機能を削除(ci)
nnoremap s <Nop>
" s + hjkl でウィンドウ間を移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
" ウィンドウそのものを移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" 次のタブに移動
nnoremap sn  :tabn<CR>
" 前のタブに移動
nnoremap sp  :tabp<CR>
" タブの作成
nnoremap st :<C-u>tabnew<CR>

" quickfix
map <C-N> :cnext<CR>
map <C-M> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" ビジュアルモードでインデント変更後に再選択
vnoremap <  <gv
vnoremap >  >gv
" インサートモード中でも隣のウィンドウに移動
inoremap <C-W><C-W> <ESC><C-W><C-W><ESC>

function! SplitTerminalFunc()
	:sp
	:wincmd j
	:resize 5
	:terminal
	:startinsert
endfunction

" 上下分割して、ターミナルを起動
command! Splitterminal :call SplitTerminalFunc()
" ESCでターミナルモードから抜ける
tnoremap <silent> <ESC> <C-\><C-n>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Shift + F で自動修正
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

"ファイルタイプに関係する設定
augroup filetypeds
	autocmd!
	autocmd BufNewFile,BufRead,BufReadPre *.{md,mkd,mark*} set filetype=markdown
	autocmd BufNewFile,BufRead,BufReadPre *.{json} set filetype=json conceallevel=0
	autocmd InsertEnter *.json setlocal conceallevel=0 concealcursor=
	autocmd InsertLeave *.json setlocal conceallevel=0 concealcursor=inc
	autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
	autocmd BufRead,BufNewFile *.scss set filetype=scss.css
	autocmd FileType scss set iskeyword+=-
	autocmd BufNewFile,BufRead,BufReadPre *.{nvim} set filetype=vim conceallevel=0
	" digdag's setting
	autocmd BufNewFile,BufRead *.dig set filetype=yaml
	autocmd Syntax yaml setl indentkeys-=<:> indentkeys-=0#
augroup END
