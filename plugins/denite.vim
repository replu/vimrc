" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>  denite#do_map('do_action')
	nnoremap <silent><buffer><expr> <C-v>  denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> <C-x>  denite#do_map('do_action', 'split')

	nnoremap <silent><buffer><expr> d  denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p  denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q  denite#do_map('quit')
	nnoremap <silent><buffer><expr> i  denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space>  denite#do_map('toggle_select').'j'

	nnoremap <silent><buffer><expr> <ESC>  denite#do_map('quit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	inoremap <silent><buffer> <C-j> <ESC><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
	inoremap <silent><buffer> <C-k> <ESC><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
	inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
	imap <silent><buffer> <tab> <Plug>(denite_filter_quit)

	inoremap <silent><buffer><expr> <c-t> denite#do_map('do_action', 'tabopen')
	inoremap <silent><buffer><expr> <c-v> denite#do_map('do_action', 'vsplit')
	inoremap <silent><buffer><expr> <c-x> denite#do_map('do_action', 'split')
endfunction

" フローティングウィンドを使用
autocmd FileType denite set winblend=20
autocmd FileType denite-filter set winblend=20
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7

" Change denite default options
let s:denite_options = {
			\ 'split': 'floating',
			\ 'start_filter': 1,
			\ 'auto_resize': 1,
			\ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
			\ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
			\ 'winheight': float2nr(&lines * s:denite_win_height_percent),
			\ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
			\ 'highlight_filter_background': 'DeniteFilter',
			\ 'highlight_window_background': 'DeniteFilter',
			\ 'prompt': '> ',
			\ 'highlight_matched_char': 'Type',
			\ }

call denite#custom#option('default', s:denite_options)

call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['.git/', '.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])

call denite#custom#alias('source', 'file/rec_git', 'file/rec')
call denite#custom#var('file/rec_git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#option('default', 'prompt', '>')
call denite#custom#option('default', 'direction', 'top')

" バッファ一覧
noremap <C-P> :Denite buffer<CR>
nnoremap sB :<C-u>Denite buffer<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Denite file/old<CR>

nmap <silent> <Leader><Leader> :<C-u>Denite file/rec<CR>

"Denite でバッファ内検索  / と同じような機能
nnoremap <silent> <Leader><C-f> :<C-u>Denite line<CR>
