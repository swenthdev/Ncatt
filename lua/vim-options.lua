-- EN: Use spaces instead of tabs for indentation.
-- ES: Usa espacios en lugar de tabs para la indentación.
vim.cmd("set expandtab")

-- EN: Number of spaces a <Tab> in the file counts for.
-- ES: Número de espacios que representa un <Tab> en el archivo.
vim.cmd("set tabstop=2")

-- EN: Number of spaces used when pressing <Tab> or <BS> in insert mode.
-- ES: Número de espacios que se insertan/eliminan al presionar <Tab> o <BS> en modo inserción.
vim.cmd("set softtabstop=2")

-- EN: Number of spaces used for each indentation step (>> / <<).
-- ES: Número de espacios usados por cada nivel de indentación (>> / <<).
vim.cmd("set shiftwidth=2")

-- EN: Set <Space> as the leader key for custom keymaps.
-- ES: Define <Space> como la tecla líder para atajos personalizados.
vim.g.mapleader = " "

-- EN: Default background before flavor.lua (system theme sync) loads, or if it's
--     missing. "vim.g.background" isn't a real option -- it's just an unrelated
--     global variable -- so this never actually reached catppuccin before.
-- ES: Fondo por defecto antes de que cargue flavor.lua (sincronización con el tema
--     del sistema), o si no existe. "vim.g.background" no es una opción real -- es
--     una variable global sin relación -- así que esto nunca llegaba a catppuccin.
vim.opt.background = "light"

-- EN: Disable swap file creation (prevents clutter and conflicts in version-controlled projects).
-- ES: Desactiva la creación de archivos swap (evita archivos innecesarios y conflictos en proyectos con control de versiones).
vim.opt.swapfile = false

-- EN: Split-pane navigation with Ctrl + hjkl is set up in
--     plugins/nvim-tmux-navigation.lua instead (loads after this file and
--     would silently override these same keys anyway; that plugin already
--     falls back to plain :wincmd navigation when not inside tmux).
-- ES: La navegación entre paneles con Ctrl + hjkl se define en
--     plugins/nvim-tmux-navigation.lua (carga después de este archivo y de
--     todos modos sobrescribiría estas mismas teclas; ese plugin ya usa
--     :wincmd normal cuando no se está dentro de tmux).

-- EN: Clear search highlights with <leader>h.
-- ES: Limpia el resaltado de búsqueda con <leader>h.
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- EN: Enable absolute line numbers in the gutter.
-- ES: Habilita los números de línea absolutos en el margen.
vim.wo.number = true

