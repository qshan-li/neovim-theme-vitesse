local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for WezTerm
[colors]
foreground = "%s"
background = "%s"
cursor_fg = "%s"
cursor_bg = "%s"
cursor_border = "%s"
selection_fg = "%s"
selection_bg = "%s"

[colors.ansi]
"%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s"

[colors.brights]
"%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s"
]],
    variant,
    c.mainText,
    c.editorBackground,
    c.editorBackground,
    c.mainText,
    c.mainText,
    c.mainText,
    c.syntaxFunction,
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
