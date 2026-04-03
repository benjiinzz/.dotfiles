local path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

vim.iter(vim.fn.glob(path .. "/*.lua", false, true))
	:filter(function(file)
		return vim.fn.fnamemodify(file, ":t:r") ~= "init"
	end)
	:each(function(file)
		local name = vim.fn.fnamemodify(file, ":t:r")
		require("plugins." .. name)
	end)
