"  _   _ _____ _____     _____ __  __
" | \ | | ____/ _ \ \   / /_ _|  \/  |
" |  \| |  _|| | | \ \ / / | || |\/| |
" | |\  | |__| |_| |\ V /  | || |  | |
" |_| \_|_____\___/  \_/  |___|_|  |_|

"=================================="
"       Begin Plugins Section      "
"=================================="
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
    " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
        "{{{ PRODUCTIVITY }}}
            Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " FZF latest binary
            Plug 'junegunn/fzf.vim' " FZF
            Plug 'SirVer/ultisnips' " Code Snippets Engine
            Plug 'junegunn/goyo.vim' " Focus Mode
            Plug 'junegunn/limelight.vim' " Limelight - Additional Focus mode stuff with Goyo
            Plug 'vim-scripts/restore_view.vim' " Remember code folds and cursor position
            Plug 'vimwiki/vimwiki', { 'branch': 'dev' } " Use Vimwiki
            Plug 'lervag/vimtex' " LaTeX Line Compiling?
        "{{{ AESTHETICS }}}
            Plug 'bling/vim-airline' " Airline Status bar Vim
            Plug 'godlygeek/tabular' " Markdown Tables
            Plug 'camspiers/lens.vim' " Automatic Window Re-sizing
            Plug 'camspiers/animate.vim' " Windo Re-size Animation
        "{{{ PRACTICALITY }}}
            Plug 'tpope/vim-commentary' " T-Pope / Comment out code in a variety of langs
            Plug 'Yggdroot/indentLine' " Pretty indented lines
            Plug 'tpope/vim-surround' " T-Pope / Change surrounding tags, characters, quotes
            Plug 'airblade/vim-gitgutter' " Git code line change icons
            Plug 'vim-pandoc/vim-rmarkdown' " RMarkdown Docs in Vim
            Plug 'vim-pandoc/vim-pandoc' " RMarkdown Docs in Vim
            Plug 'vim-pandoc/vim-pandoc-syntax' " RMarkdown Docs in Vim
        "{{{ SYNTAX HIGHLIGHTING }}}
            Plug 'PotatoesMaster/i3-vim-syntax' " i3 Config Syntax highlighting
            Plug 'kovetskiy/sxhkd-vim' " sxhkd Config file syntax highlighting
            Plug 'tpope/vim-markdown' " T-Pope / For markdown fenced langs syntax highlighting
        "{{{ ICEBOX }}}
            "Plug 'terryma/vim-multiple-cursors' " Multi-cursor functionality
            "Plug 'mhinz/vim-startify' " Start screen for vim / Doesnt Work with VimWiki
            "Plug 'neoclide/coc.nvim',{'branch': 'release'} " Code Completion
            Plug 'morhetz/gruvbox' " Because Gruvbox
            "Plug 'nathanaelkane/vim-indent-guides' " Indentation guides
            "Plug 'rust-lang/rust.vim' " Full Rust language support
            "Plug 'KKPMW/vim-sendtowindow' " Sending code to terminal in vim (uses <space>hjkl)
            "Plug 'ap/vim-css-color' " Visual display hexcode colors in vim
    " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
call plug#end()
"=================================="
"             LEADER               "
"=================================="
        " ~~~~~ Set Leader Character
                let mapleader =","
"=================================="
"             SNIPPETS             "
"=================================="
    " ~~~~~ Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
    " ~~~~~ If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"
"=================================="
"          Code Folding            "
"=================================="
        " ~~~~~ Enable Tabbed Code Folding
                set foldmethod=indent
                set foldlevel=99
        " ~~~~~ Enable folding with the spacebar
                nnoremap <Space><Space> za
"=================================="
"               FZF                "
"=================================="
        " ~~~~~ Open FZF search in vim
                map <C-f> <Esc><Esc>:Files!<CR>
                inoremap <C-f> <Esc><Esc>:BLines!<CR>
                map <C-g> <Esc><Esc>:BCommits!<CR>
        " ~~~~~ Bat Preview Theme
                let $BAT_THEME = 'Solarized (dark)'
        " ~~~~~ Let FZF find hidden files and folders
                let $FZF_DEFAULT_COMMAND='find . -not -path "*/\.git*" -type f -print'
