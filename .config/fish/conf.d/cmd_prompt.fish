function fish_prompt
    set -l last_status $status

    # Use Tokyo Night Night colors
    set -l ansi_1 f7768e   # Error / Red         :contentReference[oaicite:9]{index=9}
    set -l ansi_2 c3e88d   # Success / Green     :contentReference[oaicite:10]{index=10}
    set -l ansi_3 ffc777   # Warning / Yellow    :contentReference[oaicite:11]{index=11}
    set -l ansi_4 7aa2f7   # Info / Blue         :contentReference[oaicite:12]{index=12}
    set -l ansi_5 bb9af7   # Magenta             :contentReference[oaicite:13]{index=13}
    set -l ansi_6 7dcfff   # Cyan                :contentReference[oaicite:14]{index=14}
    set -l ansi_7 c0caf5   # White / Text        :contentReference[oaicite:15]{index=15}
    set -l ansi_8 414868   # Dark Gray / Divider :contentReference[oaicite:16]{index=16}

    set -l retc $ansi_1
    test $last_status = 0; and set retc $ansi_2

    # Git prompt customization (colors now from Tokyo Night)
    set -g __fish_git_prompt_color_branch       $ansi_2
    set -g __fish_git_prompt_color_dirtystate   $ansi_3
    set -g __fish_git_prompt_color_stagedstate  $ansi_5
    set -g __fish_git_prompt_color_invalidstate $ansi_1
    set -g __fish_git_prompt_color_untrackedfiles $ansi_6
    set -g __fish_git_prompt_color_cleanstate   $ansi_2
    set -g __fish_git_prompt_char_stateseparator " $ansi_8│"

    # User and host colors
    set -l user_color $ansi_3
    if functions -q fish_is_root_user; and fish_is_root_user
        set user_color $ansi_1
    end

    set -l host_color $ansi_4
    if test -n "$SSH_CLIENT"
        set host_color $ansi_6
    end

    # Top line
    echo -n (set_color $retc)'┬─'(set_color $ansi_2)'['
    echo -n (set_color $user_color)$USER(set_color $ansi_7)@(set_color $host_color)(prompt_hostname)
    echo -n (set_color $ansi_7):(set_color $ansi_4)(prompt_pwd)(set_color $ansi_2)']'

    # Date
    echo -n (set_color $retc)'─'(set_color $ansi_2)'['(set_color $ansi_7)(date +%X)(set_color $ansi_2)']'

    # Vi-mode
    if test "$fish_key_bindings" = fish_vi_key_bindings -o "$fish_key_bindings" = fish_hybrid_key_bindings
        set -l mode
        switch $fish_bind_mode
            case default
                set mode (set_color $ansi_1)N
            case insert
                set mode (set_color $ansi_2)I
            case replace_one replace
                set mode (set_color $ansi_5)R
            case visual
                set mode (set_color $ansi_5)V
        end
        echo -n (set_color $retc)'─'(set_color $ansi_2)'['(set_color normal)$mode(set_color $ansi_2)']'
    end

    # Virtual Environment
    if set -q VIRTUAL_ENV
        echo -n (set_color $retc)'─'(set_color $ansi_2)'[V:'(set_color $ansi_5)(basename "$VIRTUAL_ENV")(set_color $ansi_2)']'
    end

    # Git
    set -l git_prompt (fish_git_prompt)
    if test -n "$git_prompt"
        echo -n (set_color $retc)'─'(set_color $ansi_2)'[G:'(set_color normal)$git_prompt(set_color $ansi_2)']'
    end

    # Battery
    if type -q acpi && acpi -a | grep -q off
        set -l bat (acpi -b | cut -d' ' -f4-)
        echo -n (set_color $retc)'─'(set_color $ansi_2)'[B:'(set_color $ansi_3)$bat(set_color $ansi_2)']'
    end

    # Jobs
    if jobs -q
        echo
        for job in (jobs)
            echo (set_color $retc)│ (set_color $ansi_3)$job
        end
    end

    # Prompt
    echo
    echo -n (set_color $retc)'╰─'(set_color $ansi_7)'$ '
    set_color normal
end

