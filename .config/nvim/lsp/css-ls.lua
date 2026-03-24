return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = {
		"css",
		"scss",
		"less",
		"sass",
		"html",
	},
	root_markers = { "package.json", ".git" },
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
		scss = { validate = true, lint = {
			unknownAtRules = "ignore",
		} },
		less = { validate = true, lint = {
			unknownAtRules = "ignore",
		} },
	},
}
