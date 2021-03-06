execute pathogen#infect()
filetype plugin indent on
filetype plugin on
syntax on
set omnifunc=syntaxcomplete#Complete
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
" set shellcmdflag=-ic

" use :w!! instead of the :w !sudo tee % hack
cmap w!! w !sudo tee > /dev/null %


"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
let $GOPATH = "~/programming/Go"
let mapleader = " "
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" use goimports instead of gofmt on save
let g:go_fmt_command = "goimports"

" for vim-racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="~/Downloads/rust/src/"

au FileType rust au BufWrite * :Autoformat

set expandtab
set nocompatible
set mouse=a
set nu
set smartindent
set tabstop=2
set shiftwidth=2
"set autoindent
set hlsearch " higlight matches
set incsearch
set showmatch
set relativenumber
set undofile
set gdefault
"set clipboard=unnamed
"Settings for various plugins (which opens new subwindows)

"set background=dark
colo gruvbox
set background=light
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/


" Trailing Whitespace fighter
function! s:FixWhitespace(line1,line2)
	let l:save_cursor = getpos(".")
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
	call setpos('.', l:save_cursor)
endfunction

	" Run :FixWhitespace to remove end of line white space.
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

autocmd BufNewFile,BufRead *.go setlocal ts=4 shiftwidth=4
autocmd BufNewFile,BufRead *.rb setlocal filetype=ruby
autocmd BufNewFile,BufRead *.erb source ~/.vim/ftplugin/erb.vim

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap ((      (
inoremap [      []<Left>
inoremap [[ 		[

ca WQ wq
ca Wq wq
ca W w
ca Q q
ca bg set keymap=bulgarian
