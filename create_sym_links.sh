#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists() {
    PATH_SRC=$1
    PATH_DST=$2
    echo "Attempting to create symlink from $PATH_SRC to $PATH_DST"
    if [ ! -f $PATH_DST ] && [ ! -d $PATH_DST ]; then
        echo "Creating..."
        ln -s $PATH_SRC $PATH_DST
    else
        echo "File/Directory found at $PATH_DST"
        echo "Won't do anything."
    fi
    echo ""
}

create_symlink_if_not_exists "/home/volt/volt_configs/i3-config/i3/config" "/home/volt/.config/i3/config"
