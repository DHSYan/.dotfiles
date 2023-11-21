local ls = require("luasnip")

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "-- this is what was expanded"),
    },
}

