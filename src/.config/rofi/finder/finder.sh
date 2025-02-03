#!/usr/bin/env bash

# PUT THIS FILE IN ~/.local/share/rofi/finder.sh
# USAGE: rofi -show find -modi find:~/.local/share/rofi/finder.sh

SEARCH_DIR="$HOME"  # Change this if you want to search elsewhere

# Function to get an appropriate icon for files and directories
get_icon() {
    local file="$1"

    if [[ -d "$file" ]]; then
        case "$file" in
            "$HOME") echo "user-home" ;;
            "$HOME/Documents") echo "folder-documents" ;;
            "$HOME/Downloads") echo "folder-download" ;;
            "$HOME/Pictures") echo "folder-pictures" ;;
            "$HOME/Music") echo "folder-music" ;;
            "$HOME/Videos") echo "folder-videos" ;;
            "$HOME/Desktop") echo "user-desktop" ;;
            *) echo "folder" ;;  # Default folder icon
        esac
        return
    fi

    local mime_type=$(file --mime-type -b "$file")

    case "$mime_type" in
        text/plain) echo "text-x-generic" ;;
        image/*) echo "image-x-generic" ;;
        video/*) echo "video-x-generic" ;;
        audio/*) echo "audio-x-generic" ;;
        application/pdf) echo "application-pdf" ;;
        application/zip|application/x-zip-compressed) echo "package-x-generic" ;;
        application/x-executable|application/x-sharedlib) echo "application-x-executable" ;;
        *) echo "application-x-generic" ;;  # Default fallback
    esac
}

if [ ! -z "$@" ]; then
    QUERY="$@"

    if [[ "$@" == /* ]]; then
        coproc ( xdg-open "$@" > /dev/null 2>&1 )
        exec 1>&-
        exit;
    elif [[ "$@" == \!\!* ]]; then
        echo -e "!!-- Type your search query to find files and directories\n!!-- To search again type !<search_query>\n!!-- To search parent directories type ?<search_query>\n!!-- You can print this help by typing !!"
    elif [[ "$@" == \?* ]]; then
        while read -r line; do
            icon=$(get_icon "$line")
            echo -e "$line\0icon\x1f$icon"
        done <<< "$(find "$SEARCH_DIR" -path '*/\.*' -prune -o -not -name '.*' -iname "*${QUERY#\?}*" -print)"
    else
        while read -r line; do
            icon=$(get_icon "$line")
            echo -e "$line\0icon\x1f$icon"
        done <<< "$(find "$SEARCH_DIR" -path '*/\.*' -prune -o -not -name '.*' -iname "*${QUERY#!}*" -print)"
    fi
else
    echo -e "!!-- Type your search query to find files and directories\n!!-- To search again type !<search_query>\n!!-- To search parent directories type ?<search_query>\n!!-- You can print this help by typing !!"
fi

