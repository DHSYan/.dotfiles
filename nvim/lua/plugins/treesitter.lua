return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function () 
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 
                "c",
                "lua",
                "vim",
                "vimdoc",
                "markdown",
                "markdown_inline",
                "latex",
            },
            sync_install = false,
            highlight = {
                enable = true,
                disable = { "tex" , "latex"},
            },
            indent = { enable = true },  
        })
    end   
}
-- Not 100% from scratch, taken from github treesitter

-- From what I know:
-- Treesitter is a syntax parser that provides good features with 
-- syntaxs, like highlighting, know a function scope

