print("Hi from /nvim/lua/plugins/init");
return {
    -- list of plugins that I want
    -- The below don't have to be manually sourced, Lazy.nvim do it auto
    -- require("plugins.theme"),

    -- require("plugins.org-mode")

    -- LSP STuff
    require('plugins.lsp') -- I think this sources /nvim/lua/plugins/lsp/init.lua?

}
