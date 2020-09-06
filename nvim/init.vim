" global settings
syntax on
set number
set relativenumber
set wrap
set showcmd
set wildmenu
set ruler

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" split
set splitright
set splitbelow

" set plug
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" open markdown
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	endif
endfunc

" autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

" plug
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

call plug#end()

" color
colorscheme gruvbox

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='gruvbox'
nmap <tab> :bn<cr>

" markdown plug
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "firefox --new-window"
