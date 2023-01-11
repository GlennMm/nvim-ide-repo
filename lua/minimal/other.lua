local oky, cmt = pcall(require, "Comment")
if not oky then
	vim.notify("Failed to load Comment plugin", vim.log.levels.WARN)
	return
end

local ok, tsc = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
if not ok then
  cmt.setup()
  return 
end

cmt.setup({
  pre_hook = tsc.create_pre_hook(),
})
