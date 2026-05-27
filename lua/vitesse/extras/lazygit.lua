local M = {}

function M.template(c, variant)
  return string.format(
    [[# Vitesse %s for lazygit
gui:
  theme:
    activeBorderColor:
      - "%s"
      - bold
    inactiveBorderColor:
      - "%s"
    searchingActiveBorderColor:
      - "%s"
      - bold
    selectedLineBgColor:
      - "%s"
    cherryPickedCommitFgColor:
      - "%s"
    cherryPickedCommitBgColor:
      - "%s"
]],
    variant,
    c.syntaxFunction,
    c.inactiveText,
    c.warningText,
    c.syntaxFunction,
    c.syntaxKeyword,
    c.editorBackground
  )
end

return M
