local oky, fold = pcall(require, "pretty-fold")
if not oky then
  return
end
fold.setup()
