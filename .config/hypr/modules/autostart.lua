-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local home = os.getenv("HOME")
local scripts = home .. "/.config/hypr/scripts"

hl.on("hyprland.start", function()
	-- 1. Export session env to the bus (dbus-run-session already started it)
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(" wl-paste -p -t text --watch clipman store -P --histpath='~/.local/share/clipman-primary.json'")

	-- 2. Remove duplicated cursor
	hl.exec_cmd("hyprctl dispatch dpms off")
	hl.exec_cmd("sleep 1 && hyprctl dispatch dpms on")

	-- 3. Running scripts
	hl.exec_cmd("bash " .. scripts .. "/autostart/services")
	hl.exec_cmd("bash " .. scripts .. "/hyprlock")

	hl.exec_cmd("hypridle")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
end)
