" Change the leader to space
nnoremap <Space> <NOP>
let mapleader = ' '
"
" Tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Line numbers
set number

" Add marker for 80 character limit
set colorcolumn=81

" Fuzzy Find
" To install fzf, run the following:
" brew install fzf
set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>

" ------- "
" PLUGINS "
" ------- "

" Minpac setup
" To install Minpac, run the following:
" git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Sensible defaults
call minpac#add('tpope/vim-sensible')

" Nord Color Scheme
call minpac#add('arcticicestudio/nord-vim')
colorscheme nord

" Airline installation and configuration
call minpac#add('vim-airline/vim-airline')
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

" Easy Motion
call minpac#add('easymotion/vim-easymotion')

" ----------- "
" END PLUGINS "
" ----------- "

" Plug 'w0rp/ale'
" Plug 'mattn/emmet-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'tpope/vim-surround'

" ALE settings
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier', 'eslint']
" let g:ale_fixers['json'] = ['prettier']

" JSX settings
" let g:jsx_ext_required = 0

