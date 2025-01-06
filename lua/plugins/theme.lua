return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "dragon",
				background = {
					dark = "dragon",
					light = "wave",
				},
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
}
