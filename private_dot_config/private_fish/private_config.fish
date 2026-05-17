# ~/.config/fish/config.fish
if not status is-interactive
    exit
end

set fish_greeting ''
# --- Name Banner ---
if not set -q TNAME
    set -gx TNAME "DedSec"   # replace with your custom name
end

# Show banner (Fish runs scripts differently; this uses your existing banner.sh if available)
#if test -f $HOME/.banner.sh
#    set cols (tput cols)
#    bash $HOME/.banner.sh $cols $TNAME
#end

# Neofetch/terminal-widgets at startup
if status is-interactive
    and not set -q SSH_TTY
    and type -q twidgets

    twidgets \
        --logo dedsec \
        --align left \
        --row-gap 1 \
        --column-gap 1 \
        --column 1 \
        --row 0 \
        --direction row \
        --margin 0 \
        --no-badge
end

# --- Aliases ---
if type -q exa
    alias l 'exa'
    alias ls 'exa'
    alias l. 'exa -d .*'
    alias la 'exa -a'
    alias ll 'exa -Fhl'
    alias ll. 'exa -Fhl -d .*'
else
    alias l 'ls --color=auto'
    alias ls 'ls --color=auto'
    alias l. 'ls --color=auto -d .*'
    alias la 'ls --color=auto -a'
    alias ll 'ls --color=auto -Fhl'
    alias ll. 'ls --color=auto -Fhl -d .*'
end

# Safety aliases
alias cp 'cp -i'
alias ln 'ln -i'
alias mv 'mv -i'
alias rm 'rm -i'

# use zoxide instead of cd
alias cd 'z'

# Force python -> python3
alias python '/usr/bin/python3'

# --- Cursor style ---
# Makes cursor a blinking underline
echo -ne "\e[4 q"

if status is-interactive
    and not set -q SSH_TTY
    zoxide init fish | source
end

# uv
if status is-interactive
    fish_add_path "/data/data/com.termux/files/home/.local/bin"
end
