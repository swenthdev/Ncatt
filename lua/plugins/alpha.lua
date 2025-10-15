return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    -- EN: Load the Alpha plugin and use the "dashboard" theme.
    -- ES: Carga el plugin Alpha y usa el tema "dashboard".
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- EN: Define the ASCII art header displayed at the top of the dashboard.
    -- ES: Define el encabezado con arte ASCII que se muestra en la parte superior del dashboard.
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
      [[                      swenthdev                    ]],
    }

    -- EN: Define buttons for quick actions like creating files or opening Telescope.
    -- ES: Define botones para acciones rápidas como crear archivos o abrir Telescope.
    dashboard.section.buttons.val = {
      dashboard.button("N", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("F", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("R", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("I", "  Resume", ":Alpha<CR>"),
      dashboard.button("Q", "  Quit", ":qa<CR>"),
    }

    -- EN: Apply highlight group to each button for consistent styling.
    -- ES: Aplica un grupo de resaltado a cada botón para mantener un estilo consistente.
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButton"
    end

    -- EN: Initialize Alpha with the configured dashboard options.
    -- ES: Inicializa Alpha con las opciones configuradas del dashboard.
    alpha.setup(dashboard.opts)
  end,
}

