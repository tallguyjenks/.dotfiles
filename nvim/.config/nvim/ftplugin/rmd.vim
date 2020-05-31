inoremap <leader>s ~~~~<Space><++><Esc>F~hi
inoremap $ $$<Space><++><Esc>F$i
map <leader>w yiWi[<Esc>Ea](<Esc>pa)
inoremap <leader>n ---<CR><CR>
inoremap <leader>b ****<Space><++><Esc>F*hi
inoremap <leader>i __<Space><++><Esc>F_i
inoremap <leader>fn ^[]<Space><++><Esc>F[a
inoremap <leader>l [](<++>)<++><Esc>F[a
inoremap <leader>1 #<Space><CR><CR><++><Esc>2kA
inoremap <leader>2 ##<Space><CR><CR><++><Esc>2kA
inoremap <leader>3 ###<Space><CR><CR><++><Esc>2kA
inoremap <leader>4 ####<Space><CR><CR><++><Esc>2kA
inoremap <leader>5 #####<Space><CR><CR><++><Esc>2kA
inoremap <leader>6 ######<Space><CR><CR><++><Esc>2kA
inoremap <leader>r ```{r}<CR>```<CR><CR><++><Esc>2kO
inoremap <leader>p `r knitr::include_graphics("")`<Space><++><Esc>F"i
inoremap <leader>sub ~~<Space><++><Esc>F~i
inoremap <leader>sup ^^<Space><++><Esc>F^i
"=================================="
"           R Development          "
"=================================="
        " ~~~~~ Open terminal in split for R analysis
                nnoremap <leader>t :vsp<CR>:terminal<CR>aR<CR>
