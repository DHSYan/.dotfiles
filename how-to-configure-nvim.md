# Starting

mkdir nvim

## To path of this folder
### this is where nvim will look for it's config file.
can be found with
- " :h rtp " (Stands for "help runtimepath")
------------------------------------------------------------------------------------
'runtimepath' 'rtp'	string	(default:     "$XDG_CONFIG_HOME/nvim,
					       $XDG_CONFIG_DIRS[1]/nvim,
					       $XDG_CONFIG_DIRS[2]/nvim,
					       …
					       $XDG_DATA_HOME/nvim[-data]/site,
					       $XDG_DATA_DIRS[1]/nvim/site,
					       $XDG_DATA_DIRS[2]/nvim/site,
					       …
					       $VIMRUNTIME,
					       …
					       $XDG_DATA_DIRS[2]/nvim/site/after,
					       $XDG_DATA_DIRS[1]/nvim/site/after,
					       $XDG_DATA_HOME/nvim[-data]/site/after,
					       …
					       $XDG_CONFIG_DIRS[2]/nvim/after,
					       $XDG_CONFIG_DIRS[1]/nvim/after,
					       $XDG_CONFIG_HOME/nvim/after")

------------------------------------------------------------------------------------

# init.lua (Place in the .)
- This is the first file that nvim will look at


# The lua Directory
- Any dir that's in here, is "Requireable", by lua.
## In the lua Dir

## The "user" Directory
- This can be anything, I will name it "twinkletoes"
### ./lua/user/init.lua
- This is another init lua, but it's in the user folder.
- We have to go require the "user" folder now.
- Since our user folder is in a "Lua" and anything in there in is requirable
- we go to ./init.lua and say
{ require("user") }







# Remapping
- ./lua/user/remap.lua
## This is an example of how to remap something
`vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)`	
## Requiring
- Now that we got this new file. 
 - we have to require it in ./lua/user/init.lua
 - *side note: anything in here ./lua is already requrieblae
 - and since, ./init.lua is requiring the folder user, and when it sees a folder, it looks for init.lua in the folder first
 - so, we have to go to ./lua/user/init.lua and require whatever








# After Directory
- I think it's called after?
- Anyway, right now it's has plugin dir, that holds the setting of the plugins

- Added colors, using a function
- I think I will have different funcitons for differnece colorscheme


# Tree Sitter
- Don't know what it does



