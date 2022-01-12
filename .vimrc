syntax on
set tabstop=4
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set number " show line numbers
set expandtab
set relativenumber
set laststatus=2
set hidden
set ignorecase
set clipboard+=unnamedplus
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set expandtab " tabs are spaces
retab!
set showcmd " show command in bottom bar
set cursorline " highlight current line
set lazyredraw " redraw only when we need to.
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ruler
nnoremap <leader><space> :nohlsearch<CR>
colorscheme desert
" note lines over 90 characters wide
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%>91v.\+/
augroup vimrc_autocmds
 autocmd BufEnter * highlight OverLength ctermbg=red guibg=#111111
 autocmd BufEnter * match OverLength /\%>91v.\+/
augroup END
" turn on spellcheck
:setlocal spell spelllang=en_us
set backspace=indent,eol,start "allows backspacing in insert mode
set mouse=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
"inoremap <Left>  <ESC>:echoe "Use h"<CR>
"inoremap <Right> <ESC>:echoe "Use l"<CR>
"inoremap <Up>    <ESC>:echoe "Use k"<CR>
"inoremap <Down>  <ESC>:echoe "Use j"<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font:h11
nnoremap H gT
nnoremap L gt

" autocomplete brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

filetype plugin on
let NERDSpaceDelims=1

" integrate fzf with vim
set rtp+=~/.fzf
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
