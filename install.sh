#!/bin/bash

set -e

cd `dirname $0`
WD=`pwd`

function backup_file {
    fn=$1
    bfn=$2
    subdir=`dirname ${bfn}`
    mkdir -p backup/${subdir}
    mv "${fn}" backup/${bfn}
}

function install_file {
    srcfile=$1
    dstfile=$2

    if [ ! -e "${srcfile}" ]; then
        echo "${srcfile} does not exist"
        exit 1;
    fi

    if [ -d "${srcfile}" ]; then
        echo "${srcfile} is a directory"
        exit 1;
    fi

    if [[ -L "${dstfile}" ]]; then
        linkto=`readlink ${dstfile}`
        if [ "${linkto}" == "${WD}/${srcfile}" ]; then
            echo "${srcfile} already installed"
            return
        fi
        rm -f ${dstfile}
    else
        if [ -e "${dstfile}" ]; then
            backup_file "${dstfile}" "${srcfile}"
        fi
    fi

    ln -sf "${WD}/${srcfile}" "${dstfile}"
}

install_file vimrc ~/.vimrc

rm -rf ~/.vim
ln -s `pwd`/vim ~/.vim

rm -rf ~/.config/nvim
ln -s ~/.vim-config/nvim ~/.config/nvim
