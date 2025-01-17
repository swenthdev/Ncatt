return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require('notify')

    vim.keymap.set("n", "<leader>m", ":Notifications<CR>", { noremap = true, silent = true })

    notify.setup({
      stages = "fade",
      timeout = 3000,
      background_colour = "#1e1e2f",
      minimum_width = 50,
      max_width = function() return math.floor(vim.o.columns * 0.4) end,
      max_height = function() return math.floor(vim.o.lines * 0.2) end,
      top_down = true,
      render = "default",
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 1000 })
        vim.wo[win].wrap = false
        vim.api.nvim_win_set_config(win, { style = "minimal", border = "rounded" })
      end,
    })

    local colors = require('catppuccin.palettes').get_palette()
    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.red, bg = colors.base })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = colors.yellow, bg = colors.base })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = colors.green, bg = colors.base })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = colors.teal, bg = colors.base })

    vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.red })
    vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = colors.green })
    vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = colors.teal })

    vim.api.nvim_set_hl(0, "NotifyERRORBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyWARNBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyINFOBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { fg = colors.text })

    vim.lsp.handlers["window/showMessage"] = function(_, method, params, _)
      local severity = ({
        [1] = "ERROR",
        [2] = "WARN",
        [3] = "INFO",
        [4] = "DEBUG",
      })[params.type]
      notify(method.message, severity, { title = "LSP" })
    end

    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        local diagnostics = vim.diagnostic.get(0)
        for _, diagnostic in ipairs(diagnostics) do
          local severity = ({
            [vim.diagnostic.severity.ERROR] = "ERROR",
            [vim.diagnostic.severity.WARN] = "WARN",
            [vim.diagnostic.severity.INFO] = "INFO",
            [vim.diagnostic.severity.HINT] = "DEBUG",
          })[diagnostic.severity]
          notify(diagnostic.message, severity, { title = "LSP Diagnostic", timeout = 4000 })
        end
      end,
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        source = true,
        border = "rounded",
         format = function(diagnostic)
          return string.format("%s (%s)", diagnostic.message, diagnostic.source or "")
        end,
      },
    })
  end,
}
