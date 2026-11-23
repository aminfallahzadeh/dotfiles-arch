return {
	{
		"milanglacier/minuet-ai.nvim",
		lazy = false,
		config = function()
			require("minuet").setup({
				-- notify = "debug", -- Prints HTTP errors, timeouts, and responses to :messages
				request_timeout = 60, -- Increase from default 3s so cold-loading doesn't abort
				-- throttle = 1000, -- Prevent spamming local GPU on every keystroke
				-- debounce = 400,
				provider = "openai_fim_compatible",
				n_completions = 1,
				-- context_window = 512,

				context_window = 768,

				provider_options = {
					openai_fim_compatible = {
						api_key = "TERM",
						name = "Ollama",
						end_point = "http://localhost:11434/v1/completions",
						model = "qwen2.5-coder:7b",
						-- model = "qwen2.5-coder:14b",
						optional = {
							max_tokens = 40,
							top_p = 0.9,
						},
					},
				},

				virtualtext = {
					auto_trigger_ft = { "*" },
					keymap = {
						accept = "<S-Tab>",
						accept_line = "<A-a>",
						accept_n_lines = "<A-z>",
						prev = "<A-[>",
						next = "<A-]>",
						dismiss = "<A-e>",
					},
				},
			})
		end,
	},
}
