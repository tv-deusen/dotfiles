function fish_config_theme_wez_ghostty
    # ANSI Color Mapping
    set -l ansi_0 000000 # Black
    set -l ansi_1 cc5555 # Red
    set -l ansi_2 55cc55 # Green
    set -l ansi_3 cccc55 # Yellow
    set -l ansi_4 5555cc # Blue
    set -l ansi_5 cc55cc # Magenta
    set -l ansi_6 55cccc # Cyan
    set -l ansi_7 cccccc # White (light gray)
    set -l ansi_8 555555 # Bright Black (dark gray)
    set -l ansi_9 ff5555 # Bright Red
    set -l ansi_10 55ff55 # Bright Green
    set -l ansi_11 ffff55 # Bright Yellow
    set -l ansi_12 5555ff # Bright Blue
    set -l ansi_13 ff55ff # Bright Magenta
    set -l ansi_14 55ffff # Bright Cyan
    set -l ansi_15 ffffff # Bright White

    # Basic Colors
    set -g fish_color_normal $ansi_7
    set -g fish_color_command $ansi_2
    set -g fish_color_param $ansi_7
    set -g fish_color_redirection $ansi_4
    set -g fish_color_comment $ansi_8
    set -g fish_color_error $ansi_1
    set -g fish_color_escape $ansi_6
    set -g fish_color_operator $ansi_6
    set -g fish_color_end $ansi_4
    set -g fish_color_quote $ansi_3
    set -g fish_color_autosuggestion $ansi_8

    # Directory and Prompt
    set -g fish_color_cwd $ansi_4
    set -g fish_color_cwd_root $ansi_1
    set -g fish_color_user $ansi_10
    set -g fish_color_host $ansi_14

    # Highlights
    set -g fish_color_cancel $ansi_9
    set -g fish_color_search_match --background=$ansi_8

    # Optional: Set fish_prompt colors to match
    function fish_prompt
        set -l status_copy $status
        set -l cwd (prompt_pwd)

        # Set color for status indicator
        set -l status_color (set_color $ansi_1)
        if test $status_copy -eq 0
            set status_color (set_color $ansi_2)
        end

        echo -n -s $status_color "➜ " (set_color $ansi_4) "$cwd " (set_color normal)
    end
end
