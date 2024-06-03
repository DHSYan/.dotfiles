local function keymaps()
    local nmap = require("util.nmap")
    nmap("<leader>oo", ":ObsidianOpen<CR>", "[O]bsidian [O]pen")
    nmap("<leader>ob", ":ObsidianBacklinks<CR>", "[O]bsidian [B]acklinks")
    -- nmap("<leader>otd", ":ObsidianToday<CR>", "[O]bsidian [T]o[d]ay")
    nmap("<leader>otm", ":ObsidianTomorrow<CR>", "[O]bsidian [T]o[m]orrow")
    nmap("<leader>oyd", ":ObsidianYesterday<CR>", "[O]bsidian [y]ester[d]ay")
    nmap("<leader>os", ":ObsidianSearch<CR>", "[O]bsidian [S]earch")
end

local opts = {
    workspaces = {
        {
            name = "Concept-Notes",
            path = "~/Concept-Notes",
        },
        {
            name = "Youtube",
            path = "~/youtube-script",
        },
        {
            name = "Remote-Vaults",
            path = "~/Remote-Vaults",
        },
    },

    new_notes_location = "current_dir",

    note_id_func = function(title)
        return title
    end,

    completion = { 
        nvim_cmp = true,
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

    templates = {
        subdir = "templates",
        date_format = "%m-%d-%Y",
        time_format = "%H:%M:%S",
    },
    disable_frontmatter = false,
}

local concept_note_name = "Concept-Notes";

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
    ft = "markdown",
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
