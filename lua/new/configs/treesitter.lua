local oky, cfg = pcall(require, 'nvim-treesitter.configs')
if not oky then
  return
end
cfg.setup {

  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "rust", "go", "javascript", "typescript", "tsx" }, -- put the language you want in this array
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
