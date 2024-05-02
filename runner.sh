#!/bin/bash

process_files() {
    local dir="$1"
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            process_files "$file"
        elif [ -f "$file" ]; then
            file_type=$(file "$file")
            if [[ $file_type == *ELF* ]]; then
                echo "Processing $file"
                binary-security-check -c never "$file"
            fi
        fi
    done
}

process_files "$1"


