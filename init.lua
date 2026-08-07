local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")

-- themeswitch.sh (the Hyprland dotfiles theme switcher) regenerates this file
-- with vim.o.background / vim.g.catppuccin_flavour on every system theme change,
-- but nothing was ever loading it -- nvim's colorscheme never followed the
-- system theme. Must run before lazy.setup() so catppuccin's flavour = "auto"
-- picks it up on this very startup.
local flavor_file = vim.fn.stdpath("config") .. "/flavor.lua"
if vim.fn.filereadable(flavor_file) == 1 then
  dofile(flavor_file)
end

require("lazy").setup("plugins")

vim.cmd([[set noshowmode]])

vim.opt.cursorline = true

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#CBA6F7", bg = "NONE", bold = true })

vim.tbl_islist = vim.islist
