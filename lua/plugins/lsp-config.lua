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
        -- EN: Web / scripting languages.
        -- ES: Lenguajes web y de scripting.
        "ts_ls",         -- TypeScript / JavaScript
        "html",          -- HTML
        "cssls",         -- CSS
        "jsonls",        -- JSON

        -- EN: Systems / compiled languages.
        -- ES: Lenguajes de sistemas / compilados.
        "jdtls",         -- Java
        "rust_analyzer", -- Rust
        "gopls",         -- Go
        "clangd",        -- C / C++
        "asm_lsp",       -- Assembly

        -- EN: Scripting / interpreted languages.
        -- ES: Lenguajes de scripting / interpretados.
        "pyright",       -- Python
        "intelephense",  -- PHP
        "bashls",        -- Bash / Shell

        -- EN: Config / infrastructure languages.
        -- ES: Lenguajes de configuración / infraestructura.
        "yamlls",        -- YAML
        "dockerls",      -- Dockerfile
        "sqlls",         -- SQL
        "taplo",         -- TOML (Cargo.toml, pyproject.toml, etc.)
        "terraformls",   -- Terraform / HCL

        -- EN: Markup / documentation formats.
        -- ES: Formatos de marcado / documentación.
        "marksman",      -- Markdown (links, headings, references)
        "lemminx",       -- XML / SVG / Maven POM / Spring XML

        -- EN: Editor tooling.
        -- ES: Herramientas del editor.
        "lua_ls",        -- Lua (Neovim config)
      },
      -- EN: `automatic_installation` was removed from mason-lspconfig (no longer
      --     compatible with the native vim.lsp.config() mechanism, see its
      --     CHANGELOG); it was a silent no-op here. `ensure_installed` above
      --     already installs these servers, and `automatic_enable` (on by
      --     default) calls vim.lsp.enable() for them automatically.
      -- ES: `automatic_installation` fue eliminado de mason-lspconfig (ya no es
      --     compatible con el mecanismo nativo vim.lsp.config(), ver su
      --     CHANGELOG); aquí no hacía nada. `ensure_installed` de arriba ya
      --     instala estos servidores, y `automatic_enable` (activo por defecto)
      --     llama a vim.lsp.enable() por ellos automáticamente.
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

      -- EN: List of all LSP servers to configure with default capabilities.
      --     Servers with custom settings (e.g., lua_ls) are configured separately below.
      -- ES: Lista de todos los servidores LSP que se configurarán con las capacidades por defecto.
      --     Los servidores con configuración personalizada (p. ej., lua_ls) se configuran por separado abajo.
      local servers = {
        -- EN: Web / scripting languages.
        -- ES: Lenguajes web y de scripting.
        "ts_ls",         -- TypeScript / JavaScript
        "html",          -- HTML
        "cssls",         -- CSS
        "jsonls",        -- JSON

        -- EN: Systems / compiled languages.
        -- ES: Lenguajes de sistemas / compilados.
        "jdtls",         -- Java
        "rust_analyzer", -- Rust
        "gopls",         -- Go
        "clangd",        -- C / C++
        "asm_lsp",       -- Assembly
        "cmake-language-server", -- CMake (build system)

        -- EN: Scripting / interpreted languages.
        -- ES: Lenguajes de scripting / interpretados.
        "pyright",       -- Python
        "intelephense",  -- PHP
        "bashls",        -- Bash / Shell

        -- EN: Config / infrastructure languages.
        -- ES: Lenguajes de configuración / infraestructura.
        "yamlls",        -- YAML
        "dockerls",      -- Dockerfile
        "sqlls",         -- SQL
        "taplo",         -- TOML (Cargo.toml, pyproject.toml, etc.)
        "nginx-language-server", -- Nginx config files
        "terraformls",   -- Terraform / HCL

        -- EN: Markup / documentation formats.
        -- ES: Formatos de marcado / documentación.
        "marksman",      -- Markdown (links, headings, references)
        "lemminx",       -- XML / SVG / Maven POM / Spring XML

        -- EN: Editor tooling.
        -- ES: Herramientas del editor.
        "lua_ls",        -- Lua (Neovim config)
      }

      -- EN: New LSP configuration method (replaces deprecated require('lspconfig')).
      -- ES: Nuevo método de configuración LSP (reemplaza el require('lspconfig') obsoleto).
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- EN: Custom configuration for Lua LSP to recognize Neovim globals.
      --     workspace.library used to be set manually here; lazydev.nvim
      --     (plugins/lazydev.lua) now fixes lspconfig's workspace management
      --     for lua_ls automatically, so that override was removed.
      -- ES: Antes se configuraba workspace.library manualmente aquí; ahora
      --     lazydev.nvim (plugins/lazydev.lua) corrige automáticamente la
      --     configuración de workspace de lspconfig para lua_ls, así que esa
      --     sobrescritura se eliminó.
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
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

      -- EN: Adds rounded borders to floating LSP windows (hover and signature help).
      --     Uses vim.lsp.config("*", ...) to apply globally to all servers,
      --     replacing the deprecated vim.lsp.with() approach.
      -- ES: Añade bordes redondeados a las ventanas flotantes del LSP (hover y ayuda de firma).
      --     Usa vim.lsp.config("*", ...) para aplicarlo globalmente a todos los servidores,
      --     reemplazando el uso obsoleto de vim.lsp.with().
      vim.lsp.config("*", {
        handlers = {
          ["textDocument/hover"] = function(err, result, ctx, config)
            config = vim.tbl_deep_extend("force", config or {}, { border = "rounded" })
            vim.lsp.handlers.hover(err, result, ctx, config)
          end,
          ["textDocument/signatureHelp"] = function(err, result, ctx, config)
            config = vim.tbl_deep_extend("force", config or {}, { border = "rounded" })
            vim.lsp.handlers.signature_help(err, result, ctx, config)
          end,
        },
      })
    end,
  },
}

