-- return {
-- 	"nendix/zen.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("zen")
--
-- 		-- transparent background
-- 		local colors = require("zen.colors").get()
-- 		local palette = colors.palette
-- 		local hl = vim.api.nvim_set_hl
-- 		hl(0, "NormalFloat", { bg = "none" })
-- 		hl(0, "Normal", { bg = "none" })
-- 		hl(0, "NormalFloat", { bg = "none" })
-- 		hl(0, "SignColumn", { bg = "none" })
-- 		hl(0, "LineNr", { bg = "none" })
-- 		hl(0, "EndOfBuffer", { bg = "none" })
-- 		hl(0, "FloatBorder", { bg = "none", fg = palette.silver })
--
-- 		hl(0, "NoiceCmdlinePopup", { bg = "none" })
-- 		hl(0, "NoiceCmdlinePopupBorder", { bg = "none", fg = palette.silver })
-- 		hl(0, "NoicePopup", { bg = "none" })
-- 		hl(0, "NoicePopupBorder", { bg = "none", fg = palette.silver })
-- 		hl(0, "NoiceHover", { bg = "none" })
-- 		hl(0, "NoiceHoverBorder", { bg = "none", fg = palette.silver })
-- 	end,
-- }
-- "nendix/zen.nvim",
-- lazy = false,
-- priority = 1000,
--
-- config = function()
-- 	require("zen").setup({
-- 		variant = "dark", -- "dark" or "light"
-- 		undercurl = true,
-- 		transparent = false,
-- 		dimInactive = false,
-- 		terminalColors = true,
-- 		commentStyle = { italic = true },
-- 		functionStyle = {},
-- 		keywordStyle = { italic = true },
-- 		statementStyle = {},
-- 		typeStyle = {},
-- 		compile = false,
-- 		colors = {
-- 			palette = {}, -- override palette colors
-- 			theme = {}, -- override theme colors
-- 		},
-- 		overrides = function(colors)
-- 			return {}
-- 		end,
-- 	})
-- end,
-- vim.cmd.colorscheme("zen"),
-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		name = "catppuccin",
-- 		priority = 1000,
--
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				flavour = "mocha",
-- 				transparent_background = true,
-- 				styles = {
-- 					comments = { "italic" },
-- 					conditionals = { "italic" },
-- 					keywords = { "italic" },
-- 					loops = { "italic" },
-- 					booleans = { "italic" },
-- 				},
-- 			})
--
-- 			vim.cmd.colorscheme("catppuccin")
--
-- 			-- trasparent plugins
-- 			local hl = vim.api.nvim_set_hl
--
-- 			hl(0, "NormalFloat", { bg = "none" })
-- 			hl(0, "FloatBorder", { bg = "none", fg = "#89b4fa" })
--
-- 			hl(0, "WhichKeyFloat", { bg = "none" })
-- 			hl(0, "WhichKeyBorder", { bg = "none", fg = "#89b4fa" })
--
-- 			hl(0, "LazyNormal", { bg = "none" })
-- 			hl(0, "LazyBorder", { bg = "none", fg = "#89b4fa" })
--
-- 			hl(0, "NoiceCmdlinePopup", { bg = "none" })
-- 			hl(0, "NoiceCmdlinePopupBorder", { bg = "none", fg = "#89b4fa" })
-- 			hl(0, "NoicePopup", { bg = "none" })
-- 			hl(0, "NoicePopupBorder", { bg = "none", fg = "#89b4fa" })
-- 			hl(0, "NoiceHover", { bg = "none" })
-- 			hl(0, "NoiceHoverBorder", { bg = "none", fg = "#89b4fa" })
--
-- 			-- LSP highlight colors
-- 			-- hl(0, "LspReferenceRead", { bold = true, bg = "NONE", underline = true, sp = "#89b4fa" })
-- 			-- hl(0, "LspReferenceText", { bold = true, bg = "NONE", underline = true, sp = "#89b4fa" })
-- 			-- hl(0, "LspReferenceWrite", { bold = true, bg = "NONE", underline = true, sp = "#89b4fa" })
-- 		end,
-- 	},
-- }

return {
	"webhooked/kanso.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		-- Default options:
		require("kanso").setup({
			bold = true, -- enable bold fonts
			italics = true, -- enable italics
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = {},
			typeStyle = {},
			transparent = true, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { zen = {}, pearl = {}, ink = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			background = { -- map the value of 'background' option to a theme
				dark = "ink", -- try "zen", "mist" or "pearl" !
				light = "ink", -- try "zen", "mist" or "pearl" !
			},
			foreground = "default", -- "default" or "saturated" (can also be a table like background)
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("kanso-zen")

		-- trasparent plugins
		-- local hl = vim.api.nvim_set_hl
		-- local colors = require("kanso.colors").setup()
		-- local palette = colors.palette

		-- hl(0, "NormalFloat", { bg = "none" })
		-- hl(0, "FloatBorder", { bg = "none", fg = palette.altBlue1 })
	end,
}
