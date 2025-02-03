#!/bin/bash
screen_height=$(xdotool getdisplaygeometry | awk '{print $2}')
screen_width=$(xdotool getdisplaygeometry | awk '{print $1}')
threshold=5
exit_threshold=100
dock_active=false

while true; do
        mouse_y=$(xdotool getmouselocation --shell | grep Y= | cut -d'=' -f2)	
	if (( screen_height - mouse_y < threshold )) && ! $dock_active; then
	num_windows=$(wmctrl -l | wc -l)
        icon_size=38
        spacing=38
        max_width=$((num_windows * (icon_size + spacing)))

rofi -modi "window" -show "window" -name "dynamic-dock" -theme-str "
configuration {
    modi:                       'window';
    show-icons:                 true;
    window-format:		'{c}';
}

@import			'~/.config/rofi/themes/rose-pine.rasi'
@import			'~/.config/rofi/config.rasi'

* {
	font:		'Iosevka Nerd Font Bold 10';
}

/*****----- Main Window -----*****/
window {
    transparency:                'real';
    location:                    south;
    fullscreen:                  false;
    x-offset:                    0px;
    y-offset:                    -10px;
    width:			 $max_width;
    enabled:                     true;
    margin:                      0px;
    padding:                     0px;
    border:                      1px solid;
    border-color:                @foreground;
    background-color:            @background;
}

/*****----- Main Box -----*****/
mainbox {
    enabled:                     true;
    spacing:                     20px;
    margin:                      0px;
    padding:                     4px;
    border:                      0px solid;
    border-radius:               0px 0px 0px 0px;
    background-color:            transparent;
    children:                    [ 'listview' ];
}

/*****----- Listview -----*****/
listview {
    enabled:                     true;
    columns:                     10;
    flow: 			 horizontal;
    lines:                       1;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               false;

    spacing:                     4px;
    margin:                      0px;
    padding:                     0px;
    border-radius:               0px;
    border:			 0px;
    border-color:                @foreground;
    background-color:            transparent;
    text-color:                  @foreground;
    cursor:                      'default';
}

/*****----- Elements -----*****/
element {
    enabled:                     true;
    spacing:                     0px;
    margin:                      0px;
    padding:                     4px 0px;
    background-color:            transparent;
    text-color:                  @foreground;
    orientation:                 vertical;
    cursor:                      pointer;
    border:			0px 0px 2px 0px;

}
element.normal.normal {
    background-color:            transparent;
    text-color:                  @foreground;
}
element.selected.normal {
    background-color:            @trans-white;
    text-color:                  @foreground;
}
element alternate.active {
    background-color:		transparent;
    text-color:			@foreground;
    border-color:		@foreground;
}
element normal.active {
    background-color:		transparent;
    text-color:			@foreground;
    border-color:		@foreground;
}
element selected.active {
    background-color:		@trans-white;
    text-color:			@foreground;
    border-color:		@foreground;
}

element-icon {
    padding:                     0px 0px 0px 0px;
    background-color:            transparent;
    text-color:                  inherit;
    size:                        32px;
    cursor:                      inherit;
}
element-text {
    background-color:            transparent;
    text-color:                  inherit;
    highlight:                   inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.5;
}
" &
rofi_pid=$!
dock_active=true
sleep 0.1
elif (( mouse_y < screen_height - exit_threshold )) && $dock_active; then
	if [[ -n "$rofi_pid" ]]; then
		kill "$rofi_pid"
	fi
dock_active=false
	fi
	sleep 0.1
done
