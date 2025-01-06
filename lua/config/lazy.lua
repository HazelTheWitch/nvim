-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true

-- Space as leader and \ as local leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

-- Line Numbers
vim.opt.number = true

-- Always show tabline
vim.o.showtabline = 2

-- 4 Spaces Instead of Tabs
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Sign Column Always On
vim.o.signcolumn = "yes"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})
