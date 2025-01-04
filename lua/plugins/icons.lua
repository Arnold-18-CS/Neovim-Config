return {
	"nvim-web-devicons",
	config = function()
		local icons = require("nvim-web-devicons")
		icons.setup({
			override = {},
			default = true, -- Use default icons if none are provided
		})
		icons.get_icons()
	end,
}
