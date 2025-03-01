return {
    {
        "folke/which-key.nvim",
        opts = {},
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "folke/todo-comments.nvim",
        opts = {},
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps",
            },
        },
    },
    {
        "danymat/neogen",
        opts = { snippet_engine = "luasnip" },
    },
}
