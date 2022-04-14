local npairs = require("nvim-autopairs")

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "string", "template_string" },
		java = false, -- don't check treesitter on java
	},
	disable_filetype = { "TelescopePrompt" },
	fast_wrap = {
		map = "<M-w>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		-- highlight = 'Search',
		highlight = "PmenuSel",
		highlight_grey = "Comment",
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp = require("cmp")

--> adds parenthesis to the AC options
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- local ts_conds = require('nvim-autopairs.ts-conds')
-- local Rule = require('nvim-autopairs.rule')
-- press % => %% only while inside a comment or string
-- npairs.add_rules({
--   Rule("%", "%", "lua")
--       :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
--   Rule("$", "$", "lua")
--       :with_pair(ts_conds.is_not_ts_node({ 'function' }))
-- })
