" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost *
	 \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	 \ |   exe "normal! g`\""
	 \ | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set wildmenu            " visual autocomplete for command menu
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"设置背景主题
color elflord
"显示行号
set number
"tab宽度
set tabstop=4
"统一缩进
set shiftwidth=4
"用空格代替tab
"set expandtab
" Be smart when using tabs ;)
set smarttab
"智能缩进
set cindent
set smartindent
"高亮显示匹配的括号
set showmatch
"显示标尺
set ruler
"去掉vi一致性
set nocompatible
"搜索高亮显示
set hlsearch
"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" highlight current line
"set cursorline
" Set 7 lines to the cursor - when moving vertically using j/k
"set so=7
" Show matching brackets when text indicator is over them
set showmatch
" Set movement
map <up> gk
map <down> gj
map j gj
map k gk
" Double-click for highlighting
map <2-LeftMouse> *
imap <2-LeftMouse> <c-o>*
"总是显示状态行
set laststatus=2
" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Map ;; as Esc
"inoremap ;; <Esc>
" Map Ctrl-m in Insert Mode as Save File
"inoremap <c-m> <Esc>:update<CR>
set backspace=2 " make backspace work like most other programs
set tags+=tags;/ " for ctags file
" For Tab Completion
set wildmenu
set wildmode=list:longest,full

" For Auto-Pairs
" https://github.com/jiangmiao/auto-pairs
let g:AutoPairsShortcutJump = '<C-k>'

" Search for visually selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text

" Tagbar
" https://github.com/universal-ctags/ctags
" https://github.com/majutsushi/tagbar
" nmap <F8> :TagbarToggle<CR>

" Autotag
" https://github.com/craigemery/vim-autotag

" Ctrlp
" https://github.com/ctrlpvim/ctrlp.vim

" Nerdcommenter
" https://github.com/scrooloose/nerdcommenter

" Lightline
" https://github.com/itchyny/lightline.vim

" Save Shortcut F2
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <Esc><F2>

" Vim-Plug: https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
call plug#end()

" vim-oscyank: https://github.com/ojroques/vim-oscyank
" Ref: https://gronskiy.com/posts/2023-03-26-copy-via-vim-tmux-ssh/
nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual
