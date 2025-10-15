return {
  {
    -- EN: Neo-tree: a modern and highly configurable file explorer for Neovim.
    -- ES: Neo-tree: un explorador de archivos moderno y muy configurable para Neovim.
    "nvim-neo-tree/neo-tree.nvim",

    -- EN: Use the v3.x branch which includes the latest stable features.
    -- ES: Usa la rama v3.x que incluye las funciones estables más recientes.
    branch = "v3.x",

    -- EN: Key mappings to open Neo-tree in different modes.
    -- ES: Atajos de teclado para abrir Neo-tree en distintos modos.
    keys = {
      { "<C-n>",      ":Neotree filesystem reveal right<CR>", noremap = true, silent = true },
      { "<leader>bf", ":Neotree buffers reveal float<CR>",    noremap = true, silent = true },
    },

    -- EN: Commands that can trigger the lazy-loading of this plugin.
    -- ES: Comandos que pueden activar la carga diferida (lazy-loading) del plugin.
    cmd = { "Neotree", "NeoTreeReveal", "NeoTreeClose" },

    -- EN: Required dependencies for Neo-tree to work properly.
    -- ES: Dependencias necesarias para que Neo-tree funcione correctamente.
    dependencies = {
      "nvim-lua/plenary.nvim",          -- EN: Utility functions. / ES: Funciones utilitarias.
      "nvim-tree/nvim-web-devicons",    -- EN: File icons. / ES: Íconos de archivos.
      "MunifTanjim/nui.nvim",           -- EN: UI components. / ES: Componentes de interfaz.
      {
        -- EN: Adds a visual window picker when opening files in splits.
        -- ES: Añade un selector visual de ventanas al abrir archivos en divisiones.
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one      = true,
              bo                  = {
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                buftype  = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },

    -- EN: Main plugin setup configuration.
    -- ES: Configuración principal del plugin.
    config = function()
      require("neo-tree").setup({
        -- EN: Displays source selector in the winbar.
        -- ES: Muestra el selector de fuente en la barra de ventana.
        source_selector = {
          winbar = true,
          sources = {
            { source = "filesystem", display_name = "  Files" },
            { source = "buffers", display_name = " ﬘ Buffers" },
            { source = "git_status", display_name = "  Git" },
          },
        },

        -- EN: General behavior settings.
        -- ES: Configuraciones generales del comportamiento.
        close_if_last_window = false,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
        sort_case_insensitive = false,

        -- EN: Component appearance and icons.
        -- ES: Apariencia e íconos de los componentes.
        default_component_configs = {
          container = { enable_character_fade = true },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "*",
            highlight = "NeoTreeFileIcon",
          },
          modified = { symbol = "[+]", highlight = "NeoTreeModified" },
          name = { trailing_slash = false, use_git_status_colors = true, highlight = "NeoTreeFileName" },
          git_status = {
            symbols = {
              added = "",
              modified = "",
              deleted = "✖",
              renamed = "󰁕",
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
          file_size = { enabled = false },
          type = { enabled = false },
          last_modified = { enabled = false },
          created = { enabled = false },
          symlink_target = { enabled = false },
        },

        -- EN: Configuration of Neo-tree main window.
        -- ES: Configuración de la ventana principal de Neo-tree.
        
        window = {
          position = "right",
          width = 36,
          mapping_options = { noremap = true, nowait = true },
          mappings = {
            ["<space>"] = { "toggle_node", nowait = false },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = { "add", config = { show_path = "none" } },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
          },
        },

        -- EN: Settings specific to the filesystem explorer.
        -- ES: Configuración específica del explorador de archivos.
        
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_hidden = true,
          },
          follow_current_file = { enabled = true },
          group_empty_dirs = false,
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = false,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["og"] = { "order_by_git_status", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
            fuzzy_finder_mappings = {
              ["<down>"] = "move_cursor_down",
              ["<C-n>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              ["<C-p>"] = "move_cursor_up",
            },
          },
        },

        -- EN: Configuration for buffer source in Neo-tree.
        -- ES: Configuración para el origen de buffers en Neo-tree.

        buffers = {
          follow_current_file = { enabled = true, leave_dirs_open = false },
          group_empty_dirs = true,
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
          },
        },

        -- EN: Git status integration and floating window configuration.
        -- ES: Integración con estado de Git y configuración de ventana flotante.

        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
          },
        },
      })
    end,
  },
}

