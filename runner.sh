#!/bin/bash

process_files() {
    local dir="$1"
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            process_files "$file"
        elif [ -f "$file" ]; then
            echo "Processing file: $file"
            if [[ $(file --mime-type -b "$file") == application/octet-stream ]]; then
                echo "$file is a binary file"
            else
                echo "$file is not a binary file"
            fi
        fi
    done
}

if [ -z "$1" ]; then
    echo "Usage: $0 <путь до верхней папки>"
    exit 1
fi

process_files "$1"

