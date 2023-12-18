if [ ! -e ${HOME}/.work ]; then
    return
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/greg/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/greg/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/greg/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/greg/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate

alias seven-env="conda activate py3.10 && cd ~/src/seven/ && poetry shell"
alias seven="cd ~/src/seven"
