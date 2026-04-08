# Ncatt

Neovim configuration in Lua with `lazy.nvim`.

[English](#english) | [Español](#espanol)

## English

### Overview

Ncatt is a modular Neovim setup focused on clean UI, LSP, Telescope, Neo-tree, Treesitter, Git tools, and a Catppuccin-based look.

### Current baseline

- Recommended Neovim version: `0.11.3+`
- Plugin manager: `lazy.nvim`
- Lua workspace helper: `lazydev.nvim`
- External tools: `git`, `node`, `npm`

### What was refreshed

- Updated the Lua development helper from `neodev.nvim` to `lazydev.nvim`
- Fixed the modern LSP flow with `vim.lsp.config()` + `vim.lsp.enable()`
- Removed a duplicate Git plugin definition

### Install

```bash
git clone https://github.com/swenthdev/Ncatt.git ~/.config/nvim
nvim
```

Then run `:Lazy sync` if needed.

### Notes

- Screenshots are in [`imgs/`](/home/swenthdev/Documents/Tech/Ncatt/imgs)
- How it works: [`docs/HOW_NCATT_WORKS.md`](/home/swenthdev/Documents/Tech/Ncatt/docs/HOW_NCATT_WORKS.md)

### License

This project is licensed under the **Ncatt Personal Use License v1.0**. See `LICENSE.txt` for details.

## Espanol

### Resumen

Ncatt es una configuración modular de Neovim enfocada en una interfaz limpia, LSP, Telescope, Neo-tree, Treesitter, herramientas Git y una apariencia basada en Catppuccin.

### Base actual

- Versión recomendada de Neovim: `0.11.3+`
- Gestor de plugins: `lazy.nvim`
- Ayudante para Lua: `lazydev.nvim`
- Herramientas externas: `git`, `node`, `npm`

### Qué se actualizó

- Se cambió `neodev.nvim` por `lazydev.nvim`
- Se corrigió el flujo LSP moderno con `vim.lsp.config()` + `vim.lsp.enable()`
- Se eliminó una definición duplicada de plugins Git

### Instalación

```bash
git clone https://github.com/swenthdev/Ncatt.git ~/.config/nvim
nvim
```

Luego ejecuta `:Lazy sync` si hace falta.

### Notas

- Las imágenes están en [`imgs/`](/home/swenthdev/Documents/Tech/Ncatt/imgs)
- Cómo funciona: [`docs/HOW_NCATT_WORKS.md`](/home/swenthdev/Documents/Tech/Ncatt/docs/HOW_NCATT_WORKS.md)

### Licencia

Este proyecto está licenciado bajo la **Ncatt Personal Use License v1.0**. Revisa `LICENSE.txt` para más detalles.
