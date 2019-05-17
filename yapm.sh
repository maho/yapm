#!/bin/bash

help() {
    YAPM=$(basename $0)
    echo "usage: $YAPM [-h] [-r TYPE] <pip install args>"
    echo "yet another pip manager"
    echo "use $YAPM instead of 'pip install', and $YAPM will write just installed"
    echo "requirement to requirements/TYPE.txt, defaults requirements/base.txt"
    echo ""
    echo "this script has no power of super cow and is rather dummy. It's"
    echo "written to help you remember which packages you need in your project"

    exit 1
}

install() {
    PKG="$1"
    mkdir -p requirements
    REQFILE=requirements/$TYPE.txt
    set -e
    if [[ $PKG == git+* ]] || [[ $PKG == hg+* ]];then
        EGG=${PKG##*egg=}
        pip install -e "$PKG"
        pip freeze | grep -i egg=$EGG >> $REQFILE 
    else
        pip install "$PKG"
        pip freeze | grep -i "$PKG" >> $REQFILE
    fi
}

if [ -z "$1" ];then
    help
fi

TYPE="base"
while [ -n "$1" ];do
    case "$1" in 
        -h)
            help;;
        -r)
            shift
            TYPE="$1"
            shift
            ;;
        *)
            echo "installing $1"
            install "$1"
            shift;;
    esac
done




