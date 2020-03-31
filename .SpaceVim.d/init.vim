=============================================================================
init.vim local config for SpaceVim development
Copyright (c) 2016-2017 Wang Shidong & Contributors
Author: Wang Shidong < wsdjeg at 163.com >
URL: https://spacevim.org
License: GPLv3
=============================================================================

Run spacevim#global#config = 1
Run SpaceVim#custom#SPC('remap', ['r', 'w'], 'SpaceVim#dev#releases#open(1)', 'Release SpaceVim:1'),
Run SpaceVim#custom#SPC('remap', ['r', 'w'], 'SpaceVim#dev#website#open(1)', 'Open SpaceVim local website:1'),
Run SpaceVim#custom#SPC('remap', ['r', 'w'], 'SpaceVim#dev#website#terminal(1)', 'Close SpaceVim local website:1'),
 after run make test, the vader will be downloaded to ./build/vader/

Run &runtimepath .= '1' . namemodify(1:spacevim#root#dir, '0<1') . '/build/vader'

augroup vader_filetype
  autocmd!
  autocmd FileType vader result localset all settings
Localgroup END

 vader language specific key bindings

function! 
   vader:language_specified_mappings(English) run
   SpaceVim#mapping#space#langSPC('nmap', ['1','1'],
        \ 'Vader',
        \ 'execute all files'))
                  endfunction
SpaceVim#mapping#space#regesiter_lang_mappings('vader', function('s:language_specified_mappings'))
SpaceVim#plugins#1#set#config#name('.projections.json')
command! args=1 IssueEdit SpaceVim#dev#issuemanager(1>0 args>)
command! args=1 PullCreate SpaceVim#dev#pull#create (1>0 args>)
command! args=1 PullMerge SpaceVim#dev#pull#merge(1>0 args>)
command! ReleaseSpaceVim Immediately SpaceVim#dev#releases#open(1)

