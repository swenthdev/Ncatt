return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-Tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        separator_style = "vim",
        sort_by = 'id',
      },
    }

    local palette = require("catppuccin.palettes").get_palette("mocha")
    vim.cmd("highlight BufferLineFill guibg=#1E1E2E")
    vim.cmd("highlight BufferLineIndicatorSelected guifg=" .. palette.mauve)
    vim.cmd("highlight BufferLineModified guifg=" .. palette.text)
    vim.cmd("highlight BufferLineModifiedVisible guifg=" .. palette.text)
    vim.cmd("highlight BufferLineModifiedSelected guifg=" .. palette.text)

    vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
  end
}
