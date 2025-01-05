return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "elixir",
          "heex",
          "javascript",
          "html",
          "json",
          "typescript",
          "tsx",
          "yaml",
          "css",
          "markdown",
          "markdown_inline",
          "graphql",
          "c_sharp",
          "csv",
          "dockerfile",
          "dot",
          "gitignore",
          "go",
          "python",
          "sql",
          "xml",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        },
        per_filetype = {
          ["html"] = {
            enable_close = true,
            enable_rename = true
          },
          ["astro"] = {
            enable_close = true,
            enable_rename = true
          },
          ["glimmer"] = {
            enable_close = true,
            enable_rename = true
          },
          ["handlebars"] = {
            enable_close = true,
            enable_rename = true
          },
          ["javascript"] = {
            enable_close = true,
            enable_rename = true
          },
          ["jsx"] = {
            enable_close = true,
            enable_rename = true
          },
          ["markdown"] = {
            enable_close = true,
            enable_rename = true
          },
          ["php"] = {
            enable_close = true,
            enable_rename = true
          },
          ["rescript"] = {
            enable_close = true,
            enable_rename = true
          },
          ["svelte"] = {
            enable_close = true,
            enable_rename = true
          },
          ["tsx"] = {
            enable_close = true,
            enable_rename = true
          },
          ["twig"] = {
            enable_close = true,
            enable_rename = true
          },
          ["typescript"] = {
            enable_close = true,
            enable_rename = true
          },
          ["vue"] = {
            enable_close = true,
            enable_rename = true
          },
          ["xml"] = {
            enable_close = true,
            enable_rename = true
          }
        }
      })
    end
  }
}
