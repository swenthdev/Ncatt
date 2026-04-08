vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.background = "dark"

vim.opt.swapfile = false

-- EN: Keep window navigation separate from tmux navigation to avoid keymap conflicts.
-- ES: Mantiene la navegación entre ventanas separada de tmux para evitar conflictos de atajos.
vim.keymap.set('n', '<leader>wh', '<C-w>h', { silent = true, desc = 'Window left' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { silent = true, desc = 'Window down' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { silent = true, desc = 'Window up' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { silent = true, desc = 'Window right' })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
