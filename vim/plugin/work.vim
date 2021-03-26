if filereadable(expandcmd("~/.work"))
    let g:ctrlp_user_command = 'find %s -regextype posix-extended -type f -regex ".*\.(cpp|hpp|py|xml)" -o -name "CMakeLists.txt"'
    if -1 != stridx(getcwd(), 'bellport')
        set mp=bpmake
    endif
else
    let g:ctrlp_custom_ignore = 'node_modules\|build'
endif
