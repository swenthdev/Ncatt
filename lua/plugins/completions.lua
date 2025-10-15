return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "onsails/lspkind.nvim",
    },
    config = function()
      -- EN: Load required modules for autocompletion, snippet handling, and icons.
      -- ES: Carga los módulos necesarios para autocompletado, manejo de snippets e íconos.
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      -- EN: Keymaps to jump between snippet placeholders using Ctrl+L and Ctrl+J.
      -- ES: Atajos para moverse entre los marcadores de los snippets con Ctrl+L y Ctrl+J.
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        luasnip.jump(1)
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        luasnip.jump(-1)
      end, { silent = true })

      -- EN: Main CMP setup configuration.
      -- ES: Configuración principal del plugin CMP.
      cmp.setup({
        -- EN: Defines how snippets are expanded in completion suggestions.
        -- ES: Define cómo se expanden los snippets en las sugerencias de autocompletado.
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- EN: Configure bordered completion and documentation windows.
        -- ES: Configura las ventanas de autocompletado y documentación con bordes.
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          }),
          documentation = cmp.config.window.bordered(),
        },

        -- EN: Define key mappings for CMP navigation and confirmation.
        -- ES: Define los atajos de teclado para la navegación y confirmación en CMP.
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),     -- EN: Scroll documentation up
                                                      -- ES: Desplaza la documentación hacia arriba
          ["<C-f>"] = cmp.mapping.scroll_docs(4),      -- EN: Scroll documentation down
                                                      -- ES: Desplaza la documentación hacia abajo
          ["<C-Space>"] = cmp.mapping.complete(),      -- EN: Manually trigger completion
                                                      -- ES: Activa manualmente el autocompletado
          ["<C-e>"] = cmp.mapping.abort(),             -- EN: Close completion window
                                                      -- ES: Cierra la ventana de autocompletado
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- EN: Confirm selection with Enter
                                                             -- ES: Confirma la selección con Enter

          -- EN: Tab and Shift-Tab navigate through completion items or snippets.
          -- ES: Tab y Shift-Tab navegan entre los ítems de autocompletado o snippets.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        -- EN: Define completion sources such as LSP, LuaSnip, and buffer.
        -- ES: Define las fuentes de autocompletado como LSP, LuaSnip y buffer.
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "buffer" },
        }),

        -- EN: Customize how items are displayed in the completion menu.
        -- ES: Personaliza cómo se muestran los ítems en el menú de autocompletado.
        formatting = {
          format = function(entry, vim_item)
            -- EN: Add icons and labels using lspkind.
            -- ES: Agrega íconos y etiquetas usando lspkind.
            vim_item = lspkind.cmp_format({
              mode = "symbol_text",
              maxwidth = 50,
              ellipsis_char = "...",
              menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                luasnip = "[Snip]",
                latex_symbols = "[Latex]",
              },
            })(entry, vim_item)

            -- EN: Add TailwindCSS color preview integration.
            -- ES: Añade integración con TailwindCSS para mostrar colores.
            vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
            return vim_item
          end,
        },

        -- EN: Enable completion only when not inside comments or command mode.
        -- ES: Habilita el autocompletado solo cuando no se esté dentro de comentarios o en modo comando.
        enabled = function()
          local context = require("cmp.config.context")
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
          end
        end,
      })

      -- EN: Enable CMP for search modes ("/" and "?") using buffer source.
      -- ES: Habilita CMP para los modos de búsqueda ("/" y "?") usando el buffer como fuente.
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- EN: Enable CMP for command-line mode (":") with path and command sources.
      -- ES: Habilita CMP para el modo de línea de comandos (":") con las fuentes de path y command.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = "path" } },
          { { name = "cmdline" } }
        ),
      })
    end,
  },
}

