" nmap <silent> gd :LspDefinition<CR>
" nmap <silent> <f2> :LspRename<CR>
" nmap <silent> <Leader>d :LspTypeDefinition<CR>
" nmap <silent> <Leader>r :LspReferences<CR>
" nmap <silent> <Leader>i :LspImplementation<CR>
" let g:lsp_diagnostics_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_popup_delay = 200
" let g:lsp_text_edit_enabled = 0
"
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <F2> <plug>(lsp-rename)
  nmap <silent> <Leader>d :LspTypeDefinition<CR>
  nmap <silent> <Leader>r :LspReferences<CR>
  nmap <silent> <Leader>i :LspImplementation<CR>
  inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

" let g:lsp_diagnostics_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_text_edit_enabled = 1
" let g:lsp_async_completion = 1

let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

" asyncomplete.vim
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" let g:asyncomplete_auto_popup = 1
"
"
" let g:asyncomplete_auto_completeopt = 0
"
" set completeopt=menuone,noinsert,noselect,preview
"
" let g:asyncomplete_popup_delay = 200

" vim-goimports
let g:goimports = 1
let g:goimports_simplify = 1
