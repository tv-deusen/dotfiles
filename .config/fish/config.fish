if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ""

# Use terminal's default colors
# set -g fish_color_normal normal
# set -g fish_color_command normal
# set -g fish_color_param normal
# set -g fish_color_redirection normal
# set -g fish_color_comment normal
# set -g fish_color_error normal
# set -g fish_color_escape normal
# set -g fish_color_operator normal
# set -g fish_color_end normal
# set -g fish_color_quote normal
# set -g fish_color_autosuggestion normal

# Just kidding, use tokyonight
set -x GHOSTTY_THEME tokyonight

# ┌───────────────────────────────────┐
# │ Tokyo Night Night color mapping │
# └───────────────────────────────────┘
# Base colors
set -Ux fish_color_normal #80c0caf5   # default text           :contentReference[oaicite:3]{index=3}
set -Ux fish_color_command #80c0caf5   # commands like echo     :contentReference[oaicite:4]{index=4}
set -Ux fish_color_comment #414868     # comments               :contentReference[oaicite:5]{index=5}
set -Ux fish_color_error #f7768e     # syntax errors          :contentReference[oaicite:6]{index=6}

# Prompt-specific colors
set -Ux fish_color_user #7aa2f7     # username               :contentReference[oaicite:7]{index=7}
set -Ux fish_color_host #bb9af7     # hostname               :contentReference[oaicite:8]{index=8}
set -Ux fish_color_cwd #7dcfff     # current directory      :contentReference[oaicite:9]{index=9}
set -Ux fish_color_cwd_root #e0af68     # root directory         :contentReference[oaicite:10]{index=10}

# Miscellaneous
set -Ux fish_color_redirection #bb9af7  # I/O redirections       :contentReference[oaicite:11]{index=11}
set -Ux fish_color_operator #7aa2f7  # operators (*, ~, etc.) :contentReference[oaicite:12]{index=12}
set -Ux fish_color_search_match --background=#414868 # history search match :contentReference[oaicite:13]{index=13}
set -Ux fish_color_selection --background=#414868 # text selection        :contentReference[oaicite:14]{index=14}
#
#
#

# Powershell Telemetry opt-out
set -g DOTNET_CLI_TELEMETRY_OPTOUT 1

# Highlights
set -g fish_color_cancel normal
set -g fish_color_search_match --background=normal

# Load Node stuff
nvm use latest >/dev/null

# Ollama integration
function oai
    ollama_query
end
bind \cO oai

# Cargo bins
fish_add_path /home/user/.cargo/bin/

# local bins
fish_add_path /home/user/.local/bin/

# Copy to clipboard
alias cpc fish_clipboard_copy

set -gx CRYPTOGRAPHY_OPENSSL_NO_LEGACY 1

set -x GPG_TTY $(tty)

set -x CS_ACCESS_TOKEN "NzY0OTA-MjAyNi0wNS0yN1QxOTo0MjoyMg-I3siY2xpLmFjY2VzcyJ9.Ss0o1wXUZ2UEf53acwngH7ps4nscklJWrvcCra9dZj8"
set -x CRABBIT_API_TOKEN cr-b10bc9275453988734f698c8f084e5543f6b50ac53465ea34628bc9a36

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /opt/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# Created by `pipx` on 2025-05-26 20:54:34
set PATH $PATH /home/user/.local/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/user/.lmstudio/bin
# End of LM Studio CLI section

