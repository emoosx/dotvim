" vimrc
" Author: Kaung Htet Zaw <emoosx@gmail.com>
" Source: http://github.com/emoosx/dotvim

set nocompatible
filetype off
" Plugins installed {{{
    call plug#begin('~/.vim/plugged')
  " Coding {{{
      if executable('lua')
        Plug 'Shougo/neocomplete.vim'
        Plug 'Shougo/neosnippet'
        Plug 'Shougo/neosnippet-snippets'
        imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: pumvisible() ? "\<C-n>" : "\<tab>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<tab>"

        " For snippet_complete marker.
        if has('conceal')
          set conceallevel=2 concealcursor=i
        endif

      endif
      Plug 'sjl/gundo.vim'
      Plug 'Raimondi/delimitMate'        "matching quotes, brackets ., etc
      Plug 'scrooloose/nerdcommenter'    "commenting
      Plug 'scrooloose/syntastic'        "syntax wise error checking
      Plug 'scrooloose/nerdtree'          "filebrowser
      if executable('ctags')
        Plug 'majutsushi/tagbar'         "source code browsing
      endif
      Plug 'tpope/vim-surround'          "quoting/parenthizing made simple
      " Plug 'sheerun/vim-polyglot'        "a collection of syntax
      Plug 'editorconfig/editorconfig-vim'
      Plug 'jpalardy/vim-slime'          "REPL
      Plug 'kien/ctrlp.vim'
      Plug 'jbgutierrez/vim-partial'
      Plug 'junegunn/vim-easy-align'
      xmap ga <Plug>(EasyAlign)
      nmap ga <Plug>(EasyAlign)
  " }}}
  " python {{{
      Plug 'klen/python-mode', {'for' : 'python'}
      Plug 'jmcantrell/vim-virtualenv' , {'for': 'python'}
      Plug 'emoosx/vim-conceal'
      Plug 'hdima/python-syntax', {'for': 'python'}
  " }}}
  " Ansible-yaml {{{
      Plug 'chase/vim-ansible-yaml'
  " }}}
  " LaTeX {{{
      Plug 'lervag/vimtex'
  " }}}
  " Scala {{{
      Plug 'derekwyatt/vim-scala', {'for' : 'scala'}
  " }}}
  " OCaml {{{
      Plug 'rgrinberg/vim-ocaml'
      Plug 'def-lkb/vimbufsync'
      Plug 'def-lkb/ocp-indent-vim', { 'rtp' : 'ocp-indent-vim/' }
      let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
      execute "set rtp+=" . g:opamshare . "/merlin/vim"
      execute "helptags " . g:opamshare . "/merlin/vim/doc"
  " }}}
  " css, less {{{
      Plug 'ap/vim-css-color', {'for' : ['css', 'less', 'scss']}
      Plug 'mattn/emmet-vim', {'for' : ['htmldjango', 'html', 'liquid', 'html.handlebars']}
  " }}}
  " js {{{
      Plug 'pangloss/vim-javascript' 
      Plug 'mklabs/grunt.vim'
      Plug 'isRuslan/vim-es6'
      Plug 'mxw/vim-jsx'
  " }}}
  " git {{{
      Plug 'tpope/vim-fugitive'
      Plug 'airblade/vim-gitgutter'
      Plug 'idanarye/vim-merginal'
  " }}}
  " Utilities {{{
      Plug 'tpope/vim-repeat'               " repeating of plugin commands
      Plug 'godlygeek/tabular'               " tabular formatting
  " }}}
  " colorschemes {{{
    Plug 'flazz/vim-colorschemes'
    Plug 'altercation/vim-colors-solarized'
    Plug 'sjl/badwolf'
    Plug 'chriskempson/tomorrow-theme', { 'rtp' : 'vim/' }
    Plug 'scwood/vim-hybrid'
    Plug 'wombat256.vim'
    Plug 'Mustang2'
    Plug 'Pychimp/vim-luna'
    Plug 'baskerville/bubblegum'
    Plug 'chriskempson/base16-vim'
    Plug 'emoosx/vim-ariana'
    Plug 'ajh17/Spacegray.vim'
    Plug 'toupeira/vim-desertink'
    Plug 'jordwalke/flatlandia'
    Plug 'joshdick/onedark.vim'
    Plug 'aereal/vim-colors-japanesque'
  " }}}
  " Fancy {{{
      Plug 'kien/rainbow_parentheses.vim'
      Plug 'bling/vim-airline'
      Plug 'nathanaelkane/vim-indent-guides'
      Plug 'junegunn/goyo.vim'  "distraction free writing
      Plug 'junegunn/limelight.vim'
      autocmd User GoyoEnter Limelight
      autocmd User GoyoLeave Limelight!
      Plug 'jaxbot/semantic-highlight.vim'
      Plug 'calebsmith/vim-lambdify'
  " }}}
  " Others {{{
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-unimpaired'
    if executable('ack')
        Plug 'mileszs/ack.vim'
    endif
    Plug 'vim-scripts/scratch.vim'
    Plug 'moll/vim-bbye'      ":Bdelete
    Plug 'ntpeters/vim-better-whitespace'
    " }}}
  " Markdown {{{
    Plug 'tpope/vim-markdown'
    " }}}
  " Vimdiff {{{
    Plug 'chrisbra/vim-diff-enhanced'
  " }}}
    call plug#end()
  " }}}
