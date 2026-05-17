local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node

return {
    s("cf", {
        t({
            "#include <bits/stdc++.h>",
            "#include <ext/pb_ds/assoc_container.hpp>",
            "#include <ext/pb_ds/tree_policy.hpp>",
            "using namespace std;",
            "using namespace __gnu_pbds;",
            "",
            "template <class T>",
            "using ordered_set = tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;",
            "",
            "void solve();",
            "",
            "int main() {",
            "    ios::sync_with_stdio(false);",
            "    cin.tie(nullptr);",
            "",
            "    int t; cin >> t;",
            "    while (t--) solve();",
            "",
            "    return 0;",
            "}",
            "",
            "void solve() {",
            "    ",
        }),
        i(0),
        t({
            "",
            "}",
        }),
    }),
}
