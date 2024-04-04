nmap('<leader>sr',
    "<cmd>source ~/.dotfiles/nvim/lua/snippets/mysnips.lua<CR>",
    "SNIP: [S]nip [R]eload")

local luasnip = require("luasnip")

local s = luasnip.s
local fmt = require("luasnip.extras.fmt").fmt
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

local all = {
}

local lua = {}

local markdown = {
    s("cal", fmt("> [!{}] {}\n> {}", {i(1, "type"), i(2, "title"), i(3, "body")})),

    s("vec", fmt("\\vec{{{}}}", {i(1, "letter")})),
    s("O", fmt("O({})", {i(1, "___")})),
    s("frac", fmt("\\frac{{{}}}{{{}}}", {i(1, "___"), i(2, "___")})),
    s("ml", fmt("${}$", {i(1, "INLINE")})),
    s("mb", fmt("$${}$$", {i(1, "BLOCK")})),

    luasnip.parser.parse_snippet("=>", "\\implies "),
    luasnip.parser.parse_snippet("a", "\\alpha "),
    luasnip.parser.parse_snippet("d", "\\delta "),
    luasnip.parser.parse_snippet("D", "\\Delta "),
    luasnip.parser.parse_snippet("+-", "\\pm "),

}

local c = {
    luasnip.parser.parse_snippet("std", "#include <stdio.h>\n#include <stdlib.h>"),
}

luasnip.snippets = {
    all = all,
    lua = lua,
    markdown = markdown,
    c = c,
}

-- Check :help luasnip
-- for it's API
luasnip.add_snippets(nil, luasnip.snippets, nil)