"=================================="
"          Miscellaneous           "
"=================================="
        " ~~~~~ Open files with intended programs not vim
                augroup nonvim
                   au!
                   au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
                   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
                augroup end
        " ~~~~~ Make tab go to the matching pair item
                "nnoremap <Tab> %
        " ~~~~~ Make sure wrapped lines are traversed in a non-dumb way
                nmap j gj
                nmap k gk
        " ~~~~~ Make inner change text motions extendeded (*nixcasts)
                let items = [ "<bar>", "\\", "/", ":", ".", "*", "_" ]
                for item in items
                   exe "nnoremap yi".item." T".item."yt".item
                   exe "nnoremap ya".item." F".item."yf".item
                   exe "nnoremap ci".item." T".item."ct".item
                   exe "nnoremap ca".item." F".item."cf".item
                   exe "nnoremap di".item." T".item."dt".item
                   exe "nnoremap da".item." F".item."df".item
                   exe "nnoremap vi".item." T".item."vt".item
                   exe "nnoremap va".item." F".item."vf".item
                endfor
        " ~~~~~ Check file in shellcheck:
                map <leader>s :!clear && shellcheck %<CR>
        " ~~~~~ Replace all is aliased to S.
                nnoremap S :%s//g<Left><Left>
        " ~~~~~ Black hole registry https://bit.ly/2WARts6
                nnoremap c "_c
        " ~~~~~ DIFF-ing in Vim
                nnoremap <leader>d :windo diffthis<CR>
                nnoremap <leader>D :windo diffoff<CR>
        " ~~~~~ Turns off highlighting on the bits of code that are changed,
        " ~~~~~ so the line that is changed is highlighted but the actual text
        " ~~~~~ that has changed stands out on the line and is readable.
                if &diff
                    highlight! link DiffText MatchParen
                endif
        " ~~~~~ Additional Options
            "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            "                       GRUVBOX THINGS
            "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                "let g:airline_theme='gruvbox'
                "let g:gruvbox_contrast_dark='hard'
                "let g:gruvbox_italicize_strings=1
                "colorscheme gruvbox
                "set background=dark " Use colors that suit a dark background
            "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                set background=light " Use colors that suit a dark background
                set wildmenu " Tab through menu lists
                set backspace=indent,eol,start " Allow backspacing over these items
                set conceallevel=0 " Dont hide my shit
                set nobackup " Do not mak backup files and clog up the works
                set noswapfile " Dont use swap files, they're annoying
                set go=a " Hide GuiOptions
                set mouse=a " Enable mouse usage
                set nohlsearch " disable search highlighting
                set clipboard=unnamed,unnamedplus " Allow copied vim text to also be added to clipboard
                set nospell " When on spell checking will be done
                set nocompatible " Dont worry about VI compatability, do yo thang
                set encoding=utf-8 " Use an encoding that supports unicode.
                set fileencoding=utf-8 " Set file encoding
                set number relativenumber " line numbers and relative line numbers
                set tabstop=4 " The width of a TAB is set to 4.
                set shiftwidth=4 " Indents will have a width of 4
                set softtabstop=4 " Sets the number of columns for a TAB
                set expandtab " Expand TABs to spaces
                set wildmode=longest,list,full " Enable autocompletion:
                set autoindent " New lines inherit indentation of preceding lines
                set scrolloff=10 " keep at least 5 lines above/below
                set ignorecase " search ignoring case
                "set cursorline " show me what line im on
                "filetype indent on " Enable filetype-specific indenting
                filetype plugin on " File type detection
                syntax on " Turn on syntax highlighting
        " ~~~~~ This maps CTRL-C to T-popes commentary for commenting out code
                map <C-c> gcc
        " ~~~~~ Mark the 81st and greater columns with obnoxious red
                "autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg','\%>120v.\+',-1) "Breaks fzf's display
                highlight ColorColumn ctermbg=grey
                call matchadd('ColorColumn','\%81v',100)
        " ~~~~~ Highlight white space and tab characters
                exec "set listchars=tab:\u00B7\u00B7,trail:\u2423,nbsp:~"
                set list
        " ~~~~~ Highlight trailing whitespace with RED
                autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
                autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
                highlight EOLWS ctermbg=red guibg=red
                "nmap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>
        " ~~~~~ Turn off arrow keys in ALL modes
                "noremap <up> <nop>
                "noremap <down> <nop>
                "noremap <left> <nop>
                "noremap <right> <nop>
                "inoremap <up> <nop>
                "inoremap <down> <nop>
                "inoremap <left> <nop>
                "inoremap <right> <nop>
                "nnoremap <up> <nop>
                "nnoremap <down> <nop>
                "nnoremap <left> <nop>
                "nnoremap <right> <nop>
                "vnoremap <up> <nop>
                "vnoremap <down> <nop>
                "vnoremap <left> <nop>
                "vnoremap <right> <nop>
        " ~~~~~ Disables automatic commenting on newline:
                autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
        " ~~~~~ Spell-check set to <leader>o, 'o' for 'orthography':
                map <leader>o :setlocal spell! spelllang=en_us<CR>
        " ~~~~~ Automatically deletes all trailing whitespace on save.
                autocmd BufWritePre * %s/\s\+$//e
        " ~~~~~ When shortcut files are updated, renew bash and vifm configs:
                autocmd BufWritePost files,directories !shortcuts
        " ~~~~~ Update binds when sxhkdrc is updated.
                autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
        " ~~~~~ Run xrdb whenever Xdefaults or Xresources are updated.
                autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
        " ~~~~~ Save file as sudo on files that require root permission
                cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
        " ~~~~~ Navigating with guides
                inoremap <leader><leader> <Esc>/<++><CR>"_c4l
                vnoremap <leader><leader> <Esc>/<++><CR>"_c4l
                map <leader><leader> <Esc>/<++><CR>"_c4l
        " ~~~~~ Ensuring Some filetypes are read as they should be
                autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
                autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
                autocmd BufRead,BufNewFile *.tex set filetype=tex

                autocmd Filetype Rmd inoremap <tab> <Esc>:UltiSnipsExpandTrigger<CR>
