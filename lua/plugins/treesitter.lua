return {
  -- EN: Treesitter provides advanced syntax highlighting and code parsing using incremental parsing.
  -- ES: Treesitter ofrece resaltado de sintaxis avanzado y análisis del código mediante análisis incremental.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- EN: Automatically updates parsers when installed / ES: Actualiza automáticamente los parsers al instalar.
    config = function()
      -- EN: Load Treesitter configuration.
      -- ES: Carga la configuración de Treesitter.
      local config = require("nvim-treesitter.configs")

      config.setup({
        -- EN: List of languages to install Treesitter parsers for.
        -- ES: Lista de lenguajes para los que se instalarán los parsers de Treesitter.
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript",
          "html", "json", "typescript", "tsx", "yaml", "css", "markdown",
          "markdown_inline", "graphql", "c_sharp", "csv", "dockerfile", "dot",
          "gitignore", "go", "python", "sql", "xml",
        },

        -- EN: Automatically install missing parsers when opening a file.
        -- ES: Instala automáticamente los parsers faltantes al abrir un archivo.
        auto_install = true,

        -- EN: Enables syntax highlighting.
        -- ES: Activa el resaltado de sintaxis.
        highlight = { enable = true },

        -- EN: Enables automatic indentation based on syntax tree.
        -- ES: Activa la indentación automática basada en el árbol sintáctico.
        indent = { enable = true },
      })
    end
  },

  -- EN: Plugin for automatically closing and renaming HTML/XML tags using Treesitter context.
  -- ES: Plugin para cerrar y renombrar automáticamente etiquetas HTML/XML usando el contexto de Treesitter.
  {
    "windwp/nvim-ts-autotag",
    config = function()
      -- EN: Load and configure nvim-ts-autotag.
      -- ES: Carga y configura nvim-ts-autotag.
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,        -- EN: Automatically close tags / ES: Cierra etiquetas automáticamente.
          enable_rename = true,       -- EN: Automatically rename paired tags / ES: Renombra etiquetas emparejadas automáticamente.
          enable_close_on_slash = false, -- EN: Disable auto-close on self-closing slash / ES: Desactiva cierre automático al usar barra final.
        },

        -- EN: Per-filetype settings to control tag behavior in different languages.
        -- ES: Configuraciones por tipo de archivo para controlar el comportamiento de etiquetas en distintos lenguajes.
        per_filetype = {
          ["html"] = { enable_close = true, enable_rename = true },
          ["astro"] = { enable_close = true, enable_rename = true },
          ["glimmer"] = { enable_close = true, enable_rename = true },
          ["handlebars"] = { enable_close = true, enable_rename = true },
          ["javascript"] = { enable_close = true, enable_rename = true },
          ["jsx"] = { enable_close = true, enable_rename = true },
          ["markdown"] = { enable_close = true, enable_rename = true },
          ["php"] = { enable_close = true, enable_rename = true },
          ["rescript"] = { enable_close = true, enable_rename = true },
          ["svelte"] = { enable_close = true, enable_rename = true },
          ["tsx"] = { enable_close = true, enable_rename = true },
          ["twig"] = { enable_close = true, enable_rename = true },
          ["typescript"] = { enable_close = true, enable_rename = true },
          ["vue"] = { enable_close = true, enable_rename = true },
          ["xml"] = { enable_close = true, enable_rename = true },
        }
      })
    end
  }
}

