return {
	{
		"L3MON4D3/LuaSnip",
		config = function()
			local ls = require("luasnip")

			ls.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})

			vim.keymap.set({ "s", "i" }, "<C-o>", function()
				if ls.is_expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end)

			vim.keymap.set({ "s", "i" }, "<C-i>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end)

			-- ls.add_snippets("language", "snippets")
		end,
	},
}
