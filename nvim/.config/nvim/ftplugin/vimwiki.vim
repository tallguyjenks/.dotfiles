"=================================="
"        VIMWIKI Markdown Cmd's    "
"=================================="
        " ~~~~~ Diary Template
                inoremap <leader>log # <++><CR><CR><++><CR><CR>## Morning Journal<CR><CR>*<CR><Esc>!!date<CR>A*<Esc>kJxA<CR><CR>### Goals<CR><CR><Esc>!!grep "\- \[ \]" ~/Documents/2020Goals.md<CR>Go<CR>#### To Work Towards My Goals Today I Will...<CR><CR><++><CR><CR>### Happenings Today?<CR><CR><++><CR><CR>### Grateful For?<CR><CR><++><CR><CR>### Thoughts?<CR><CR><++><CR><CR>## Training Log<CR><CR><++><CR><CR>## DevLog<CR><CR><++><CR><CR><Esc>gg
        " ~~~~~ This inputs a NOW() timestamp
                inoremap <leader>now *<CR><Esc>!!date<CR>A*<Esc>kJxA<CR><CR>
                inoremap <leader>goals <Esc>!!grep "\- \[ \]" ~/Documents/2020Goals.md<CR>
        " ~~~~~ This is for a vim wiki note template
                inoremap <leader>note #<Space>Explain<CR><CR><CR><CR>#<Space>Documentation<CR><CR><++><CR><CR>#<Space>Code<CR><CR>```<++><CR><CR>#<Space> Documentation<CR><++><CR><CR>```<CR><CR><Esc>gg2ji
                inoremap <leader>cnote #<Space>Explain<CR><CR><CR><CR>#<Space>Documentation<CR><CR><++><CR><CR>#<Space>Code<CR><CR>```c<CR><CR>//<Space> Documentation<CR><++><CR><CR>```<CR><CR><Esc>gg2ji
                inoremap <leader>shnote #<Space>Explain<CR><CR><CR><CR>```sh<CR><CR><++><CR><CR>```<CR><CR>#<Space>Documentation<CR><CR><++><CR><CR><Esc>gg2ji
                inoremap <leader>sh ```sh<CR><CR><CR><CR>```<Esc>2ki
                nnoremap <leader>t :Rg :
