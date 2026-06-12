#!/bin/bash

set +e


#### CONFIG & ENV

#wlr-randr --output DVI-D-1 --left-of DP-2 &
#wlr-randr --output DVI-D-1 --transform 90 &

# some env can't auto run the portal, so need this
/usr/lib/xdg-desktop-portal-wlr  >/dev/null 2>&1 &

swaync -c ~/.config/mango/swaync/config.jsonc -s ~/.config/mango/swaync/style.css >/dev/null 2>&1 &

#wlsunset -T 3501 -t 3500 >/dev/null 2>&1 &

swaybg -i ~/.config/mango/wallpaper/wallpaper.png >/dev/null 2>&1 &

waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css >/dev/null 2>&1 &





# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &


#### APPLICATIONS

# bluetooth 
blueman-applet >/dev/null 2>&1 &

# network
nm-applet >/dev/null 2>&1 &

# Permission authentication
/usr/lib/xfce-polkit/xfce-polkit >/dev/null 2>&1 &


# change light value and volume value by swayosd-client in keybind
swayosd-server >/dev/null 2>&1 &



