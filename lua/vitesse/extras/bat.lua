local M = {}

function M.template(c, variant)
  local lines = {
    '# Vitesse ' .. variant .. ' for bat',
    'name = "Vitesse ' .. variant .. '"',
    '',
    '[colors]',
    'foreground = "' .. c.mainText .. '"',
    'background = "' .. c.editorBackground .. '"',
    'selection-background = "' .. c.syntaxFunction .. '"',
  }

  local scopes = {
    { name = 'Comment', scope = 'comment', fg = c.commentText, italic = true },
    { name = 'String', scope = 'string', fg = c.stringText },
    { name = 'Number', scope = 'constant.numeric', fg = c.foregroundEmphasis },
    { name = 'Keyword', scope = 'keyword', fg = c.syntaxError },
    {
      name = 'Function',
      scope = 'entity.name.function',
      fg = c.syntaxKeyword,
    },
    { name = 'Type', scope = 'entity.name.type', fg = c.syntaxKeyword },
    { name = 'Operator', scope = 'keyword.operator', fg = c.syntaxError },
  }

  for _, s in ipairs(scopes) do
    table.insert(lines, '')
    table.insert(lines, '[[colors.scopes]]')
    table.insert(lines, 'name = "' .. s.name .. '"')
    table.insert(lines, 'scope = "' .. s.scope .. '"')
    if s.italic then
      table.insert(lines, 'style = { fg = "' .. s.fg .. '", italic = true }')
    else
      table.insert(lines, 'style = { fg = "' .. s.fg .. '" }')
    end
  end

  return table.concat(lines, '\n') .. '\n'
end

return M
