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
    -- Obsidian
    s("cal", fmt("> [!{}] {}\n> {}", {i(1, "type"), i(2, "title"), i(3, "body")})), -- Callout
    s("ml", fmta("$<>$", {i(1, "INLINE")})),
    s("mb", fmta("$$<>$$", {i(1, "BLOCK")})),

    s("set", fmta("\\{<>\\}", {i(1, "set")})),

    -- Theoretical Computer Science
    s("O(", fmta("O(<>)", {i(1, "___")})),

    -- Basic math Operators
    s("frac", fmta("\\frac{<>}{<>}", {i(1, "___"), i(2, "___")})), -- I would love to trigger this when I type a number with a / and a number below it and it regex the numbers and put them where they belong
    
    -- Linear Algebra
    s("vec", fmta("\\vec{<>}", {i(1, "letter")})),

    -- s({trig = "(%d)/(%d)", regTrig = true, snippetType="autosnippet"},
    --     fmta("\\frac{<>}{<>}",
    --         {
    --             f(function(arg, snip) return snips.captures[1] end, {}),
    --             f(function(arg, snip) return snips.captures[2] end, {}) 
    --         }
    --
    --     )
    -- ),
    -- s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    --     fmta(
    --         "<>_{<>}",
    --         {
    --             f( function(_, snip) return snip.captures[1] end ),
    --             t("0")
    --         }
    --     )
    -- ),

    -- Calculus
    s("int", fmta("\\int_{<>}^{<>} <> d<>", {i(1, "from"), i(2, "to"), i(3, "grand"), i(4, "var")})), -- integral
    s("lim", fmta("\\lim_{<>\\rightarrow<>} <>", {i(1, "var"), i(2, "num"), i(3, "expr")})), -- limit
    s("partial", fmta("\\frac{\\partial <>}{\\partial <>}", {i(1, "f"), i(2, "x")})), -- partial
    s("piecewise",
        fmta(
            "<> = \\begin{cases}\n<> & <> \\\\\n<> & <>\n\\end{cases}",
            {i(1, "function"),
                i(2, "output1"),
                i(3, "output1_cond"),
                i(4, "output2"),
                i(5, "output2_cond"),}
        )
    ), 
    s("inf", t("\\infty"));

    --- Stats
    s("Variance", fmta("\\mathbb{V}\\text{ar}(<>)", {i(1, "X")})),
    s("Expectation", fmta("\\mathbb{E}(<>)", {i(1, "X")})), 
    s("Probability", fmta("\\mathbb{P}(<>)", {i(1, "X")})),
    s("eventspace", t( "\\mathcal{F}")), 

    -- Math Proofs
    s("=>", t("\\implies ")),
    s("->", t( "\\rightarrow ")),
    s("<->", t( "\\leftrightarrow ")),
    s("assoc", t( "\\leftrightarrow ")),
    s("Reals", t( "\\mathbb{R} ")), 

    -- Math Symbols, Canonical Meaning
    s("Rn", t( "\\mathbb{R}^{n} ")),
    s("~", t( "\\sim ")),

    -- Math Arthithmeic notation
    s("+-", t( "\\pm ")),

    -- Math Symbols, Variables
    s("w", t( "\\omega ")),
    s("a", t("\\alpha ")),
    s("d", t("\\delta ")),
    s("D", t("\\Delta ")),
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
