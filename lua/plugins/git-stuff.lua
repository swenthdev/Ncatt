return {
  {
    "tpope/vim-fugitive",
    -- EN: Adds Git commands inside Neovim (e.g., :Git, :Gdiffsplit, :Gpush).
    -- ES: Agrega comandos de Git dentro de Neovim (por ejemplo, :Git, :Gdiffsplit, :Gpush).
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- EN: Load and configure Gitsigns to display git diff signs in the sign column.
      -- ES: Carga y configura Gitsigns para mostrar los signos de cambios de Git en la columna lateral.
      require("gitsigns").setup()

      -- EN: Keymap to preview the current hunk (changes in the current section).
      -- ES: Atajo para previsualizar el "hunk" actual (los cambios en la sección actual).
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})

      -- EN: Keymap to toggle inline blame for the current line (shows author and commit).
      -- ES: Atajo para alternar la culpa (blame) en línea de la línea actual (muestra autor y commit).
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  }
}

