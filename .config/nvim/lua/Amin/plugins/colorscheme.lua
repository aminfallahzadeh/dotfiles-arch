return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					keywords = { "italic" },
					loops = { "italic" },
					booleans = { "italic" },
				},
			})

			vim.cmd.colorscheme("catppuccin")

			-- trasparent plugins
			local hl = vim.api.nvim_set_hl

			hl(0, "NormalFloat", { bg = "none" })
			hl(0, "FloatBorder", { bg = "none", fg = "#89b4fa" })

			hl(0, "WhichKeyFloat", { bg = "none" })
			hl(0, "WhichKeyBorder", { bg = "none", fg = "#89b4fa" })

			hl(0, "LazyNormal", { bg = "none" })
			hl(0, "LazyBorder", { bg = "none", fg = "#89b4fa" })

			hl(0, "NoiceCmdlinePopup", { bg = "none" })
			hl(0, "NoiceCmdlinePopupBorder", { bg = "none", fg = "#89b4fa" })
			hl(0, "NoicePopup", { bg = "none" })
			hl(0, "NoicePopupBorder", { bg = "none", fg = "#89b4fa" })
			hl(0, "NoiceHover", { bg = "none" })
			hl(0, "NoiceHoverBorder", { bg = "none", fg = "#89b4fa" })

			-- LSP highlight colors
			-- hl(0, "LspReferenceRead", { bold = true, bg = "NONE", underline = true, sp = "#89b4fa" })
			-- hl(0, "LspReferenceText", { bold = true, bg = "NONE", underline = true, sp = "#89b4fa" })
			-- hl(0, "LspReferenceWrite", { bold = true, bg = "NONE", underline = true, sp = "#89b4fa" })
		end,
	},
}
