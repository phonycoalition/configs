if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_key_bindings fish_vi_key_bindings
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line

# Aliases
alias nala="sudo nala"
alias dpkg="sudo dpkg"
alias apt="sudo apt"
alias apt-get="sudo apt-get"
alias up="nala update && nala upgrade"
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdit="mkdir -p"
alias cat="batcat"
alias home="cd ~/main"
alias lst="exa --group-directories-first --tree --level=1 --long --header --classify"
alias lst2="exa --group-directories-first --tree --level=2 --long --header --classify"
alias ls="exa --group-directories-first --across --classify"
alias ls2="exa --group-directories-first --tree --level=2 --classify"
alias lsa="exa --group-directories-first --all --classify"

function md -d "Create a directory and set CWD"
    mkdir -p $argv
    cd $argv
end

# Starship
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/dirghayu/miniforge3/bin/conda
    eval /home/dirghayu/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/dirghayu/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/dirghayu/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/dirghayu/miniforge3/bin" $PATH
    end
end

if test -f "/home/dirghayu/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/home/dirghayu/miniforge3/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

fish_add_path $HOME/.juliaup/bin/

set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH /usr/local/texlive/2024/bin/x86_64-linux
set -x EDITOR nvim
