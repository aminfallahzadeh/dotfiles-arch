hl.config({

	---------------
	---- INPUT ----
	---------------
	input = {
		kb_layout = "us,ir",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:alt_shift_toggle",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
			disable_while_typing = false,
		},
	},

	----------------
	----  MISC  ----
	----------------
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},

	------------------
	----  SCROLL  ----
	------------------
	scrolling = {
		fullscreen_on_one_column = true,
	},

	master = {
		new_status = "master",
	},

	dwindle = {
		preserve_split = true, -- You probably want this
	},
})
