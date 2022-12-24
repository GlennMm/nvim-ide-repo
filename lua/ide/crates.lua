local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	return 
end
require('crates').setup {
    
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
}
