" Minpac setup
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Plugins
call minpac#add('tpope/vim-sensible')
call minpac#add('arcticicestudio/nord-vim')

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
let g:nord_comment_brightness = 8

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

" Fuzzy Find key map
" map <C-n> :FZF<CR>

" JSX settings
" let g:jsx_ext_required = 0

