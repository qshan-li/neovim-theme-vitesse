local M = {}

function M.template(c, variant)
  return string.format(
    [[; Vitesse %s for delta
[delta]
    syntax-theme = "Vitesse %s"
    plus-style = "syntax %s"
    minus-style = "syntax %s"
    plus-emph-style = "syntax %s"
    minus-emph-style = "syntax %s"
    line-numbers-minus-style = "%s"
    line-numbers-plus-style = "%s"
    line-numbers-zero-style = "%s"
]],
    variant,
    variant,
    c.successText,
    c.syntaxError,
    c.successText,
    c.syntaxError,
    c.syntaxError,
    c.successText,
    c.commentText
  )
end

return M
