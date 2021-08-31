if [ ! -e ${HOME}/.work ]; then
    exit 0
fi

# User specific aliases and functions
export DEVKIT_XFCE_VERSION=STABLE
if [ -f /ctc/devkit/v1/${DEVKIT_XFCE_VERSION}/wrappers/setup_devkit_env ]; then
        source /ctc/devkit/v1/${DEVKIT_XFCE_VERSION}/wrappers/setup_devkit_env
fi
if [ -f /ctc/devkit/v1/${DEVKIT_XFCE_VERSION}/pkgsrc/etc/profile.d/vte.sh ]; then
        source /ctc/devkit/v1/${DEVKIT_XFCE_VERSION}/pkgsrc/etc/profile.d/vte.sh
fi
export PATH=~/.local/bin:$PATH

function volov {
    if [ $# -eq 0 ]; then
        env=1.9.1
    else
        env=$1
    fi
    source /sw/gsd/volov_venv/linux64/${env}/py_envs/main/bin/activate
}

eval `keychain --eval id_rsa id_dsa 0123ABCD`
