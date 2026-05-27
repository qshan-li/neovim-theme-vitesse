local M = {}

function M.highlights(c, config, utils)
  return {
    LspReferenceText = { bg = c.menuOptionBackground },
    LspReferenceRead = { bg = c.menuOptionBackground },
    LspReferenceWrite = { bg = c.menuOptionBackground },
    LspCodeLens = { fg = c.commentText },
    LspCodeLensSeparator = { fg = c.commentText },
    LspSignatureActiveParameter = {
      bg = utils.shade(c.warningEmphasis, 0.5, c.editorBackground),
      bold = true,
    },
    LspInlayHint = { fg = c.commentText },
    ['@lsp.type.namespace'] = { link = '@namespace' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.enumMember'] = { fg = c.syntaxFunction },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.struct'] = { link = '@type' },
    ['@lsp.type.parameter'] = { link = '@parameter' },
    ['@lsp.type.property'] = { link = '@text' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.method'] = { link = '@method' },
    ['@lsp.type.macro'] = { link = '@label' },
    ['@lsp.type.decorator'] = { link = '@label' },
    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.typemod.function.declaration'] = { link = '@function' },
    ['@lsp.typemod.function.readonly'] = { link = '@function' },
  }
end

return M
