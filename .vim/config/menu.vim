let g:unite_source_menu_menus = {}

" Menu items for Unite commands.
let g:unite_source_menu_menus.unite = {
    \'description' : 'Unite Commands',
\}
let g:unite_source_menu_menus.unite.command_candidates = [
    \['List Files                        ,f', 'Unite -start-insert -no-split -buffer-name=files file_rec/async'],
    \['Browse Files                     ,vf', 'VimFiler'],
    \['List Buffers                      ,b', 'Unite -quick-match -auto-preview -buffer-name=buffers -no-split buffer'],
    \['Search Files                      ,s', 'Unite -auto-preview -no-split -buffer-name=search grep:.'],
    \['Show Outline                      ,o', 'Unite -start-insert -buffer-name=outline outline'],
    \['Show Lines                        ,l', 'Unite -start-insert -buffer-name=lines line'],
    \['Show Registers                    ,r', 'Unite -start-insert -buffer-name=registers register'],
    \['Show Yank History                 ,y', 'Unite -no-split -buffer-name=yank history/yank'],
    \['Show Git Conflicts                ,gc', 'Unite git-conflict'],
    \['Show Command History              ,hc', 'Unite -no-split -buffer-name=command history/command'],
    \['Show Search History               ,hs', 'Unite -no-split -buffer-name=search history/search'],
    \['Go to next result                 ,n', 'UniteNext'],
    \['Go to previous result             ,p', 'UnitePrevious'],
\]

" Menu items for Vimux commands
let g:unite_source_menu_menus.vimux = {
    \'description' : 'Vimux Commands',
\}
let g:unite_source_menu_menus.vimux.command_candidates = [
    \['Prompt Command                   ,vp', 'VimuxPromptCommand'],
    \['Run Last Command                 ,vl', 'VimuxRunLastCommand'],
    \['Close Runner                     ,vq', 'VimuxCloseRunner'],
    \['Interrupt Runner                 ,vx', 'VimuxInterruptRunner'],
\]

" Menu items for Git.
let g:unite_source_menu_menus.git = {
    \'description' : 'Git Commands',
\}
let g:unite_source_menu_menus.git.command_candidates = [
    \['Go to next hunk                   ]h', 'GitGutterNextHunk'],
    \['Go to prev hunk                   [h', 'GitGutterPrevHunk'],
    \['Stage hunk                       ,hs', 'GitGutterStageHunk'],
    \['Revert hunk                      ,hr', 'GitGutterRevertHunk'],
    \['View branch history            :Gitv', 'Gitv'],
    \['View file history             :Gitv!', 'Gitv!'],
    \['View repo status            :Gstatus', 'Gstatus'],
    \['Commit changes              :Gcommit', 'Gcommit'],
\]

" Menu items for other commands
let g:unite_source_menu_menus.other = {
    \'description' : 'Other Commands',
\}
let g:unite_source_menu_menus.other.command_candidates = [
    \['Toggle Gundo                      ,g', 'GundoToggle'],
    \['Show Task List                   ,tl', 'TaskList'],
    \['Toggle numbering                 ,tn', 'NumbersToggle'],
\]
