describe('vitesse colorscheme', function()
  it('setup does not error', function()
    assert.has_no.errors(function()
      require('vitesse').setup {}
    end)
  end)

  it('colorscheme loads without error', function()
    assert.has_no.errors(function()
      require('vitesse').colorscheme()
    end)
  end)

  it('sets colors_name', function()
    require('vitesse').colorscheme()
    assert.equals('vitesse', vim.g.colors_name)
  end)

  it('get_colors returns non-empty table', function()
    local colors = require('vitesse').get_colors()
    assert.is_table(colors)
    assert.is_not_nil(colors.mainText)
    assert.is_not_nil(colors.editorBackground)
  end)

  it('all 4 variants load', function()
    for _, variant in ipairs { 'dark', 'dark-soft', 'light', 'light-soft' } do
      assert.has_no.errors(function()
        require('vitesse').setup { theme = variant }
        require('vitesse').colorscheme()
      end)
    end
  end)

  it('transparent mode works', function()
    require('vitesse').setup { transparent = true }
    require('vitesse').colorscheme()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    assert.equals('NONE', normal.bg or 'NONE')
  end)

  it('dim_inactive works', function()
    require('vitesse').setup { dim_inactive = true }
    require('vitesse').colorscheme()
    local normal = vim.api.nvim_get_hl(0, { name = 'Normal' })
    local normal_nc = vim.api.nvim_get_hl(0, { name = 'NormalNC' })
    assert.is_not.equals(normal.fg, normal_nc.fg)
  end)

  it('overrides work', function()
    require('vitesse').setup {
      overrides = { Comment = { fg = '#ff0000' } },
    }
    require('vitesse').colorscheme()
    local comment = vim.api.nvim_get_hl(0, { name = 'Comment' })
    assert.equals(0xff0000, comment.fg)
  end)

  it('on_colors callback works', function()
    require('vitesse').setup {
      on_colors = function(colors)
        colors.mainText = '#111111'
      end,
    }
    require('vitesse').colorscheme()
    local colors = require('vitesse').get_colors()
    assert.equals('#111111', colors.mainText)
  end)

  it('terminal colors are set', function()
    require('vitesse').setup { terminal_colors = true }
    require('vitesse').colorscheme()
    assert.is_not_nil(vim.g.terminal_color_0)
    assert.is_not_nil(vim.g.terminal_color_15)
  end)
end)
