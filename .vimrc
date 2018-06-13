" Minpac setup
" To install Minpac, run the following:
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Plugins
call minpac#add('tpope/vim-sensible')
call minpac#add('arcticicestudio/nord-vim')

" Plug 'w0rp/ale'
" Plug 'easymotion/vim-easymotion' 
" Plug 'mattn/emmet-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'bling/vim-airline'
" Plug
" Plug 'tpope/vim-surround'

" Change the leader to space
nnoremap <Space> <NOP>
let mapleader = ' '

" Syntax highlighting
colorscheme nord

" Tabs like I like them
" set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Line numbers
set number

" Add marker for 80 character limit
" set colorcolumn=81

" ALE settings
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier', 'eslint']
" let g:ale_fixers['json'] = ['prettier']

" Fuzzy Find
" To install fzf, run the following:
" brew install fzf
set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>

" JSX settings
" let g:jsx_ext_required = 0

