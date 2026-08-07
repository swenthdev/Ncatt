return {
  {
    -- EN: Integrates external formatters and linters into Neovim's LSP.
    -- ES: Integra formateadores y linters externos en el LSP de Neovim.
    "nvimtools/none-ls.nvim",

    -- EN: Load immediately on startup.
    -- ES: Se carga inmediatamente al iniciar Neovim.
    lazy = false,

    -- EN: Dependency required by none-ls.
    -- ES: Dependencia necesaria para none-ls.
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      -- EN: Import none-ls (previously known as null-ls).
      -- ES: Importa none-ls (anteriormente null-ls).
      local null_ls = require("null-ls")

      -- EN: Configure none-ls with desired formatters.
      -- ES: Configura none-ls con los formateadores deseados.
      null_ls.setup({
        debug = false, -- EN: Debug logging left on in prod; writes to a log file on every format. / ES: Quedó activo en producción; escribe a un log en cada formateo.
        sources = {
          -- EN: Lua formatter.
          -- ES: Formateador para Lua.
          null_ls.builtins.formatting.stylua,

          -- EN: Prettier for web-related files (JS, TS, HTML, CSS, etc.).
          -- ES: Prettier para archivos web (JS, TS, HTML, CSS, etc.).
          null_ls.builtins.formatting.prettier,
        },
      })

      -- EN: Keymap to manually format the current buffer.
      -- ES: Atajo para formatear manualmente el buffer actual.
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ async = true })
      end)
    end,
  },
}

