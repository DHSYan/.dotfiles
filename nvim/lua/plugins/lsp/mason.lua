local default_setup = function(server)
    lspconfig[server].setup({
    })
end

return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function() 
            require('mason').setup({})
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        -- dependencies = {
        --     'williamboman/mason.nvim',
        --     'neovim/nvim-lspconfig',
        -- },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    default_setup
                },
            })
        end,
        
    }
}

-- this was created looking at 'tjdevries/config_manager' and 
-- VonHeikemen/lsp-zero.nvim
-- LSP Zero Has Really helpful documentation and tutorial
