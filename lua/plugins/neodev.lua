return {
  -- EN: LazyDev is the current replacement for neodev.nvim and improves LuaLS for Neovim configs.
  -- ES: LazyDev es el reemplazo actual de neodev.nvim y mejora LuaLS para configuraciones de Neovim.
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      -- EN: Load luv types when vim.uv is used.
      -- ES: Carga los tipos de luv cuando se usa vim.uv.
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
