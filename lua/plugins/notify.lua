return {
  -- EN: Notification plugin for Neovim — provides elegant, animated popup messages.
  -- ES: Plugin de notificaciones para Neovim — muestra mensajes emergentes elegantes y animados.
  'rcarriga/nvim-notify',

  config = function()
    -- EN: Load the notify module.
    -- ES: Carga el módulo notify.
    local notify = require('notify')
    local function current_palette()
      local flavour = vim.o.background == "light" and "latte" or "mocha"
      return require('catppuccin.palettes').get_palette(flavour)
    end

    -- EN: Keymap to open the notification history window.
    -- ES: Mapeo de tecla para abrir la ventana del historial de notificaciones.
    vim.keymap.set("n", "<leader>m", ":Notifications<CR>", { noremap = true, silent = true })

    -- EN: Main configuration for nvim-notify.
    -- ES: Configuración principal de nvim-notify.
    local colors = current_palette()
    notify.setup({
      stages = "fade",  -- EN: Animation style for showing/hiding notifications. / ES: Estilo de animación al mostrar u ocultar notificaciones.
      timeout = 1800,   -- EN: Duration in milliseconds before a message disappears. / ES: Duración en milisegundos antes de que el mensaje desaparezca.
      background_colour = colors.base,  -- EN: Notification background color. / ES: Color de fondo de las notificaciones.
      minimum_width = 40,  -- EN: Minimum notification width. / ES: Ancho mínimo de la notificación.
      max_width = function() return math.floor(vim.o.columns * 0.4) end, -- EN: Limit width to 40% of window. / ES: Limita el ancho al 40% de la ventana.
      max_height = function() return math.floor(vim.o.lines * 0.15) end,  -- EN: Limit height to 15% of window. / ES: Limita la altura al 15% de la ventana.
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

    -- EN: Make notify the default notification UI so plugins share one backend.
    -- ES: Hace que notify sea la interfaz por defecto para que los plugins compartan un solo backend.
    vim.notify = notify

    -- EN: Apply notification colors according to the active Catppuccin flavour.
    -- ES: Aplica los colores de las notificaciones según el sabor activo de Catppuccin.
    local function apply_notify_highlights()
      local refreshed = current_palette()
      vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = refreshed.red, bg = refreshed.base })
      vim.api.nvim_set_hl(0, "NotifyWARNBorder",  { fg = refreshed.yellow, bg = refreshed.base })
      vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { fg = refreshed.green, bg = refreshed.base })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = refreshed.teal, bg = refreshed.base })

      vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = refreshed.red })
      vim.api.nvim_set_hl(0, "NotifyWARNTitle",  { fg = refreshed.yellow })
      vim.api.nvim_set_hl(0, "NotifyINFOTitle",  { fg = refreshed.green })
      vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = refreshed.teal })

      vim.api.nvim_set_hl(0, "NotifyERRORBody", { fg = refreshed.text })
      vim.api.nvim_set_hl(0, "NotifyWARNBody",  { fg = refreshed.text })
      vim.api.nvim_set_hl(0, "NotifyINFOBody",  { fg = refreshed.text })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { fg = refreshed.text })
    end

    apply_notify_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin",
      callback = apply_notify_highlights,
    })

  end,
}
