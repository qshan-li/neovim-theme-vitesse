local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for tmux
set -g status-style "bg=%s,fg=%s"
set -g status-left-style "fg=%s,bold"
set -g status-right-style "fg=%s"
set -g window-status-current-style "fg=%s,bold"
set -g message-style "bg=%s,fg=%s"
set -g pane-active-border-style "fg=%s"
set -g pane-border-style "fg=%s"
set -g display-panes-active-colour "%s"
set -g display-panes-colour "%s"
set -g clock-mode-colour "%s"
]],
    variant,
    c.editorBackground,
    c.mainText,
    c.syntaxFunction,
    c.commentText,
    c.syntaxFunction,
    c.syntaxFunction,
    c.mainText,
    c.syntaxFunction,
    c.inactiveText,
    c.syntaxFunction,
    c.inactiveText,
    c.syntaxFunction
  )
end

return M