filetype plugin indent on
" Leader {{{
  let mapleader = ","
  let maplocalleader = "\\"
" }}}
" Configs {{{
  if executable('lua')
    if has('gui_running')
      set regexpengine=1
    endif
  endif
  syntax enable
  set nocompatible        " leave vi-compatibility mode
  set encoding=utf-8      " unicode encoding by default
  set title               " show title in terminal
  set ttyfast
  set hidden              " buffer hidden, not closed, when abandoned
  set noexrc              " enables reading of .vimrc in the current directory
  set gdefault            " global searching as default
  set linebreak
  set showcmd
  set lisp
  set nostartofline
  set history=1000
  set visualbell          " supress audio/visual error
  set backspace=indent,eol,start
  set number
  set showmode            " show the current mode
  set mousehide           " hide the mouse pointer while typing
  set hlsearch
  set autowrite
  set autoread
  set shiftround
  set incsearch
  set showmatch
  set cursorline
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  set laststatus=2
  set report=0
  set ruler               " always show current positions along the bottom
  " set list
  " set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
  set showbreak=↪
  set updatetime=4000
  set complete=.,w,b,u,t
  set completeopt=longest,menuone,preview
" }}}
" Folding {{{
  set nofoldenable
  nnoremap <Space> za
  vnoremap <Space> za
  " Make z0 recursively open whatever top level fold we're in
  nnoremap z0 zCz0
  " Use ,z to "focus" the current fold
  nnoremap <leader>z zMzvzz
" }}}
" Case {{{
  set ignorecase
  set smartcase
" }}}
" Splits {{{
  set splitright
" }}}
" Tabs, spaces, wrapping {{{
  set expandtab
  set wrap
  set wm=2
  set ts=2
  set sts=2
  set sw=2
  set smartindent
  set autoindent
  set ci
  set formatoptions=qrn1
  set textwidth=80
  set smarttab
" }}}
" Backups {{{
  set noswapfile
  set nobackup
  set nowritebackup
  set autowriteall
" }}}
" Triggers {{{
  au VimResized * :wincmd = " resize splits when the window is resized
" }}}
" Wildmenu {{{
  set wildchar=<Tab>
  set wildmode=longest:full:list
  set wildignore+=*.o,*.pyc,.DS_Store
  set wildignore+=*.orig
  set wildignore+=*.javac,*.aux,*.out,*.toc
  set wildignore+=*.sw?,*.exe,*.dll,*.manifest
  set wildignore+=migrations
  set wildignore+=*.jpg,*.bmp,*.jpeg,*.gif,*.png
" }}}
" Navigation {{{
  " Buffers {{{
    nnoremap <C-l> gt
    nnoremap <C-h> gT
    "nnoremap gl <C-w>l
  " }}}
  " Splits {{{
    nmap gh <C-w>h
    nmap gk <C-w>k
    nmap gj <C-w>j
    nmap gl <C-w>l
  " }}}
