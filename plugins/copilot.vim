" 候補を決定
imap <silent><script><expr> <C-C> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" 候補を選択
imap <silent> <C-D> <Plug>(copilot-next)
imap <silent> <C-A> <Plug>(copilot-previous)
