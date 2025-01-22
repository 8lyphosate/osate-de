_find() {
	xdotool search --name "$1"
}
CLASS="ncmpcpp"
IDS=$(_find $CLASS)

if [ -z "$IDS" ];
 then
    i3-msg exec "alacritty -e ncmpcpp"
 else
    i3-msg [title="ncmpcpp"] focus
fi
