return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      -- EN: Sets up Mason with a rounded border and custom icons for package states.
      -- ES: Configura Mason con bordes redondeados e íconos personalizados para los estados de los paquetes.
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
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- EN: List of LSP servers Mason should install automatically.
      -- ES: Lista de servidores LSP que Mason debe instalar automáticamente.
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
      -- EN: Enables automatic installation of LSP servers.
      -- ES: Habilita la instalación automática de los servidores LSP.
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- EN: Adds completion capabilities from nvim-cmp to all LSP servers.
      -- ES: Agrega las capacidades de autocompletado de nvim-cmp a todos los servidores LSP.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- EN: List of all LSP servers to configure.
      -- ES: Lista de todos los servidores LSP que se configurarán.
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

      -- EN: New LSP configuration method (replaces deprecated require('lspconfig')).
      -- ES: Nuevo método de configuración LSP (reemplaza el require('lspconfig') obsoleto).
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- EN: Custom configuration for Lua LSP to recognize Neovim globals.
      -- ES: Configuración personalizada para Lua LSP para reconocer las variables globales de Neovim.
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- EN: Configure diagnostics display (virtual text, signs, underline, etc.).
      -- ES: Configura la visualización de diagnósticos (texto virtual, signos, subrayado, etc.).
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      -- EN: Keybindings for common LSP actions.
      -- ES: Atajos de teclado para acciones comunes del LSP.
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

      -- EN: Adds rounded borders to floating LSP windows.
      -- ES: Añade bordes redondeados a las ventanas flotantes del LSP.
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end,
  },
}

