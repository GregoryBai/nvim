local _M = {}
_M.toggle_tree = function()
	if require("nvim-tree.view").is_visible() then
		require("nvim-tree").toggle()
		require("bufferline.state").set_offset(0)
	else
		-- require'bufferline.state'.set_offset(-31, '')
		require("bufferline.state").set_offset(31, "")
		require("nvim-tree").toggle()
		-- require'nvim-tree'.find_file(true)
	end
end

return _M
