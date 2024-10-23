set number
set tabstop=2
set shiftwidth=2
set expandtab
set path+=.,src/**
set relativenumber
set nohlsearch

set cursorline
set termguicolors

set nobackup 

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

nnoremap <silent> <LEFT> :vertical resize -2 <CR>
nnoremap <silent> <RIGHT> :vertical resize +2 <CR>
nnoremap <silent> <UP> :resize -2 <CR>
nnoremap <silent> <DOWN> :resize +2 <CR>
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


nnoremap y "ay
nnoremap y "ay
vnoremap y "ay
nnoremap py "ap
vnoremap py "ap

nnoremap d "dd
vnoremap d "dd
nnoremap pd "dp
vnoremap pd "dp
nnoremap c "cc
vnoremap c "cc
nnoremap pc "cp
vnoremap pc "cp
nnoremap x "xx
vnoremap x "xx
nnoremap px "xp
vnoremap px "xp

nnoremap yp "+y
vnoremap yp "+y
nnoremap pp "+p
vnoremap pp "+p

"this is the tmux navigator settings, so that ou can use ctrl + h/j/k/l to
"move.
nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>

call plug#begin('~/.local/share/nvim/plugged')
"kolev plugs to try
Plug 'sangdol/mintabline.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'sangdol/mintabline.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

"autocomplete shit 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'pangloss/vim-javascript'

Plug 'ThePrimeagen/vim-be-good'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"some colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'
Plug 'diegoulloao/neofusion.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }

" Add colorizer to highlight CSS/HTML colors
Plug 'norcalli/nvim-colorizer.lua'

" this is to make that we can use ctrl + hjkl to move between tmux panes
Plug 'alexghergh/nvim-tmux-navigation'

" Set up a tree file viewer
"Plug 'nvim-tree/nvim-web-devicons' " optional
"Plug 'nvim-tree/nvim-tree.lua'

call plug#end()
lua require'colorizer'.setup()

" colorscheme nordic
" colorscheme kanagawa-wave " chill
" colorscheme kanagawa-lotus " light
" colorscheme kanagawa-dragon " dark
 colorscheme tokyonight
" colorscheme neofusion

 Plug 'sangdol/mintabline.vim'


command! CreateHtmlFile call CreateHtmlTemplate()
function! CreateHtmlTemplate()
    execute 'normal! i<!DOCTYPE html>'
    execute 'normal! o<html lang="en">'
    execute 'normal! o<head>'
    execute 'normal! o    <meta charset="UTF-8">'
    execute 'normal! o    <meta name="viewport" content="width=device-width, initial-scale=1.0">'
    execute 'normal! o    <title>Document</title>'
    execute 'normal! o</head>'
    execute 'normal! o<body>'
    execute 'normal! o    <h1>Hello, World!</h1>'
    execute 'normal! o</body>'
    execute 'normal! o</html>'
    execute 'normal! gg'
endfunction

lua require'colorizer'.setup()
