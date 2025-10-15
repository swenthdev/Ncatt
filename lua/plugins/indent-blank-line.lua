return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		-- EN: Load and configure the IBL (Indent Blankline) plugin, which adds visual indent guides.
		-- ES: Carga y configura el plugin IBL (Indent Blankline), que agrega guías visuales de indentación.
		require("ibl").setup({
			indent = {
				-- EN: Defines the character used for indentation guides (│ is a thin vertical line).
				-- ES: Define el carácter usado para las guías de indentación (│ es una línea vertical delgada).
				char = "│",
			},
			scope = {
				-- EN: Disables scope highlighting (highlighting the current code block).
				-- ES: Desactiva el resaltado de alcance (resalta el bloque de código actual).
				enabled = false,
			},
		})
	end,
}

