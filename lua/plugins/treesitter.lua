return {
  -- EN: Treesitter provides advanced syntax highlighting and code parsing using incremental parsing.
  -- ES: Treesitter ofrece resaltado de sintaxis avanzado y análisis del código mediante análisis incremental.
  {
    "nvim-treesitter/nvim-treesitter",
    -- EN: The upstream repo was archived (Apr 2026) after a full, incompatible
    --     rewrite landed on its "main" branch (ensure_installed/highlight.enable
    --     were removed there). "master" is the old API this config below uses,
    --     kept available and frozen for backward compatibility -- pin it
    --     explicitly so a future install never silently resolves to "main".
    -- ES: El repo original fue archivado (abr 2026) tras una reescritura
    --     completa e incompatible en la rama "main" (ahí se eliminaron
    --     ensure_installed/highlight.enable). "master" es la API vieja que usa
    --     esta config, disponible y congelada por compatibilidad -- se fija
    --     explícitamente para que una instalación futura nunca caiga en "main".
    branch = "master",
    build = ":TSUpdate", -- EN: Automatically updates parsers when installed / ES: Actualiza automáticamente los parsers al instalar.
    config = function()
      -- EN: Load Treesitter configuration.
      -- ES: Carga la configuración de Treesitter.
      local config = require("nvim-treesitter.configs")

      -- EN: Markdown fences tagged ```sh/```shell/```zsh need to resolve to the
      --     "bash" parser (there's no separate one). Core's injection resolver
      --     looks these up through vim.treesitter.language.get_lang(), which is
      --     empty unless something registers the alias -- the plugin's own
      --     (now unused, see queries/markdown/injections.scm) injections.scm
      --     used to handle this via a custom directive.
      -- ES: Los fences de markdown con ```sh/```shell/```zsh deben resolver al
      --     parser "bash" (no existe uno separado). El resolvedor de
      --     inyecciones del core lo busca vía vim.treesitter.language.get_lang(),
      --     que está vacío a menos que algo registre el alias -- el
      --     injections.scm del plugin (ya sin uso, ver queries/markdown/injections.scm)
      --     lo manejaba con una directiva personalizada.
      vim.treesitter.language.register("bash", { "sh", "shell", "zsh" })

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

