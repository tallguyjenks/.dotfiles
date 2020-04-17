#!/usr/bin/env bash

#  ____                               ____    _    ____  _   _ ____   ____
# | __ ) _ __ _   _  __ _ _ __  ___  | __ )  / \  / ___|| | | |  _ \ / ___|
# |  _ \| '__| | | |/ _` | '_ \/ __| |  _ \ / _ \ \___ \| |_| | |_) | |
# | |_) | |  | |_| | (_| | | | \__ \ | |_) / ___ \ ___) |  _  |  _ <| |___
# |____/|_|   \__, |\__,_|_| |_|___/ |____/_/   \_\____/|_| |_|_| \_\\____|
#             |___/

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]$(whoami | runes)\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | runes) \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

