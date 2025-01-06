return {
	setup = function(client, buffer)
		local lsp = vim.lsp
		local telescope = require("telescope.builtin")
		local formatting = client.supports_method("textDocument/formatting")

		local mappings = {
			{ "<LocalLeader>R", lsp.buf.rename, desc = "Rename" },
			{ "<LocalLeader>S", telescope.lsp_workspace_symbols, desc = "Workspace Symbols" },
			{ "<LocalLeader>a", lsp.buf.code_action, desc = "Code Action" },
			{ "<LocalLeader>d", vim.diagnostic.open_float, desc = "Diagnostics" },
			{ "<LocalLeader>f", lsp.buf.format, desc = "Format", cond = formatting },
			{ "<LocalLeader>r", telescope.lsp_references, desc = "References" },
			{ "<LocalLeader>s", telescope.symbols, desc = "Symbols" },
			{ "K", lsp.buf.hover, desc = "Hover" },
			{ "<C-.>", lsp.buf.definition, desc = "Go To Definition" },
			{ "[d", lsp.diagnostic.goto_prev, desc = "Previous Diganostic" },
			{ "]d", lsp.diagnostic.goto_prev, desc = "Next Diganostic" },
		}

		require("which-key").add(mappings, { buffer = buffer })
	end,
}
