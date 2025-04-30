local u =  {
  'nvim-orgmode/orgmode',
  -- dependencies = {
  --   { 'nvim-treesitter/nvim-treesitter', lazy = true },
  -- },
  event = 'VeryLazy',
  config = function()
    -- Load treesitter grammar for org
    -- require('orgmode').setup_ts_grammar()

    -- Setup treesitter
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })

    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = {'~/orgfiles/**/*', '~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Terms/23T3/Org/**/*'},
      org_default_notes_file = '~/Library/CloudStorage/OneDrive-UNSW/1-Academics/Terms/23T3/Org/refile.org'
            -- The refile org file can just live whereever I guess, but need
            -- synced
    })
  end,
}

local m = {}

return m 
