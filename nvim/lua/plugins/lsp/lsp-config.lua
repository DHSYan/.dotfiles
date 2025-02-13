-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

function server_list()
    local lspconfig = require("lspconfig");
    lspconfig.nixd.setup({
        cmd = { "nixd" },
        settings = {
            nixd = {
                nixpkgs = {
                    expr = "import <nixpkgs> { }",
                },
                formatting = {
                    command = { "nixfmt" }, 
                },
            },
        },
    });
    -- lspconfig.java_language_server.setup({
    --     cmd = { "java-language-server" },
    -- })


    -- lspconfig.lua_ls.setup{
    --     capabilities = capabilities
    -- }
    -- lspconfig.clangd.setup{
    --     capabilities = capabilities
    -- }
end

-- This Function belowe was taken from kickstart.nvim
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

end

local luasnip_setup = function()
    local luasnip = require('luasnip')
    luasnip.config.setup({})
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Import my snippets
    require("snippets.mysnips")

    vim.keymap.set(
        { "i", "s" }, -- insert mode and what is 's' mode?
        "<c-k>",
        function ()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end,
        {
            desc = "Snip: Next Choice",
            silent = false, -- what does thiss do?
        }
    )
    vim.keymap.set(
        {"i", "s"}, 
        "<c-j>",
        function ()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end,
        {
            desc = "Snip: Prev choice",
            silent = false,
        }
    )


    return luasnip
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        -- Snipnet Engine
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip', -- luasnip completion engine
        -- Actual Snipnes
        'rafamadriz/friendly-snippets',
    },
    config = function()
        -- local lspconfig = require("lspconfig")
        require('mason').setup()
        require('mason-lspconfig').setup()

        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
            ensure_installed = {},
        })


        -- Taken from Kickstart (0 Idea what it does yet)
        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        mason_lspconfig.setup_handlers({
            function(server_name)
                -- if server_name == "rust_analyzer" then
                --     require('lspconfig').rust_analyzer.setup({
                --         capabilities = capabilities,
                --         settings = {
                --             ['rust-analyzer'] = {
                --                 diagnostics = {
                --                     enable = false;
                --                 }
                --             }
                --         },
                --         on_attach = on_attach,
                --     })
                -- else
                    require('lspconfig')[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                -- end
            end
        })

        -- Completion
        local cmp = require("cmp")

        -- Setup Luasnip & snippet related things
        local luasnip = luasnip_setup()

        cmp.setup({
            snippet = {
                -- According to nvim-cmp, a snippnet engine is required
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- 0??
                end
            },
            window = {
                -- I think these make the window bordered?
                -- Which should make them easier to see if that's the case
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- ['<C-Space>'] = cmp.complete({}), -- Invokes Completion
                ['<C-y>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace, -- 0??
                    select = true                           -- 0??
                })
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'orgmode' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        })
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                    { name = 'cmdline' }
                }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        server_list()
    end,
}
-- Just that that I go through line by line, and being very methiodically
-- on what I write
--
-- [[ Questnion That I have ]]
-- Say for example, I added LuaSnip to the dependencies,
-- then what if there's configuration that needs to be configured for that
-- plugin?
