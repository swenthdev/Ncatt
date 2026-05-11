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

-- EN: Set the default background theme to light.
-- ES: Establece el tema de fondo predeterminado en claro.
vim.g.background = "light"

-- EN: Disable swap file creation (prevents clutter and conflicts in version-controlled projects).
-- ES: Desactiva la creación de archivos swap (evita archivos innecesarios y conflictos en proyectos con control de versiones).
vim.opt.swapfile = false

-- EN: Keymaps for navigating between split panes using Ctrl + hjkl.
-- ES: Atajos para navegar entre paneles divididos con Ctrl + hjkl.
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- EN: Clear search highlights with <leader>h.
-- ES: Limpia el resaltado de búsqueda con <leader>h.
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- EN: Enable absolute line numbers in the gutter.
-- ES: Habilita los números de línea absolutos en el margen.
vim.wo.number = true

