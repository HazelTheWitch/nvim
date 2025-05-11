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
    -- {
    --   "luckasRanarison/tailwind-tools.nvim",
    --     name = "tailwind-tools",
    --     build = ":UpdateRemotePlugins",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-telescope/telescope.nvim",
    --         "neovim/nvim-lspconfig",
    --     },
    --     opts = {
    --         extension = {
    --             patterns = {
    --                 rust = { "class=[\"']([^\"']+)[\"']" },
    --             }
    --         }
    --     }
    -- },
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
                    "typescript",
                    "css",
                    "javascript",
                    "svelte",
                    "wgsl",
                    "zig",
                    "astro",
                },
                highlight = { enable = true },
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
                svelte = {},
                biome = {},
                eslint = {},
                ts_ls = {},
                tailwindcss = {
                    filetypes = { "rust" },
                    init_options = {
                        userLanguages = {
                            rust = "html"
                        }
                    }
                },
                wgsl_analyzer = {},
                zls = {},
                emmet_ls = {
                    filetypes = {
                        "css",
                        "eruby",
                        "html",
                        "javascript",
                        "javascriptreact",
                        "less",
                        "sass",
                        "typescript",
                        "scss",
                        "svelte",
                        "pug",
                        "typescriptreact",
                        "vue",
                        "astro",
                    }
                }
            }

            vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
                pattern = "*.wgsl",
                callback = function()
                    vim.bo.filetype = "wgsl"
                end,
            })

            require("lazydev").setup({})
            require("mason").setup({})

            local function on_attach(client, buffer)
                require("plugins.lspconfig.keymap").setup(client, buffer)
                require("plugins.lspconfig.formatting").setup(client, buffer)

                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
                vim.wo.foldlevel = 99
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function (event)
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if not client then
                        return
                    end
                    for buffer_number, _ in pairs(client.attached_buffers) do
                        on_attach(client, buffer_number)
                    end
                end
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
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
