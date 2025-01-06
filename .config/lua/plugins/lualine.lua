return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require('lualine')
    local colors = require('catppuccin.palettes').get_palette('mocha')

    local mode_color = {
      n = { bg = colors.blue, fg = colors.crust },
      i = { bg = colors.green, fg = colors.crust },
      v = { bg = colors.yellow, fg = colors.crust },
      c = { bg = colors.peach, fg = colors.crust },
    }

    local function mode_color_fn()
      local mode = vim.fn.mode()
      return mode_color[mode] or { bg = colors.blue, fg = colors.crust }
    end

    lualine.setup({
      options = {
        globalstatus = true,
        theme = 'catppuccin',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
            color = mode_color_fn,
          },
        },
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
