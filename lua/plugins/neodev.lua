return {
  -- EN: Neodev enhances the Lua development experience in Neovim, especially for writing Neovim config and plugins.
  -- ES: Neodev mejora la experiencia de desarrollo en Lua dentro de Neovim, especialmente al escribir configuraciones y plugins para Neovim.
  "folke/neodev.nvim",

  config = function()
    -- EN: Initializes Neodev with default settings. This provides better autocompletion, type checking, and documentation for Neovim’s Lua API.
    -- ES: Inicializa Neodev con la configuración por defecto. Esto proporciona mejor autocompletado, verificación de tipos y documentación para la API Lua de Neovim.
    require("neodev").setup({})
  end,
}

