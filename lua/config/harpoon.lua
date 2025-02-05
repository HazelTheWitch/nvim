local harpoon = require("harpoon")
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>fq", function()
	toggle_telescope(harpoon:list())
end, { desc = "Telescope Harpoon" })

for i = 1, 9 do
	vim.keymap.set("n", "<C-q>" .. i, function() harpoon:list():select(i) end, { desc = "Select Harpooned " .. i })
end
