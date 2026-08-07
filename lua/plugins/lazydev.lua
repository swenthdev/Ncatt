-- EN: lazydev.nvim replaces neodev.nvim (archived by its own author in favor of
--     this plugin). It gives the Lua LSP proper types/completion for Neovim's
--     API and installed plugins, and automatically fixes lspconfig's workspace
--     library setup for lua_ls -- so the manual workspace.library/checkThirdParty
--     override that used to live in lsp-config.lua's lua_ls settings is no
--     longer needed.
-- ES: lazydev.nvim reemplaza a neodev.nvim (archivado por su propio autor a
--     favor de este plugin). Le da al LSP de Lua tipos/autocompletado correctos
--     para la API de Neovim y los plugins instalados, y corrige automáticamente
--     la configuración de workspace library de lspconfig para lua_ls -- por lo
--     que la sobrescritura manual de workspace.library/checkThirdParty que
--     estaba en la config de lua_ls en lsp-config.lua ya no hace falta.
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}
