" Change the leader to space
nnoremap <Space> <NOP>
let mapleader = ' '

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

" Use 'jk' to get out of insert mode
inoremap jk <Esc>

" Allow use of local (per-project) config files
set exrc
set secure

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

" ALE settings
call minpac#add('dense-analysis/ale')
nmap <Leader>n :ALENext<CR>
nmap <Leader>N :ALEPrevious<CR>
let g:ale_completion_enabled = 1
let g:ale_linters = {}
let g:ale_fix_on_save = 1
let g:ale_fixers = {}

" JavaScript support
call minpac#add('pangloss/vim-javascript')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('styled-components/vim-styled-components')
call minpac#add('jparise/vim-graphql')
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:kite_supported_languages = ['javascript']
let g:ale_linters['javascript'] = ['eslint', 'tsserver']
let g:ale_fixers['javascript'] = ['eslint', 'prettier']
let g:ale_fixers['json'] = ['prettier']

" TypeScript support
call minpac#add('leafgarland/typescript-vim')
let g:ale_linters['typescript'] = ['tsserver', 'eslint']
let g:ale_fixers['typescript'] = ['eslint']

" Enhanced C# support
call minpac#add('OrangeT/vim-csharp')

" Vim Surround
call minpac#add('tpope/vim-surround')

" Fugitive, a git plugin
call minpac#add('tpope/vim-fugitive')

" Emmet
call minpac#add('mattn/emmet-vim')

" NERDTree
call minpac#add('scrooloose/nerdtree')
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" NERDCommenter
call minpac#add('scrooloose/nerdcommenter')
let g:NERDSpaceDelims = 1

" Automatically add pairs for certain characters
call minpac#add('jiangmiao/auto-pairs')

" Twig support
call minpac#add('lumiliet/vim-twig')

" Scala support
call minpac#add('derekwyatt/vim-scala')
let g:ale_linters['scala'] = ['sbtserver']

" Codebase searching
call minpac#add('mileszs/ack.vim')
let g:ackprg = 'ag --vimgrep'

" Fluent support
call minpac#add('projectfluent/fluent.vim')

" Jinja support
call minpac#add('Glench/Vim-Jinja2-Syntax')
autocmd BufNewFile,BufRead *.njk set syntax=jinja

" ----------- "
" END PLUGINS "
" ----------- "
