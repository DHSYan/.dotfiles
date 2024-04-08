local function keymaps()
    local nmap = require("util.nmap")
    nmap("<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
    nmap("<leader>ob", ":ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
    -- nmap("<leader>otd", ":ObsidianToday<CR>", "[O]bsidian [T]o[d]ay")
    nmap("<leader>otm", ":ObsidianTomorrow<CR>", "[O]bsidian [T]o[m]orrow")
    nmap("<leader>oyd", ":ObsidianYesterday<CR>", "[O]bsidian [y]ester[d]ay")
    nmap("<leader>os", ":ObsidianSearch<CR>", "[O]bsidian [S]earch")
end


-- TODO: These are Path on my Mac, need to make them more portable
-- local concept_note_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
-- local personal_icloud_path = "/Library/Mobile\\ Documents/com~apple~CloudDocs/Life-Life/Notes"
-- local daily_notes_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"
-- local youtube_notes_path = "/Library/Mobile\\ Documents/com~apple~CloudDocs/Youtube-Life/Notes"
-- local presentation_notes_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Presentation-Note"
-- local degree_planning_path = "/Library/CloudStorage/OneDrive-UNSW/Degree-Plannig"
--
--
-- local concept_note_path_half = "~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
-- local personal_icloud_path_half = "~/Library/Mobile\\ Documents/com~apple~CloudDocs/Life-Life/Notes"
-- local daily_notes_path_half = "~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"
-- local youtube_notes_path_half = "~/Library/Mobile\\ Documents/com~apple~CloudDocs/Youtube-Life/Notes"

local opts = {
    -- workspaces = {
    --     {
    --         name = "Concept-Notes",
    --         path = concept_note_path_half,
    --         -- path = vim.fn.expand("~") .. concept_note_path,
    --         -- path = "~" .. concept_note_path,
    --     },
    --     {
    --         name = "Notes",
    --         path = personal_icloud_path_half,
    --         -- path = vim.fn.expand("~") .. personal_icloud_path,
    --         -- path = "~" .. personal_icloud_path,
    --     },
    --     {
    --         name = "Daily-Notes",
    --         path = daily_notes_path_half,
    --         -- path = vim.fn.expand("~") .. daily_notes_path,
    --         -- path = "~" .. daily_notes_path,
    --     },
    --     {
    --         name = "Notes",
    --         path = youtube_notes_path_half
    --     },
    --     {
    --         name = "Presentation-Notes",
    --         path = "~" .. presentation_notes_path
    --     },
    --     {
    --         name = "Degree-Planning",
    --         path = "~" .. degree_planning_path
    --     },
    --
    -- },
    workspaces = {
        {
            name = "Concept-Notes",
            path = "~/Concept-Notes",
        },
        {
            name = "Concept-Notes on the cloud",
            path = "/Users/twinkletoes/OneDrive - UNSW/1-Academics/Concept-Notes",
        },
        {
            name = "Remote-Vaults",
            path = "~/Remote-Vaults",
        },
    },

    backlinks = {
        height = 4,
        wrap = true,
    },

    new_notes_location = "current_dir",

    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        -- local suffix = ""
        -- if title ~= nil then
        --     -- If title is given, transform it into valid file name.
        --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        -- else
        --     -- If title is nil, just add 4 random uppercase letters to the suffix.
        --     for _ = 1, 4 do
        --         suffix = suffix .. string.char(math.random(65, 90))
        --     end
        -- end
        -- return tostring(os.time()) .. "-" .. suffix
        return title
    end,

    completion = { -- This was taken from the docs
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
    },

    -- Specify how to handle attachments.
    attachments = { -- This was taken from the docs
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = "assets", -- This is the default
        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
        -- The is the default implementation.
        ---@param client obsidian.Client
        ---@param path Path the absolute path to the image file
        ---@return string
        -- img_text_func = function(client, path)
        --     local link_path
        --     local vault_relative_path = client:vault_relative_path(path)
        --     if vault_relative_path ~= nil then
        --         -- Use relative path if the image is saved in the vault dir.
        --         link_path = vault_relative_path
        --     else
        --         -- Otherwise use the absolute path.
        --         link_path = tostring(path)
        --     end
        --     local display_name = vim.fs.basename(link_path)
        --     return string.format("![[%s]]", display_name, link_path)
        --     -- Modified From the docs
        -- end,
    },
    open_app_foreground = false,
}

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- You can actually load a plugin when you press a key, and 
    -- issue a command that is associated with that plugin.
    keys = {
      { "<leader>otd", "<cmd>ObsidianToday<cr>", desc = "[O]bsidian [t]o[d]ay" },
      { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "[O]bsidian [O]pen"},
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian [S]earch"},
    },
    lazy = true,
    --[[ event = { -- this was taken from the docs
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        "BufReadPre " .. vim.fn.expand("~") .. concept_note_path .. "/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. concept_note_path .. "/**.md",

        "BufReadPre " .. vim.fn.expand("~") .. personal_icloud_path .. "/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. personal_icloud_path .. "/**.md",

        "BufReadPre " .. vim.fn.expand("~") .. daily_notes_path .. "/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. daily_notes_path .. "/**.md",

        "BufReadPre " .. vim.fn.expand("~") .. youtube_notes_path .. "/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. youtube_notes_path .. "/**.md",

        "BufReadPre " .. vim.fn.expand("~") .. presentation_notes_path .. "/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. presentation_notes_path .. "/**.md",
    }, ]]
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
