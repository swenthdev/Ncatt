return {
  -- EN: Neovim Session Manager helps manage, save, and restore sessions (open buffers, windows, tabs, etc.).
  -- ES: Neovim Session Manager ayuda a gestionar, guardar y restaurar sesiones (buffers, ventanas, pestañas, etc.).
  'Shatur/neovim-session-manager',

  config = function()
    -- EN: Loads and configures the session manager.
    -- ES: Carga y configura el administrador de sesiones.
    require('session_manager').setup({
      -- EN: Disables automatic session loading on startup.
      -- ES: Desactiva la carga automática de sesiones al iniciar Neovim.
      autoload_mode = require('session_manager.config').AutoloadMode.Disabled,

      -- EN: Sets the directory where sessions will be saved.
      -- ES: Define el directorio donde se guardarán las sesiones.
      sessions_dir = vim.fn.expand("~/.config/nvim/sessions/"),
    })
  end
}

