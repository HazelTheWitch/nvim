-- Harpoon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>q", function()
    harpoon:list():add()
end, { desc = "Harpoon Current File" })

-- Telescope
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", telescope.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope Help Tags" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
