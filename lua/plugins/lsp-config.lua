return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "ts_ls",
        "jdtls",
        "intelephense",
        "rust_analyzer",
        "jsonls",
        "html",
        "lua_ls",
        "cssls",
        "pyright",
        "gopls",
      },
      auto_install = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      local servers = {
        "ts_ls",
        "jdtls",
        "intelephense",
        "rust_analyzer",
        "jsonls",
        "html",
        "lua_ls",
        "cssls",
        "pyright",
        "gopls",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({ capabilities = capabilities })
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Mostrar documentación LSP" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Ir a definición" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Buscar referencias" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acción de código" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo" })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
    end,
  },
}
