if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval $(dbus-launch --exit-with-session --sh-syntax)
fi
systemctl --user import-enviroment DISPLAY XAUTHORITY

if command -v dbus-update-activation-enviroment >/dev/null 2>&1; then
	dbus-update-activation-enviroment DISPLAY XAUTHORITY
fi

exec dwm
