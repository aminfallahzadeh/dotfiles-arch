-- =============================================
-- My Neovim Config
-- OS : Arch Linux
-- Author: Amin Fallahzadeh
-- =============================================

-------------------------------------------------
-- Leader Keys
-------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------
-- Basic Keymaps
-------------------------------------------------
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-------------------------------------------------
-- General UI
-------------------------------------------------
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.ruler = true
vim.opt.background = "dark"
vim.opt.fillchars = { eob = " " }
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.winborder = "rounded"

-------------------------------------------------
-- File Explorer & Banners
-------------------------------------------------
vim.cmd("let g:netrw_banner = 0")

-------------------------------------------------
-- Encoding
-------------------------------------------------
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-------------------------------------------------
-- Line Numbers
-------------------------------------------------
vim.opt.nu = true
vim.opt.rnu = true

-------------------------------------------------
-- Indentation & Tabs
-------------------------------------------------
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-------------------------------------------------
-- Wrapping Behaviour
-------------------------------------------------
vim.opt.wrap = true
vim.opt.linebreak = true

-------------------------------------------------
-- Search Settings
-------------------------------------------------
vim.opt.ignorecase = true
vim.opt.smartcase = true

-------------------------------------------------
-- Undo / Backup / Swap
-------------------------------------------------
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wildignore:append({ "*/node_modules/*" })

-------------------------------------------------
-- Window Management
-------------------------------------------------
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-------------------------------------------------
-- Clipboard
-------------------------------------------------
vim.opt.clipboard:append("unnamedplus")

-------------------------------------------------
-- Mouse Support
-------------------------------------------------
vim.opt.mouse = "a"

-------------------------------------------------
-- Backspace Behaviour
-------------------------------------------------
vim.opt.backspace = { "start", "eol", "indent" }

-------------------------------------------------
-- Disable Auto Comment on New Line
-------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})

-------------------------------------------------
-- Highlight Fixes
-------------------------------------------------
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})

-------------------------------------------------
-- Session Options Fix (for checkhealth)
-------------------------------------------------
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"

-------------------------------------------------
-- Misc
-------------------------------------------------
vim.g.sass_variables_file = "_variables.scss"
vim.o.termbidi = true
