return {
    {
        "folke/lazydev.nvim",
        ft = { "lua" },
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "diff",
                    "gitignore",
                    "json",
                    "lua",
                    "markdown",
                    "regex",
                    "sql",
                    "toml",
                    "yaml",
                    "ron",
                    "rust",
                    "python",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            "williamboman/mason.nvim",
            {
                "williamboman/mason-lspconfig.nvim",
                config = { automatic_installation = true },
            },
        },
        config = function()
            local servers = {
                bashls = {},
                rust_analyzer = {},
            }

            require("lazydev").setup({})
            require("mason").setup({})

            local function on_attach(client, buffer)
                require("plugins.lspconfig.keymap").setup(client, buffer)
                require("plugins.lspconfig.formatting").setup(client, buffer)

                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
                vim.wo.foldlevel = 99
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            mason_lspconfig.setup_handlers({
                function(server)
                    require("lspconfig")[server].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server],
                    })
                end,
            })
        end,
    },
    { "sheerun/vim-polyglot" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = require("plugins.cmp.keymap").setup(cmp, luasnip),

                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
}
