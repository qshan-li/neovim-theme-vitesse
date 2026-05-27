local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for Kitty
foreground %s
background %s
cursor %s
cursor_text %s
selection_foreground %s
selection_background %s
url_color %s
active_tab_foreground %s
active_tab_background %s
inactive_tab_foreground %s
inactive_tab_background %s

# normal
color0 %s
color1 %s
color2 %s
color3 %s
color4 %s
color5 %s
color6 %s
color7 %s

# bright
color8 %s
color9 %s
color10 %s
color11 %s
color12 %s
color13 %s
color14 %s
color15 %s
]],
    variant,
    c.mainText,
    c.editorBackground,
    c.mainText,
    c.editorBackground,
    c.mainText,
    c.syntaxFunction,
    c.linkText,
    c.mainText,
    c.syntaxFunction,
    c.inactiveText,
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
