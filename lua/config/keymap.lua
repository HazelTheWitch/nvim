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

-- Docstrings
vim.keymap.set("n", "<leader>d", function() require("neogen").generate() end, { desc = "Generate Docstring" })

-- Tabs
vim.keymap.set("n", "<C-t>", "<CMD>tabnew<CR>", { desc = "Open a New Tab" })
vim.keymap.set("n", "<C-S-t>", "<CMD>tabclose<CR>", { desc = "Close Current Tab" })
vim.keymap.set("n", "<S-h>", "<CMD>tabprev<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-l>", "<CMD>tabnext<CR>", { desc = "Previous Tab" })
