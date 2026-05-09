return {
  -- EN: Adds Telescope UI select extension for better selection menus.
  -- ES: Añade la extensión UI Select de Telescope para menús de selección mejorados.
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    -- EN: Main Telescope plugin for fuzzy finding files, buffers, text, etc.
    -- ES: Plugin principal de Telescope para búsqueda difusa de archivos, buffers, texto, etc.
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      -- EN: Telescope setup with improved dropdown theme and UI select integration.
      -- ES: Configuración de Telescope con tema dropdown mejorado e integración de UI Select.
      telescope.setup({
        defaults = {
          prompt_prefix = "  ", -- EN: Search icon | ES: Icono de búsqueda
          selection_caret = "  ", -- EN: Cursor marker | ES: Indicador del cursor
          path_display = { "smart" },
          layout_config = {
            horizontal = { preview_width = 0.55 },
          },
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          file_ignore_patterns = { "node_modules", ".git/", "venv" },
        },

        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          oldfiles = {
            theme = "dropdown",
            previewer = false,
          },
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              winblend = 10, -- EN: Adds slight transparency | ES: Añade un poco de transparencia
              previewer = false,
            }),
          },
        },
      })

      -- EN: Load Telescope UI select extension.
      -- ES: Carga la extensión UI select de Telescope.
      telescope.load_extension("ui-select")

      -- EN: Keymaps for quick access to Telescope pickers.
      -- ES: Atajos de teclado para acceder rápidamente a los buscadores de Telescope.
      -- Búsqueda normal (desde el directorio del proyecto)
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files (cwd)" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (cwd)" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
      vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Search word under cursor" })

      -- Búsqueda desde la raíz del sistema de archivos (/)
      vim.keymap.set("n", "<leader>fr", function()
        builtin.find_files({
          prompt_title = "  Find Files (root /)",
          cwd = "/",
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = { "^proc/", "^sys/", "^dev/", "^run/", "%.sock$" },
        })
      end, { desc = "Find files from /" })

      vim.keymap.set("n", "<leader>fR", function()
        builtin.live_grep({
          prompt_title = "  Grep (root /)",
          cwd = "/",
          additional_args = { "--no-ignore", "--hidden" },
        })
      end, { desc = "Live grep from /" })

      -- Búsqueda desde la carpeta del archivo actual
      vim.keymap.set("n", "<leader>fc", function()
        local file_dir = vim.fn.expand("%:p:h")
        if file_dir == "" then file_dir = vim.fn.getcwd() end
        builtin.find_files({
          prompt_title = "  Files near current file",
          cwd = file_dir,
          hidden = true,
        })
      end, { desc = "Find files from current file dir" })
    end,
  },
}

