.vimrcを開く <Leader>ev
.vimrcを再読み込み <Leader>rv

カーソル位置以降の文字列とヤンクした単語を置換
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

テキストオブジェクト的にカーソルが単語内の何処にあってもヤンクした文字列と置換
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

アウトラインをサイドバーで表示
<leader>t

# denite
tabで開く
<c-t>
vsplitで開く
<c-v>
splitで開く
<c-x>

バッファ一覧
<C-P>
sB

最近使ったファイルの一覧
<C-Z>

Deniteでのファイル検索(カレントディレクトリから)
<Leader><Leader> :<C-u>Denite file/rec<CR>
sf  :<C-u>Denite file/rec<CR>
Deniteでのファイル検索(プロジェクトルートから)
sF  :<C-u>DeniteProjectDir file/rec<CR>

バッファ内検索  / と同じような機能
<Leader>/

指定したワードでgrep(バッファ)
ssg :<C-u>Denite grep<CR>
指定したワードでgrep(プロジェクト)
ssG :<C-u>DeniteProjectDir grep<CR>

カーソルの下の単語でgrep(バッファ)
sg
カーソルの下の単語でgrep(プロジェクト)
sG

# Github

:OpenGithubFile	開いているファイルをgithubで開く
:OpenGithubIssue <number>	開いているファイルのgithubプロジェクトの指定issueを開く
:OpenGithubIssue 	開いているファイルのgithubプロジェクトのissueリストを開く
:OpenGithubPullReq <number>	開いているファイルのgithubプロジェクトの指定PRを開く
:OpenGithubPullReq	開いているファイルのgithubプロジェクトのPRリストを開く
:OpenGithubProject	開いているファイルのgithubプロジェクトを開く

# LSP
リネーム
<F2>
LSP Hover
gk
バッファを診断
<leader>D

定義に移動
gd
型宣言に移動
<Leader>d
参照に移動
<Leader>r
インターフェイスの実装ｎ移動
<Leader>i


ドキュメントに対して実行すべきコマンドを問い合わせて実行する
:LspCodeAction
ドキュメントに対して実行できるコマンドのリストを取得
:LspCodeLens

ドキュメント内のエラーがQuickFixで一覧表示される
:LspDocumentDiagnostics
" 上記でQuickFixに表示される内容の移動
:LspNextDiagnostic
:LspPreviousDiagnostic
:LspNextError
:LspPreviousError
:LspNextWarning
:LspPreviousWarning

:LspDocumentSymbol ドキュメント内のジャンプ可能なシンボル一覧を表示
:LspWorkspaceSymbol	Search/Show workspace symbol

# テキストオブジェクト
オペレータ + [回数] + 範囲 + テキストオブジェクト

- オペレーター
	y :  yank
	d : delete
	c : change
	- : replace
	sa : 囲みを追加
	sd : 囲みを削除
	sr : 囲みを置換

[* 回数]
繰り返し回数を数字で指定

[* 範囲]
	a : 冠詞のa (a word  や a line のイメージ)
	i : inner

[* テキストオブジェクト]
	w : 単語
	W : 単語の前後のスペースを含む
	t : html タグ
	()や""などの括弧

""で囲まれた中のテキストオブジェクトをヤンクしてある文字列に置換
-i"

テキストオブジェクトに囲みを追加
sa + {テキストオブジェクト} + {囲み指定}
saiw( : 単語を()で囲む

テキストオブジェクトの囲みを削除
sd + {削除したい囲みを含むテキストオブジェクト}
sda( : ()で囲まれたテキストオブジェクトから()を削除

テキストオブジェクトの囲みを置換
sr + {変更したい囲みを含むテキストオブジェクト} + {新しい囲み指定}
sra"' : ""で囲まれたテキストオブジェクトの""を''に置換
