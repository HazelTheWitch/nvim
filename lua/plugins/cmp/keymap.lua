return {
	setup = function(cmp, luasnip)
		return cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete({}),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		})
	end,
}
