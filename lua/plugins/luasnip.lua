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

            local function uuid()
                local id, _ = vim.fn.system("uuidgen"):gsub("\n", "")
                return id
            end

            ls.add_snippets("all", {
                ls.snippet({
                    trig = "uuid",
                    name = "UUID",
                    descr = "generate a random UUID"
                }, {
                    ls.dynamic_node(1, function()
                        return ls.snippet_node(nil, ls.insert_node(1, uuid()))
                    end)
                })
            })

            ls.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
            })

            -- ls.add_snippets("language", "snippets")
        end,
    },
}
