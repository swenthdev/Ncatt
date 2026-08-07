; Neovim core ships its own queries/markdown/injections.scm (kept up to date
; with core's treesitter engine), but nvim-treesitter (the plugin, archived
; upstream Apr 2026 and frozen on the old "master" API) also ships its own
; version of this exact file. Since the plugin sits earlier/higher-priority on
; the runtimepath, its copy silently shadowed core's for every query lookup
; (verified with vim.treesitter.query.get_files('markdown', 'injections')).
;
; The plugin's version uses a `#set-lang-from-info-string!` directive that no
; longer works correctly against core's newer languagetree/highlighter code,
; crashing on every markdown file with a fenced code block:
;   attempt to call method 'range' (a nil value)
;
; vim.treesitter.query.get_files() picks the FIRST matching file found in
; 'runtimepath' order as the base query (later matches are only appended if
; they declare themselves an extension via a "; extends" modeline -- they
; don't replace the base). ~/.config/nvim itself is always first in
; 'runtimepath' (ahead of every plugin), so putting the file here -- not
; under after/queries/, which has no special priority for this particular
; lookup -- makes it win. Confirmed via `nvim --clean` that core's version
; (reproduced below) highlights fenced code blocks correctly on its own.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
