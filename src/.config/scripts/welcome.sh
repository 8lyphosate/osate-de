#! /bin/bash
i3-msg floating enable
i3-msg resize set 840 600
clear
fastfetch -c ~/.config/fastfetch/welcome.jsonc
echo -e "\e[3;34m  ╒╛\e[3;37m Welcome, enter the combination ' ' + '?' for help with key shortcuts.\e[3;34m │"
echo "  │                 ╒═══════════════════════════════════════════════════════╛"
bash --rcfile .bashrc2
