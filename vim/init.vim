"显示行号
set nu 

"高亮显示
syntax on 

"不同模式下的光标样式
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;blue\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
endif
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线
