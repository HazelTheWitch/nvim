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
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup {
              max_length = 0,          -- Maximum length of selection (0 for no limit)
              silent = false,          -- Disable message on successful copy
              trim = false,            -- Trim surrounding whitespaces before copy
            }
            local function copy()
              if ((vim.v.event.operator == "y" or vim.v.event.operator == "d")
                and vim.v.event.regname == "") then
                require("osc52").copy_register("")
              end
            end

            vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
          end,
    },
    {
        "danymat/neogen",
        opts = { snippet_engine = "luasnip" },
    },
}
