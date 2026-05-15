-----------------------
---- LOOK AND FEEL ----
-----------------------
local colors = require("modules.colors")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,

		border_size = 1,

		col = {
			active_border = colors.border,
			inactive_border = colors.inactive,
		},

		resize_on_border = true,
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 2,
		rounding_power = 2,

		active_opacity = 0.95,
		inactive_opacity = 0.7,

		shadow = {
			enabled = true,
			range = 7,
			render_power = 3,
			color = colors.backgrounddark,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			new_optimizations = true,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})
