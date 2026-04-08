# How Ncatt Works

[English](#english) | [Español](#espanol)

## English

### What Ncatt is

Ncatt is a Neovim configuration written in Lua.
It uses `lazy.nvim` to load plugins and keeps the setup split into small files inside `lua/plugins/`.

### Startup flow

1. `init.lua` starts Neovim.
2. It checks whether `lazy.nvim` exists locally.
3. If `lazy.nvim` is missing, it clones it automatically.
4. It adds `lazy.nvim` to the runtime path.
5. It loads base options from `lua/vim-options.lua`.
6. It loads every plugin spec from `lua/plugins/` with `require("lazy").setup("plugins")`.

### Main files

- `init.lua`
  Bootstraps `lazy.nvim`, loads base settings, and applies a few global UI tweaks.
- `lua/vim-options.lua`
  Contains editor options such as tabs, leader key, background mode, line numbers, and some core keymaps.
- `lua/plugins/*.lua`
  Each file defines one plugin or one feature area.

### Plugin structure

Ncatt is modular.
Each file in `lua/plugins/` returns a Lua table that `lazy.nvim` reads as plugin configuration.

Main areas:

- `catppuccin.lua`
  Theme setup. Handles the main colorscheme and flavor behavior.
- `bufferline.lua`
  Top buffer bar.
- `lualine.lua`
  Statusline at the bottom.
- `alpha.lua`
  Startup dashboard.
- `neo-tree.lua`
  File explorer.
- `telescope.lua`
  File and text search.
- `treesitter.lua`
  Syntax highlighting and parser-based features.
- `completions.lua`
  Autocompletion with `nvim-cmp`, snippets, and Lua helper integration.
- `lsp-config.lua`
  Language Server Protocol setup with Mason and Neovim's modern LSP flow.
- `null-ls.lua`
  External formatters through `none-ls`.
- `git-stuff.lua`
  Git integration with Fugitive and Gitsigns.
- `noice.lua` and `notify.lua`
  Message UI and notifications.
- `nvim-tmux-navigation.lua`
  Navigation between Neovim splits and tmux panes.

### Theme behavior

Ncatt uses Catppuccin as the main theme.
The active look depends on Neovim's `background` value:

- `dark` -> `mocha`
- `light` -> `latte`

Some UI parts such as bufferline, lualine, and notify also read the active flavor so they stay visually in sync.

### LSP and coding features

Ncatt uses:

- `mason.nvim` to manage LSP tools
- `mason-lspconfig.nvim` to ensure selected servers are installed
- `nvim-lspconfig` with `vim.lsp.config()` and `vim.lsp.enable()`
- `nvim-cmp` for completion
- `lazydev.nvim` for a better Neovim Lua development experience
- `none-ls.nvim` for formatters such as `stylua` and `prettier`

### Keymap idea

Ncatt separates responsibilities to avoid conflicts:

- `Ctrl-h/j/k/l` for tmux and Neovim pane navigation
- `<leader>wh/wj/wk/wl` for pure Neovim window movement
- Plugin-specific mappings live close to the plugin that uses them

### How to customize Ncatt safely

If you want to edit Ncatt, the safest pattern is:

1. Change base editor behavior in `lua/vim-options.lua`
2. Change plugin behavior in the matching file inside `lua/plugins/`
3. Open Neovim and run `:Lazy sync` after plugin changes
4. Test both dark and light background if the change affects UI

### Quick mental model

Ncatt works like this:

- `init.lua` starts everything
- `lazy.nvim` loads the modules
- each plugin file handles one responsibility
- Catppuccin gives the main visual identity
- LSP, completion, Treesitter, Telescope, and Neo-tree form the main editing workflow

## Espanol

### Qué es Ncatt

Ncatt es una configuración de Neovim escrita en Lua.
Usa `lazy.nvim` para cargar plugins y mantiene todo dividido en archivos pequeños dentro de `lua/plugins/`.

### Flujo de arranque

1. `init.lua` inicia Neovim.
2. Revisa si `lazy.nvim` existe localmente.
3. Si `lazy.nvim` no está, lo clona automáticamente.
4. Lo agrega al runtime path.
5. Carga las opciones base desde `lua/vim-options.lua`.
6. Carga todas las definiciones de plugins desde `lua/plugins/` con `require("lazy").setup("plugins")`.

### Archivos principales

- `init.lua`
  Inicializa `lazy.nvim`, carga la configuración base y aplica algunos ajustes globales de interfaz.
- `lua/vim-options.lua`
  Contiene opciones del editor como tabs, tecla leader, modo de fondo, números de línea y atajos base.
- `lua/plugins/*.lua`
  Cada archivo define un plugin o un área funcional.

### Estructura de plugins

Ncatt es modular.
Cada archivo en `lua/plugins/` devuelve una tabla de Lua que `lazy.nvim` interpreta como configuración.

Áreas principales:

- `catppuccin.lua`
  Configuración del tema principal.
- `bufferline.lua`
  Barra superior de buffers.
- `lualine.lua`
  Barra de estado inferior.
- `alpha.lua`
  Dashboard de inicio.
- `neo-tree.lua`
  Explorador de archivos.
- `telescope.lua`
  Búsqueda de archivos y texto.
- `treesitter.lua`
  Resaltado de sintaxis y funciones basadas en parsers.
- `completions.lua`
  Autocompletado con `nvim-cmp`, snippets e integración para Lua.
- `lsp-config.lua`
  Configuración de LSP con Mason y el flujo moderno de Neovim.
- `null-ls.lua`
  Formateadores externos mediante `none-ls`.
- `git-stuff.lua`
  Integración con Git usando Fugitive y Gitsigns.
- `noice.lua` y `notify.lua`
  Interfaz de mensajes y notificaciones.
- `nvim-tmux-navigation.lua`
  Navegación entre splits de Neovim y paneles de tmux.

### Comportamiento del tema

Ncatt usa Catppuccin como tema principal.
La apariencia activa depende del valor `background` de Neovim:

- `dark` -> `mocha`
- `light` -> `latte`

Partes de la interfaz como bufferline, lualine y notify también leen el sabor activo para mantenerse visualmente sincronizadas.

### LSP y funciones de desarrollo

Ncatt usa:

- `mason.nvim` para gestionar herramientas LSP
- `mason-lspconfig.nvim` para instalar servidores definidos
- `nvim-lspconfig` con `vim.lsp.config()` y `vim.lsp.enable()`
- `nvim-cmp` para autocompletado
- `lazydev.nvim` para mejorar el desarrollo Lua en Neovim
- `none-ls.nvim` para formateadores como `stylua` y `prettier`

### Idea de atajos

Ncatt separa responsabilidades para evitar conflictos:

- `Ctrl-h/j/k/l` para navegar entre paneles de tmux y Neovim
- `<leader>wh/wj/wk/wl` para moverte entre ventanas solo dentro de Neovim
- Los atajos específicos viven cerca del plugin que los usa

### Cómo personalizar Ncatt sin romperlo

Si quieres editar Ncatt, el patrón más seguro es:

1. Cambiar comportamiento base del editor en `lua/vim-options.lua`
2. Cambiar comportamiento de plugins en el archivo correspondiente dentro de `lua/plugins/`
3. Abrir Neovim y ejecutar `:Lazy sync` después de cambiar plugins
4. Probar tanto modo oscuro como claro si el cambio afecta la interfaz

### Modelo mental rápido

Ncatt funciona así:

- `init.lua` arranca todo
- `lazy.nvim` carga los módulos
- cada archivo de plugin tiene una responsabilidad concreta
- Catppuccin define la identidad visual principal
- LSP, completion, Treesitter, Telescope y Neo-tree forman el flujo principal de trabajo