"=================================="
"           LimeLight              "
"=================================="
        " ~~~~~ Color name (:help cterm-colors) or ANSI code
                let g:limelight_conceal_ctermfg = 'gray'
                let g:limelight_conceal_ctermfg = 240
        " ~~~~~ Color name (:help gui-colors) or RGB color
                let g:limelight_conceal_guifg = 'DarkGray'
                let g:limelight_conceal_guifg = '#777777'
        " ~~~~~ Default: 0.5
                let g:limelight_default_coefficient = 0.7
        " ~~~~~ Number of preceding/following paragraphs to include (default: 0)
                let g:limelight_paragraph_span = 1
        " ~~~~~ Beginning/end of paragraph
        " ~~~~~ When there's no empty line between the paragraphs
        " ~~~~~ and each paragraph starts with indentation
                let g:limelight_bop = '^\s'
                let g:limelight_eop = '\ze\n^\s'
        " ~~~~~ Highlighting priority (default: 10)
        " ~~~~~ Set it to -1 not to overrule hlsearch
                let g:limelight_priority = -1
        " ~~~~~ Integration with goyo
                autocmd! User GoyoEnter Limelight
                autocmd! User GoyoLeave Limelight!
"=================================="
"           File Explorer          "
"=================================="
        " ~~~~~ Open netrw
                map <leader>n :Vexplore<CR>
                let g:netrw_liststyle = 3
"=================================="
"       Split Management           "
"=================================="
        " ~~~~~ Splits open at the bottom and right, this is best in life
                set splitbelow splitright
        " ~~~~~ Shortcutting split navigation, saving a keypress:
                map <C-h> <C-w>h
                map <C-j> <C-w>j
                map <C-k> <C-w>k
                map <C-l> <C-w>l
        " ~~~~~ Open new splits in a semantic way (tip from *nixcasts)
                nnoremap c<C-h> :lefta vsp new<CR>
                nnoremap c<C-j> :bel sp new<CR>
                nnoremap c<C-k> :abo sp new<CR>
                nnoremap c<C-l> :rightb vsp new<CR>
        " ~~~~~ Closing splits in a sane way
                nnoremap <C-q> :q<CR>
                nnoremap <S-Q> :only<CR>
        " ~~~~~ Open my bibliography file in split
                map <leader>B :vsp<space>$BIB<CR>
"=================================="
"       Document Compiling         "
"=================================="
        " ~~~~~ Compile document, be it groff/LaTeX/markdown/etc.
                map <leader>c :w! \| !compiler <c-r>%<CR>
        " ~~~~~ Turn on Autocompiler mode
                map <leader>a :!setsid autocomp % &<CR>
        " ~~~~~ Open corresponding .pdf/.html or preview
                map <leader>p :!opout <c-r>%<CR><CR>
        " ~~~~~ Cleans out tex build files when I close out of a .tex file.
                autocmd VimLeave *.tex !texclear %
        " ~~~~~ Maps the typical auto compiler key to \o which calles the
        " ~~~~~ Vim Live Latex preview function for live preview
                autocmd FileType tex map <leader>a \o
