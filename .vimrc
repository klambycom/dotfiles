" Setup Vundle
" ============
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'airblade/vim-gitgutter'
Plugin 'joonty/vdebug'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vexxor/phpdoc.vim'

" You also have to install prettier globaly with 'npm install -g prettier' or
" 'yarn global add prettier'.
Plugin 'prettier/vim-prettier'

" Syntaxes
Plugin 'mxw/vim-jsx'
Plugin 'sheerun/vim-polyglot'
Plugin 'groenewege/vim-less'
Plugin 'vim-scripts/wikipedia.vim'

call vundle#end()

filetype plugin indent on
syntax on

" Global
" ======
if has("terminfo")
  let &t_Co=16
  let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
  let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
  let &t_Co=16
  let &t_Sf="\<Esc>[3%dm"
  let &t_Sb="\<Esc>[4%dm"
endif

set autowrite		" Write the old file out when switching between files.
set hidden		  	" Switch between buffers without saving
set splitbelow		" Split windows below the current window.
set foldenable		" Enable code folding
set mousehide		" Hide mouse when typing
set autoread		" Set to auto read when a file is changed from the outside
set vb t_vb=		" Disable beeping
set updatetime=100 " Set updatetime to 100ms (default 4000ms). Should change if I notice lag!

set clipboard=unnamed	" Share clipboard with OS

"set encoding=utf-8
set fileencoding=utf-8

" Source the .vimrc file after saving it
"if has("autocmd")
"	autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" Automatically change current directory to that of the file in the buffer
" Jag kommenterar ut denna för tillfället för att testa hur jag gillar det
"autocmd BufEnter * cd %:p:h

" Tab stuff
" ---------
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab " Space?
set noexpandtab " Tab? TODO Templösning!!!!!!!!!!!!!!!!

" Indent stuff
" ------------
set smartindent
set autoindent

" Better line wrapping
" --------------------
set wrap
set textwidth=79
set formatoptions=qrn1

" Layout?
" -------
set showcmd					" Show command in button right partion of the screen
set number					" Show lines numbers
set relativenumber
" set relativenumber		" Prefer relative line numbering?
set ruler					" Display current cursor position in lower right corner.
set laststatus=2			" Always show the status line
" set linespace=3			" Prefer a slightly higher line height
"set list					" Show linebrake and tab symbols
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Search
" ------
set incsearch	" Set incremental searching
set hlsearch	" Highlight searching

" Autocompletion
" --------------
" For autocompletion
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set wildmode=list:longest
set completeopt=longest,menuone

" Put swap files in /tmp file
" ---------------------------
set backupdir=~/.tmp/backup//
set directory=~/.tmp/swap//

" Maintain undo history between sessions
" --------------------------------------
set undofile
set undodir=~/.tmp/undo//



" Keyboard & Shortcuts
" ====================
let mapleader = ','
let maplocalleader = '\\'
"set timeoutlen=500 " Ever notice a slight lag after typing the leader key + command? This lowers the timeout.

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Saves time
nnoremap <space> :
inoremap jj <esc>

" Ctrl-z without stupid ctrl, fg to get back
nnoremap <leader>s <C-z>
" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>
" Shortcut for editing .vimrc file in a new tab
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
" Hard-wrap paragraphs of text
nnoremap <leader>q gqip
" Shortcut to fold tags with leader (usually \) + ft
"nnoremap <leader>ft Vatzf
" Map code completion to , + tab
inoremap <leader><tab> <C-x><C-u>
" Delete all buffers (via Derek Wyatt)
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>
" Switch to the directory of the current file with <leader>cd
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" Switch to last edited buffer
nnoremap <leader>f :b#<cr>

" Make word uppercase
inoremap <leader>u <esc>viwUea

" åäö
inoremap aa å
inoremap Aa Å
inoremap ae ä
inoremap Ae Ä
inoremap oe ö
inoremap Oe Ö

" Javascript console.log debugging
nnoremap <leader>d Oconsole.log("DEBUGGING  <esc>:execute "normal! i" . ( line(".") )<cr>a");<esc>hh
vnoremap <leader>d yOconsole.log(<esc>pa);<esc>

" Load the current buffer in Firefox, Chrome or Safari
abbrev ff :! open -a firefox.app %:p<cr>
abbrev chr :! open -a Google\ Chrome %:p<cr>
abbrev safari :! open -a safari.app %:p<cr>

" Speed up buffer switching
"noremap <C-k> <C-W>k
"noremap <C-j> <C-W>j
"noremap <C-k> :bp<cr>
"noremap <C-j> :bn<cr>
"noremap <C-h> <C-W>h
"noremap <C-l> <C-W>l
noremap <C-h> :bp<cr>
noremap <C-l> :bn<cr>

" Simple calculator (1+1<C-a> => 1+1=2)
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Use the arrows to switch buffer
"noremap <right> :bn<cr>
"noremap <left> :bp<cr>

" Scroll page up/down with gj/gk
nnoremap gj <C-f>
nnoremap gk <C-b>

