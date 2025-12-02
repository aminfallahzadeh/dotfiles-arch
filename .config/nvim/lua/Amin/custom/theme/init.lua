require("Amin.core.colors.dark")
require("Amin.core.colors.light")

vim.o.background = "dark"

local highlights = vim.o.background == "light" and PaletteLightHighlights or PaletteDarkHighlights

for group, opts in pairs(highlights) do
	local cmd = "highlight " .. group

	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end

	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end

	if opts.style then
		cmd = cmd .. " gui=" .. opts.style
	end

	vim.cmd(cmd)
end
