local function keymaps()
    local nmap = require("util.nmap")
    nmap("<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
    nmap("<leader>ob", ":ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
end


-- TODO: These are Path on my Mac, need to make them more portable
local concept_note_path =  "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
local personal_icloud_path = "/Library/Mobile\\ Documents/com~apple~CloudDocs/Life-Life/Notes"
local daily_notes_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"

local concept_note_path_half =  "~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
local personal_icloud_path_half = "~/Library/Mobile\\ Documents/com~apple~CloudDocs/Life-Life/Notes"
local daily_notes_path_half = "~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"

local opts = {
    workspaces = {
        {
            name = "Concept-Notes",
            path = concept_note_path_half,
            -- path = vim.fn.expand("~") .. concept_note_path,
            -- path = "~" .. concept_note_path,
        },
        {
            name = "Notes",
            path = personal_icloud_path_half,
            -- path = vim.fn.expand("~") .. personal_icloud_path,
            -- path = "~" .. personal_icloud_path,
        },
        {
            name = "Daily-Notes",
            path = daily_notes_path_half,
            -- path = vim.fn.expand("~") .. daily_notes_path,
            -- path = "~" .. daily_notes_path,
        }
    },

    detect_cwd = true,

    backlinks = {
        height = 4,
        wrap = true,
    },
}

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        "BufReadPre " .. vim.fn.expand("~") .. concept_note_path .. "/**.md" ,
        "BufNewFile " .. vim.fn.expand("~") .. concept_note_path .. "/**.md" ,

        "BufReadPre " .. vim.fn.expand("~") .. personal_icloud_path .. "/**.md" ,
        "BufNewFile " .. vim.fn.expand("~") .. personal_icloud_path .. "/**.md" ,

        "BufReadPre " .. vim.fn.expand("~") .. daily_notes_path .. "/**.md" ,
        "BufNewFile " .. vim.fn.expand("~") .. daily_notes_path .. "/**.md" ,
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local obsidian = require("obsidian")
        obsidian.setup(opts);

        keymaps();

    end
}
-- Got the above from Obsidian Github
