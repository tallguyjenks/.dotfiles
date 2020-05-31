"=================================="
"        VIMWIKI Markdown Cmd's    "
"=================================="
        " ~~~~~ Diary Template
                inoremap <leader>diary #<Space><++><CR><CR><++><CR><CR>##<Space>DevLog<CR><CR><++><CR><CR><Esc>gg
        " ~~~~~ This is for a vim wiki note template
                inoremap <leader>note #<Space>Explain<CR><CR><CR><CR>#<Space>Documentation<CR><CR><++><CR><CR>#<Space>Code<CR><CR>```<++><CR><CR>#<Space> Documentation<CR><++><CR><CR>```<CR><CR><Esc>gg2ji
                inoremap <leader>cnote #<Space>Explain<CR><CR><CR><CR>#<Space>Documentation<CR><CR><++><CR><CR>#<Space>Code<CR><CR>```c<CR><CR>//<Space> Documentation<CR><++><CR><CR>```<CR><CR><Esc>gg2ji
                inoremap <leader>shnote #<Space>Explain<CR><CR><CR><CR>```sh<CR><CR><++><CR><CR>```<CR><CR>#<Space>Documentation<CR><CR><++><CR><CR><Esc>gg2ji
                inoremap <leader>sh ```sh<CR><CR><CR><CR>```<Esc>2ki
        " ~~~~~ This inputs a NOW() timestamp
                inoremap <leader>now *<CR><Esc>!!date<CR>A*<Esc>kJxA<CR><CR>
