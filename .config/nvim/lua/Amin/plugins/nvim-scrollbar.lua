return {
	"petertriho/nvim-scrollbar",
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		require("scrollbar").setup({
			handle = {
				-- Pick a visible color for the handle
				color = mocha.surface1,
			},
			marks = {
				Search = { color = mocha.yellow },
				Error = { color = mocha.red },
				Warn = { color = mocha.peach },
				Info = { color = mocha.blue },
				Hint = { color = mocha.teal },
				Misc = { color = mocha.mauve },
			},
		})
	end,
}
