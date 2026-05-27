local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for Alacritty
[colors.primary]
background = "%s"
foreground = "%s"

[colors.cursor]
text = "%s"
cursor = "%s"

[colors.normal]
black = "%s"
red = "%s"
green = "%s"
yellow = "%s"
blue = "%s"
magenta = "%s"
cyan = "%s"
white = "%s"

[colors.bright]
black = "%s"
red = "%s"
green = "%s"
yellow = "%s"
blue = "%s"
magenta = "%s"
cyan = "%s"
white = "%s"
]],
    variant,
    c.editorBackground,
    c.mainText,
    c.editorBackground,
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
