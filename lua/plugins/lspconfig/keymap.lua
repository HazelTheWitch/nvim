return {
	setup = function(client, buffer)
		local lsp = vim.lsp
		local telescope = require("telescope.builtin")
		local formatting = client.supports_method("textDocument/formatting")

		local mappings = {
			{ "<localleader>R", lsp.buf.rename, desc = "Rename" },
			{ "<localleader>S", telescope.lsp_workspace_symbols, desc = "Workspace Symbols" },
			{ "<localleader>a", lsp.buf.code_action, desc = "Code Action" },
			{ "<localleader>d", vim.diagnostic.open_float, desc = "Diagnostics" },
			{ "<localleader>f", lsp.buf.format, desc = "Format", cond = formatting },
			{ "<localleader>r", telescope.lsp_references, desc = "References" },
			{ "<localleader>s", telescope.symbols, desc = "Symbols" },
			{ "K", lsp.buf.hover, desc = "Hover" },
			{ "<C-.>", lsp.buf.definition, desc = "Go To Definition" },
			{ "[d", lsp.diagnostic.goto_prev, desc = "Previous Diganostic" },
			{ "]d", lsp.diagnostic.goto_prev, desc = "Next Diganostic" },
		}

		require("which-key").add(mappings, { buffer = buffer })
	end,
}
