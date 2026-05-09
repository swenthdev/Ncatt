return {
  -- EN: Enables seamless navigation between Neovim and tmux panes using keybindings.
  -- ES: Permite la navegación fluida entre paneles de Neovim y tmux usando atajos de teclado.
  "alexghergh/nvim-tmux-navigation",

  config = function()
    -- EN: Load the nvim-tmux-navigation plugin with default settings.
    -- ES: Carga el plugin nvim-tmux-navigation con la configuración predeterminada.
    require('nvim-tmux-navigation').setup({})

    -- EN: Map Ctrl + h/j/k/l to move between tmux and Neovim splits.
    -- ES: Asigna Ctrl + h/j/k/l para moverse entre divisiones de tmux y Neovim.
    vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
    vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
    vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
    vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
  end,
}