" Automatically append closing characters
" http://vim.wikia.com/wiki/Automatically_append_closing_characters
inoremap {<CR>  {<CR>}<Esc>O
inoremap {<Tab> {  }<Esc>hi

" Move text with ctrl + up/down
" -----------------------------
" Bubble signle lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp

" Buble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" Exercise from Learn Vimscript the Hard Way.
nnoremap <leader>w :match Error /\v\s$/<cr>
nnoremap <leader>W :match Error /dfafahlasfdjwjofds/<cr>

" select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Find word in other files
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>



" Language specific
" =================
" PHP file settings {{{
augroup filetype_php
  autocmd!
  autocmd FileType php setlocal ts=2 sts=2 sw=2 noexpandtab
augroup END
augroup filetype_tpl
  autocmd!
  autocmd FileType tpl setlocal ts=2 sts=2 sw=2 noexpandtab
augroup END
" }}}
" Javascript file settings {{{
augroup filetype_javascript
  autocmd!
  " TODO Should I use <buffer>?
  autocmd Filetype javascript nnoremap <leader>c I//<esc>
  autocmd Filetype javascript vnoremap <leader>c <esc>`<I/*<esc>`>A*/<esc>
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END
" }}}
" Javascript file settings {{{
augroup filetype_coffee
  autocmd!
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
augroup END
" }}}
" Markdown file settings {{{
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak nolist

  " Nearest headline
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! jj?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap ah :<c-u>execute "normal! jj?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
" Ruby file settings {{{
augroup filetype_ruby
  autocmd!
  autocmd BufNewFile,BufRead Rakefile,Capfile,Gemfile,Termfile,Vagrantfile,config.ru,*.rabl set filetype=ruby
  autocmd BufRead,BufNewFile *.erb set filetype=erb.eruby.html " Make html.erb use html5.vim
augroup END
" }}}
" Prolog file settings {{{
augroup filetype_prolog
  autocmd!
  autocmd BufNewFile,BufRead *.pl set filetype=prolog
augroup END
" }}}
" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

autocmd FileType html,css,scss,ruby,pml,yaml,coffee,vim,erb setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Run current rubyfile
nnoremap <leader>r :w<cr>:!s up<cr>
abbrev irb :w<cr>:!irb -r ./%<cr>


" MacVim
" ======
if has("gui_macvim")
	" Set the color scheme. Change this to your preference.
	" Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
	"colorscheme desert
  colorscheme codeschool

	" Set font type and size
	set guifont=Monaco:h12

	" Hide MacVim toolbar by default
	set go-=T

  " Make fullscreen take up entire screen
	set fuoptions=maxhorz,maxvert

  " Hide right-hand scrollbar
  set go-=r
  set go-=R

  " Hide left-hand scrollbar
  set go-=l 
  set go-=L 

" NeoVim
" ======
elseif has("nvim")
  syntax enable

  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"

  set background=light

  colorscheme grb4

	" Set font type and size
	set guifont=Monaco:h10

" CUI
" ===
else
  syntax enable

  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"

  set background=light

  " colorscheme solarized
	" colorscheme desert256
  " colorscheme codeschool
  colorscheme grb4

	" Set font type and size
	set guifont=Monaco:h10
endif



" Plugins
" =======
" NERDTree
" --------
" Shortcut for NERDTreeToggle
"inoremap ,nt :NERDTreeToggle
nnoremap <F4> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Show hidden files in NerdTree
" let NERDTreeShowHidden=1

" Autopen NERDTree and focus cursor in new document
" if has("gui_macvim")
"   autocmd VimEnter * NERDTree
"   autocmd VimEnter * wincmd p
" endif

" Emmet
" -----
let g:user_emmet_expandabbr_key = '<leader>t'

" Gundo
" -----
nnoremap <F5> :NERDTreeClose<CR>:GundoToggle<CR>
let g:gundo_preview_bottom = 1

" Tagbar
" ------
nnoremap <F6> :TagbarToggle<CR>

" Prettier
" --------
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#parser = 'flow'

" MiniBufExplorer
" ---------------
"let g:miniBufExplSplitBelow=1
"let g:miniBufExplorerMoreThanOne=4
"let g:miniBufExplUseSingleClick=1

" SuperTab like snippets behavior. 
let g:SuperTabDefaultCompletionType = "context" 

" PHP
function! PhpSyntaxOverride()
	hi! def link phpDocTags phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

let g:pdv_cfg_php4always = 0
noremap <leader>pd :call PhpDoc()<CR>

" Abbreviations
" =============
" Helpful abbreviations
iab lorem Lorem ipsum dolor sit amet... Jag ska fylla i mer sen
iab llorem Lorem ipsum dolor sit amet... Lorem ipsum dolor sit amet... Jag ska fylla i mer sen

" Spelling corrects
source ~/.vim/abbreviations
" TODO:
" :!echo 'iab rod ord' >> .vim/abbreviations
" :source .vim/abbreviations
"
" function AddAbbreviation(wrong, right)
"   ...
" endfunction



" Test
" ====
" Opens a vertical split and switches over (\v)
" nnoremap <leader>v <C-W>v<C-w>l

" Set up an HTML5 template for all new .html files
" autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

" Example for adding abbreviations - triggered by the spacebar.
"iabbrev mysite ftp://username@server/folder/

" Create dictionary for custom expansions
"set dictionary+=/Users/christian/.vim/dict/PHP.dict

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
