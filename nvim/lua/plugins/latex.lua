return {
   "lervag/vimtex",
    config = function()
        -- Enable vimtex plugin with concealment
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_syntax_conceal = {
            accents = 2,
            cites = 2,
            fancy = 2,
            greek = 2,
            math_bounds = 2,
            math_delimiters = 2,
            math_fracs = 2,
            math_super_sub = 2,
            math_symbols = 2,
            sections = 2,
            styles = 2,
            trailing_whitespace = 0,
        }
    end,
}
