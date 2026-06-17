#!/bin/bash
set +e

# some env can't auto run the portal, so need this
/usr/lib/xdg-desktop-portal >/dev/null 2>&1 &
/usr/lib/xdg-desktop-portal-wlr  >/dev/null 2>&1 &
/usr/lib/xdg-desktop-portal-gtk >/dev/null 2>&1 &


systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &


# Wallpaper
waypaper --restore >/dev/null 2>&1 & 

# Bar
waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css >/dev/null 2>&1 &


# Notifications
swaync -c ~/.config/mango/swaync/config.jsonc -s ~/.config/mango/swaync/style.css >/dev/null 2>&1 &

#wlsunset -T 3501 -t 3500 >/dev/null 2>&1 &

# Prevent sleeping while audio is playing
sway-audio-idle-inhibit >/dev/null 2>&1 &

# keep clipboard content - conflicts with other clipbaord managers
#wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &

# change light value and volume value by swayosd-client in keybind
swayosd-server >/dev/null 2>&1 &

#### APPLICATIONS

# bluetooth applet
blueman-applet >/dev/null 2>&1 &

# network applet
nm-applet >/dev/null 2>&1 &

# Permission authentication
/usr/lib/xfce-polkit/xfce-polkit >/dev/null 2>&1 &

# autostart tray apps
nextcloud --background >/dev/null 2>&1 &
keepassxc --minimized >/dev/null 2>&1 &
cursor-clip --daemon >/dev/null 2>&1 &





