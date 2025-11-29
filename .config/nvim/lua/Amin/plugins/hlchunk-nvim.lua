return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		require("hlchunk").setup({
			chunk = {
				enable = true,
				delay = 0,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "─",
				},
				style = { { fg = mocha.mauve }, { fg = mocha.red } },
			},
		})
	end,
}
