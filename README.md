# 🧠 Project Ncatt

> Neovim configuration in Lua using `lazy.nvim`.

[**English**](#english) | [**Español**](#espa%C3%B1ol)

---

## English

### 📘 Introduction

Welcome to **Ncatt**, a Neovim configuration crafted with performance and customization in mind. Built using **Lua** and the powerful plugin manager **[lazy.nvim](https://github.com/folke/lazy.nvim)**, this setup aims to be modular, fast, and developer-friendly.

### 📸 Screenshots

> ⚠️ **Note**: Images are removed on first use after cloning to avoid loading issues.

<p align="center">
    <img src="/imgs/ncatt-latte.png" width="300"/>
    <img src="/imgs/ncatt-mocha.png" width="300"/>
    <br/>
    <img src="/imgs/neo-tree-latte.png" width="300"/>
    <img src="/imgs/neo-tree-mocha.png" width="300"/>
    <br/>
    <img src="/imgs/split-latte.png" width="300"/>
    <img src="/imgs/split-mocha.png" width="300"/>
</p>

### 📁 File Structure

Each file in the `plugins` directory corresponds to the configuration for a specific plugin:

- `alpha.lua`: Start screen with `alpha-nvim`
- `autopairs.lua`: Auto-close pairs with `nvim-autopairs`
- `catppuccin.lua`: Theme configuration for `catppuccin`
- `completions.lua`: Autocompletion with `nvim-cmp`
- `git-stuff.lua`: Git integrations (e.g., `gitsigns.nvim`)
- `gitsigns.lua`: Git signs in the gutter
- `indent-blankline.lua`: Indentation guides
- `lsp-config.lua`: LSP setup with `nvim-lspconfig`
- `lualine.lua`: Statusline with `lualine.nvim`
- `neo-tree.lua`: File explorer (`neo-tree.nvim`)
- `neodev.lua`: Enhances Lua dev experience for Neovim
- `null-ls.lua`: Linters and formatters with `null-ls.nvim`
- `nvim-tmux-navigation.lua`: Navigation between Neovim and tmux
- `telescope.lua`: Fuzzy finder with `telescope.nvim`
- `treesitter.lua`: Advanced syntax highlighting
- `vim-splits.lua`: Split management

### ⚙️ Prerequisites

Make sure the following are installed:

- [Neovim](https://neovim.io/) `v0.8+`
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/)

### 🚀 Installation

```bash
git clone https://github.com/swenthdev/Ncatt.git ~/.config/nvim
rm -rf ~/.config/nvim/imgs ~/.config/nvim/README.md

```


# 🧠 Proyecto Ncatt

> Configuración de Neovim en Lua usando `lazy.nvim`.

[**Versión en Inglés**](#english) | [**Español**](#espa%C3%B1ol)

---

## 📘 Introducción

Bienvenido a **Ncatt**, una configuración de Neovim modular, optimizada y pensada para desarrolladores. Está escrita en **Lua** y utiliza **[lazy.nvim](https://github.com/folke/lazy.nvim)** como gestor de plugins.

Este entorno te proporcionará una experiencia fluida con soporte para LSP, autocompletado, integración con Git, resaltado avanzado de sintaxis y más.

---

## 📸 Algunas Imágenes

> ⚠️ **Nota**: Las imágenes serán eliminadas automáticamente al clonar el repositorio, para evitar errores en la carga inicial.

<p align="center">
    <img src="/imgs/ncatt-latte.png" width="300"/>
    <img src="/imgs/ncatt-mocha.png" width="300"/>
    <br/>
    <img src="/imgs/neo-tree-latte.png" width="300"/>
    <img src="/imgs/neo-tree-mocha.png" width="300"/>
    <br/>
    <img src="/imgs/split-latte.png" width="300"/>
    <img src="/imgs/split-mocha.png" width="300"/>
</p>

---

## 📁 Estructura de Archivos

Cada archivo en el directorio `plugins` contiene la configuración específica de un plugin o funcionalidad:

- `alpha.lua`: Pantalla de inicio con `alpha-nvim`
- `autopairs.lua`: Cierre automático de paréntesis y llaves con `nvim-autopairs`
- `catppuccin.lua`: Tema visual `catppuccin`
- `completions.lua`: Autocompletado con `nvim-cmp`
- `git-stuff.lua`: Plugins relacionados con Git como `gitsigns.nvim`
- `gitsigns.lua`: Indicadores de cambios en el margen del código
- `indent-blankline.lua`: Guías visuales de indentación
- `lsp-config.lua`: Configuración de servidores de lenguaje (LSP)
- `lualine.lua`: Barra de estado con `lualine.nvim`
- `neo-tree.lua`: Explorador de archivos (`neo-tree.nvim`)
- `neodev.lua`: Mejora la experiencia al desarrollar plugins en Lua
- `null-ls.lua`: Integración de linters y formatters con `null-ls.nvim`
- `nvim-tmux-navigation.lua`: Navegación fluida entre Neovim y tmux
- `telescope.lua`: Buscador de archivos y símbolos con `telescope.nvim`
- `treesitter.lua`: Resaltado avanzado de sintaxis con `nvim-treesitter`
- `vim-splits.lua`: Gestión eficiente de splits en Neovim

---

## ⚙️ Requisitos Previos

Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas:

- [Neovim](https://neovim.io/) `v0.8` o superior
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) y [npm](https://www.npmjs.com/) (necesario para algunos LSP y Treesitter)

---

## 🚀 Instalación

Clona este repositorio directamente en tu configuración de Neovim:

```bash
git clone https://github.com/swenthdev/Ncatt.git ~/.config/nvim
rm -rf ~/.config/nvim/imgs ~/.config/nvim/README.md

```
