# This is to install the dependencies for the i3 config (so it can work properly)


# Used in main config (doesn't come with i3 preinstalled)
sudo dnf install i3blocks rofi xset picom nitrogen -y

# Used to control monitors
sudo dnf install xrandr -y

# Used in scripts / keybinds for control
sudo dnf install brightnessctl acpi perl -y

#perl is for the battery script, as well as acpi
