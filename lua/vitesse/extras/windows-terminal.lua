local M = {}

function M.template(c, variant)
  return string.format(
    [[{
  "name": "Vitesse %s",
  "background": "%s",
  "foreground": "%s",
  "cursorColor": "%s",
  "selectionBackground": "%s",
  "black": "%s",
  "red": "%s",
  "green": "%s",
  "yellow": "%s",
  "blue": "%s",
  "purple": "%s",
  "cyan": "%s",
  "white": "%s",
  "brightBlack": "%s",
  "brightRed": "%s",
  "brightGreen": "%s",
  "brightYellow": "%s",
  "brightBlue": "%s",
  "brightPurple": "%s",
  "brightCyan": "%s",
  "brightWhite": "%s"
}]],
    variant,
    c.editorBackground,
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
