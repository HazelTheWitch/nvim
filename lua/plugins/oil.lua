return {
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
				"permissions",
				"size",
			},
			delete_to_trash = true,
			lsp_file_methods = { enabled = true },
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
	},
}
