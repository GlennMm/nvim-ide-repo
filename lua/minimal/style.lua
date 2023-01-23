local ok, fidget = pcall(require, "fidget")
if not ok then
	vim.notify("fidget failed")
	return
end
fidget.setup()
