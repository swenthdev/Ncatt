return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- EN: Load the Lualine statusline plugin and the Catppuccin color palette.
    -- ES: Carga el plugin de barra de estado Lualine y la paleta de colores Catppuccin.
    local lualine = require('lualine')
    local colors = require('catppuccin.palettes').get_palette('mocha')

    -- EN: Define background/foreground colors for different modes (normal, insert, visual, command).
    -- ES: Define colores de fondo y texto para los distintos modos (normal, inserción, visual, comando).
    local mode_color = {
      n = { bg = colors.blue, fg = colors.crust },
      i = { bg = colors.green, fg = colors.crust },
      v = { bg = colors.yellow, fg = colors.crust },
      c = { bg = colors.peach, fg = colors.crust },
    }

    -- EN: Function that returns the appropriate color scheme based on the current Vim mode.
    -- ES: Función que devuelve el esquema de color adecuado según el modo actual de Vim.
    local function mode_color_fn()
      local mode = vim.fn.mode()
      return mode_color[mode] or { bg = colors.blue, fg = colors.crust }
    end

    -- EN: Configure Lualine with sections, colors, and separators.
    -- ES: Configura Lualine con sus secciones, colores y separadores.
    lualine.setup({
      options = {
        -- EN: Enables a global statusline for all windows.
        -- ES: Habilita una barra de estado global para todas las ventanas.
        globalstatus = true,
        -- EN: Use Catppuccin theme colors.
        -- ES: Usa los colores del tema Catppuccin.
        theme = 'catppuccin',
        -- EN: Decorative separators between sections.
        -- ES: Separadores decorativos entre las secciones.
        section_separators = { left = '', right = '' },
      },
      sections = {
        -- Section A
        -- EN: Displays the current mode (NORMAL, INSERT, etc.) with dynamic color.
        -- ES: Muestra el modo actual (NORMAL, INSERT, etc.) con color dinámico.
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
            color = mode_color_fn,
          },
        },

        -- Section B
        -- EN: Shows current Git branch and LSP diagnostics.
        -- ES: Muestra la rama actual de Git y los diagnósticos del LSP.
        lualine_b = {
          {
            'branch',
            separator = { left = '', right = '' },
            color = { bg = colors.mauve, fg = colors.crust },
          },
          {
            'diagnostics',
            separator = { left = '', right = '' },
            color = { bg = colors.surface0, fg = colors.sky },
          },
        },

        -- Section C
        -- EN: Displays filename and filesize (only if file > 0 bytes).
        -- ES: Muestra el nombre del archivo y el tamaño (solo si el archivo tiene más de 0 bytes).
        lualine_c = {
          {
            'filename',
            separator = { left = '', right = '' },
            color = { bg = colors.text, fg = colors.crust },
          },
          {
            'filesize',
            cond = function() return vim.fn.getfsize(vim.fn.expand('%')) > 0 end,
            separator = { left = '', right = '' },
            color = { bg = colors.red, fg = colors.crust },
          },
        },

        -- Section X
        -- EN: Displays file format (unix, dos) and encoding (utf-8, etc.).
        -- ES: Muestra el formato del archivo (unix, dos) y la codificación (utf-8, etc.).
        lualine_x = {
          {
            'fileformat',
            separator = { left = '', right = '' },
            color = { bg = colors.mauve, fg = colors.crust },
          },
          {
            'encoding',
            separator = { left = '', right = '' },
            color = { bg = colors.surface0, fg = colors.yellow },
          },
        },

        -- Section Y
        -- EN: Shows the current filetype and the progress percentage through the file.
        -- ES: Muestra el tipo de archivo actual y el porcentaje de progreso dentro del archivo.
        lualine_y = {
          {
            'filetype',
            separator = { left = '', right = '' },
            color = { bg = colors.text, fg = colors.crust },
          },
          {
            'progress',
            separator = { left = '', right = '' },
            color = { bg = colors.surface0, fg = colors.teal },
          },
        },

        -- Section Z
        -- EN: Displays the cursor’s current location (line and column) with mode color.
        -- ES: Muestra la ubicación actual del cursor (línea y columna) con el color del modo.
        lualine_z = {
          {
            'location',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
            color = mode_color_fn,
          },
        },
      },
    })
  end
}

