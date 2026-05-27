# Vitesse 主题覆盖率提升方案

> 基于对 [antfu/vscode-theme-vitesse](https://github.com/antfu/vscode-theme-vitesse) 的逐项比对。
> 仅记录 Neovim 有意义的差距，排除 VS Code 专属 UI（titleBar、activityBar、sideBar 等）。

---

## 总览

| 优先级 | 项目 | 影响范围 | 预估工作量 |
|--------|------|----------|-----------|
| P0 | 补充缺失的语义色彩色板 | 全局 | 中 |
| P0 | 修正语法高亮色彩映射 | syntax/treesitter | 中 |
| P1 | 新增 `black` 变体 | colorscheme | 小 |
| P1 | 改进 Diff 高亮组 | editor | 小 |
| P1 | 补充 Diff/Markup 文本样式 | treesitter | 小 |
| P2 | 补充 Neovim UI 高亮组 | editor | 小 |
| P2 | 修正终端颜色映射 | terminal | 小 |

---

## P0：补充缺失的语义色彩色板

### 现状

VS Code 原版定义了 19 个语法语义色，当前 Neovim 调色板仅有 23 个共享键，缺失以下关键色：

| 语义色 | VS Code Dark | VS Code Light | Neovim 当前映射 | 问题 |
|--------|-------------|---------------|----------------|------|
| `variable` | `#bd976a` | `#b07d48` | `syntaxFunction` (绿) | 颜色错误，应为金棕色 |
| `number` | `#4C9A91` | `#2f798a` | `foregroundEmphasis` | 缺少独立色，应为青色 |
| `constant` | `#c99076` | `#a65e2b` | `syntaxError` (红) | 颜色错误，应为橙棕色 |
| `class` | `#6872ab` | `#5a6aa6` | `syntaxKeyword` (青) | 颜色错误，应为蓝紫色 |
| `interface` | `#5d99a9` | `#2e808f` | 无 | 完全缺失，应为青蓝色 |
| `type` | `#5DA994` | `#2e8f82` | `syntaxKeyword` (青) | 颜色偏差，应为独立色 |
| `builtin` | `#cb7676` | `#ab5959` | `syntaxError` (红) | 颜色相同但语义不同 |
| `property` | `#b8a965` | `#998418` | `syntaxFunction` (绿) | 颜色错误，应为金黄色 |
| `namespace` | `#db889a` | `#b05a78` | `syntaxKeyword` (青) | 颜色错误，应为粉红色 |
| `decorator` | `#bd8f8f` | `#bd8f8f` | 无 | 完全缺失，应为灰粉色 |
| `regex` | `#c4704f` | `#ab5e3f` | 无 | 完全缺失，应为橙棕色 |

### 执行步骤

**Step 1：扩展调色板**（`lua/vitesse/colorscheme.lua`）

在 `dark_base` 和 `light_base` 中新增以下键：

```lua
-- dark_base 新增
syntaxVariable = '#bd976a',
syntaxNumber = '#4C9A91',
syntaxConstant = '#c99076',
syntaxClass = '#6872ab',
syntaxInterface = '#5d99a9',
syntaxType = '#5DA994',
syntaxBuiltin = '#cb7676',
syntaxProperty = '#b8a965',
syntaxNamespace = '#db889a',
syntaxDecorator = '#bd8f8f',
syntaxRegex = '#c4704f',

-- light_base 新增
syntaxVariable = '#b07d48',
syntaxNumber = '#2f798a',
syntaxConstant = '#a65e2b',
syntaxClass = '#5a6aa6',
syntaxInterface = '#2e808f',
syntaxType = '#2e8f82',
syntaxBuiltin = '#ab5959',
syntaxProperty = '#998418',
syntaxNamespace = '#b05a78',
syntaxDecorator = '#bd8f8f',
syntaxRegex = '#ab5e3f',
```

在 `apply_palette()` 中添加对应的 `premix()` 调用。

**Step 2：更新语法高亮映射**（`lua/vitesse/groups/syntax.lua`）

修正以下映射：

| 高亮组 | 当前 | 目标 |
|--------|------|------|
| `Constant` | `c.syntaxError` | `c.syntaxConstant` |
| `Number` | `c.foregroundEmphasis` | `c.syntaxNumber` |
| `Boolean` | `c.syntaxFunction` | `c.syntaxKeyword` (保持不变，VS Code 中 boolean=keyword) |
| `Statement` | `c.syntaxError` | `c.syntaxError` (保持不变) |
| `Operator` | `c.syntaxError` | `c.syntaxError` (保持不变，VS Code 中 operator=red) |
| `Type` | `c.syntaxKeyword` | `c.syntaxType` |
| `Class` (link) | `Type` | 保持 link 到 Type |
| `Struct` (link) | `Type` | 保持 link 到 Type |

**Step 3：更新 Treesitter 高亮映射**（`lua/vitesse/groups/treesitter.lua`）

| 高亮组 | 当前 | 目标 |
|--------|------|------|
| `@variable` | `c.syntaxFunction` | `c.syntaxVariable` |
| `@variable.builtin` | `c.syntaxFunction` | `c.syntaxVariable` |
| `@variable.member` | `c.mainText` | `c.syntaxProperty` |
| `@variable.parameter` | `c.mainText` | `c.mainText` (保持不变) |
| `@constant` (link) | `Constant` | 保持不变 |
| `@constant.builtin` | `c.syntaxFunction` | `c.syntaxBuiltin` |
| `@type` (link) | `Type` | 保持不变 |
| `@type.builtin` | `c.syntaxFunction` | `c.syntaxBuiltin` |
| `@type.qualifier` | `c.syntaxFunction` | `c.syntaxKeyword` |
| `@type.definition` | `c.mainText` | `c.syntaxType` |
| `@namespace` (link) | `Type` | `fg = c.syntaxNamespace` |
| `@property` (link) | `Property` | `fg = c.syntaxProperty` |
| `@field` (link) | `Property` | `fg = c.syntaxProperty` |
| `@number` (link) | `Number` | 保持不变 |
| `@constructor` | `c.syntaxFunction` | `c.syntaxType` |
| `@tag.attribute` | `c.syntaxKeyword` | `c.syntaxVariable` |
| `@attribute` | `c.syntaxKeyword` | `c.syntaxDecorator` |
| `@annotation` (link) | `Label` | `fg = c.syntaxDecorator` |
| `@punctuation.bracket` | `c.warningEmphasis` | `c.syntaxOperator` |
| `@markup.quote` | `c.commentText` | `c.syntaxInterface` |

**Step 4：更新 LSP 语义令牌映射**（`lua/vitesse/groups/lsp.lua`）

确保 `@lsp.type.*` 组使用正确的调色板键（部分可能已正确）。

### 验收标准

- [ ] `dark` 变体下 `@variable` 显示为金棕色 (`#bd976a`)，非绿色
- [ ] `@number` 显示为青色 (`#4C9A91`)，非前景色
- [ ] `Constant` 显示为橙棕色 (`#c99076`)，非红色
- [ ] `@type` 显示为青绿色 (`#5DA994`)，非青色
- [ ] `@property` 显示为金黄色 (`#b8a965`)，非绿色
- [ ] `@namespace` 显示为粉红色 (`#db889a`)，非青色
- [ ] `@attribute` 显示为灰粉色 (`#bd8f8f`)
- [ ] `light` 变体下所有对应颜色正确
- [ ] 运行 `nvim --headless -c "colorscheme vitesse" -c "qa"` 无报错

---

## P0：修正语法高亮色彩映射

### 现状

部分语法组的映射与 VS Code 原版存在语义偏差：

| 问题 | VS Code 规则 | Neovim 当前 | 影响 |
|------|-------------|------------|------|
| `@punctuation.bracket` | `#666666` (gray) | `c.warningEmphasis` (yellow) | 括号颜色错误 |
| `@markup.quote` | `v('interface')` (teal) | `c.commentText` (gray) | 引用块颜色偏差 |
| `@string.regexp` | `v('regex')` (orange) | link `String` (pink) | 正则表达式颜色错误 |
| `@markup.heading` | `primary` + bold | link `Keyword` | 正确，但需确认 bold 生效 |

### 执行步骤

在 P0 Step 3 中已包含。额外需要在 `syntax.lua` 中添加 `Regex` 组：

```lua
Regex = { fg = c.syntaxRegex },
```

并在 `treesitter.lua` 中：

```lua
['@string.regexp'] = { fg = c.syntaxRegex },
```

### 验收标准

- [ ] 括号 (`()`, `{}`, `[]`) 显示为灰色，非黄色
- [ ] 正则表达式显示为橙棕色，非粉色
- [ ] Markdown 引用块显示为青蓝色，非灰色

---

## P1：新增 `black` 变体

### 现状

VS Code 原版有 5 个变体，Neovim 缺少 `black`（纯黑背景）变体。

VS Code `black` 变体特性：
- 背景：`#000000`
- 前景：`#dbd7cacc`（略低透明度）
- 活动背景：`#121212`
- 标点色：`#444444`

### 执行步骤

**Step 1：添加调色板**（`lua/vitesse/colorscheme.lua`）

```lua
black = vim.tbl_extend('force', dark_base, {
  editorBackground = '#000000',
  sidebarBackground = '#000000',
  popupBackground = '#121212',
  floatingWindowBackground = '#000000',
  menuOptionBackground = '#121212',
  windowBorder = '#191919',
  focusedBorder = '#121212',
  emphasizedBorder = '#121212',
}),
```

同时需要为 `black` 变体覆盖 `mainText` 透明度：
- `mainText = '#dbd7cacc'`
- `syntaxOperator = '#444444'`

**Step 2：更新 `resolve_theme()`**（`lua/vitesse/colorscheme.lua`）

确保 `'black'` 被识别为有效主题。

**Step 3：添加入口文件**（`colors/vitesse-black.lua`）

```lua
vim.o.background = 'dark'
vim.g.vitesse_theme = 'black'
require('vitesse').colorscheme()
```

**Step 4：更新配置**（`lua/vitesse/config.lua`）

在 `theme` 选项说明中添加 `'black'`。

### 验收标准

- [ ] `:colorscheme vitesse-black` 加载纯黑背景主题
- [ ] 背景色为 `#000000`
- [ ] 前景色透明度正确（略低于标准 dark）
- [ ] 所有语法高亮颜色与 dark 变体一致（仅背景不同）
- [ ] 4 个 extras 工具（alacritty、kitty 等）生成 black 变体输出

---

## P1：改进 Diff 高亮组

### 现状

VS Code 原版的 diff 编辑器使用**背景色**标记变更区域，而当前 Neovim 实现仅使用前景色。

| 组 | VS Code | Neovim 当前 |
|----|---------|------------|
| DiffAdd | 绿色背景 + 深绿前景 | 仅前景色 |
| DiffChange | 蓝色背景 + 深蓝前景 | 仅前景色 |
| DiffDelete | 红色背景 + 深红前景 | 仅前景色 |
| DiffText | 更深的背景 + 前景 | 仅前景色 |

### 执行步骤

修改 `lua/vitesse/groups/editor.lua` 中的 Diff 组：

```lua
local diff_add_bg = utils.mix(c.successText, c.editorBackground, 0.18)
local diff_delete_bg = utils.mix(c.syntaxError, c.editorBackground, 0.18)
local diff_change_bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.18)
local diff_text_bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.30)

DiffAdd = { bg = diff_add_bg, fg = c.successText },
DiffDelete = { bg = diff_delete_bg, fg = c.syntaxError },
DiffChange = { bg = diff_change_bg, fg = c.syntaxFunction },
DiffText = { bg = diff_text_bg, fg = c.syntaxFunction },
```

### 验收标准

- [ ] `DiffAdd` 区域有明显的绿色背景
- [ ] `DiffDelete` 区域有明显的红色背景
- [ ] `DiffChange` 区域有明显的蓝色背景
- [ ] `DiffText`（实际变更行）比 `DiffChange` 背景更深
- [ ] `transparent = true` 时 diff 背景仍可见（使用 mix 而非直接 bg）

---

## P1：补充 Diff/Markup 文本样式

### 现状

VS Code 原版的 token colors 为 diff markup 定义了丰富的背景+前景组合，以及 Markdown 特定样式。当前 Neovim 的 `@diff.*` 和 `@markup.*` 组覆盖不完整。

### 执行步骤

在 `treesitter.lua` 中补充：

```lua
-- Diff markup（VS Code 有背景色）
['@diff.plus'] = { bg = utils.mix(c.successText, c.editorBackground, 0.15), fg = c.successText },
['@diff.minus'] = { bg = utils.mix(c.syntaxError, c.editorBackground, 0.15), fg = c.syntaxError },
['@diff.delta'] = { bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.10), fg = c.syntaxFunction },

-- Markdown link underline（VS Code 有 underline 样式）
['@markup.link'] = { fg = c.linkText, underline = true },

-- 注：@markup.raw 等已正确设置 bg = 'NONE'
```

### 验收标准

- [ ] Git diff 的 `+` 行有浅绿色背景
- [ ] Git diff 的 `-` 行有浅红色背景
- [ ] Git diff 的修改行有浅蓝色背景
- [ ] Markdown 链接有下划线

---

## P2：补充 Neovim UI 高亮组

### 现状

以下 Neovim 有意义的 UI 高亮组尚未定义或可改进：

| 高亮组 | 说明 | 当前状态 | 建议 |
|--------|------|----------|------|
| `MsgSeparator` | 消息区域分隔线 | 未定义 | `fg = c.windowBorder` |
| `RedrawDebugClear` | `:redrawdebug clear` | 未定义 | `bg = c.warningEmphasis` |
| `RedrawDebugComposed` | `:redrawdebug composed` | 未定义 | `bg = c.successText` |
| `RedrawDebugRecompose` | `:redrawdebug recompose` | 未定义 | `bg = c.syntaxError` |
| `healthSuccess` | `:checkhealth` 成功 | 未定义 | `fg = c.successText` |
| `healthWarning` | `:checkhealth` 警告 | 未定义 | `fg = c.warningText` |

### 执行步骤

在 `editor.lua` 中追加：

```lua
MsgSeparator = { fg = c.windowBorder },
RedrawDebugClear = { bg = c.warningEmphasis },
RedrawDebugComposed = { bg = c.successText },
RedrawDebugRecompose = { bg = c.syntaxError },
healthSuccess = { fg = c.successText },
healthWarning = { fg = c.warningText },
```

### 验收标准

- [ ] `:messages` 输出的分隔线颜色与窗口边框一致
- [ ] `:checkhealth` 输出的成功/警告文字颜色正确
- [ ] `:redrawdebug clear` 可见黄色闪烁

---

## P2：修正终端颜色映射

### 现状

当前终端颜色映射与 VS Code 原版存在差异：

| 色位 | VS Code | Neovim 当前 | 问题 |
|------|---------|------------|------|
| color 0 (Black) | background | editorBackground | 相同，OK |
| color 4 (Blue) | `#6394bf` / `#296aa3` | `syntaxFunction` (green) | 蓝色用了绿色值 |
| color 5 (Magenta) | `#d9739f` / `#a13865` | `syntaxKeyword` (teal) | 品红用了青色值 |
| color 6 (Cyan) | `#5eaab5` / `#2993a3` | `linkText` (teal) | 接近但不同 |
| color 12 (BrightBlue) | `#6394bf` / `#296aa3` | `syntaxOperator` (gray) | 蓝色用了灰色值 |
| color 13 (BrightMagenta) | `#d9739f` / `#a13865` | `syntaxError` (red) | 品红用了红色值 |
| color 14 (BrightCyan) | `#5eaab5` / `#2993a3` | `stringText` (pink) | 青色用了粉色值 |

### 执行步骤

需要在调色板中新增 `cyan` 和 `magenta` 色，或直接使用 VS Code 的十六进制值：

```lua
-- colorscheme.lua 中新增
syntaxCyan = '#5eaab5',    -- dark
syntaxMagenta = '#d9739f', -- dark
syntaxCyan = '#2993a3',    -- light
syntaxMagenta = '#a13865', -- light
```

更新 `set_terminal_colors()`（`init.lua`）：

```lua
vim.g.terminal_color_4 = colorscheme.blue           -- Blue
vim.g.terminal_color_5 = colorscheme.syntaxMagenta   -- Magenta
vim.g.terminal_color_6 = colorscheme.syntaxCyan      -- Cyan
vim.g.terminal_color_12 = colorscheme.blue           -- BrightBlue
vim.g.terminal_color_13 = colorscheme.syntaxMagenta  -- BrightMagenta
vim.g.terminal_color_14 = colorscheme.syntaxCyan     -- BrightCyan
```

### 验收标准

- [ ] 终端中 `echo -e "\e[34mBlue"` 显示为蓝色，非绿色
- [ ] 终端中 `echo -e "\e[35mMagenta"` 显示为品红色，非青色
- [ ] 终端中 `echo -e "\e[36mCyan"` 显示为青色
- [ ] Bright 变体颜色与正常变体一致（仅更亮）
- [ ] `light` 变体下终端颜色正确

---

## 实施建议

### 执行顺序

```
P0-Step1 (调色板) → P0-Step2 (syntax) → P0-Step3 (treesitter) → P0-Step4 (lsp)
    ↓
P1-diff (editor) → P1-diff-markup (treesitter)
    ↓
P1-black (新变体)
    ↓
P2-ui (editor) → P2-terminal (init.lua)
```

### 测试策略

每个 P0/P1 完成后：

1. 启动 Neovim，加载各变体，目视检查关键颜色
2. 运行 `nvim --headless -l tests/theme_spec.lua`
3. 对比 VS Code 截图中的关键语法元素颜色

### 回归风险

- P0 调色板变更会影响**所有**使用这些键的高亮组，需全面回归
- P1 diff 背景色变更会影响 gitsigns 等插件的 diff 显示，需测试兼容性
- P1 black 变体需要 extras 生成脚本支持 5 个变体（当前为 4 个）
