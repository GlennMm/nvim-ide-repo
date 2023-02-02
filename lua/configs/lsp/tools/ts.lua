local M = {}

local oky, tools = pcall(require, "typescript")
if not oky then
  vim.notify("Failed to load typescript tools", vim.log.levels.WARN)
  return
end

local tss = {
  typescript = {
    -- baseIndentSize = 2,
    -- indentSize = 2,
    -- indentStyle = "Smart",
    -- insertSpaceAfterCommaDelimiter = true,
    -- insertSpaceAfterConstructor = true,
    -- insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
    -- insertSpaceAfterKeywordsInControlFlowStatements = true,
    -- insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
    -- insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
    -- insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
    -- insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
    -- insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
    -- insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true,
    -- insertSpaceAfterSemicolonInForStatements = true,
    -- insertSpaceAfterTypeAssertion = true,
    -- insertSpaceBeforeAndAfterBinaryOperators = true,
    -- insertSpaceBeforeFunctionParenthesis = true,
    -- insertSpaceBeforeTypeAnnotation = true,
    -- semicolons = "ignore",
    -- tabSize = 2,
    -- trimTrailingWhitespace = true,
    inlayHints = {
      includeInlayEnumMemberValueHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
    },
  },
  javasript = {
    baseIndentSize = 2,
    indentSize = 2,
    indentStyle = "Smart",
    insertSpaceAfterCommaDelimiter = true,
    insertSpaceAfterConstructor = true,
    insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
    insertSpaceAfterKeywordsInControlFlowStatements = true,
    insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
    insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
    insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
    insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
    insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
    insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true,
    insertSpaceAfterSemicolonInForStatements = true,
    insertSpaceAfterTypeAssertion = true,
    insertSpaceBeforeAndAfterBinaryOperators = true,
    insertSpaceBeforeFunctionParenthesis = true,
    insertSpaceBeforeTypeAnnotation = true,
    semicolons = "ignore",
    tabSize = 2,
    trimTrailingWhitespace = true,
    inlayHints = {
      includeInlayEnumMemberValueHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
    },
  },
  -- codeActionsOnSave = {
  --   source = {
  --     organizeImports = true,
  --     fixAll = true,
  --     removeUnused = true,
  --     addMissingImports = true,
  --   },
  -- },
}
local lsp_opt = require("configs.lsp.utils")
M.setup = function()
  tools.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
      fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
      on_attach = lsp_opt.on_attach,
      capabilities = lsp_opt.capabilities,
      settings = tss,
    },
  })
end

return M
