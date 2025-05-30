#!/usr/bin/env fish

# This Fish shell function imports all WireGuard .conf files from a specified
# Prerequisites:
#   - WireGuard kernel module installed (e.g., wireguard-dkms on Arch).
#   - NetworkManager with WireGuard support.
#   - Your .conf files generated and placed in CONFIG_DIR.

function import_mullvad_wg --description "Import Mullvad WireGuard configs into NetworkManager"
    # Define the directory where your Mullvad WireGuard config files are located
    set -l CONFIG_DIR /etc/wireguard # Default for mullvad-wg.sh

    # Check if the directory exists
    if not test -d "$CONFIG_DIR"
        echo (set_color red)"Error:" (set_color normal)"Configuration directory '$CONFIG_DIR' not found."
        echo "Please ensure your Mullvad config files are in this directory, or update the CONFIG_DIR variable within the function."
        return 1
    end

    echo (set_color blue)"Starting import of WireGuard configs from '$CONFIG_DIR'..."(set_color normal)

    # Change to the config directory for easier looping
    # 'or begin ... end' is Fish's equivalent of '|| { ...; exit 1; }' for functions
    cd "$CONFIG_DIR"; or begin
        echo (set_color red)"Failed to change directory to $CONFIG_DIR. Exiting."(set_color normal)
        return 1
    end

    # Loop through all .conf files in the directory
    for config_file in *.conf
        # Check if the file actually exists (handles cases where no .conf files are found)
        if test -f "$config_file"
            # Extract the connection name by removing the .conf extension
            # basename is a clean way to get the filename without the extension
            set -l connection_name (basename "$config_file" .conf)

            echo (set_color cyan)"--- Importing $config_file as connection: $connection_name ---"(set_color normal)

            # Import the WireGuard connection
            # 'sudo' is crucial here as NetworkManager configuration requires root privileges
            # and config files are often root-owned.
            if sudo nmcli connection import type wireguard file "$config_file"
                echo (set_color green)"Successfully imported $connection_name."(set_color normal)

                # Optional: Set autoconnect to no if you don't want them to connect automatically on boot
                # This is highly recommended for many connections to prevent system overload at boot.
                if sudo nmcli connection modify "$connection_name" autoconnect no
                    echo (set_color yellow)"Set $connection_name to not autoconnect."(set_color normal)
                else
                    echo (set_color red)"Warning: Failed to set autoconnect for $connection_name."(set_color normal)
                end

                # Optional: Set connection permissions for the current user
                # This allows managing the VPN via the KDE GUI without constant password prompts.
                # 'id -nu' gets the current username.
                set -l current_user (id -nu)
                if sudo nmcli connection modify "$connection_name" connection.permissions "user:$current_user"
                    echo (set_color yellow)"Set permissions for $connection_name for user: $current_user."(set_color normal)
                else
                    echo (set_color red)"Warning: Failed to set permissions for $connection_name."(set_color normal)
                end
            else
                echo (set_color red)"Error: Failed to import $config_file."(set_color normal)
            end
            echo "" # Add a blank line for readability between imports
        end
    end

    echo (set_color blue)"Import process complete."(set_color normal)
    echo "You can now list connections with: "(set_color brgreen)"nmcli connection show"(set_color normal)
    echo "And manage them via the KDE Plasma NetworkManager applet."
end
