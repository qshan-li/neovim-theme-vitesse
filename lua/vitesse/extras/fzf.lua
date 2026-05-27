local M = {}

function M.template(c, variant)
  -- fzf uses --color format: fg:bg:hl:hl+:fg+:bg+:info:prompt:spinner:pointer:marker
  return string.format(
    [[# Vitesse %s for fzf
export FZF_DEFAULT_OPTS='
  --color=fg:%s,bg:%s,hl:%s,fg+:%s,bg+:%s,hl+:%s
  --color=info:%s,prompt:%s,spinner:%s,pointer:%s,marker:%s
  --color=border:%s,header:%s
']],
    variant,
    c.mainText,
    c.editorBackground,
    c.syntaxFunction,
    c.mainText,
    c.syntaxFunction,
    c.syntaxFunction,
    c.linkText,
    c.syntaxKeyword,
    c.warningText,
    c.syntaxError,
    c.successText,
    c.inactiveText,
    c.commentText
  )
end

return M
