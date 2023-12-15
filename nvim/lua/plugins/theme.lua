-- Captppuccin
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require('catppuccin').setup({
--       flavour = "mocha"
--     })
--
--     vim.cmd.colorscheme 'catppuccin'
--   end,
-- }

-- Kanagawa
-- return {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,
--     config = function()
--         require('kanagawa').setup({
--             theme = "lotus"
--         })
--         vim.cmd.colorscheme 'kanagawa'
--     end
-- }
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            style = 'night',
            transparent = true,

        })
        vim.cmd.colorscheme 'tokyonight'
        vim.cmd("hi ColorColumn guibg='grey'")
    end
}
