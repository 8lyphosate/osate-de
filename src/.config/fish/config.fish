if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
	fastfetch -c ~/.config/fastfetch/fish-greeting.jsonc
end
starship init fish | source
