" Be like REPL my friend
" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%#//(#%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&&&&&&%%##%%%%/...,*(#(%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&&&%%#/,,....      ....,#%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&%#(/**,..      ../(((/*//,#%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&%%#((///*,,,...,*///*.....,.,(%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&%%%%%%%%%%%%#(*****/(####/*...(%%#(%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&%%%%#(//(#####/    .......    ,##..%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&%%%%%%%(//*,,,,.             ..(( *%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&%#####(/*,...,,.     ,..     ..**#%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&%##(**,,...*/*..      .,.  ....(#%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&%###(/**/(#(#####(,..        .*%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&%#%%%%%%%###((((((*. ...,.       .,#%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&%%###(((((((###(.  /(,. .....##%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&%####((((/**/*,..      ....,#%%%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&&&&%%%#####(*/(((##(*.    .,..#%%%%&%&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&&&&&&&&%%&%##%%####((*,.        .,...((#%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&
" &&&&&&&&&%%&&&%&&&&&####%%%%#((/,... ..,*,..../#((/(#%%&&&&&&&&&&&#%%%%%%%#&&&&&
" &&&&&&%&&&&&&&&&&&&&%#####%%%%%%%%%#(##**,...,(#####((######%&&&&&(%%%###%%&&&&&
" &###%%&&&&&&&&&&&&&&&%######%%%%%%%%%///*,..,,(#%%####(##########%%&&&&&&&&&&&&&
" %%%%%%%&&&&&&&&&&&&&&&%########%%%%%%#(*,,..,*#(%%%%#########%##%%%######%%%%&&&
"
" Run current file
nnoremap <Leader>rr :!node %<CR>
" Run current like
nnoremap <Leader>rl :exec '!node' '-e'  shellescape(getline('.'))<CR>
" Run current line, print it below it, and comment it
nnoremap <Leader>rp :exec ':r' '!node' '-e'  shellescape(getline('.'))<CR> :Commentary<CR>

let g:javascript_plugin_jsdoc = 1
"--- LIT highlighting and autclosing
let g:htl_css_templates = 1
let g:htl_all_templates = 1
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion,litHtmlRegion',
      \ 'javascript.jsx': 'jsxRegion,litHtmlRegion',
      \ 'javascript':     'litHtmlRegion',
      \ 'typescript':     'litHtmlRegion',
      \ }
