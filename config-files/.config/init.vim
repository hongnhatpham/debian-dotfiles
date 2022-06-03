:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set smarttab
:set shiftwidth=4
:set softtabstop=4
:set mouse=a
:set clipboard=unnamed

call plug#begin('~/.config/nvim/plugged')
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/mhartington/formatter.nvim'
Plug 'https://github.com/rstacruz/vim-hyperstyle'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/ap/vim-css-color'
call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-f> :Format<CR>
