return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()

    -- EN: Detects the active Catppuccin flavor based on vim.g.catppuccin_flavour
    --     or the current background mode (light → latte, dark → mocha).
    -- ES: Detecta el sabor activo de Catppuccin según vim.g.catppuccin_flavour
    --     o el modo de fondo actual (claro → latte, oscuro → mocha).
    local function current_flavour()
      if vim.g.catppuccin_flavour and vim.g.catppuccin_flavour ~= "" then
        return vim.g.catppuccin_flavour
      end
      if vim.o.background == "light" then
        return "latte"
      end
      return "mocha"
    end

    -- EN: Returns the full Catppuccin color palette for the active flavor.
    -- ES: Devuelve la paleta de colores completa de Catppuccin para el sabor activo.
    local function current_palette()
      return require("catppuccin.palettes").get_palette(current_flavour())
    end

    -- EN: Applies all custom highlight groups for bufferline using the
    --     Catppuccin palette. This function is called on startup and
    --     re-applied on every colorscheme change or new buffer load.
    -- ES: Aplica todos los grupos de resaltado personalizados para bufferline
    --     usando la paleta de Catppuccin. Esta función se llama al inicio y
    --     se vuelve a aplicar en cada cambio de colorscheme o nuevo buffer.
    local function apply_bufferline_highlights()
      local palette = current_palette()

      -- EN: Background color definitions per tab state.
      --     fill_bg     → empty area between tabs and window edge (matches Normal bg → invisible).
      --     inactive_bg → inactive tabs (slightly darker than base).
      --     visible_bg  → visible buffer in a split (slightly lighter than base).
      --     active_bg   → active/selected tab (darkest, most differentiated).
      -- ES: Definición de colores de fondo según el estado del tab.
      --     fill_bg     → área vacía entre tabs y el borde de ventana (igual que Normal bg → invisible).
      --     inactive_bg → tabs inactivos (un tono más oscuro que base).
      --     visible_bg  → buffer visible en un split (un tono más claro que base).
      --     active_bg   → tab activo/seleccionado (el más oscuro, bien diferenciado).
      local fill_bg     = palette.base
      local inactive_bg = palette.mantle
      local visible_bg  = palette.surface0
      local active_bg   = palette.crust

      -- EN: Fill area highlights (empty space in the bufferline bar).
      -- ES: Resaltados del área de relleno (espacio vacío en la barra de bufferline).
      vim.api.nvim_set_hl(0, "BufferLineFill",        { bg = fill_bg })
      vim.api.nvim_set_hl(0, "BufferLineTabClose",    { fg = palette.red,  bg = fill_bg })
      vim.api.nvim_set_hl(0, "BufferLineTabSelected", { fg = palette.text, bg = active_bg })

      -- EN: Buffer tab highlights for each state: inactive, visible (split), selected (active).
      -- ES: Resaltados de los tabs de buffer para cada estado: inactivo, visible (split), seleccionado (activo).
      vim.api.nvim_set_hl(0, "BufferLineBackground",
        { fg = palette.overlay0, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineBufferVisible",
        { fg = palette.overlay2, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineBufferSelected",
        { fg = palette.text, bg = active_bg, bold = true, italic = false })

      -- EN: Left-side indicator icon for the active tab.
      -- ES: Icono indicador lateral izquierdo para el tab activo.
      vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected",
        { fg = palette.mauve, bg = active_bg })

      -- EN: Slant-style separators between tabs.
      --     The triangle is drawn using the fg color of the separator.
      --     Logic: fg = fill color (so the triangle "cuts" into the background),
      --            bg = color of the tab the separator belongs to.
      -- ES: Separadores estilo slant entre tabs.
      --     El triángulo se dibuja usando el fg del separator.
      --     Lógica: fg = color del fill (para que el triángulo "corte" hacia el fondo),
      --             bg = color del tab al que pertenece ese separator.
      vim.api.nvim_set_hl(0, "BufferLineSeparator",
        { fg = fill_bg,     bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible",
        { fg = fill_bg,     bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected",
        { fg = inactive_bg, bg = active_bg })

      -- EN: Modified buffer indicator icon (shown when buffer has unsaved changes).
      -- ES: Icono indicador de buffer modificado (se muestra cuando hay cambios sin guardar).
      vim.api.nvim_set_hl(0, "BufferLineModified",
        { fg = palette.peach, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineModifiedVisible",
        { fg = palette.peach, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineModifiedSelected",
        { fg = palette.peach, bg = active_bg })

      -- EN: Close button highlights per tab state.
      -- ES: Resaltados del botón de cierre según el estado del tab.
      vim.api.nvim_set_hl(0, "BufferLineCloseButton",
        { fg = palette.overlay0, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible",
        { fg = palette.overlay2, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected",
        { fg = palette.red,      bg = active_bg })

      -- EN: General diagnostic icon highlights per tab state.
      -- ES: Resaltados del icono de diagnóstico general según el estado del tab.
      vim.api.nvim_set_hl(0, "BufferLineDiagnostic",
        { fg = palette.overlay0, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineDiagnosticVisible",
        { fg = palette.overlay0, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineDiagnosticSelected",
        { fg = palette.overlay1, bg = active_bg, bold = true })

      -- EN: Error diagnostic highlights (LSP errors).
      -- ES: Resaltados de diagnóstico de errores (errores de LSP).
      vim.api.nvim_set_hl(0, "BufferLineError",
        { fg = palette.red, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineErrorVisible",
        { fg = palette.red, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineErrorSelected",
        { fg = palette.red, bg = active_bg, bold = true })
      vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic",
        { fg = palette.red, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineErrorDiagnosticVisible",
        { fg = palette.red, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineErrorDiagnosticSelected",
        { fg = palette.red, bg = active_bg })

      -- EN: Warning diagnostic highlights (LSP warnings).
      -- ES: Resaltados de diagnóstico de advertencias (advertencias de LSP).
      vim.api.nvim_set_hl(0, "BufferLineWarning",
        { fg = palette.yellow, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineWarningVisible",
        { fg = palette.yellow, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineWarningSelected",
        { fg = palette.yellow, bg = active_bg, bold = true })
      vim.api.nvim_set_hl(0, "BufferLineWarningDiagnostic",
        { fg = palette.yellow, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineWarningDiagnosticVisible",
        { fg = palette.yellow, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineWarningDiagnosticSelected",
        { fg = palette.yellow, bg = active_bg })

      -- EN: Info diagnostic highlights (LSP info messages).
      -- ES: Resaltados de diagnóstico de información (mensajes informativos de LSP).
      vim.api.nvim_set_hl(0, "BufferLineInfo",
        { fg = palette.sky, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineInfoVisible",
        { fg = palette.sky, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineInfoSelected",
        { fg = palette.sky, bg = active_bg, bold = true })

      -- EN: Hint diagnostic highlights (LSP hints/suggestions).
      -- ES: Resaltados de diagnóstico de sugerencias (sugerencias de LSP).
      vim.api.nvim_set_hl(0, "BufferLineHint",
        { fg = palette.teal, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineHintVisible",
        { fg = palette.teal, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineHintSelected",
        { fg = palette.teal, bg = active_bg, bold = true })

      -- EN: Duplicate buffer name highlights (when two buffers share the same filename).
      -- ES: Resaltados para nombres de buffer duplicados (cuando dos buffers tienen el mismo nombre de archivo).
      vim.api.nvim_set_hl(0, "BufferLineDuplicate",
        { fg = palette.overlay0, bg = inactive_bg, italic = true })
      vim.api.nvim_set_hl(0, "BufferLineDuplicateVisible",
        { fg = palette.subtext0, bg = visible_bg,  italic = true })
      vim.api.nvim_set_hl(0, "BufferLineDuplicateSelected",
        { fg = palette.subtext1, bg = active_bg,   italic = true })

      -- EN: DevIcons background fix. nvim-web-devicons assigns its own background
      --     color when creating highlight groups, which causes incorrect icon colors.
      --     This loop iterates over all generated BufferLineDevIcon groups and
      --     overrides their background with the correct color per tab state.
      -- ES: Fix del fondo de DevIcons. nvim-web-devicons asigna su propio color de fondo
      --     al crear los grupos de resaltado, lo que provoca colores de icono incorrectos.
      --     Este bucle recorre todos los grupos BufferLineDevIcon generados y sobreescribe
      --     su fondo con el color correcto según el estado del tab.
      for _, group in ipairs(vim.fn.getcompletion("BufferLineDevIcon", "highlight")) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
        if ok and hl then
          local bg
          if group:match("Selected$") then
            bg = active_bg
          elseif group:match("Visible$") then
            bg = visible_bg
          else
            bg = inactive_bg
          end
          vim.api.nvim_set_hl(0, group, {
            fg = hl.fg and string.format("#%06x", hl.fg) or palette.blue,
            bg = bg,
          })
        end
      end

      -- EN: Explicit fix for the Default DevIcon groups (fallback icon when
      --     no specific filetype icon is found).
      -- ES: Fix explícito para los grupos de DevIcon por defecto (icono de respaldo
      --     cuando no se encuentra un icono específico para el tipo de archivo).
      vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultInactive",
        { fg = palette.overlay1, bg = inactive_bg })
      vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultVisible",
        { fg = palette.subtext1, bg = visible_bg })
      vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultSelected",
        { fg = palette.blue,     bg = active_bg })
    end

    require("bufferline").setup({
      options = {
        -- EN: Display mode: "buffers" shows open buffers, "tabs" shows vim tabs.
        -- ES: Modo de visualización: "buffers" muestra buffers abiertos, "tabs" muestra tabs de vim.
        mode = "buffers",

        -- EN: Disable buffer numbering (set "ordinal" or "buffer_id" to enable).
        -- ES: Desactiva la numeración de buffers (usa "ordinal" o "buffer_id" para habilitarla).
        numbers = "none",

        -- EN: Command to close a buffer when clicking its close button or right-clicking.
        -- ES: Comando para cerrar un buffer al hacer clic en su botón de cierre o clic derecho.
        close_command       = "bdelete! %d",
        right_mouse_command = "bdelete! %d",

        -- EN: Command to switch to a buffer on left click.
        -- ES: Comando para cambiar a un buffer al hacer clic izquierdo.
        left_mouse_command  = "buffer %d",

        -- EN: Disable middle mouse button action.
        -- ES: Desactiva la acción del botón central del ratón.
        middle_mouse_command = nil,

        -- EN: Active buffer indicator style: "icon" shows a small icon on the left side.
        -- ES: Estilo del indicador del buffer activo: "icon" muestra un pequeño icono a la izquierda.
        indicator = {
          icon  = "▎",
          style = "icon",
        },

        -- EN: Icons for buffer close button, modified state, global close, and truncation markers.
        -- ES: Iconos para el botón de cierre de buffer, estado modificado, cierre global y marcadores de truncado.
        buffer_close_icon   = "󰅖",
        modified_icon       = "●",
        close_icon          = "󰅖",
        left_trunc_marker   = "",
        right_trunc_marker  = "",

        -- EN: Maximum characters for the buffer name and directory prefix.
        -- ES: Máximo de caracteres para el nombre del buffer y el prefijo de directorio.
        max_name_length   = 24,
        max_prefix_length = 18,

        -- EN: Minimum tab width in characters.
        -- ES: Ancho mínimo del tab en caracteres.
        tab_size = 24,

        -- EN: Enable LSP diagnostics integration in the bufferline.
        --     diagnostics_update_in_insert: avoid updating while typing.
        -- ES: Habilita la integración de diagnósticos LSP en la bufferline.
        --     diagnostics_update_in_insert: evita actualizar mientras se escribe.
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,

        -- EN: Custom diagnostic indicator showing the error/warning icon and count.
        -- ES: Indicador de diagnóstico personalizado que muestra el icono de error/advertencia y el conteo.
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- EN: Reserve space for neo-tree on the left side when it is open.
        --     separator = true adds a visual divider between neo-tree and the bufferline.
        -- ES: Reserva espacio para neo-tree en el lado izquierdo cuando está abierto.
        --     separator = true agrega un divisor visual entre neo-tree y la bufferline.
        offsets = {
          {
            filetype   = "neo-tree",
            text       = "File Explorer",
            highlight  = "Directory",
            text_align = "left",
            separator  = true,
          },
        },

        -- EN: Visibility toggles for icons and indicators in the bufferline.
        -- ES: Controles de visibilidad para iconos e indicadores en la bufferline.
        show_buffer_icons       = true,
        show_buffer_close_icons = true,
        show_close_icon         = false,
        show_tab_indicators     = true,

        -- EN: Allow tabs to have variable width (false = tabs can grow/shrink).
        -- ES: Permite que los tabs tengan ancho variable (false = los tabs pueden crecer/reducirse).
        enforce_regular_tabs = false,

        -- EN: Always show the bufferline, even when only one buffer is open.
        -- ES: Siempre muestra la bufferline, incluso cuando solo hay un buffer abierto.
        always_show_bufferline = true,

        -- EN: Use slant-style separators between tabs (triangle shape).
        --     Other options: "slope", "thick", "thin", { left = "", right = "" }.
        -- ES: Usa separadores estilo slant entre tabs (forma de triángulo).
        --     Otras opciones: "slope", "thick", "thin", { left = "", right = "" }.
        separator_style = "slant",

        -- EN: Hover interaction: reveal the close button after 180ms of hovering.
        -- ES: Interacción al pasar el cursor: muestra el botón de cierre tras 180ms.
        hover = {
          enabled = true,
          delay   = 180,
          reveal  = { "close" },
        },

        -- EN: Sort buffers so that the most recently opened one appears after the current.
        -- ES: Ordena los buffers para que el más reciente aparezca después del actual.
        sort_by = "insert_after_current",
      },
    })

    -- EN: Apply custom highlights immediately after bufferline setup.
    -- ES: Aplica los resaltados personalizados inmediatamente después de configurar bufferline.
    apply_bufferline_highlights()

    -- EN: Re-apply highlights on every colorscheme change
    --     (covers catppuccin-mocha, catppuccin-latte, etc.).
    -- ES: Vuelve a aplicar los resaltados en cada cambio de colorscheme
    --     (cubre catppuccin-mocha, catppuccin-latte, etc.).
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern  = "catppuccin*",
      callback = apply_bufferline_highlights,
    })

    -- EN: Re-apply highlights when a new buffer is added. DevIcon highlight groups
    --     are created lazily, so they may not exist on the first call.
    -- ES: Vuelve a aplicar los resaltados cuando se agrega un nuevo buffer. Los grupos
    --     de resaltado de DevIcon se crean de forma lazy, por lo que pueden no existir
    --     en la primera llamada.
    vim.api.nvim_create_autocmd("BufAdd", {
      once     = false,
      callback = function()
        vim.schedule(apply_bufferline_highlights)
      end,
    })

    -- EN: Keymaps for bufferline navigation and buffer management.
    -- ES: Atajos de teclado para navegación en bufferline y gestión de buffers.
    local map = function(key, cmd, desc)
      vim.keymap.set("n", key, cmd, { silent = true, desc = desc })
    end

    -- EN: Cycle between buffers.
    -- ES: Ciclar entre buffers.
    map("<leader>bp", "<Cmd>BufferLineCyclePrev<CR>",   "Previous buffer")
    map("<leader>bn", "<Cmd>BufferLineCycleNext<CR>",   "Next buffer")

    -- EN: Close buffers relative to current position.
    -- ES: Cerrar buffers relativos a la posición actual.
    map("<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", "Close other buffers")
    map("<leader>br", "<Cmd>BufferLineCloseRight<CR>",  "Close buffers to the right")
    map("<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",   "Close buffers to the left")
    map("<leader>bd", "<Cmd>bdelete<CR>",               "Close current buffer")

    -- EN: Jump directly to a buffer by its position number.
    --     Useful when numbers = "ordinal" is set.
    -- ES: Saltar directamente a un buffer por su número de posición.
    --     Útil cuando se configura numbers = "ordinal".
    map("<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", "Go to buffer 1")
    map("<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", "Go to buffer 2")
    map("<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", "Go to buffer 3")
    map("<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", "Go to buffer 4")
    map("<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>", "Go to buffer 5")
  end,
}
