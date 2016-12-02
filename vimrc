"================

" VIM Configure

"================

"

" :Author: xiehuc@gmail.com

"



set encoding=utf-8



"================

" gvim configuration

" ===============

if has('gui_running')

" menu language

   set langmenu=zh_CN.utf-8

" hide toolbar

   set guioptions-=T

endif



set path+=/usr/local/include:include

"tags

set tags+=tags

set tags+=~/.vim/tags/systags

set tags+=~/.vim/tags/linuxtags

set tags+=~/.vim/tags/cpp



set diffopt=vertical



" With a map leader it's possible to do extra key combinations

" like <leader>w saves the current file

let mapleader = ","

let g:mapleader = "," 



if has('unix')

   let s:uname = system('uname -s')

   " remove last non-ascii

   let s:uname = s:uname[:len(s:uname)-2]

endif

let APPLE= s:uname == "Darwin"



"---------------------

" Vundle Plugin

"---------------------
filetype plugin indent on "added by hs


let iCanHazVundle=1

let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')

if !filereadable(vundle_readme)

   echo "Installing Vundle.."

   echo ""

   silent !mkdir -p ~/.vim/bundle

   silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

   let iCanHazVundle=0

endif



set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()



Plugin 'gmarik/Vundle.vim'



Plugin 'xiehuc/vim-files'

Plugin 'Tagbar'

nmap <silent> <F4> :TagbarToggle<CR>

let g:tagbar_ctags_bin = 'ctags'

let g:tagbar_width = 30



Plugin 'ervandew/supertab'

set completeopt=longest,menuone

let g:SuperTabLongestEnhanced = 1 "conflict with riv

let g:SuperTabLongestHighlight = 1

let g:SuperTabDefaultCompletionType = 'context'



Plugin 'Rip-Rip/clang_complete'
", {'pinned':2}

let g:clang_use_library=1

let g:clang_auto_select=1

let g:clang_auto_complete=0

let g:clang_snippets=1

let g:clang_complete_macros=1

let g:clang_complete_patterns=0

let g:clang_complete_copen=1

let g:clang_jumpto_back_key='<C-O>'

if filereadable("/usr/lib/x86_64-linux-gnu/libclang.so.1")

   let g:clang_library_path="/usr/lib/x86_64-linux-gnu/libclang.so.1"

endif

au Filetype c,cpp let g:SuperTabContextDefaultCompletionType='<c-x><c-u>'

if APPLE

   let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

endif

"Bundle 'Shougo/neocomplcache.vim'

"let g:neocomplcache_enable_smart_case = 1

"let g:neocomplcache_disable_auto_complete = 1

"if &filetype != "c" || &filetype != "cpp"

"    let g:neocomplcache_enable_at_startup = 1

"endif

Plugin 'a.vim'

map <leader>a :A<cr>

Bundle 'The-NERD-tree'

Bundle 'jistr/vim-nerdtree-tabs'

nmap <silent> <F2> :NERDTreeTabsToggle<CR>

Plugin 'tpope/vim-fugitive'

let g:fugitive_git_executable = 'LANG=C git'

Plugin 'bling/vim-airline'

let g:airline_powerline_fonts=1

let g:airline#extensions#whitespace#enabled=0

"let g:airline_theme='powerlineish'

if APPLE

   "let g:airline_powerline_fonts=1

   let g:airline_left_sep=' '

   let g:airline_right_sep=' '

   let g:airline_left_alt_sep=' '

   let g:airline_right_alt_sep=' '

end

set laststatus=2

"fast find file

Bundle 'ctrlp.vim'

let g:ctrlp_custom_ignore = '\v[\/]build$'

Bundle 'jansenm/vim-cmake'

"Bundle 'Indent-Guides'

"Bundle 'Align'

Plugin 'godlygeek/tabular'

Bundle 'LaTeX-Box'

let g:LatexBox_latexmk_options="-xelatex"

au Filetype tex nmap <leader>m :Latexmk<cr>

Bundle 'xaizek/vim-inccomplete'

let g:inccomplete_showdirs = 1

let g:inccomplete_addclosebracket = "never"

Bundle 'gobgen'

"glib object generate"

Plugin 'davidhalter/jedi-vim'

let g:jedi#auto_vim_configuration = 0

let g:jedi#use_tabs_not_buffers = 0

let g:jedi#completions_command = '<C-x>'

"au FileType python let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

Bundle 'altercation/vim-colors-solarized'

let g:solarized_termcolors=256

Plugin 'Rykka/riv.vim', {'pinned':1}

Plugin 'Rykka/InstantRst'

let g:instant_rst_slow=1

let g:instant_rst_bind_scroll=0

let g:instant_rst_localhost_only=1

let g:instant_rst_browser='chromium'

