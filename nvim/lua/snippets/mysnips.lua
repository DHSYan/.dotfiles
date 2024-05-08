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
    s("cal", fmt("> [!{}] {}\n> {}", {i(1, "type"), i(2, "title"), i(3, "body")})), -- Callout

    s("vec", fmta("\\vec{<>}", {i(1, "letter")})),
    s("O(", fmta("O(<>)", {i(1, "___")})),
    s("frac", fmta("\\frac{<>}{<>}", {i(1, "___"), i(2, "___")})), -- I would love to trigger this when I type a number with a / and a number below it and it regex the numbers and put them where they belong
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
    s("int", fmta("\\int_{<>}^{<>} <> d<>", {i(1, "from"), i(2, "to"), i(3, "grand"), i(4, "var")})), -- integral
    s("lim", fmta("\\lim_{<>\\rightarrow<>} <>", {i(1, "var"), i(2, "num"), i(3, "expr")})), -- limit

    s("partial", fmta("\\frac{\\partial <>}{\\partial <>}", {i(1, "f"), i(2, "x")})), -- partial


    s("=>", t("\\implies ")),
    s("a", t("\\alpha ")),
    s("d", t("\\delta ")),
    s("D", t("\\Delta ")),
    s("+-", t( "\\pm ")),
    s("->", t( "\\rightarrow ")),
    s("Rn", t( "\\mathbb{R}^{n} ")),
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
