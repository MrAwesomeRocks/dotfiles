#!/bin/bash
# -*- mode: shell-script -*-

# WARNING: Do not edit this file.
# It was generated by processing {{ yadm.source }}

echo "Installing starship!"

{% if yadm.os == "Msys" %}


# Download executable to $HOME/.local/bin
local_bin="$HOME/.local/bin"
mkdir -p "$local_bin"
cd "$local_bin"

starship_zip_download_url=$(
    curl -sL https://api.github.com/repos/starship/starship/releases/latest |
        jq -r ".assets[].browser_download_url" |
        grep "starship-x86_64-pc-windows-msvc.zip$"
)
curl -fsL "$starship_zip_download_url" -o "starship.zip" &&
    unzip -u "$starship.zip" &&
    rm "starship.zip"

{% else %}

# Use starship installer
curl -sS https://starship.rs/install.sh | sh

{% endif %}
