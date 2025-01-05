return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        debug = true,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
        },
      })

      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format buffer" })
    end,
  },
}
