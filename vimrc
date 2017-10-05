set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" bad wolf
Plugin 'sjl/badwolf'

"YCM
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on


" color :
set t_Co=256
syntax enable
set background=dark
" colorscheme solarized
colorscheme badwolf
" set background=light
" colorscheme solarized

"tab :
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"UI config :
set number
set showcmd
set cursorline
set linebreak
set hlsearch
set smartindent
set autoindent
set showmatch
set showmode
filetype indent on
filetype plugin indent on
set incsearch
set ruler
set backspace=2
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

autocmd FileType verilog set tabstop=4
autocmd FileType verilog set softtabstop=4
autocmd FileType verilog set shiftwidth=4

autocmd FileType systemverilog set tabstop=4
autocmd FileType systemverilog set softtabstop=4
autocmd FileType systemverilog set shiftwidth=4

autocmd FileType verilog_systemverilog set tabstop=4
autocmd FileType verilog_systemverilog set softtabstop=4
autocmd FileType verilog_systemverilog set shiftwidth=4

autocmd BufNewFile,BufRead *.md set filetype=markdown

set history=50

"personal shortcut :
:command Q q
:command W w
:command WQ wq
:command Wq wq

"fold :
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=100 " 设置折叠层数为 1
set foldlevel=100 " 设置折叠层数为 1


" Easyalign
" xmap ga <plug>(EasyAlign)
" nmap ga <plug>(EasyAlign)


" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
if v:version >= 702
  " Lines longer than 80 columns.
  au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)

  " Whitespace at the end of a line. This little dance suppresses
  " whitespace that has just been typed.
  au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
  au InsertEnter * call matchdelete(w:m1)
  au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
  au InsertLeave * call matchdelete(w:m2)
  au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
else
  au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
  au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
  au InsertLeave * syntax match WhitespaceEOL /\s\+$/
endif


" Encoding priorities
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

" shortcuts for YCM
let mapleader=";"
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ic :YcmCompleter GoToInclude<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>

" prevent loading questions
let g:ycm_extra_conf_globlist = ['~/projects/dev_smt_qos/*', '~/win_projects/dev_smt_qos/*', '~/projects/dev_pard_smt/*']

" The editing history per file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
