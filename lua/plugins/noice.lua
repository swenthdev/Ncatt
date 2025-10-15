return {
  -- EN: Noice enhances Neovim's UI for messages, command-line, and LSP interactions, creating a more modern interface.
  -- ES: Noice mejora la interfaz de usuario de Neovim para mensajes, línea de comandos y LSP, ofreciendo una experiencia más moderna.
  "folke/noice.nvim",

  -- EN: Loads when Neovim is in a "lazy" state (to optimize startup performance).
  -- ES: Se carga cuando Neovim está en un estado “lazy” (para optimizar el rendimiento al iniciar).
  event = "VeryLazy",

  dependencies = {
    -- EN: Required dependency providing UI components for Noice.
    -- ES: Dependencia necesaria que provee componentes de interfaz para Noice.
    "MunifTanjim/nui.nvim",

    -- EN: Provides notification handling (popup messages and alerts).
    -- ES: Maneja notificaciones y mensajes emergentes en Neovim.
    "rcarriga/nvim-notify",
  },

  config = function()
    -- EN: Configure the main Noice plugin.
    -- ES: Configura el plugin principal Noice.
    require("noice").setup({
      lsp = {
        -- EN: Enables LSP progress notifications (e.g., “Analyzing...”, “Loading project...”).
        -- ES: Habilita notificaciones de progreso del LSP (por ejemplo, “Analizando...”, “Cargando proyecto...”).
        progress = { enabled = true },

        -- EN: Overrides certain default LSP functions to display improved markdown and completion documentation.
        -- ES: Sobrescribe algunas funciones LSP para mostrar documentación y markdown mejorados.
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

        -- EN: Enables diagnostic display customization.
        -- ES: Habilita la personalización de la visualización de diagnósticos.
        diagnostics = {
          enabled = true,
          filter = { event = "BufWritePost" },
        },
      },

      -- EN: Predefined interface presets for layout and behavior.
      -- ES: Ajustes predefinidos de interfaz para disposición y comportamiento.
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = true,
      },

      -- EN: Defines routes (rules) for how certain messages are displayed or filtered.
      -- ES: Define rutas (reglas) para cómo se muestran o filtran ciertos mensajes.
      routes = {
        {
          -- EN: Hides “written” messages (e.g., “file written”).
          -- ES: Oculta los mensajes de “archivo escrito”.
          filter = { event = "msg_show", kind = "", find = "written" },
          opts = { skip = true },
        },
        {
          -- EN: Highlights error messages with a red border and prevents timeout.
          -- ES: Resalta los mensajes de error con un borde rojo y evita que desaparezcan automáticamente.
          filter = { event = "msg_show", kind = "error" },
          opts = { highlight = "ErrorMsg", timeout = false, stop = true },
        },
      },

      -- EN: Customizes the appearance of UI views (command line, popup menus, LSP docs, etc.).
      -- ES: Personaliza la apariencia de las vistas de interfaz (línea de comandos, menús emergentes, docs del LSP, etc.).
      views = {
        cmdline_popup = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
            highlight = "FloatBorder",
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
          position = { row = "50%", col = "50%", relative = "editor" },
        },
        popupmenu = {
          backend = "nui",
          kind_icons = true,
        },
        lsp_doc_split = {
          position = "bottom",
          size = "20%",
          border = { style = "rounded", highlight = "FloatBorder" },
        },
      },
    })

    -- EN: Configure nvim-notify (the notification system used by Noice).
    -- ES: Configura nvim-notify (el sistema de notificaciones usado por Noice).
    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    })

    -- EN: Integrates Noice with Telescope for enhanced command and message search.
    -- ES: Integra Noice con Telescope para una búsqueda mejorada de comandos y mensajes.
    require("telescope").load_extension("noice")
  end,
}

