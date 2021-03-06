"""""""""""""""""""""""""
" Author: Zaid Gharaybeh
"
"""""""""""""""""""""""""
"source <path>



"" Bread and butter
" addtional scroll movements and replace buttons
noremap <silent> J @="j\<lt>C-E>"<CR>
noremap <silent> K @="k\<lt>C-Y>"<CR>
noremap <c-j> J
noremap <c-k> K
" copy to system clipboard
noremap Y "+y
" allows multiple pasting of copied text
xnoremap p pgvy
" paste from clipboard without ruining indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
inoremap <c-b> <F2><c-r>+<F2>
" word completion using tab and shift tab (i don't like c-n c-p)
inoremap <TAB> <c-n>
inoremap <S-TAB> <c-p>
"
nnoremap <Space> :noh<CR>
" frees up m to use for my own bindings
noremap mm m



""" my mappings
" bufdo e without loss of syntax highlighting and switching buffers
nnoremap me <c-w>n:bufdo e<CR>:q
" open all files recursively of type determined after
nnoremap ma :args `find . -not -path '*/\.*' -type f -name '*.'`<Left><Left>
" block abstraction and execution "TODO make below work with beginning of file
nnoremap my ?\%^\\|# ----------<CR>v/\%$\\|# ----------<CR>$:SlimeSend<CR>'>:noh<CR>l
nnoremap mY ?\%^\\|# ----------<CR>v/\%$\\|# ----------<CR>$"+y'>:noh<CR>l
nnoremap mb o<CR># ---------- [] ----------:<CR><CR><ESC>2k13la
" ctags
noremap mt :<c-u>!ctags -R **/*.py<CR>:set tags=tags<CR>
" shortcut to highlight whole word under cursor TODO make this work in visual mode
noremap ml :<c-u>let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<CR>wb
" replace occurences with incrementing counter appended
nnoremap mri :let @a=1 \| %s/search/\='replace'.(@a+setreg('a',@a+1))/g
nnoremap msb :botr vs<CR>:b 
"" python mappings
"
nnoremap mp Oimport ipdb; ipdb.set_trace()<ESC>:w<CR>
" insert python docstring
nnoremap midp o"""<CR>ToDo:description<CR><CR><CR>Keyword arguments:<CR>arg1 -- <CR>arg2 -- <CR>"""<ESC>
" timeit
xnoremap mvt <ESC>`<Oimport time; my_start_time = time.time()<ESC>`>oprint("my_end_time - my_start_time = ", time.time() - my_start_time)<ESC>


" timeout settings
set timeoutlen=1000 ttimeoutlen=0



"" visual options
" highlight search results
set hlsearch
" highlight opposite [({
hi MatchParen cterm=none ctermbg=darkgreen
" set line number
set nu
" set syntax
syntax on
"
set laststatus=2
" make active window more visible
hi StatusLine ctermfg=black ctermbg=darkgreen cterm=bold gui=bold
" for vim to have consistent colors within tmux
set background=dark
set t_Co=256





"" Other options
set autoread
" ctags set
set tags=tags
" redefine tabs as spaces and auto indent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab






"" Package/Plugin settings
" Slime 
noremap mSC :<C-u>SlimeConfig<CR>
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": ".0"}
let g:slime_dont_ask_default = 1
" winresize
let g:winresizer_start_key = 'mW'
" Ale stuff
nnoremap mF :ALEFix<CR>
nnoremap mL :ALELint<CR>
let b:ale_linters = ['flake8']
let b:ale_fixers = ['black']
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
" UltiSnips stuff
let g:UltiSnipsExpandTrigger="c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"
