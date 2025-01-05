<div align="center">
   <img src="/img/Ncatt.svg" alt="Ncatt Logo" style="border-radius: 50%; height: 450px; width: 450px;"/>
</div>

# Project Ncatt

# Neovim Configuration

[**English Version**](#english) | [**Versión en Español**](#español)

---

## English

### Introduction

This repository contains my Neovim configuration files, based on Lua, and using `lazy.nvim` as a plugin manager. Each file in the `plugins` directory corresponds to the configuration of a plugin or set of functionalities in Neovim.

## Screenshots

**Note**: For initial use, the images in this README will be removed to ensure proper functionality after cloning.

<p align="center">
     <img src="/img/alpha.png" alt="" width="300"/>
     <img src="/img/vim.png" alt="" width="300"/>
     <br>
     <img src="/img/lualine.png" alt="" width="300"/>
</p>

## File Structure

- **alpha.lua**: Configuration for Neovim's start screen using the `alpha-nvim` plugin.
- **autopairs.lua**: Configuration for handling automatic closing of parentheses, braces, and other pairs using `nvim-autopairs`.
- **catppuccin.lua**: Configuration of the `catppuccin` theme for Neovim, with support for different styles and integration settings.
- **completions.lua**: Configuration for autocompletion, using `nvim-cmp` or similar.
- **git-stuff.lua**: Git-related plugins, such as `gitsigns.nvim`, configured for version control.
- **gitsigns.lua**: Specific configuration for the `gitsigns.nvim` plugin, which shows Git changes in the gutter.
- **indent-blankline.lua**: Configuration for `indent-blankline.nvim`, adding indentation guides.
- **lsp-config.lua**: Configuration of Language Server Protocols (LSP) using `nvim-lspconfig`.
- **lualine.lua**: Statusline configuration using `lualine.nvim`.
- **neo-tree.lua**: File explorer using `neo-tree.nvim`.
- **neodev.lua**: Configuration for `neodev.nvim` to aid Neovim plugin development.
- **null-ls.lua**: Configuration for `null-ls.nvim` for linters, formatters, and more.
- **nvim-tmux-navigation.lua**: Navigation integration between Neovim and tmux.
- **telescope.lua**: Powerful finder using `telescope.nvim`.
- **treesitter.lua**: Syntax highlighting with `nvim-treesitter`.
- **vim-splits.lua**: Split management in Neovim.

### Prerequisites

Ensure you have the following tools installed on your system:

- [Neovim](https://neovim.io/) v0.8 or higher
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) (for some LSP and Treesitter plugins)

### Installation

1. Clone this repository to your Neovim configuration directory:

   ```sh
   git clone https://github.com/SwintDev/Config-Neovim.git ~/.config/nvim
   rm -rf ~/.config/nvim/img ~/.config/nvim/README.md
   ```
---
### License 

File txt

---

<div align="center">
   <img src="/img/Ncatt.svg" alt="Ncatt Logo" style="border-radius: 50%; height: 450px; width: 450px;"/>
</div>

# Proyecto Ncatt

## Configuración de Neovim

## Español

### Introducción

Este repositorio contiene la configuración de Neovim basada en Lua, utilizando `lazy.nvim` como gestor de plugins. Cada archivo en el directorio `plugins` corresponde a la configuración de un plugin o de un conjunto de funcionalidades en Neovim.

## Algunas Imágenes

**Nota**: Para el uso inicial, las imágenes en este README se eliminarán para asegurar que la configuración funcione correctamente después de clonar.

<p align="center">
     <img src="/img/alpha.png" alt="" width="300"/>
     <img src="/img/vim.png" alt="" width="300"/>
     <br>
     <img src="/img/lualine.png" alt="" width="300"/>
</p>

## Estructura de Archivos

- **alpha.lua**: Configuración para la pantalla de inicio de Neovim usando `alpha-nvim`.
- **autopairs.lua**: Manejo de cierre automático de paréntesis y otros pares con `nvim-autopairs`.
- **catppuccin.lua**: Configuración del tema `catppuccin` con integración de estilos.
- **completions.lua**: Configuración de autocompletado con `nvim-cmp`.
- **git-stuff.lua**: Plugins relacionados con Git, como `gitsigns.nvim`.
- **gitsigns.lua**: Configuración de `gitsigns.nvim`, mostrando cambios de Git en el margen.
- **indent-blankline.lua**: Añade guías de indentación con `indent-blankline.nvim`.
- **lsp-config.lua**: Configuración de servidores de lenguaje con `nvim-lspconfig`.
- **lualine.lua**: Barra de estado personalizada con `lualine.nvim`.
- **neo-tree.lua**: Explorador de archivos con `neo-tree.nvim`.
- **neodev.lua**: Facilita el desarrollo de plugins para Neovim con `neodev.nvim`.
- **null-ls.lua**: Configuración de linters y formatters con `null-ls.nvim`.
- **nvim-tmux-navigation.lua**: Navegación entre Neovim y tmux.
- **telescope.lua**: Buscador potente con `telescope.nvim`.
- **treesitter.lua**: Resaltado avanzado de sintaxis con `nvim-treesitter`.
- **vim-splits.lua**: Manejo de splits en Neovim.

### Requisitos Previos

Asegúrate de tener las siguientes herramientas instaladas:

- [Neovim](https://neovim.io/) v0.8 o superior
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) y [npm](https://www.npmjs.com/) (para algunos plugins de LSP y Treesitter)

### Instalación

1. Clona este repositorio en tu directorio de configuración de Neovim:

   ```sh
   git clone https://github.com/SwintDev/Config-Neovim.git ~/.config/nvim
   rm -rf ~/.config/nvim/img ~/.config/nvim/README.md
   ```
---
### Licencia

Archivo txt

---
