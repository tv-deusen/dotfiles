if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

# Directory and Prompt
# set -g fish_color_cwd normal
# set -g fish_color_cwd_root normal
# set -g fish_color_user normal
# set -g fish_color_host normal

# Highlights
set -g fish_color_cancel normal
set -g fish_color_search_match --background=normal

# Load Node stuff
nvm use latest >/dev/null

# Ollama integration
bind \cL ollama_prompt
