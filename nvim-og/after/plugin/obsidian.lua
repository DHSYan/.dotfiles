local config = {
    -- dir = "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/COMP3331",
    workspaces = {
        "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/COMP3331",
        "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/COMP1511",
        "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/DESN1000",
        "/Users/tzen/Library/Mobile Documents/com~apple~CloudDocs/Personal-icloud/Notes",
        "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/Concept-Notes",
        "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/Daily-Notes"
    },
    completion = {
        -- If using nvim-cmp, otherwise set to false
        nvim_cmp = true,
        -- Trigger completion at 2 chars
        min_chars = 2,
        -- Where to put new notes created from completion. Valid options are
        --  * "current_dir" - put new notes in same directory as the current buffer.
        --  * "notes_subdir" - put new notes in the default notes subdirectory.
        notes_subdir = "Notes",
        new_notes_location = "notes_subdir",

        -- Whether to add the output of the node_id_func to new notes in autocompletion.
        -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
        prepend_note_id = true
    },
    finder = "telescope.nvim"
}

local setup_obsidian = function()
    for _, val in pairs(config.workspaces) do
        -- cur_dir = vim.fn.getcwd()..""
        -- print(cur_dir);
        -- i, j = string.find(cur_dir, vim.fs.normalize(val).."")
        -- print(i, j)
        -- if string.sub(cur_dir, i, j) == vim.fs.normalize(val).."" then
        if vim.fs.normalize(val) == vim.fn.getcwd() then
            -- print("I am matching", val);
            print("I matched", val);
            require("obsidian").setup(vim.tbl_extend('error', config, {dir = val}))
            break
        else
            print("None Matched Up I have", val);
            -- print("But I got", cur_dir);
        end
    end
end

vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>")
setup_obsidian();




-- local pickers = require "telescope.pickers"
-- local finders = require "telescope.finders"
-- local conf = require("telescope.config").values
-- local actions = require "telescope.actions"
-- local action_state = require "telescope.actions.state"
--
-- obsopts = {
--     -- dir = {},
--     completion = {
--         -- If using nvim-cmp, otherwise set to false
--         nvim_cmp = true,
--         -- Trigger completion at 2 chars
--         min_chars = 2,
--         -- Where to put new notes created from completion. Valid options are
--         --  * "current_dir" - put new notes in same directory as the current buffer.
--         --  * "notes_subdir" - put new notes in the default notes subdirectory.
--         new_notes_location = "current_dir",
--
--         -- Whether to add the output of the node_id_func to new notes in autocompletion.
--         -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
--         prepend_note_id = true
--     },
--     finder = "telescope.nvim"
-- }
--
-- obsidian_picker = function(opts)
-- 	opts = opts or {}
-- 	pickers.new(opts, {
-- 		prompt_title = "vaults",
-- 		finder = finders.new_table {
-- 			results = { "vault1", "vault2" }
-- 		},
-- 		sorter = conf.generic_sorter(opts),
-- 		attach_mappings = function(prompt_bufnr, map)
-- 			actions.select_default:replace(function()
-- 				actions.close(prompt_bufnr)
-- 				local selection = action_state.get_selected_entry()[1]
-- 				local dir
-- 				if selection == "vault1" then
-- 					dir = "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/COMP3331"
-- 				elseif selection == "vault2" then
-- 					dir = "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/COMP1511"
-- 				end
-- 				vim.api.nvim_set_current_dir(dir)
-- 				obsopts.dir = dir
-- 				require("obsidian").setup(obsopts)
-- 			end)
-- 			return true
-- 		end,
-- 	}):find()
-- end
--
-- vim.cmd([[
-- 	augroup InitPicker
-- 	autocmd!
-- 	autocmd VimEnter * lua obsidian_picker()
-- 	augroup END
-- ]])




-- require("obsidian").setup({
--       dir = "/Users/tzen/Library/CloudStorage/OneDrive-UNSW/1-Academics/23T3/COMP3331",
--
-- })
