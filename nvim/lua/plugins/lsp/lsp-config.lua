-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

function server_list() 
    local lspconfig = require("lspconfig")

    -- lspconfig.lua_ls.setup{
    --     capabilities = capabilities
    -- }
    -- lspconfig.clangd.setup{
    --     capabilities = capabilities
    -- }


end


return {
    'neovim/nvim-lspconfig',
    config = function() 
        server_list()
    end
    
}

-- This file is 99.99% from scratch
-- Not claiming that I came out with these,
-- Just that that I go through line by line, and being very methiodically
-- on what I write
