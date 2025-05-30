function fish_prompt
    set -l status_copy $status
    set -l cwd (prompt_pwd)

    # Set color for status indicator
    set -l status_color (set_color normal)
    if test $status_copy -eq 0
        set status_color (set_color normal)
    end

    echo -n -s $status_color "➜ " (set_color normal) "$cwd " (set_color normal)
end
