function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  nmap <buffer> <F2>  <plug>(lsp-rename)
  nmap <buffer> gk    <plug>(lsp-hover)

  " 定義や参照へ移動
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <silent> <Leader>d :LspTypeDefinition<CR>
  nmap <silent> <Leader>r :LspReferences<CR>
  nmap <silent> <Leader>i :LspImplementation<CR>

  " 補完候補の移動と決定
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

" filetypeがgoの時は複数のLSP Serverを起動する
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_text_edit_enabled = 1

" vim-goimports
let g:goimports = 1
let g:goimports_simplify = 1

" vista
let g:vista_default_executive = 'vim_lsp'

nnoremap <leader>t :Vista!!<CR>
