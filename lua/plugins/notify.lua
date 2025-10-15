return {
  -- EN: Notification plugin for Neovim — provides elegant, animated popup messages.
  -- ES: Plugin de notificaciones para Neovim — muestra mensajes emergentes elegantes y animados.
  'rcarriga/nvim-notify',

  config = function()
    -- EN: Load the notify module.
    -- ES: Carga el módulo notify.
    local notify = require('notify')

    -- EN: Keymap to open the notification history window.
    -- ES: Mapeo de tecla para abrir la ventana del historial de notificaciones.
    vim.keymap.set("n", "<leader>m", ":Notifications<CR>", { noremap = true, silent = true })

    -- EN: Main configuration for nvim-notify.
    -- ES: Configuración principal de nvim-notify.
    notify.setup({
      stages = "fade",  -- EN: Animation style for showing/hiding notifications. / ES: Estilo de animación al mostrar u ocultar notificaciones.
      timeout = 3000,   -- EN: Duration in milliseconds before a message disappears. / ES: Duración en milisegundos antes de que el mensaje desaparezca.
      background_colour = "#1e1e2f",  -- EN: Notification background color. / ES: Color de fondo de las notificaciones.
      minimum_width = 50,  -- EN: Minimum notification width. / ES: Ancho mínimo de la notificación.
      max_width = function() return math.floor(vim.o.columns * 0.4) end, -- EN: Limit width to 40% of window. / ES: Limita el ancho al 40% de la ventana.
      max_height = function() return math.floor(vim.o.lines * 0.2) end,  -- EN: Limit height to 20% of window. / ES: Limita la altura al 20% de la ventana.
      top_down = true,  -- EN: Display notifications from top to bottom. / ES: Muestra las notificaciones de arriba hacia abajo.
      render = "default", -- EN: Default rendering style. / ES: Estilo de renderizado por defecto.

      -- EN: Custom behavior for notification window appearance.
      -- ES: Comportamiento personalizado para la apariencia de las ventanas de notificación.
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 1000 }) -- EN: Keeps window on top. / ES: Mantiene la ventana en primer plano.
        vim.wo[win].wrap = false -- EN: Disable line wrapping. / ES: Desactiva el ajuste de línea.
        vim.api.nvim_win_set_config(win, { style = "minimal", border = "rounded" }) -- EN: Rounded border style. / ES: Usa bordes redondeados.
      end,
    })

    -- EN: Import Catppuccin color palette for consistent styling.
    -- ES: Importa la paleta de colores de Catppuccin para mantener coherencia visual.
    local colors = require('catppuccin.palettes').get_palette()

    -- EN: Define highlight groups for notification borders by severity.
    -- ES: Define grupos de resaltado para los bordes según la severidad del mensaje.
    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = colors.red, bg = colors.base })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder",  { fg = colors.yellow, bg = colors.base })
    vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { fg = colors.green, bg = colors.base })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = colors.teal, bg = colors.base })

    -- EN: Define colors for notification titles by severity.
    -- ES: Define los colores de los títulos de notificación según la severidad.
    vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = colors.red })
    vim.api.nvim_set_hl(0, "NotifyWARNTitle",  { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "NotifyINFOTitle",  { fg = colors.green })
    vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = colors.teal })

    -- EN: Define text color for notification bodies.
    -- ES: Define el color del texto de los cuerpos de notificación.
    vim.api.nvim_set_hl(0, "NotifyERRORBody", { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyWARNBody",  { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyINFOBody",  { fg = colors.text })
    vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { fg = colors.text })

    -- EN: Override the LSP "window/showMessage" handler to display messages via notify.
    -- ES: Sobrescribe el manejador LSP “window/showMessage” para mostrar mensajes con notify.
    vim.lsp.handlers["window/showMessage"] = function(_, method, params, _)
      local severity = ({
        [1] = "ERROR",
        [2] = "WARN",
        [3] = "INFO",
        [4] = "DEBUG",
      })[params.type]
      notify(method.message, severity, { title = "LSP" })
    end

    -- EN: Show LSP diagnostics as notifications after each file save.
    -- ES: Muestra los diagnósticos del LSP como notificaciones después de guardar un archivo.
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        local diagnostics = vim.diagnostic.get(0)
        for _, diagnostic in ipairs(diagnostics) do
          local severity = ({
            [vim.diagnostic.severity.ERROR] = "ERROR",
            [vim.diagnostic.severity.WARN]  = "WARN",
            [vim.diagnostic.severity.INFO]  = "INFO",
            [vim.diagnostic.severity.HINT]  = "DEBUG",
          })[diagnostic.severity]
          notify(diagnostic.message, severity, { title = "LSP Diagnostic", timeout = 4000 })
        end
      end,
    })

    -- EN: Configure Neovim diagnostic display options (for inline and floating messages).
    -- ES: Configura las opciones de visualización de diagnósticos en Neovim (para mensajes en línea y flotantes).
    vim.diagnostic.config({
      virtual_text = true,  -- EN: Show diagnostics inline. / ES: Muestra los diagnósticos en línea.
      signs = true,         -- EN: Show signs in the gutter. / ES: Muestra signos en la columna lateral.
      update_in_insert = true, -- EN: Update diagnostics while typing. / ES: Actualiza los diagnósticos mientras escribes.
      severity_sort = true, -- EN: Sort diagnostics by severity. / ES: Ordena los diagnósticos por severidad.
      float = {
        source = true,
        border = "rounded", -- EN: Rounded border for floating diagnostic windows. / ES: Bordes redondeados en ventanas flotantes.
        format = function(diagnostic)
          return string.format("%s (%s)", diagnostic.message, diagnostic.source or "")
        end,
      },
    })
  end,
}

