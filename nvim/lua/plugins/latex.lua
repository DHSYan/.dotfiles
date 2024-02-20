return {
   "lervag/vimtex",
    config = function()
        -- Enable vimtex plugin with concealment
        vim.g.vimtex_syntax_enabled = 1
        vim.g.vimtex_syntax_conceal = {
            accents = 1,
            cites = 1,
            fancy = 1,
            greek = 1,
            math_bounds = 1,
            math_delimiters = 1,
            math_fracs = 1,
            math_super_sub = 1,
            math_symbols = 1,
            sections = 1,
            styles = 1,
            trailing_whitespace = 0,
        }
    end,
}
