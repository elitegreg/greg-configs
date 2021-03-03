if [ -e /etc/bash_completion.d/git-prompt ]; then
    GIT_PROMPT_SCRIPT=/etc/bash_completion.d/git-prompt
elif [ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    GIT_PROMPT_SCRIPT=/usr/share/git-core/contrib/completion/git-prompt.sh
fi

if [ $GIT_PROMPT_SCRIPT != '' ]; then
    source $GIT_PROMPT_SCRIPT
    git='$(__git_ps1 " [git:%s]")'
else
    git=''
fi

__hg_ps1()
{
    if [ -x /usr/bin/hg ] && [ -n "$(hg root 2> /dev/null)" ]; then
        printf -- "$1" "$(hg branch)"
    fi
}

__bzr_ps1()
{
    if [ -x /usr/bin/bzr ] && [ -n "$(bzr --no-plugins root 2> /dev/null)" ]; then
        printf -- "$1" "$(bzr --no-plugins nick)"
    fi
}

hg='$(__hg_ps1 " [hg:%s]")'
bzr='$(__bzr_ps1 " [bzr:%s]")'

reset='\[\033[0m\]'
red='\[\033[1;31m\]'
green='\[\033[1;32m\]'
blue='\[\033[1;34m\]'
purple='\[\033[1;35m\]'
grey='\[\033[1;37m\]'
darkgrey='\[\033[1;30m\]'

if [ "$color_prompt" = yes ]; then
    PS1="${green}\u@\h${reset}:${blue}\w${red}${git}${hg}${bzr}${reset}\$ "
else
    PS1="\u@\h:\w${git}${hg}${bzr}\$ "
fi
