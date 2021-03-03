if [ "`which flatpak 2> /dev/null`" != '' ]; then
    flatpak list | grep -q org.vim.Vim
    if [ $? -eq 0 ]; then
        alias vim='flatpak run org.vim.Vim'
        alias gvim='flatpak run org.vim.Vim -g'
    fi
fi
