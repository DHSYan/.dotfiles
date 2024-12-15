vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Lazy.nvim Bootstrap Install]]
-- Taken from lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local opts = {
    lockfile = "/home/tzen/.dotfiles/nvim/lazy-lock.json", -- lockfile generated after running update.
}
-- "plugins" is requiring the lua module in /nvim/lua/plugins.lua
require("lazy").setup("plugins", opts);

-- [[ Keymaps ]]
require("keymaps");

-- [[ Options ]]
require("options");

-- [[ Netrw ]]
require("netrw");

-- [[ Featurs that I like from Kickstart ]]
-- the function scope line on the left, that tells you what scope you are in

-- vim.cmd("NoNeckPain")

