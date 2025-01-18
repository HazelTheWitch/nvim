return {
    {
        "L3MON4D3/LuaSnip",
        tag = "v2.3.0",
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")

            local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

            vim.api.nvim_create_autocmd("ModeChanged", {
                group = unlinkgrp,
                pattern = { "s:n", "i:*" },
                desc = "Forget the current snippet when leaving insert mode",
                callback = function(evt)
                    if ls.session and ls.session.current_nodes[evt.buf] and ls.session.jump_active then
                        ls.unlink_current()
                    end
                end,
            })

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
