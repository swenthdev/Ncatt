return {
  {
    "tpope/vim-fugitive",
    -- EN: Adds Git integration commands directly into Neovim (e.g., :Git, :Gdiffsplit, :Gpush).
    -- ES: Agrega comandos de integración con Git directamente en Neovim (por ejemplo, :Git, :Gdiffsplit, :Gpush).
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- EN: Loads and configures Gitsigns to display Git changes (additions, modifications, deletions)
      --     as signs in the sign column.
      -- ES: Carga y configura Gitsigns para mostrar los cambios de Git (adiciones, modificaciones, eliminaciones)
      --     como signos en la columna lateral.
      require("gitsigns").setup()
    end,
  }
}

