"------------------------------------------------------------
"検索関係
"------------------------------------------------------------
"{{{
set ignorecase
set smartcase
set hlsearch
set incsearch
" Kでカーソル下の単語のhelpを引く
set keywordprg=:help
"}}}


"------------------------------------------------------------
"編集関係
"------------------------------------------------------------
"{{{
set shiftround
set autoindent
set autowrite
set backspace=indent,eol,start
set wrapscan
set showmatch
set matchtime=1
set wildmenu
set formatoptions+=mM
set nostartofline
set confirm
set virtualedit=block
set notimeout
set ttimeout ttimeoutlen=200
set noswapfile
set nobackup
set noundofile
set autochdir
set hidden
set matchpairs& matchpairs+=<:>
set spelllang=en,cjk
" ファイルを開いた時に，カーソル位置を最後にカーソルがあった位置まで移動
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"}}}

"------------------------------------------------------------
"表示関係
"------------------------------------------------------------
"{{{
set number
set nolist
set ambiwidth=double
set wrap
set display=lastline
set laststatus=2
set cmdheight=2
set showcmd
set title
set visualbell
set t_vb=
set foldmethod=marker
set conceallevel=0
set pumheight=15
set completeopt=menu
set termguicolors
set pumblend=20
set signcolumn=yes

" 不可視文字の表示を変更
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" タブ設定
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
"}}}
"

let g:home = expand('~')
let g:python_home = g:home . '/.pyenv/shims'
let g:python_host_prog = g:python_home . '/python2'
let g:python3_host_prog = g:python_home . '/python3'

call plug#begin('~/.nvim/plugged')

" util
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'kassio/neoterm'
Plug 'thinca/vim-quickrun'
Plug 'reireias/vim-cheatsheet'

" appearance
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'haya14busa/vim-operator-flashy'

" edit
Plug 'ntpeters/vim-better-whitespace'
Plug 'cohama/lexima.vim'
Plug 'tomtom/tcomment_vim'
Plug 'sjl/gundo.vim'
Plug 'haya14busa/vim-edgemotion'

" text object
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'rhysd/vim-operator-surround'

" file explorer
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'ryanoasis/vim-devicons'
Plug 't9md/vim-choosewin'

" highlight and indent
Plug 'sheerun/vim-polyglot'

" lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports', {'for': 'go'}
Plug 'liuchengxu/vista.vim'

" top page
Plug 'mhinz/vim-startify'

" markdown
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown' }

" template
Plug 'mattn/sonictemplate-vim'

" integration browser
Plug 'tyru/open-browser-github.vim'
Plug 'vim-scripts/open-browser.vim'
Plug 'mattn/webapi-vim'

" integration https://carbon.now.sh
Plug 'kristijanhusak/vim-carbon-now-sh'

" color theme
Plug 'cocopon/iceberg.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'

" help
Plug 'vim-jp/vimdoc-ja'

call plug#end()

filetype plugin indent on

for plugin in glob(g:home.'/.config/nvim/plugins/*', 1, 1)
	execute "source " . plugin
endfor

" Help
set helplang=ja

" Color
set t_Co=256
syntax enable
set background=dark

" color schemes with plugin
colorscheme PaperColor

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
nnoremap <Leader>ev :tabe $HOME/.config/nvim/init.vim<CR>
" .vimrcを再読み込み
nnoremap <Leader>rv :source $HOME/.config/nvim/init.vim<CR>
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

"ファイルタイプに関係する設定
augroup filetypeds
	autocmd!
	autocmd BufNewFile,BufRead,BufReadPre *.{md,mkd,mark*} set filetype=markdown
	autocmd BufNewFile,BufRead,BufReadPre *.{json} set filetype=json conceallevel=0
	autocmd InsertEnter *.json setlocal conceallevel=0 concealcursor=
	autocmd InsertLeave *.json setlocal conceallevel=0 concealcursor=inc
	autocmd BufRead,BufNewFile *.scss set filetype=scss.css
	autocmd FileType scss set iskeyword+=-
	autocmd BufNewFile,BufRead,BufReadPre *.{nvim} set filetype=vim conceallevel=0
	autocmd BufNewFile,BufRead *.dig set filetype=yaml
	autocmd BufRead,BufNewFile *.tf set filetype=terraform
	autocmd Syntax yaml setl indentkeys-=<:> indentkeys-=0#

	" python の場合 Shift + F で自動修正
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
augroup END