"=================================="
"             VIM WIKI             "
"=================================="
    " ~~~~~ Ensure files are read as what I want in vimwiki:
        let g:vimwiki_global_ext = 0
        let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
        let g:vimwiki_root = '~/VimWiki'
        let g:vimwiki_listsyms = '✗○◐●✓'
        let g:vimwiki_list = [
            \{'path': '~/VimWiki', 'syntax': 'markdown', 'ext': '.md'},
            \{'path': '~/VimWiki/academia', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/academia/statistics', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/social', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/spirituality', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/linux', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/css', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/bash', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/html', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/latex', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/r', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/regex', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/rust', 'syntax': 'markdown', 'ext':'.md'},
            \{'path': '~/VimWiki/tech/python', 'syntax': 'markdown', 'ext':'.md'}]
"=================================="
"              GOYO                "
"=================================="
        " ~~~~~ Goyo plugin makes text more readable when writing prose:
                map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
        " ~~~~~ Enable Goyo by default for mutt writting
        " ~~~~~ Goyo's width will be the line limit in mutt.
                autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
                autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light
                autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
                autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
"=================================="
"          Indent Guides           "
"=================================="
        " ~~~~~ Run on startup FROM nathanaelkane/vim-indent-guides
                "let g:indent_guides_enable_on_vim_startup = 1
                "let g:indent_guides_auto_colors = 0
                "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=237
                "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=238
        " ~~~~~ From Yggdroot/indentLine
                let g:indentLine_color_term = 6 " Makes the vertical bars Red from term color 1
                let g:indentLine_char_list = ['|', '¦', '┆', '┊']
                let g:indentLine_setConceal = 1
                let g:indentLine_conceallevel = 1
                let g:indentLine_concealcursor = ""
"=================================="
"        LaTeX Code Snips          "
"=================================="
        " ~~~~~ Word count:
                autocmd FileType tex map ,w :w !detex \| wc -w<CR>
"=================================="
"       Markdown Code Snips        "
"=================================="
        autocmd Filetype [rR]md,markdown inoremap <leader>s ~~~~<Space><++><Esc>F~hi
        autocmd Filetype [rR]md,markdown inoremap $ $$<Space><++><Esc>F$i
        autocmd Filetype [rR]md,markdown map <leader>w yiWi[<Esc>Ea](<Esc>pa)
        autocmd Filetype [rR]md,markdown inoremap <leader>n ---<CR><CR>
        autocmd Filetype [rR]md,markdown inoremap <leader>b ****<Space><++><Esc>F*hi
        autocmd Filetype [rR]md,markdown inoremap <leader>i __<Space><++><Esc>F_i
        autocmd Filetype [rR]md,markdown inoremap <leader>fn ^[]<Space><++><Esc>F[a
        autocmd Filetype [rR]md,markdown inoremap <leader>l [](<++>)<++><Esc>F[a
        autocmd Filetype [rR]md,markdown inoremap <leader>1 #<Space><CR><CR><++><Esc>2kA
        autocmd Filetype [rR]md,markdown inoremap <leader>2 ##<Space><CR><CR><++><Esc>2kA
        autocmd Filetype [rR]md,markdown inoremap <leader>3 ###<Space><CR><CR><++><Esc>2kA
        autocmd Filetype [rR]md,markdown inoremap <leader>4 ####<Space><CR><CR><++><Esc>2kA
        autocmd Filetype [rR]md,markdown inoremap <leader>5 #####<Space><CR><CR><++><Esc>2kA
        autocmd Filetype [rR]md,markdown inoremap <leader>6 ######<Space><CR><CR><++><Esc>2kA
        autocmd Filetype [rR]md inoremap <leader>r ```{r}<CR>```<CR><CR><++><Esc>2kO
        autocmd Filetype [rR]md inoremap <leader>p `r knitr::include_graphics("")`<Space><++><Esc>F"i
        autocmd Filetype [rR]md inoremap <leader>sub ~~<Space><++><Esc>F~i
        autocmd Filetype [rR]md inoremap <leader>sup ^^<Space><++><Esc>F^i
                "=================================="
                "        VIMWIKI Markdown Cmd's    "
                "=================================="
                        " ~~~~~ Diary Template
                                autocmd FileType markdown inoremap <leader>diary #<Space><++><CR><CR><++><CR><CR>##<Space>DevLog<CR><CR><++><CR><CR><Esc>gg
                        " ~~~~~ This is for a vim wiki note template
                                autocmd Filetype markdown inoremap <leader>note #<Space>Explain<CR><CR><CR><CR>#<Space>Documentation<CR><CR><++><CR><CR>#<Space>Code<CR><CR>```<++><CR><CR>#<Space> Documentation<CR><++><CR><CR>```<CR><CR><Esc>gg2ji
                                autocmd Filetype markdown inoremap <leader>shnote #<Space>Explain<CR><CR><CR><CR>```sh<CR><CR><++><CR><CR>```<CR><CR>#<Space>Documentation<CR><CR><++><CR><CR><Esc>gg2ji
                                autocmd Filetype markdown inoremap <leader>sh ```sh<CR><CR><CR><CR>```<Esc>2ki
                        " ~~~~~ This inputs a NOW() timestamp
                                autocmd Filetype markdown inoremap <leader>now *<CR><Esc>!!date<CR>A*<Esc>kJxA<CR><CR>

                "=================================="
                "           R Development          "
                "=================================="
                        " ~~~~~ Open terminal in split for R analysis
                                autocmd FileType *.R,*.Rmd, nnoremap <leader>t :vsp<CR>:terminal<CR>aR<CR>
