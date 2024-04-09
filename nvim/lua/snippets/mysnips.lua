nmap('<leader>sr',
    "<cmd>source ~/.dotfiles/nvim/lua/snippets/mysnips.lua<CR>",
    "SNIP: [S]nip [R]eload")

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local all = {
}

local lua = {}


local markdown = {
    s("cal", fmt("> [!{}] {}\n> {}", {i(1, "type"), i(2, "title"), i(3, "body")})),

    s("vec", fmta("\\vec{<>}", {i(1, "letter")})),
    s("O(", fmta("O(<>)", {i(1, "___")})),
    s("frac", fmta("\\frac{<>}{<>}", {i(1, "___"), i(2, "___")})),
    s("ml", fmta("$<>$", {i(1, "INLINE")})),
    s("mb", fmta("$$<>$$", {i(1, "BLOCK")})),
    s({trig = "(%d)/(%d)", regTrig = true, snippetType="autosnippet"},
        fmta("\\frac{<>}{<>}",
            {
                f(function(arg, snip) return snips.captures[1] end, {}),
                f(function(arg, snip) return snips.captures[2] end, {}) 
            }

        )
    ),
    s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
        fmta(
            "<>_{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                t("0")
            }
        )
    ),

    s("=>", t("\\implies ")),
    s("a", t("\\alpha ")),
    s("d", t("\\delta ")),
    s("D", t("\\Delta ")),
    s("+-", t( "\\pm ")),
}

local c = {
    s("std", t("#include <stdio.h>\n#include <stdlib.h>")),
}

ls.snippets = {
    all = all,
    lua = lua,
    markdown = markdown,
    c = c,
}

-- Check :help luasnip
-- for it's API
ls.add_snippets(nil, ls.snippets, nil)
