return {
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
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
      end)
    end,
  },
}


