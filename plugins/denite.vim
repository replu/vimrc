" deniteバッファの設定
autocmd FileType denite set winblend=20
autocmd FileType denite-filter set winblend=20
let s:floating_window_width_ratio = 0.85
let s:floating_window_height_ratio = 0.7

let s:denite_options = {
			\ 'auto_action': 'preview',
			\ 'floating_preview': v:true,
			\ 'vertical_preview': v:true,
			\ 'split': 'floating',
			\ 'start_filter': 1,
			\ 'winwidth': float2nr(&columns * s:floating_window_width_ratio / 2),
			\ 'wincol': float2nr((&columns - (&columns * s:floating_window_width_ratio)) / 2),
			\ 'preview_width': float2nr(&columns * s:floating_window_width_ratio / 2),
			\ 'winheight': float2nr(&lines * s:floating_window_height_ratio),
			\ 'winrow': float2nr((&lines - (&lines * s:floating_window_height_ratio)) / 2),
			\ 'preview_height': float2nr(&lines * s:floating_window_height_ratio),
			\ 'highlight_filter_background': 'DeniteFilter',
			\ 'highlight_window_background': 'DeniteFilter',
			\ 'prompt': '> ',
			\ 'highlight_matched_char': 'Type',
			\ }
call denite#custom#option('default', s:denite_options)
" grep用のバッファは名前を指定しているので、そちらにも同じ設定をする
call denite#custom#option('grep-buffer-denite', s:denite_options)

" ripgrepを使うよう設定
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--color', 'never'])
call denite#custom#var('grep', {
           \ 'command': ['rg'],
           \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
           \ 'recursive_opts': [],
           \ 'pattern_opt': ['--regexp'],
           \ 'separator': ['--'],
           \ 'final_opts': [],
           \ })

" ソースごとにオプション指定
call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#source('file_mru', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call denite#custom#source('file_mru', 'converters', ['converter_relative_word'])
call denite#custom#alias('source', 'file/rec_git', 'file/rec')
call denite#custom#var('file/rec_git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

" ノーマルモードでのキーマップを設定
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>  denite#do_map('do_action')
	nnoremap <silent><buffer><expr> <C-v>  denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> <C-x>  denite#do_map('do_action', 'split')
	nnoremap <silent><buffer><expr> <C-t>  denite#do_map('do_action', 'tabopen')

	nnoremap <silent><buffer><expr> d  denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p  denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q  denite#do_map('quit')
	nnoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
	nnoremap <silent><buffer><expr> i  denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

" インサートモートでのキーマップを設定
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	inoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
	imap <silent><buffer> <tab> <Plug>(denite_filter_quit)

	inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
	inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
	inoremap <silent><buffer><expr> <C-x> denite#do_map('do_action', 'split')
endfunction

" バッファ一覧
" noremap <C-P> :Denite buffer<CR>
nnoremap sb :<C-u>Denite buffer<CR>

" 最近使ったファイルの一覧
noremap <C-Z> :Denite file_mru<CR>

" Deniteでのファイル検索
nmap <silent> <Leader><Leader> :<C-u>Denite file/rec<CR>
nmap <silent> sf :<C-u>Denite file/rec<CR>
nmap <silent> sF :<C-u>DeniteProjectDir file/rec<CR>

"バッファ内検索  / と同じような機能
nnoremap <silent> <Leader>/ :<C-u>Denite line<CR>
" 指定したワードでgrep
nmap <silent> ssg :<C-u>Denite -buffer-name=grep-buffer-denite grep<CR>
nmap <silent> ssG :<C-u>DeniteProjectDir -buffer-name=grep-buffer-denite grep<CR>
" カーソルの下の単語でgrep
nmap <silent> sg  :<C-u>DeniteProjectDir -buffer-name=grep-buffer-denite grep:::<C-r><C-w><CR>
nmap <silent> sG  :<C-u>DeniteProjectDir -buffer-name=grep-buffer-denite grep:::<C-r><C-a><CR>

" 直近のgrep結果をもう一度開く
nnoremap <silent> sS :<C-u>Denite -buffer-name=grep-buffer-denite -resume<CR>
" grep結果の選択行の前後に移動
nnoremap <silent> sN :<C-u>Denite -buffer-name=grep-buffer-denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> sP :<C-u>Denite -buffer-name=grep-buffer-denite -resume -cursor-pos=-1 -immediately<CR>
