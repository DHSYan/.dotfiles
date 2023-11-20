print("Hi from /nvim/lua/plugins/init");
return {
  -- list of plugins that I want
  -- require("plugins.theme"),

  -- require("plugins.org-mode")
    -- LSP STuff
    require("plugins.lsp.lsp-config"),
    require("plugins.lsp.clangd_extension"),
    require("plugins.lsp.nvim-cmp")

}
