local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for Fish
set -g fish_color_normal %s
set -g fish_color_command %s
set -g fish_color_keyword %s
set -g fish_color_quote %s
set -g fish_color_redirection %s
set -g fish_color_end %s
set -g fish_color_error %s
set -g fish_color_param %s
set -g fish_color_comment %s
set -g fish_color_selection --background=%s
set -g fish_color_search_match --background=%s
set -g fish_color_operator %s
set -g fish_color_escape %s
set -g fish_color_autosuggestion %s
]],
    variant,
    c.mainText,
    c.syntaxFunction,
    c.syntaxKeyword,
    c.stringText,
    c.syntaxOperator,
    c.syntaxError,
    c.syntaxError,
    c.mainText,
    c.commentText,
    c.syntaxFunction,
    c.syntaxFunction,
    c.syntaxError,
    c.syntaxKeyword,
    c.inactiveText
  )
end

return M
