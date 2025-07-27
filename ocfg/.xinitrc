#!/usr/bin/env bash

# start wm
picom --config /dev/null --backend xrender --experimental-backends &
slstatus &

# start tray services
qui-domains &
qui-disk-space &
qui-updates &
qui-clipboard &
qui-devices &
pasystray &
qvm-run sys-net 'bash -c "nm-applet &"'

# start xfce4 and other services (why not I like some of that crap)
xdg-user-dirs-update
/usr/libexec/at-spi-bus-launcher --launch-immediately &
xfce4-notifyd &
xfce4-power-manager &
xscreensaver --no-splash &
# start dwm
exec dwm
