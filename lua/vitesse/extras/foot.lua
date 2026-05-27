local M = {}

function M.template(c, variant)
  return string.format(
    [[; Vitesse %s for Foot
[colors]
foreground=%s
background=%s
selection-foreground=%s
selection-background=%s
cursor=%s
cursor-color=%s

[colors.normal]
black=%s
red=%s
green=%s
yellow=%s
blue=%s
magenta=%s
cyan=%s
white=%s

[colors.bright]
black=%s
red=%s
green=%s
yellow=%s
blue=%s
magenta=%s
cyan=%s
white=%s
]],
    variant,
    c.mainText,
    c.editorBackground,
    c.mainText,
    c.syntaxFunction,
    c.mainText,
    c.editorBackground,
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
