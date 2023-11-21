local nmap = require("util.nmap")

return {
    'mbbill/undotree',
    config = function()
        nmap('<leader>ut', vim.cmd.UndotreeToggle, "Toggle [U]ndo [T]ree")
    end,
}