Plugin 'EdJoJob/llvmir-vim'

Plugin 'thinca/vim-ref'

"Plugin 'jaxbot/github-issues.vim'

Plugin 'google/vim-maktaba'

Plugin 'google/vim-codefmtlib'

Plugin 'google/vim-codefmt'

autocmd FileType c let b:codefmt_formatter = 'clang-format'

autocmd FileType rst let b:codefmt_formatter = 'autopep8'

Plugin 'google/vim-glaive'



Plugin 'rsmenon/vim-mathematica'

let g:mma_candy = 1

au Filetype mma let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'



Plugin 'mileszs/ack.vim'

if executable('ag')

  let g:ackprg = 'ag'

endif



Plugin 'aperezdc/vim-template'

let g:templates_no_autocmd = 1

let g:username = 'xiehuc'

let g:email = 'xiehuc@gmail.com'

let g:license = 'GPL'



if APPLE

   Plugin 'rizzatti/funcoo.vim'

   Plugin 'rizzatti/dash.vim'

else

   Plugin 'Keithbsmiley/investigate.vim'

   let g:investigate_command_for_python = '^i!zeal --query python:^s 1>/dev/null &'

   let g:investigate_command_for_cpp='^i!zeal --query c++:^s 1>/dev/null &'

   let g:investigate_command_for_cmake='^i!zeal --query cmake:^s 1>/dev/null&'

   let g:investigate_command_for_bash='^i!zeal --query bash:^s 1>/dev/null&'

   let g:investigate_command_for_sh='^i!zeal --query bash:^s 1>/dev/null&'

endif



"--------------------------

" Platform Specialized

"--------------------------



"if APPLE

"   " ### 输入法相关 ###

"   set imdisable

"   set imactivatekey=D-space

"   set imsearch=0

"   autocmd! InsertLeave * set imdisable|set iminsert=0

"   autocmd! InsertEnter * set noimdisable|set iminsert=2

"   autocmd! InsertEnter * set noimdisable|set iminsert=0

"endif

if APPLE

   if has("gui_running")

      set imdisable

      au InsertEnter * set noimd

      au InsertLeave * set imd

   else

      " "Plugin 'ybian/smartim'

      "Plugin 'hongqn/vim-osx-ime'

   end

   "autocmd! InsertLeave * set imdisable|set iminsert=0

   "autocmd! InsertEnter * set noimdisable|set iminsert=0

else

   "Bundle 'fcitx.vim'

   ":set timeout timeoutlen=1000 ttimeoutlen=100

end



if iCanHazVundle == 0

   echo "Installing Bundles, please ignore key map error messages"

   echo ""

   :PluginInstall

endif



call vundle#end()



" settings for Plugin xiehuc/vim-files

set makeprg=~/.vim/bundle/vim-files/maker

set formatoptions=tcqlnmM

colorscheme lucius_dark

if has("gui_running")

   if APPLE

      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13

   else

      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11

   endif

else

   set t_Co=256

endif



" settings for Plugin glaive

 call glaive#Install()



" settings for Plugin vim-codefmt

 Glaive codefmt plugin[mappings]

 if filereadable("/usr/bin/clang-format-3.5")

    Glaive codefmt clang_format_executable="clang-format-3.5"

 endif





"-------------------------

" General Option

"-------------------------



syntax enable on " open syntax support

filetype plugin indent on " open filetype support

set autoindent cindent " indent settings





set expandtab

set ignorecase "查询时忽略大小写

set number

set tabstop=3

set softtabstop=3

set shiftwidth=3

set showmatch

set nu

set hidden "support undo history keep after change file

set wildmenu

set autoread " Set to auto read when a file is changed from the outside

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

set mat=2 "How many tenths of a second to blink

set directory=/var/tmp,/tmp "set swap file directory



" Fast saving

nmap <leader>w :w!<cr>

"sudo write

nmap <leader>W :w !sudo tee % <cr>  

"command! W w !sudo tee %

nmap <leader>q :q!<cr>

nmap <leader>m :make!<cr>

nmap <leader>M :make! sudo install<cr>

"print line number

map <leader>li :s/^/\=line('.')-line("'<")+1/<cr>

" Fast editing of the .vimrc

map <leader>e :e! ~/.vimrc<cr>

vmap <leader>dp :diffput<cr>

vmap <leader>do :diffget<cr>



"vimrc 自动生效

au! bufwritepost .vimrc source ~/.vimrc 

au  BufNewFile,BufRead *.md   set filetype=markdown

au  BufNewFile,BufRead *.rest set filetype=rst

au  Filetype make set noexpandtab



map <F3> :call qfix#QFixToggle(0) <CR>

map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -o ~/.vim/tags/systags /usr/include /usr/local/include<CR>


