return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {


      [[                                                   ]],
      [[                                                   ]],
      [[                                                   ]],
      [[                                                   ]],
      [[                                                   ]],
      [[                                                   ]],
      [[                                                   ]],
      [[    ███▄    █  ▄████▄   ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ]],
      [[    ██ ▀█   █ ▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒ ]],
      [[    ▓██  ▀█ ██▒▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░]],
      [[    ▓██▒  ▐▌██▒▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ]],
      [[    ▒██░   ▓██░▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ]],
      [[    ░ ▒░   ▒ ▒ ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ]],
      [[    ░ ░░   ░ ▒░  ░  ▒     ▒   ▒▒ ░   ░        ░    ]],
      [[      ░   ░ ░ ░          ░   ▒    ░        ░       ]],
      [[         ░ ░ ░            ░  ░                     ]],
      [[           ░                                       ]],
      [[                                                   ]],
      [[                                                   ]],
      [[                        Ncatt                      ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("N", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("F", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("R", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("I", "  Resume", ":Alpha<CR>"),
      dashboard.button("Q", "  Quit", ":qa<CR>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButton"
    end

    alpha.setup(dashboard.opts)
  end,
}
