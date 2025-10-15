return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- EN: Load and configure the Catppuccin colorscheme with preferred options.
      -- ES: Carga y configura el esquema de colores Catppuccin con las opciones preferidas.
      require("catppuccin").setup({
        -- EN: Automatically detect light or dark mode and apply the corresponding flavor.
        -- ES: Detecta automáticamente el modo claro u oscuro y aplica el estilo correspondiente.
        flavour = "auto",

        -- EN: Define the specific Catppuccin flavors for light and dark backgrounds.
        -- ES: Define los sabores específicos de Catppuccin para fondos claros y oscuros.
        background = {
          light = "latte",
          dark = "mocha",
        },

        -- EN: Disable transparency for the background (set to true if you use a transparent terminal).
        -- ES: Desactiva la transparencia del fondo (ajusta a true si usas una terminal transparente).
        transparent_background = false,

        -- EN: Hide end-of-buffer symbols (like ~ at the end of files).
        -- ES: Oculta los símbolos al final del buffer (como ~ al final de los archivos).
        show_end_of_buffer = false,

        -- EN: Disable terminal color overrides.
        -- ES: Desactiva la sobrescritura de colores de la terminal.
        term_colors = false,

        -- EN: Option to dim inactive windows for better focus.
        -- ES: Opción para oscurecer las ventanas inactivas y mejorar el enfoque.
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },

        -- EN: Global style toggles for font decorations.
        -- ES: Configuraciones globales de estilo para decoraciones de texto.
        no_italic = false,
        no_bold = false,
        no_underline = false,

        -- EN: Define individual text style preferences for syntax groups.
        -- ES: Define las preferencias de estilo de texto para los grupos de sintaxis.
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },

        -- EN: Optional overrides for specific colors.
        -- ES: Sobrescrituras opcionales para colores específicos.
        color_overrides = {},

        -- EN: Define custom highlights (empty by default).
        -- ES: Define resaltados personalizados (vacío por defecto).
        custom_highlights = {},

        -- EN: Enable default integrations with other plugins.
        -- ES: Habilita las integraciones por defecto con otros plugins.
        default_integrations = true,

        -- EN: Configure integrations with specific plugins.
        -- ES: Configura las integraciones con plugins específicos.
        integrations = {
          cmp = true,         -- EN: Enable integration with nvim-cmp (autocompletion)
                              -- ES: Habilita la integración con nvim-cmp (autocompletado)

          gitsigns = true,    -- EN: Integrate Git status signs
                              -- ES: Integra los signos de estado de Git

          nvimtree = true,    -- EN: Apply theme colors to nvim-tree
                              -- ES: Aplica los colores del tema a nvim-tree

          treesitter = true,  -- EN: Enable TreeSitter syntax highlighting integration
                              -- ES: Habilita la integración con el resaltado de sintaxis de TreeSitter

          neotree = true,     -- EN: Enable Catppuccin colors for Neo-tree
                              -- ES: Habilita los colores de Catppuccin para Neo-tree

          notify = false,     -- EN: Disable integration with nvim-notify
                              -- ES: Desactiva la integración con nvim-notify

          mini = {            -- EN: Integration for Mini.nvim modules
                              -- ES: Integración para los módulos de Mini.nvim
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      -- EN: Apply the Catppuccin colorscheme after setup.
      -- ES: Aplica el esquema de colores Catppuccin después de configurarlo.
      vim.cmd.colorscheme "catppuccin"
    end
  }
}