" }}}
" Plug settings {{{"{{{
  " Neocomplete {{{
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup=1
    let g:neocomplete#enable_smart_case=1
    let g:neocomplete#sources#syntax#min_keyword_length=3
    let g:neocomplete#lock_buffer_name_pattern= '\*ku\*'
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " }}}
  " DelimitMate {{{
    let delimitMate_excluded_regions = "Comment"
    au FileType ocaml let b:delimitMate_quotes = "\""
  " }}}
  " Gundo {{{
    nnoremap <F5> :GundoToggle<cr>
  " }}}
  " NERDCommenter {{{
    map <leader>/ <plug>NERDCommenterToggle
    let g:NERDSpaceDelims=1
  " }}}
  " Syntastic {{{
    nnoremap <leader>e :Errors<cr>
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_enable_signs=1
    let g:syntastic_loc_list_height=1
    let g:syntastic_mode_map = { 'mode': 'passive',
                                \ 'passive_filetypes': ['python', 'html'] }
    let g:syntastic_javascript_checkers=['jshint']
    let g:syntastic_ocaml_checkers=['merlin']
  " }}}
  " NERDTree {{{
    nnoremap <leader>nt :NERDTree<cr>
    nnoremap <F2> :NERDTreeToggle<cr>
    let g:NERDTreeHighlightCursorline=1
    let g:NERDTreeWinSize=25
    let g:NERDTreeShowHidden=1
    let g:NERDTreeDirArrows=1
    let g:NERDTreeMinimalUI=1
    let g:NERDChristmasTree=1
    let g:NERDTreeChDirMode=2
    let g:NERDTreeHijackNetrw=1
    let g:NERDTreeIgnore=['\.pyc$']
    nnoremap <leader>ntf :NERDTreeFind<cr>
  " }}}
  " CtrlP {{{
        map <leader>p :CtrlP<cr>
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](\.git|\.hg|\.svn|build)$',
            \ 'file': '\.exe$\|\.so$\|\.javac$\|\.pyc$'
            \ }
    " }}}
  " Tagbar {{{
          nnoremap <silent> <leader>l :TagbarToggle<cr>
          let g:tagbar_foldlevel = 2
          let g:tagbar_width = 30
          let g:tagbar_type_css = {
          \ 'ctagstype' : 'Css',
              \ 'kinds'     : [
                  \ 'c:classes',
                  \ 's:selectors',
                  \ 'i:identities'
              \ ]
          \ }
    " }}}
  " Python-Mode {{{
        let g:virtualenv_stl_format = '[%n]'
        " :VirtualEnvDeactivate
        " :VirtualEnvList
        " :VirtualEnvActivate spam
        " :VirtualEnvActivate <tab>

        let g:pymode_lint_ignore = "E302,E231"
        let g:pymode_lint_cwindow = 0
        let g:pymode_lint_on_write = 1
        let g:ropevim_enable_shortcuts = 1
        let g:pymode_rope_goto_def_newwin = "vnew"
        let g:pymode_breakpoint = 1
        let g:pymode_syntax = 1
        let g:pymode_doc_bind = '<C-k>'
        let g:pymode_syntax_builtin_objs = 1
        let g:pymode_syntax_builtin_funcs = 1
        let g:pymode_rope = 0
        let g:pymode_rope_extended_complete = 0
        let g:pymode_run_key = 'R'
        let g:pymode_lint = 1       " code checking
        let g:pymode_indent = 1
        let g:pymode_rope_completion = 1
        let g:pymode_rope_complete_on_dot = 1
        let g:pymode_rope_always_show_complete_menu = 1
        let g:pymode_syntax_print_as_function = 1
        let g:pymode_lint_write = 0
        let g:pymode_syntax_all = 1

        nnoremap <leader>pr :PymodeRun<cr>
    " }}}
  " Solarized {{{
      let g:solarized_menu = 1
      if has('gui_running')
          call togglebg#map("<F6>")
      endif
  " }}}
  " Badwolf {{{
    let g:badwolf_html_link_underline = 0
    let g:badwolf_css_props_highlight = 1
  " }}}
  " RainbowParentheses {{{
    nnoremap <leader>R :RainbowParenthesesToggle<cr>
  " }}}
  " Fugitive {{{
    nnoremap <leader>gs :Gstatus<cr>
    nnoremap <leader>gw :Gwrite<cr>
  " }}}
  " Vim Git Gutter {{{
    let g:gitgutter_enabled = 1 " enable git gutter by default
    nnoremap <leader>gg :GitGutterLineHighlightsToggle<cr>
  " }}}
  " IndentGuides {{{
    let g:indent_guides_exclude_filetypes=['help', 'nerdtree', 'tagbar']
  " }}}
  " Airline {{{
      if !exists('g:airline_symbols')
        let g:airline_symbols = {}
      endif

      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#show_buffers = 1
      let g:airline#extensions#tabline#fnamemode = ':t'
  " }}}
  " }}}
  " Emmet {{{"{{{
    let g:use_emmet_complete_tag = 1
  " }}}
  " vim-javascript {{{
    let javascript_enable_domhtmlcss = 1
  " }}}"}}}"}}}
  " Filetype-specific {{{
    " General {{{
      augroup ft_general
        au!
        au FileType * setl ts=2 sts=2 sw=2 ai si
        autocmd BufWritePost * syntax enable | doautocmd filetypedetect BufRead "%"
      augroup END
    " }}}
    " C {{{
      augroup ft_c
        au!
        au FileType c setl ai cindent
        autocmd BUfNewFile,BufRead *.c set formatprg=astyle\ -T4pb
      augroup END
    " }}}
    " OCaml {{{
      augroup ft_ocaml
        au!
        au FileType ocaml setl ts=2 sts=2 sw=2 ai si
      augroup END
    " }}}
    " Python {{{
      augroup ft_python
        au!
        au FileType python setl ts=4 sts=4 sw=4 ai ci et
      augroup END
    " }}}
    " ruby {{{
      augroup ft_ruby
        au!
        au FileType ruby setl ts=2 sts=2 sw=2 ai ci
      augroup END
    " }}}
    " html {{{
      augroup ft_html
        au!
        au FileType html,jinja,htmldjango setl ts=2 si ai sts=2 sw=2 fdm=manual
        au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf
        au FileType html,jinja,htmldjango nmap <buffer> <localleader>= Vat=
      augroup END
    " }}}
    " Css, Less {{{
      augroup ft_css
        au!
        au FileType css,less setl foldmethod=marker foldmarker={,}
        au FileType css setl ts=2 sw=2 sts=2
        au FileType less setl ts=2 sw=2 sts=2
      augroup END
    " }}}
    " Js {{{
      augroup ft_js
        au!
        au FileType js setl ts=2 sts=2 sw=2 ai si
        au FileType javascript setl ts=2 sts=2 sw=2 ai si
        au FileType jquery setl ts=2 sts=2 sw=2 ai si
      augroup END
    " }}}
    " java {{{
      augroup ft_java
        au!
        au FileType java setl ts=2 sts=2 sw=2
        let java_highlight_functions="style"
        let java_allow_cpp_keywords=1
      augroup END
    " }}}
    " php {{{
      augroup ft_php
        au!
        au FileType php setl ts=2 sts=2 sw=2 si ai
      augroup END
    " }}}
    " apache {{{
      augroup ft_apache
        au!
        au FileType apache setl ts=4 sts=4 sw=4 ai si
      augroup END
    " }}}
    " vim {{{
      augroup ft_vim
        au!
        au FileType vim setlocal foldmethod=marker ts=2 sts=2 sw=2 si ai
        " au BufEnter *pentadactylrc set foldmethod=marker ts=2 sts=2 sw=2 syn=vim ft=vim
      augroup END
    " }}}
    " markdown {{{
      augroup ft_markdown
        au!
        au FileType markdown setl ts=2 sts=2 sw=2 fo-=t
        " autocmd BufEnter *.markdown setlocal wrap fo-=t spell cc=""
      augroup END
    " }}}
    " ruby {{{
      augroup ft_ruby
        au!
        au BufRead,BufNewFile Vagrantfile set filetype=ruby
      augroup END
    " }}}
    " json {{{"{{{
      augroup ft_json
        au!
        autocmd BufRead,BufNewFile *.json set ft=javascript
      augroup END
    " }}}
    " make {{{
      augroup ft_make
        au!
        au FileType make setl noexpandtab
      augroup END
    " }}}"}}}
  " }}}
" Environment (GUI/Console) {{{
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

syntax enable
set background=dark
set colorcolumn=""
if has('gui_running')
    if has('gui_macvim')
      set guifont=Input\ Mono\ Condensed:h15
      colorscheme base16-paraiso
      set bg=dark
      set lsp=3
      set transparency=3
      set fuopt+=maxhorz
      set fuopt+=maxvert
      set nofu
      set macmeta
    elseif has('gui_gtk')
      set guifont=Monospace\ 11
    elseif has('gui_win32')
      echo ":("
    endif
    set guioptions-=T
    set guioptions-=L
    set guioptions-=M
    set guioptions-=r
    highlight SpellBad term=underline gui=undercurl guisp=Orange
else
    set t_Co=256
    colorscheme solarized
endif
" }}}
" Utlitiy Functions {{{
    " Relative Number {{{
    function! g:ToggleRelativeNumber()
        if &relativenumber
            setlocal relativenumber
        else
            setlocal number
        endif
    endfunction
    nnoremap <silent> <f1> :call g:ToggleRelativeNumber()<cr>
    " }}}
  " Toggle Indicators {{{
  " We'll use &number and &relativenumber (mutually eclusive) as proxies for
  " the toggle state of all our preferred indicator UI
  function! ToggleIndicators()
      if (&number || &relativenumber) " turn off indicators
          let b:IndicatorNumber = 0
          let b:IndicatorRelativeNumber = 0
          let b:IndicatorCursorColumn = 0
          let b:IndicatorCursorLine = 0
          let b:IndicatorColorColumn = 0
          let b:IndicatorLastStatus = 0
          if &number
              let b:IndicatorNumber = 1
              set nonumber
          else " must be relativenumber
              let b:IndicatorRelativeNumber = 1
              set norelativenumber
          endif
          if &cursorcolumn==1
              let b:IndicatorCursorColumn = 1
              set nocursorcolumn
          endif
          if &cursorline
              let b:IndicatorCursorLine = 1
              set nocursorline
          endif
          if &colorcolumn > 0
              let b:IndicatorColorColumn = &colorcolumn
              set colorcolumn=0
          endif
          if &laststatus > 0
              let b:IndicatorLastStatus = &laststatus
              set laststatus=0
          endif
      else                            " turn on indicators
          if b:IndicatorNumber
              set number
          else " must be relativenumber
              set relativenumber
          endif
          if b:IndicatorCursorColumn
              set cursorcolumn
          endif
          if b:IndicatorCursorLine
              set cursorline
          endif
          if b:IndicatorColorColumn > 0
              exe "set colorcolumn=" . b:IndicatorColorColumn
          endif
          if b:IndicatorLastStatus > 0
              exe "set laststatus=" . b:IndicatorLastStatus
          endif
      endif
  endfunction
  nnoremap <F3> :call ToggleIndicators()<cr>
  inoremap <F3> <esc>:call ToggleIndicators()<cr>
  vnoremap <F3> <esc>:call ToggleIndicators()<cr>
  " }}}
  " Swapping Split Screens {{{

  function! MarkWindowSwap()
      let g:markedWinNum = winnr()
  endfunction

  function! DoWindowSwap()
      "Mark destination
      let curNum = winnr()
      let curBuf = bufnr( "%" )
      exe g:markedWinNum . "wincmd w"
      "Switch to source and shuffle dest->source
      let markedBuf = bufnr( "%" )
      "Hide and open so that we aren't prompted and keep history
      exe 'hide buf' curBuf
      "Switch to dest and shuffle source->dest
      exe curNum . "wincmd w"
      "Hide and open so that we aren't prompted and keep history
      exe 'hide buf' markedBuf
  endfunction

  nnoremap <silent> <leader>mw :call MarkWindowSwap()<cr>
  nnoremap <silent> <leader>pw :call DoWindowSwap()<cr>
  " }}}
  " Auto saving VIMRC {{{
  augroup vimrcs
    autocmd!
    autocmd BufWritePost ~/Code/dotvim/vimrc source %
  augroup END
  " }}}
  " Make sure Vim returns to the same line when you reopen a file {{{
  augroup line_return
      au!
      au BufReadPost *
                  \ if line("'\"") > 0 && line("'\"") <= line("$") |
                  \   execute 'normal! g`"zvzz"' |
                  \ endif
  augroup END
  " }}}
" Convenience Mappings {{{
  " Toggle CursorColumn  {{{
    nnoremap <F4> :set invcursorcolumn<cr>
  " }}}
  " Escape {{{
    imap kj <esc>
    imap jj <esc>
  " }}}
  " Previous/next buffers {{{
    map <M-D-Left>  :bp<cr>
    map <M-D-Right> :bn<cr>
  " }}}
  " Fast scrolling {{{
    nnoremap <C-e>  3<C-e>
    nnoremap <C-y>  3<C-y>
    nnoremap J 5j
    nnoremap K 5k
    xnoremap J 5j
    xnoremap K 5k
  " }}}
  " easier moving of code blocks {{{
    vnoremap < <gv
    vnoremap > >gv
  " }}}
  " Stop using the arrow keys {{{
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> :bprev<cr>
    nnoremap <right> :bnext<cr>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
  " }}}
  " Quick editing {{{
    nnoremap <leader>rc :tabnew ~/code/dotvim/vimrc<cr>
    nnoremap <leader>zsh :tabnew ~/.zshrc<cr>
  " }}}
  " Search {{{
    nmap <leader>s  :%s/
    vmap <leader>s  :%s/
    nnoremap / /\v
    vnoremap / /\v
    nnoremap <leader>y  :nohls<cr>
  " }}}
" }}}

  " Make Y consistent with D and C
  map Y y$

  " toggle spell-checking
  map <f7> :setlocal spell!<cr>

  nnoremap j gj
  nnoremap k gk
  xnoremap j gj
  xnoremap k gk
" }}}