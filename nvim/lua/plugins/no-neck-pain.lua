return {
    "shortcuts/no-neck-pain.nvim",
    config = function()
        require("no-neck-pain").setup({
            width = 100,
            -- buffers = {
            --     scratchPad = {
            --       -- set to `false` to
            --       -- disable auto-saving
            --       enabled = false,
            --       -- set to `nil` to default 
            --       -- to current working directory
            --       location = "~/throw-away-code/",
            --   },
            --   bo = {
            --       filetype = "txt"
            --   },
            -- },           
        })
    end
}
