function keymaps()
    local nmap = require("util.nmap")
    nmap("<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
    nmap("<leader>ob", ":ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
end

local opts = {
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

    backlinks = {
        height = 4,
        wrap = true,
    },
}

return {
    "epwalsh/obsidian.nvim",
    version = "*",  
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim"
    },
    config = function() 
        local obsidian = require("obsidian").setup(opts);
    
        keymaps();

    end 
}
-- Got the above from Obsidian Github
