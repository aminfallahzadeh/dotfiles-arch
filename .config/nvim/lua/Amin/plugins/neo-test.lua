return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				-- require("neotest-jest")({
				-- 	jestCommand = "npx jest", -- or use "npm test --" if mapped
				-- 	jestConfigFile = "jest.config.js",
				-- }),
				require("neotest-vitest"),
			},
		})
	end,
}
