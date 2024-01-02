local function keymaps()
    local nmap = require("util.nmap")
    nmap("<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
    nmap("<leader>ob", ":ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
    nmap("<leader>otd", ":ObsidianToday<CR>", "[O]bsidian [T]o[m]orrow")
    nmap("<leader>otm", ":ObsidianTomorrow<CR>", "[O]bsidian [T]o[d]ay")
    nmap("<leader>oyd", ":ObsidianYesterday<CR>", "[O]bsidian [y]ester[d]ay")
end


-- TODO: These are Path on my Mac, need to make them more portable
local concept_note_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
local personal_icloud_path = "/Library/Mobile\\ Documents/com~apple~CloudDocs/Life-Life/Notes"
local daily_notes_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"
local youtube_notes_path = "/Library/Mobile\\ Documents/com~apple~CloudDocs/Youtube-Life/Notes"
local presentation_notes_path = "/Library/CloudStorage/OneDrive-UNSW/1-Academics/Presentation-Note"
local degree_planning_path = "/Library/CloudStorage/OneDrive-UNSW/Degree-Plannig"


local concept_note_path_half = "~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes"
local personal_icloud_path_half = "~/Library/Mobile\\ Documents/com~apple~CloudDocs/Life-Life/Notes"
local daily_notes_path_half = "~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"
local youtube_notes_path_half = "~/Library/Mobile\\ Documents/com~apple~CloudDocs/Youtube-Life/Notes"

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
        },
        {
            name = "Notes",
            path = youtube_notes_path_half
        },
        {
            name = "Presentation-Notes",
            path = "~" .. presentation_notes_path
        },
        {
            name = "Degree-Planning",
            path = "~" .. degree_planning_path
        },

    },

    detect_cwd = true,

    backlinks = {
        height = 4,
        wrap = true,
    },
    completion = { -- This was taken from the docs
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        new_notes_location = "current_dir",

        -- Control how wiki links are completed with these options:

        -- Whether to add the note ID during completion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
        prepend_note_id = true,

        -- Whether to add the note path during completion.
        -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
        -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
        prepend_note_path = false,

        -- Whether to only use paths during completion.
        -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
        -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
        use_path_only = false,
    },

    use_advanced_uri = false, -- this is a breaking change

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
        img_text_func = function(client, path)
            local link_path
            local vault_relative_path = client:vault_relative_path(path)
            if vault_relative_path ~= nil then
                -- Use relative path if the image is saved in the vault dir.
                link_path = vault_relative_path
            else
                -- Otherwise use the absolute path.
                link_path = tostring(path)
            end
            local display_name = vim.fs.basename(link_path)
            return string.format("![[%s]]", display_name, link_path)
            -- Modified From the docs
        end,
    },
    open_app_foreground = true,
}

return {
    "epwalsh/obsidian.nvim",
    version = "*",
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
