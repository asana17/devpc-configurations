if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    set -x PATH $PATH ~/.local/bin

    set -g bell_style none

    alias rm="trash"
    # vim alias
    alias vim='nvim'
    alias vi='nvim'

    # tmux alias
    alias tl='tmux list-sessions'
    alias ta="tmux attach-session -t"

    function tmux-on-directory
        set target_dir "."

        if test (count $argv) -ge 1
            set target_dir $argv[1]
        end

        set abs_dir (readlink -f $target_dir 2>/dev/null)

        if not test -d "$abs_dir"
            echo "Directory not found: $target_dir"
            return 1
        end

        fish -c "cd $abs_dir; tmux"
    end
    alias td="tmux-on-directory"

    functions --copy cd standard_cd

    function cd
      standard_cd $argv; and ls
    end

    set -g fish_key_bindings fish_vi_key_bindings

    # fzf options
    set -x PATH $PATH $HOME/.fzf/bin
    set -x FZF_DEFAULT_OPTS "--multi --height=60% --select-1 --exit-0 \
        --reverse --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up"

    # fzf ctrl-r options
    set -x FZF_CTRL_R_OPTS "
    --preview '
        echo {} \
        | awk \"{ sub(\\\s*[0-9]*?\\\s*, \\\"\"); gsub(\\\\n, \\\"\\n\\\"); print }\" \
        | bat --color=always --language=sh --style=plain
    '
    --preview-window 'down,40%,wrap'
    "

    # fzf ctrl-t command
    set -x FZF_CTRL_T_COMMAND "rg --files --hidden --no-heading -g '!{.git,node_modules,.rustup,.cargo,.local/share/Trash}'"
    set -x FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :200 {}' \
        --preview-window 'down,60%,wrap,+3/2,~3'"

    # fzf alt-c command
    set -x FZF_ALT_C_COMMAND "find ./ -type d \( -name '.git' -o -name 'node_modules' \) -prune -o -type d"
    set -x FZF_ALT_C_OPTS "--preview 'tree -aC -L 1 {} | head -200'"

    alias cp="cp -r"

    # online-judge-tools test. To submit, use acc s
    alias ojt='g++ main.cpp && oj t -N -d ./tests'

    alias ls='ls --color=auto'

    # fix the vi-mode newline issue in mac
    function fish_vi_cursor; end
end

set -g fish_greeting
set -U fish_history 10000
