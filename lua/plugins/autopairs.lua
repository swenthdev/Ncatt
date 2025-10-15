return {
  'windwp/nvim-autopairs',
  config = function()
    -- EN: Load and configure the nvim-autopairs plugin to automatically insert matching pairs like (), {}, [].
    -- ES: Carga y configura el plugin nvim-autopairs para insertar automáticamente los pares coincidentes como (), {}, [].
    require('nvim-autopairs').setup({
      -- EN: Disable autopairs in these specific filetypes (for example, Telescope prompt or Vimscript files).
      -- ES: Desactiva autopairs en estos tipos de archivos específicos (por ejemplo, el prompt de Telescope o archivos Vimscript).
      disable_filetype = { "TelescopePrompt", "vim" },
    })
  end
}

