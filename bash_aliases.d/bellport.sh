if [ ! -e ~/.work ]; then
    return 0
fi

BELLPORT_ROOT=/home/greg/src/bellport

function bellport {
    if [ $# -eq 0 ]; then
        pushd ${BELLPORT_ROOT}
        return 0
    fi

    if [ $# -eq 1 ]; then
        if [ "$1" == "listfeed" ]; then
            pushd ${BELLPORT_ROOT}/src/bp/feed
            ls -d * | egrep -v '(cpp|hpp|xml)'
            popd
        elif [ "$1" == "feed" ]; then
            pushd ${BELLPORT_ROOT}/src/bp/feed
        elif [ "$1" == "build" ]; then
            pushd ${BELLPORT_ROOT}/build
        else
            echo "Usage: bellport [listfeed|feed|build]"
            return 1
        fi
    elif [ $# -eq 2 ]; then
        if [ "$1" == "feed" ]; then
            d="${BELLPORT_ROOT}/src/bp/feed/${2}"
        elif [ "$1" == "build" ]; then
            d="${BELLPORT_ROOT}/build/src/bp/feed/${2}"
        fi

        if [ ! -d "$d" ]; then
            echo "Directory ${d} does not exist"
            return 1
        fi

        pushd ${d}
    fi
}
