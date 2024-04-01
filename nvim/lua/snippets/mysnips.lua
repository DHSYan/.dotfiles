nmap('<leader>sr',
    "<cmd>source ~/.dotfiles/nvim/lua/snippets/mysnips.lua<CR>",
    "SNIP: [S]nip [R]eload")

local luasnip = require("luasnip")

local s = luasnip.s
local fmt = require("luasnip.extras.fmt").fmt
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

local all = {
    luasnip.parser.parse_snippet("test", "LUA SNIP IS WORKING"),
    luasnip.parser.parse_snippet("another", "LOL"),
    luasnip.parser.parse_snippet("KEKW", "LOL"),
}

local lua = {
    luasnip.parser.parse_snippet("epand", "-- this is test!"),
    s("hi", fmt("local {} = require('{}')", { i(1, "test"), rep(1)})),
}

local markdown = {
    s("cal", fmt("> [!{}] {}\n> {}", {i(1, "type"), i(2, "title"), i(3, "body")})),

    -- [ex]ternal [l]ink
    s("exl", fmt("[{}]({})", {i(1, "name"), i(2, "link")})),

    s("vec", fmt("$\\vec{{{}}}$", {i(1, "letter")})),
    s("O(", fmt("$O({})$", {i(1, "___")})),
    luasnip.parser.parse_snippet("implies", "$\\implies$"),

}

local c = {
    luasnip.parser.parse_snippet("stdio", "#include <stdio.h>"),
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
