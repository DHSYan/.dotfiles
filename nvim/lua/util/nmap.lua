function nmap(key, fn, meaning) 
    vim.keymap.set('n', key, fn, {desc = meaning})
end


return nmap -- I think this is ok?


