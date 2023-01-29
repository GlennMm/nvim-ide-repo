function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match("^new") and not name:match("nvim-tree") and not name:match("plugins") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end
