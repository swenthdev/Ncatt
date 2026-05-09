return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    -- EN: Load and configure the Bufferline plugin to display buffers (tabs) in a bar at the top.
    -- ES: Carga y configura el plugin Bufferline para mostrar los buffers (pestañas) en una barra superior.
    require("bufferline").setup {
      options = {
        -- EN: Display buffer numbers (set to "none" to hide them).
        -- ES: Muestra los números de buffer (ajustado a "none" para ocultarlos).
        numbers = "none",

        -- EN: Define commands for closing buffers with different mouse actions.
        -- ES: Define los comandos para cerrar buffers con distintas acciones del mouse.
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        -- EN: Configure buffer indicator (▎ shows the active buffer).
        -- ES: Configura el indicador de buffer (▎ muestra el buffer activo).
        indicator = {
          icon = '▎',
          style = 'icon',
        },

        -- EN: Customize icons for closing, modified buffers, and separators.
        -- ES: Personaliza los íconos para cerrar, buffers modificados y separadores.
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

        -- EN: Control buffer name and tab size limits.
        -- ES: Controla los límites de tamaño del nombre del buffer y las pestañas.
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 21,

        -- EN: Enable diagnostics integration with Neovim’s LSP.
        -- ES: Habilita la integración de diagnósticos con el LSP de Neovim.
        diagnostics = "nvim_lsp",

        -- EN: Define how diagnostics (errors/warnings) are displayed on the bufferline.
        -- ES: Define cómo se muestran los diagnósticos (errores/advertencias) en la barra de buffers.
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- EN: Define behavior when Neo-tree is open (adds offset space with label “File Explorer”).
        -- ES: Define el comportamiento cuando Neo-tree está abierto (agrega espacio con la etiqueta “File Explorer”).
        offsets = {
          {
            filetype = "neo-Tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          }
        },

        -- EN: Visual options for showing icons, separators, and close buttons.
        -- ES: Opciones visuales para mostrar íconos, separadores y botones de cierre.
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,

        -- EN: Choose separator style ("vim" uses the default thin line).
        -- ES: Elige el estilo del separador ("vim" usa una línea delgada por defecto).
        separator_style = "vim",

        -- EN: Sort buffers by their ID (default behavior).
        -- ES: Ordena los buffers por su ID (comportamiento por defecto).
        sort_by = 'id',
      },
    }

    -- EN: Import Catppuccin palette for custom bufferline highlights.
    -- ES: Importa la paleta de Catppuccin para los resaltados personalizados de bufferline.
    local palette = require("catppuccin.palettes").get_palette("mocha")

    -- EN: Customize highlight colors for various bufferline elements.
    -- ES: Personaliza los colores de resaltado para varios elementos del bufferline.
    vim.cmd("highlight BufferLineFill guibg=#1E1E2E")
    vim.cmd("highlight BufferLineIndicatorSelected guifg=" .. palette.mauve)
    vim.cmd("highlight BufferLineModified guifg=" .. palette.text)
    vim.cmd("highlight BufferLineModifiedVisible guifg=" .. palette.text)
    vim.cmd("highlight BufferLineModifiedSelected guifg=" .. palette.text)

    -- EN: Keymaps for cycling between buffers using <leader>bp (previous) and <leader>bn (next).
    -- ES: Atajos de teclado para moverse entre buffers usando <leader>bp (anterior) y <leader>bn (siguiente).
    vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
  end
}

