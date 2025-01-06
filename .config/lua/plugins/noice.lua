return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        progress = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        diagnostics = {
          enabled = true,
          filter = { event = "BufWritePost" },
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = true,
      },
      routes = {
        {
          filter = { event = "msg_show", kind = "", find = "written" },
          opts = { skip = true },
        },
        {
          filter = { event = "msg_show", kind = "error" },
          opts = { highlight = "ErrorMsg", timeout = false, stop = true },
        },
      },
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

    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    })

    require("telescope").load_extension("noice")
  end,
}
