local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for Ghostty
foreground = %s
background = %s
cursor-color = %s
cursor-text = %s
selection-background = %s
selection-foreground = %s
palette = 0=%s
palette = 1=%s
palette = 2=%s
palette = 3=%s
palette = 4=%s
palette = 5=%s
palette = 6=%s
palette = 7=%s
palette = 8=%s
palette = 9=%s
palette = 10=%s
palette = 11=%s
palette = 12=%s
palette = 13=%s
palette = 14=%s
palette = 15=%s
]],
    variant,
    c.mainText,
    c.editorBackground,
    c.mainText,
    c.editorBackground,
    c.syntaxFunction,
    c.mainText,
    c.editorBackground,
    c.syntaxError,
    c.successText,
    c.warningEmphasis,
    c.syntaxFunction,
    c.syntaxKeyword,
    c.linkText,
    c.mainText,
    c.inactiveText,
    c.errorText,
    c.stringText,
    c.warningText,
    c.syntaxOperator,
    c.syntaxError,
    c.stringText,
    c.commentText
  )
end

return M
