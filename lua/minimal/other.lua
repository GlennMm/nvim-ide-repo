local oky, cmt = pcall(require, "Comment")
if not oky then
	vim.notify("Failed to load Comment plugin", vim.log.levels.WARN)
	return
end
cmt.setup()
