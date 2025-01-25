return function(ls)
  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node

  ls.add_snippets('go', {
    s('iferr', {
      t { "if err != nil {" }, t { "", "" },
      i(1),
      t { "", "}" },
    }),

    s('ftest', {
      t { "func Test" }, i(1), t { "(t *testing.T) {" },
      i(0),
      t { "}" },
    }),

    s("fhttp", {
      t("func "), i(1), t("(w http.ResponseWriter, r *http.Request) {"), t { "", "" },
      i(0), t { "", "" },
      t("}"),
    }),
  })
end
