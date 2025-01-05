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
require("lazy").setup("plugins")

vim.cmd([[set noshowmode]])

vim.opt.cursorline = true

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#CBA6F7", bg = "NONE", bold = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.cmd('echom "File saved successfully!"')
	end,
})

