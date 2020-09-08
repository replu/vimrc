let g:quickrun_config = {}
let g:quickrun_config = {
			\ "_" : {
			\	"outputter/buffer/split" : ":botright 8sp",
			\   "outputter/buffer/close_on_empty" : 1
			\ },
			\}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
