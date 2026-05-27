local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for Starship
[character]
success_symbol = "[%s](%s)"
error_symbol = "[%s](%s)"

[directory]
style = "%s"

[git_branch]
style = "%s"

[git_status]
modified = "[%s](%s)"
untracked = "[%s](%s)"
deleted = "[%s](%s)"

[nodejs]
style = "%s"

[python]
style = "%s"

[rust]
style = "%s"

[cmd_duration]
style = "%s"
]],
    variant,
    c.mainText,
    c.successText,
    c.mainText,
    c.syntaxError,
    c.syntaxFunction,
    c.syntaxKeyword,
    c.mainText,
    c.warningText,
    c.mainText,
    c.linkText,
    c.mainText,
    c.syntaxError,
    c.successText,
    c.warningEmphasis,
    c.syntaxError,
    c.commentText
  )
end

return M
