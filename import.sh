#!/usr/bin/env bash

    # Checks for archlinux
    OS_INFO=$(cat /etc/os-release | grep -i 'archlinux')
    if [ "$?" -eq 0 ]; then
        pkg_srch=$(pacman -Ss | grep ${1})

        if [ "$?" -eq 0 ]; then
            sudo pacman -Syu  ${1} 2> /dev/null
        else
            exit 1
        fi
    fi

    # Checks for Ubuntu
    OS_INFO=$(cat /etc/os-release | grep -i 'Ubuntu')
    if [ "$?" -eq 0 ]; then
        pkg_srch=$(apt-get list | grep ${1})

        if [ "$?" -eq 0 ]; then
            sudo apt-get install -y ${1} 2> /dev/null
        else
            exit 1
        fi
    fi

    # Checks for fedora
    OS_INFO=$(cat /etc/os-release | grep -i 'fedora')
    if [ "$?" -eq 0 ]; then
        pkg_srch=$(yum list  | grep ${1})

        if [ "$?" -eq 0 ]; then
            sudo yum update && yum install -y ${1} 2> /dev/null
        else
            exit 1
        fi
    fi

    # Will Check for gentoo
    # OS_INFO=$(cat /etc/os-release | grep -i 'gentoo')
    # if [ "$?" -eq 0 ]; then
    #     emerge -s ${1}
    #
    #     if [ "$?" -eq 0 ]; then
    #         emerge  ${1} 2> /dev/null
    #     else
    #         exit 1
    #     fi
    # fi
