let g:unite_source_menu_menus = {}

" Menu items for Unite commands.
let g:unite_source_menu_menus.unite = {
    \'description' : 'Unite Commands',
\}
let g:unite_source_menu_menus.unite.command_candidates = [
    \['List Files                        ,f', 'Unite -start-insert file_rec/async'],
    \['List Buffers                      ,b', 'Unite -quick-match -auto-preview buffer'],
    \['Search Files                      ,s', 'Unite -auto-preview grep:.'],
    \['Show Outline                      ,l', 'Unite outline'],
\]

" Menu items for Gundo Commands
let g:unite_source_menu_menus.gundo = {
    \'description' : 'Gundo Commands',
\}
let g:unite_source_menu_menus.gundo.command_candidates = [
    \['Toggle Gundo                      ,g', 'GundoToggle'],
\]

" Menu items for TaskList Commands
let g:unite_source_menu_menus.tasklist = {
    \'description' : 'TaskList Commands',
\}
let g:unite_source_menu_menus.tasklist.command_candidates = [
    \['Show Task List                   ,tl', 'TaskList'],
\]

" Menu items for Vimux commands
let g:unite_source_menu_menus.vimux = {
    \'description' : 'Vimux Commands',
\}
let g:unite_source_menu_menus.vimux.command_candidates = [
    \['Promt Command                    ,vp', 'VimuxPromptCommand'],
    \['Run Last Command                 ,vl', 'VimuxRunLastCommand'],
    \['Close Runner                     ,vq', 'VimuxCloseRunner'],
    \['Interrupt Runner                 ,vx', 'VimuxInterruptRunner'],
\]
