function keymaps()
    local nmap = require("util.nmap")
    --  vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
    --  vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")
    nmap("<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
    nmap("<leader>ob", ":ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
end

return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "Concept-Notes",
                path = "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
            },
            {
                name = "Personal-iCloud",
                path = "/Users/tzen/Library/Mobile Documents/com~apple~CloudDocs/Personal-icloud/Notes"
            },
            {
                name = "Daily-Notes",
                path = "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"
            }
        },

        -- see below for full list of options 👇
    },
    config = function() 
        keymaps();

    end 
}
-- Got the above from Obsidian Github
