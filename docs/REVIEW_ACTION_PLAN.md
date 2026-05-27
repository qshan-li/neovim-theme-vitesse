# Vitesse Neovim Theme — 问题清单与执行方案

> 对标: TokyoNight / Catppuccin / Nightfox / Kanagawa / Rose Pine
> 审查日期: 2026-05-27

---

## 目录

1. [插件集成覆盖不足](#1-插件集成覆盖不足)
2. [集成代码组织混乱](#2-集成代码组织混乱)
3. [缺少编译缓存](#3-缺少编译缓存)
4. [配置深度不够](#4-配置深度不够)
5. [缺少外部工具 extras](#5-缺少外部工具-extras)
6. [缺少 CI/CD 和质量保障](#6-缺少-cicd-和质量保障)
7. [LSP 语义 token 覆盖不完整](#7-lsp-语义-token-覆盖不完整)
8. [代码质量问题](#8-代码质量问题)
9. [文档问题](#9-文档问题)
10. [缺少 colorscheme 清理逻辑](#10-缺少-colorscheme-清理逻辑)

---

## 1. 插件集成覆盖不足

**现状**: 13 个插件集成（bufferline, cmp, flash, gitsigns, neo-tree, noice, telescope, trouble, which-key, nvim-notify, render-markdown, indent-blankline, lspsaga）

**目标**: 至少 30+ 个主流插件集成

### 1.1 添加 lazy.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/lazy.lua`
- **高亮组**:
  - `LazyButton` — 按钮背景/前景
  - `LazyButtonActive` — 选中按钮
  - `LazyComment` — 注释文字
  - `LazyCommit` — commit hash
  - `LazyCommitIssue` — issue 编号
  - `LazyDimmed` — 暗淡文字
  - `LazyDir` — 目录路径
  - `LazyH1` — 一级标题
  - `LazyH2` — 二级标题
  - `LazyLocal` — 本地插件标记
  - `LazyNoCond` — 未满足条件
  - `LazyNormal` — 普通文字
  - `LazyProgressDone` — 进度条完成
  - `LazyProgressTodo` — 进度条未完成
  - `LazyReasonCmd` — 原因: 命令
  - `LazyReasonEvent` — 原因: 事件
  - `LazyReasonFt` — 原因: 文件类型
  - `LazyReasonImport` — 原因: import
  - `LazyReasonKeys` — 原因: 按键
  - `LazyReasonPlugin` — 原因: 插件依赖
  - `LazyReasonRequire` — 原因: require
  - `LazyReasonSource` — 原因: 源文件
  - `LazyReasonStart` — 原因: 启动
  - `LazySpecial` — 特殊文字
  - `LazyTaskOutput` — 任务输出
  - `LazyUrl` — URL 链接
  - `LazyValue` — 值
- **验收**: 打开 lazy.nvim UI（`:Lazy`），所有文字、按钮、进度条颜色正确；暗色/亮色/soft 变体均正常

### 1.2 添加 mason.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/mason.lua`
- **高亮组**:
  - `MasonNormal` — 主窗口背景
  - `MasonHeader` — 标题
  - `MasonHeaderSecondary` — 副标题
  - `MasonHighlight` — 高亮文字
  - `MasonHighlightBlock` — 高亮块
  - `MasonHighlightBlockBold` — 高亮块加粗
  - `MasonHighlightSecondary` — 次要高亮
  - `MasonMuted` — 暗淡文字
  - `MasonMutedBlock` — 暗淡块
- **验收**: `:Mason` UI 中标题、包列表、状态指示器颜色正确

### 1.3 添加 dashboard-nvim / alpha-nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/dashboard.lua`
- **高亮组**:
  - `DashboardHeader` — ASCII art 标题
  - `DashboardFooter` — 底部文字
  - `DashboardProjectTitle` — 项目标题
  - `DashboardProjectTitleIcon` — 项目标题图标
  - `DashboardProjectIcon` — 项目图标
  - `DashboardMruTitle` — 最近文件标题
  - `DashboardMruIcon` — 最近文件图标
  - `DashboardShortCut` — 快捷键
  - `DashboardShortCutIcon` — 快捷键图标
  - `DashboardCenter` — 中心区域
  - `DashboardKey` — 按键提示
  - `DashboardDesc` — 描述文字
  - `DashboardIcon` — 图标
- **验收**: 启动页各区域文字颜色有层次区分，按钮可辨识

### 1.4 添加 oil.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/oil.lua`
- **高亮组**:
  - `OilDir` — 目录名
  - `OilFile` — 文件名
  - `OilCreate` — 新建标记
  - `OilDelete` — 删除标记
  - `OilMove` — 移动标记
  - `OilCopy` — 复制标记
  - `OilChange` — 修改标记
  - `OilRestore` — 恢复标记
  - `OilPurge` — 彻底删除标记
- **验收**: `:Oil` 文件浏览器中目录/文件/操作标记颜色正确

### 1.5 添加 nvim-dap 集成

- **文件**: 新建 `lua/vitesse/integrations/dap.lua`
- **高亮组**:
  - `DapBreakpoint` — 断点标记
  - `DapBreakpointCondition` — 条件断点标记
  - `DapLogPoint` — 日志点标记
  - `DapStopped` — 停止位置标记
  - `DapStoppedLine` — 停止行高亮
  - `DapUIPlayPause` — 播放/暂停按钮
  - `DapUIRestart` — 重启按钮
  - `DapUIStepInto` — 步入按钮
  - `DapUIStepOver` — 步过按钮
  - `DapUIStepOut` — 步出按钮
  - `DapUIStepBack` — 步退按钮
  - `DapUIStop` — 停止按钮
  - `DapUIUnavailable` — 不可用按钮
  - `DapUIWatchesEmpty` — 空监视列表
  - `DapUIWatchesError` — 监视错误
  - `DapUIWatchesValue` — 监视值
  - `DapUIScope` — 作用域标题
  - `DapUIType` — 类型
  - `DapUIValue` — 值
  - `DapUIModifiedValue` — 修改后的值
  - `DapUIDecoration` — 装饰
  - `DapUIThread` — 线程
  - `DapUISource` — 源文件
  - `DapUILineNumber` — 行号
  - `DapUIFloatBorder` — 浮动窗口边框
  - `DapUIFloatNormal` — 浮动窗口普通文字
  - `DapUIBreakpointsPath` — 断点路径
  - `DapUIBreakpointsInfo` — 断点信息
  - `DapUIBreakpointsCurrentLine` — 当前断点行
  - `DapUIBreakpointsLine` — 断点行号
- **验收**: 调试会话中按钮、断点标记、变量面板颜色正确；断点行高亮可辨识

### 1.6 添加 mini.nvim 系列集成

- **文件**: 新建 `lua/vitesse/integrations/mini.lua`
- **高亮组**:
  - `MiniCompletionActiveParameter` — 补全活动参数
  - `MiniCursorword` — 光标词下划线
  - `MiniCursorwordCurrent` — 当前光标词
  - `MiniIndentscopeSymbol` — 缩进作用域符号
  - `MiniIndentscopePrefix` — 缩进前缀
  - `MiniJump` — 跳转高亮
  - `MiniJump2dSpot` — 2D 跳转点
  - `MiniStarterCurrent` — 启动页当前项
  - `MiniStarterHeader` — 启动页标题
  - `MiniStarterFooter` — 启动页底部
  - `MiniStarterItem` — 启动页项目
  - `MiniStarterItemBullet` — 启动页项目符号
  - `MiniStarterItemPrefix` — 启动页项目前缀
  - `MiniStarterSection` — 启动页区域
  - `MiniStarterQuery` — 启动页查询
  - `MiniStatuslineDevinfo` — 状态栏开发信息
  - `MiniStatuslineFileinfo` — 状态栏文件信息
  - `MiniStatuslineFilename` — 状态栏文件名
  - `MiniStatuslineInactive` — 非活动状态栏
  - `MiniStatuslineModeNormal` — 普通模式
  - `MiniStatuslineModeInsert` — 插入模式
  - `MiniStatuslineModeVisual` — 可视模式
  - `MiniStatuslineModeReplace` — 替换模式
  - `MiniStatuslineModeCommand` — 命令模式
  - `MiniSurround` — 包围高亮
  - `MiniTablineCurrent` — 当前标签
  - `MiniTablineFill` — 标签栏填充
  - `MiniTablineHidden` — 隐藏标签
  - `MiniTablineModifiedCurrent` — 当前修改标签
  - `MiniTablineModifiedHidden` — 隐藏修改标签
  - `MiniTablineTabpagesection` — 标签页区域
  - `MiniPickMatchCurrent` — 当前匹配项
  - `MiniPickMatchMarked` — 标记匹配项
  - `MiniPickNormal` — 普通文字
  - `MiniPickPrompt` — 提示符
- **验收**: mini.pick、mini.indentscope、mini.starter 等组件颜色正确

### 1.7 添加 fidget.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/fidget.lua`
- **高亮组**:
  - `FidgetTitle` — LSP 服务器标题
  - `FidgetTask` — 任务文字
- **验收**: LSP 进度提示中服务器名和任务文字颜色正确

### 1.8 添加 nvim-navic 集成

- **文件**: 新建 `lua/vitesse/integrations/navic.lua`
- **高亮组**:
  - `NavicText` — 面包屑普通文字
  - `NavicSeparator` — 面包屑分隔符
  - `NavicIconsFile` — 文件图标
  - `NavicIconsModule` — 模块图标
  - `NavicIconsNamespace` — 命名空间图标
  - `NavicIconsPackage` — 包图标
  - `NavicIconsClass` — 类图标
  - `NavicIconsMethod` — 方法图标
  - `NavicIconsProperty` — 属性图标
  - `NavicIconsField` — 字段图标
  - `NavicIconsConstructor` — 构造函数图标
  - `NavicIconsEnum` — 枚举图标
  - `NavicIconsInterface` — 接口图标
  - `NavicIconsFunction` — 函数图标
  - `NavicIconsVariable` — 变量图标
  - `NavicIconsConstant` — 常量图标
  - `NavicIconsString` — 字符串图标
  - `NavicIconsNumber` — 数字图标
  - `NavicIconsBoolean` — 布尔图标
  - `NavicIconsArray` — 数组图标
  - `NavicIconsObject` — 对象图标
  - `NavicIconsKey` — 键图标
  - `NavicIconsNull` — null 图标
  - `NavicIconsEnumMember` — 枚举成员图标
  - `NavicIconsStruct` — 结构体图标
  - `NavicIconsEvent` — 事件图标
  - `NavicIconsOperator` — 操作符图标
  - `NavicIconsTypeParameter` — 类型参数图标
- **验收**: 面包屑导航中各类符号图标颜色有区分

### 1.9 添加 vim-illuminate 集成

- **文件**: 新建 `lua/vitesse/integrations/illuminate.lua`
- **高亮组**:
  - `IlluminatedWordText` — 文本引用高亮
  - `IlluminatedWordRead` — 读引用高亮
  - `IlluminatedWordWrite` — 写引用高亮
- **验收**: 光标下相同单词的高亮可见且不刺眼

### 1.10 添加 hop.nvim / leap.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/hop.lua`
- **高亮组**:
  - `HopNextKey` — 跳转键（第一字符）
  - `HopNextKey1` — 跳转键（第二字符）
  - `HopNextKey2` — 跳转键（第三字符）
  - `HopUnmatched` — 未匹配文字
  - `LeapMatch` — Leap 匹配
  - `LeapLabelPrimary` — Leap 主标签
  - `LeapLabelSecondary` — Leap 次标签
  - `LeapBackdrop` — Leap 背景遮罩
- **验收**: hop/leap 的跳转提示字符清晰可读，标签有层次

### 1.11 添加 copilot.vim / copilot.lua 集成

- **文件**: 新建 `lua/vitesse/integrations/copilot.lua`
- **高亮组**:
  - `CopilotSuggestion` — 补全建议文字
  - `CopilotAnnotation` — 注解文字
- **验收**: Copilot 补全建议与正常补全有视觉区分

### 1.12 添加 aerial.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/aerial.lua`
- **高亮组**:
  - `AerialNormal` — 普通符号
  - `AerialGuide` — 缩进指南
  - `AerialLine` — 当前行
  - `AerialArrayIcon` — 数组图标
  - `AerialBooleanIcon` — 布尔图标
  - `AerialClassIcon` — 类图标
  - `AerialConstantIcon` — 常量图标
  - `AerialConstructorIcon` — 构造函数图标
  - `AerialEnumIcon` — 枚举图标
  - `AerialEnumMemberIcon` — 枚举成员图标
  - `AerialEventIcon` — 事件图标
  - `AerialFieldIcon` — 字段图标
  - `AerialFileIcon` — 文件图标
  - `AerialFunctionIcon` — 函数图标
  - `AerialInterfaceIcon` — 接口图标
  - `AerialKeyIcon` — 键图标
  - `AerialMethodIcon` — 方法图标
  - `AerialModuleIcon` — 模块图标
  - `AerialNamespaceIcon` — 命名空间图标
  - `AerialNullIcon` — null 图标
  - `AerialNumberIcon` — 数字图标
  - `AerialObjectIcon` — 对象图标
  - `AerialOperatorIcon` — 操作符图标
  - `AerialPackageIcon` — 包图标
  - `AerialPropertyIcon` — 属性图标
  - `AerialStringIcon` — 字符串图标
  - `AerialStructIcon` — 结构体图标
  - `AerialTypeParameterIcon` — 类型参数图标
  - `AerialVariableIcon` — 变量图标
- **验收**: 代码大纲中各类符号图标颜色正确

### 1.13 添加 snacks.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/snacks.lua`
- **高亮组**:
  - `SnacksNormal` — 普通文字
  - `SnacksNormalNC` — 非活动文字
  - `SnacksDashboardHeader` — 仪表盘标题
  - `SnacksDashboardFooter` — 仪表盘底部
  - `SnacksDashboardDir` — 仪表盘目录
  - `SnacksDashboardFile` — 仪表盘文件
  - `SnacksDashboardIcon` — 仪表盘图标
  - `SnacksDashboardKey` — 仪表盘按键
  - `SnacksDashboardDesc` — 仪表盘描述
  - `SnacksDashboardShortcut` — 仪表盘快捷键
  - `SnacksIndent` — 缩进线
  - `SnacksIndentScope` — 缩进作用域
  - `SnacksPickerDir` — 选择器目录
  - `SnacksPickerFile` — 选择器文件
  - `SnacksPickerMatch` — 选择器匹配
  - `SnacksPickerPrompt` — 选择器提示
  - `SnacksPickerTitle` — 选择器标题
  - `SnacksScratchDesc` — 草稿描述
  - `SnacksScratchFile` — 草稿文件
  - `SnacksNotifierInfo` — 通知信息
  - `SnacksNotifierWarn` — 通知警告
  - `SnacksNotifierError` — 通知错误
  - `SnacksNotifierDebug` — 通知调试
  - `SnacksNotifierTrace` — 通知追踪
  - `SnacksZen` — 禅模式
  - `SnacksZenNC` — 禅模式非活动
  - `SnacksInputNormal` — 输入框普通
  - `SnacksInputBorder` — 输入框边框
  - `SnacksInputPrompt` — 输入框提示
- **验收**: `:Snacks` 各组件（仪表盘、选择器、通知）颜色正确

### 1.14 添加 markdown-preview.nvim 集成

- **文件**: 新建 `lua/vitesse/integrations/markdown-preview.lua`
- **高亮组**: 无需高亮组（浏览器渲染），但需在 README 中标注支持
- **验收**: 无高亮组需求，仅文档说明

### 1.15 更新 config.lua 默认配置

- **修改文件**: `lua/vitesse/config.lua`
- **变更**: 在 `integrations` 表中添加所有新集成的默认开关，全部默认 `true`
- **验收**: `require('vitesse.config').defaults.integrations` 包含所有新集成 key

### 1.16 更新 init.lua 集成注册

- **修改文件**: `lua/vitesse/init.lua`
- **变更**:
  1. 顶部 `require` 区域添加所有新集成模块
  2. `set_groups()` 中的 `integrations` 列表添加所有新条目
- **验收**: 所有新集成可被 `config.integrations.*` 开关控制

---

## 2. 集成代码组织混乱

**现状**: nvim-notify、render-markdown、indent-blankline、lspsaga 的高亮组内联在 editor.lua / treesitter.lua 中

**目标**: 每个插件独立一个文件，全部在 `integrations/` 目录下

### 2.1 迁移 nvim-notify 高亮

- **当前位置**: `lua/vitesse/groups/treesitter.lua` 第 106-121 行（16 组）
- **操作**:
  1. 新建 `lua/vitesse/integrations/notify.lua`
  2. 将 `NotifyBackground`、`NotifyINFOIcon`、`NotifyINFOTitle`、`NotifyINFOBody`、`NotifyWARNIcon`、`NotifyWARNTitle`、`NotifyWARNBody`、`NotifyERRORIcon`、`NotifyERRORTitle`、`NotifyERRORBody`、`NotifyDEBUGIcon`、`NotifyDEBUGTitle`、`NotifyDEBUGBody`、`NotifyTRACEIcon`、`NotifyTRACETitle`、`NotifyTRACEBody` 迁移至新文件
  3. 新文件导出 `M.highlights(c)` 函数，接收 colorscheme 参数
  4. 从 treesitter.lua 中删除对应行
- **验收**:
  - `treesitter.lua` 中不再有 `Notify` 开头的高亮组
  - `lua/vitesse/integrations/notify.lua` 文件存在且导出 `highlights` 函数
  - nvim-notify 弹窗颜色不变

### 2.2 迁移 render-markdown.nvim 高亮

- **当前位置**: `lua/vitesse/groups/treesitter.lua` 第 100-105 行（6 组）
- **操作**:
  1. 新建 `lua/vitesse/integrations/render-markdown.lua`
  2. 将 `RenderMarkdownCode`、`RenderMarkdownCodeBorder`、`RenderMarkdownCodeInfo`、`RenderMarkdownCodeFallback`、`RenderMarkdownCodeInline`、`RenderMarkdownInlineHighlight` 迁移至新文件
  3. 从 treesitter.lua 中删除对应行
- **验收**:
  - `treesitter.lua` 中不再有 `RenderMarkdown` 开头的高亮组
  - `lua/vitesse/integrations/render-markdown.lua` 文件存在
  - Markdown 渲染颜色不变

### 2.3 迁移 indent-blankline 高亮

- **当前位置**: `lua/vitesse/groups/editor.lua` 第 104-109 行（6 组）
- **操作**:
  1. 新建 `lua/vitesse/integrations/indent-blankline.lua`
  2. 将 `IndentBlanklineChar`、`IndentBlanklineContextChar`、`IndentBlanklineContextStart`、`IblIndent`、`IblWhitespace`、`IblScope` 迁移至新文件
  3. `indent_guide` 预计算变量也一并迁移
  4. 从 editor.lua 中删除对应行和变量
- **验收**:
  - `editor.lua` 中不再有 `Indent` / `Ibl` 开头的高亮组
  - `lua/vitesse/integrations/indent-blankline.lua` 文件存在
  - 缩进指引线颜色不变

### 2.4 迁移 lspsaga 高亮

- **当前位置**: `lua/vitesse/groups/editor.lua` 第 55-66 行（10 组）
- **操作**:
  1. 新建 `lua/vitesse/integrations/lspsaga.lua`
  2. 将 `SagaNormal`、`SagaBorder`、`HoverNormal`、`HoverBorder`、`ActionPreviewNormal`、`ActionPreviewBorder`、`DiagnosticNormal`、`DiagnosticBorder`、`DiagnosticShowNormal`、`DiagnosticShowBorder`、`TerminalNormal`、`TerminalBorder` 迁移至新文件
  3. 从 editor.lua 中删除对应行
- **验收**:
  - `editor.lua` 中不再有 `Saga` / `Hover` / `ActionPreview` / `Diagnostic*Normal` / `Diagnostic*Border` / `Terminal*Border` 开头的高亮组
  - `lua/vitesse/integrations/lspsaga.lua` 文件存在
  - Lspsaga UI 颜色不变

### 2.5 迁移 markdown 高亮

- **当前位置**: `lua/vitesse/groups/treesitter.lua` 第 96-99 行（4 组）
- **操作**:
  1. `markdownCode`、`markdownCodeBlock`、`markdownCodeDelimiter`、`markdownCodeInline` 保留在 treesitter.lua 中（因为它们是 Vim 内置 markdown 语法高亮，非插件集成）
  2. 或者移至 `lua/vitesse/groups/syntax.lua` 更合适
- **验收**: Markdown 代码块背景颜色不变

### 2.6 更新 init.lua 集成列表

- **修改文件**: `lua/vitesse/init.lua`
- **变更**:
  1. 添加 `notify`、`render_markdown`、`indent_blankline`、`lspsaga` 的 require
  2. 在 `integrations` 列表中添加这 4 个条目（默认 `true`）
  3. 在 `config.lua` 中添加对应的 `true` 默认值
- **验收**:
  - 用户可通过 `config.integrations.notify = false` 等关闭这些集成
  - 关闭后对应插件的高亮组不会被设置

---

## 3. 缺少编译缓存

**现状**: 每次 `:colorscheme` 都重新计算所有高亮组（~400 组，含颜色混合运算）

**目标**: 首次加载计算并缓存，后续加载直接读取缓存文件

### 3.1 实现缓存模块

- **文件**: 新建 `lua/vitesse/cache.lua`
- **功能**:
  1. `cache.get_path()` — 返回缓存文件路径：`vim.fn.stdpath('data') .. '/vitesse/cache'`
  2. `cache.get_key()` — 基于 `config.theme`、`config.transparent`、`config.dim_inactive`、`config.italics` 生成唯一 hash
  3. `cache.load(key)` — 尝试读取缓存文件，返回 `table | nil`
  4. `cache.save(key, groups)` — 将高亮表序列化写入缓存文件
  5. `cache.clear()` — 删除所有缓存文件
  6. 缓存文件格式：Lua table 序列化为 `.lua` 文件，直接 `dofile()` 加载
- **验收**:
  - `vim.fn.stdpath('data') .. '/vitesse/'` 目录下有缓存文件生成
  - 缓存文件是合法 Lua 文件

### 3.2 在 set_groups 中集成缓存

- **修改文件**: `lua/vitesse/init.lua`
- **变更**:
  1. `set_groups()` 开头调用 `cache.load(key)`
  2. 如果缓存命中，直接遍历缓存表调用 `nvim_set_hl`
  3. 如果缓存未命中，执行完整计算，然后调用 `cache.save(key, groups)`
  4. 用户 `overrides` 在缓存之后应用（确保用户自定义始终生效）
- **验收**:
  - 首次加载：`vim.uv.hrtime()` 计时正常
  - 第二次加载：加载时间 < 首次的 30%
  - 修改 `config.transparent` 后重新加载：缓存自动失效

### 3.3 添加缓存失效机制

- **修改文件**: `lua/vitesse/cache.lua`
- **失效条件**:
  1. `config.theme` 改变
  2. `config.transparent` 改变
  3. `config.dim_inactive` 改变
  4. `config.italics` 任一子项改变
  5. `config.on_colors` 回调存在时（无法序列化函数，跳过缓存）
  6. `config.overrides` 非空时（同上，跳过缓存）
  7. 插件版本更新（读取 git commit hash 或文件 mtime）
- **验收**:
  - 任一配置项改变后缓存自动失效
  - 有 `on_colors` 或 `overrides` 时不使用缓存

### 3.4 提供手动清除命令

- **修改文件**: `lua/vitesse/init.lua`
- **变更**: 注册 `:VitesseCacheClear` 命令调用 `cache.clear()`
- **验收**: 执行 `:VitesseCacheClear` 后缓存目录被清空

---

## 4. 配置深度不够

**现状**: 支持 `theme`、`transparent`、`dim_inactive`、`terminal_colors`、`italics`、`on_colors`、`overrides`、`integrations`

**目标**: 对齐 Catppuccin / TokyoNight 的配置深度

### 4.1 添加全局样式开关

- **修改文件**: `lua/vitesse/config.lua`
- **新增配置项**:
  ```lua
  no_italic = false,      -- 全局禁用斜体
  no_bold = false,        -- 全局禁用粗体
  no_underline = false,   -- 全局禁用下划线
  no_undercurl = false,   -- 全局禁用波浪下划线
  ```
- **修改文件**: `lua/vitesse/groups/syntax.lua`、`lua/vitesse/groups/treesitter.lua`、`lua/vitesse/groups/lsp.lua`
- **变更**: 所有设置 `italic`/`bold`/`underline`/`undercurl` 的地方，增加对全局开关的检查
- **验收**:
  - `setup({ no_italic = true })` 后所有斜体消失
  - `setup({ no_bold = true })` 后所有粗体消失
  - `setup({ no_underline = true })` 后所有下划线消失

### 4.2 添加 `on_highlights` 回调

- **修改文件**: `lua/vitesse/config.lua`
- **新增配置项**:
  ```lua
  on_highlights = nil,  -- function(highlights, colors) 回调
  ```
- **修改文件**: `lua/vitesse/init.lua`
- **变更**: 在 `set_groups()` 中，`overrides` 合并之后、`nvim_set_hl` 循环之前，调用 `on_highlights(groups, colorscheme)`
- **验收**:
  - `on_highlights` 回调接收当前高亮表和调色板
  - 回调中的修改覆盖默认值
  - 与 `overrides` 共存时，`on_highlights` 优先级更高

### 4.3 增强 `dim_inactive` 配置

- **修改文件**: `lua/vitesse/config.lua`
- **变更**: 将 `dim_inactive` 从 `boolean` 扩展为支持 `number`（透明度百分比）
  ```lua
  dim_inactive = false,  -- false | true | number (0.0-1.0)
  ```
- **修改文件**: `lua/vitesse/groups/editor.lua`
- **变更**: `NormalNC` 高亮组根据 `dim_inactive` 的值计算混合比例
  - `false` → `link = 'Normal'`
  - `true` → 使用默认 0.5 混合
  - `number` → 使用用户指定的混合比例
- **验收**:
  - `dim_inactive = 0.3` 比 `dim_inactive = true`（0.5）更亮
  - `dim_inactive = 0.8` 比 `dim_inactive = true` 更暗

### 4.4 添加 per-plugin 子选项

- **修改文件**: `lua/vitesse/config.lua`
- **变更**: `integrations` 表从 `boolean` 扩展为支持 `table`：
  ```lua
  integrations = {
    telescope = {
      enabled = true,      -- boolean
      style = 'borderless', -- 'borderless' | 'nvchad' | 'default'
    },
    bufferline = {
      enabled = true,
      bold = false,         -- 是否粗体
      italic = false,       -- 是否斜体
    },
    -- 其他插件同理...
  },
  ```
- **修改文件**: 对应的 `integrations/*.lua` 文件
- **变更**: 每个集成的 `highlights()` 函数根据子选项调整输出
- **验收**:
  - `integrations.telescope = true` 仍然有效（向后兼容）
  - `integrations.telescope = { style = 'borderless' }` 生效
  - `integrations.bufferline = { bold = false }` 后 bufferline 标签不加粗

### 4.5 添加 `styles` 配置项

- **修改文件**: `lua/vitesse/config.lua`
- **新增配置项**:
  ```lua
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    types = {},
    operators = {},
    properties = {},
  },
  ```
- **变更**: 替代当前 `italics` 表，提供更精细的控制。每个子项接受 Neovim 高亮属性 table（`italic`、`bold`、`undercurl` 等）
- **迁移**: 保留 `italics` 向后兼容，`styles` 优先级更高
- **验收**:
  - `styles.comments = { italic = true, bold = true }` 后注释同时斜体加粗
  - `italics` 配置仍然有效

---

## 5. 缺少外部工具 extras

**现状**: 零 extras

**目标**: 为主流终端/CLI 工具生成配色文件

### 5.1 创建 extras 生成框架

- **文件**: 新建 `lua/vitesse/extras/init.lua`
- **功能**:
  1. `extras.generate(name, template)` — 读取调色板，渲染模板，写入输出文件
  2. 输出目录: `extras/` （项目根目录下）
  3. 模板使用简单的 `${variable}` 占位符替换
- **验收**: 运行 `require('vitesse.extras').generate('test', 'template')` 生成文件

### 5.2 创建 extras CLI 入口

- **文件**: 新建 `scripts/generate-extras.lua`
- **功能**: 可被 `nvim --headless -l scripts/generate-extras.lua` 执行，批量生成所有 extras
- **验收**: 执行脚本后 `extras/` 目录下生成所有配色文件

### 5.3 实现各工具模板

以下每个工具一个模板文件和一个生成逻辑：

| 序号 | 工具 | 文件名 | 模板文件 |
|------|------|--------|----------|
| 1 | Alacritty | `alacritty.toml` | `lua/vitesse/extras/alacritty.lua` |
| 2 | Kitty | `kitty.conf` | `lua/vitesse/extras/kitty.lua` |
| 3 | WezTerm | `wezterm.toml` | `lua/vitesse/extras/wezterm.lua` |
| 4 | iTerm2 | `iterm2.itermcolors` | `lua/vitesse/extras/iterm2.lua` |
| 5 | Windows Terminal | `windows-terminal.json` | `lua/vitesse/extras/windows-terminal.lua` |
| 6 | Foot | `foot.ini` | `lua/vitesse/extras/foot.lua` |
| 7 | Ghostty | `ghostty.conf` | `lua/vitesse/extras/ghostty.lua` |
| 8 | tmux | `tmux.conf` | `lua/vitesse/extras/tmux.lua` |
| 9 | Fish | `fish.theme` | `lua/vitesse/extras/fish.lua` |
| 10 | Zsh (autosuggestions) | `zsh.zsh` | `lua/vitesse/extras/zsh.lua` |
| 11 | Starship | `starship.toml` | `lua/vitesse/extras/starship.lua` |
| 12 | fzf | `fzf.sh` | `lua/vitesse/extras/fzf.lua` |
| 13 | bat | `bat.theme` | `lua/vitesse/extras/bat.lua` |
| 14 | delta | `delta.gitconfig` | `lua/vitesse/extras/delta.lua` |
| 15 | lazygit | `lazygit.yml` | `lua/vitesse/extras/lazygit.lua` |
| 16 | Zellij | `zellij.kdl` | `lua/vitesse/extras/zellij.lua` |
| 17 | Neovide | `neovide.toml` | `lua/vitesse/extras/neovide.lua` |
| 18 | VS Code (terminal) | `vscode-terminal.json` | `lua/vitesse/extras/vscode.lua` |

每个模板需映射以下调色板 key 到工具特定格式：
- `editorBackground` → background
- `mainText` → foreground
- `syntaxError` → red / color1
- `successText` → green / color2
- `warningEmphasis` → yellow / color3
- `syntaxFunction` → color4 / blue
- `syntaxKeyword` → color5 / magenta/cyan
- `linkText` → color6 / cyan
- `mainText` → color7 / white
- `inactiveText` → color8 / bright-black
- `errorText` → color9 / bright-red
- `stringText` → color10 / bright-green
- `warningText` → color11 / bright-yellow
- `syntaxOperator` → color12 / bright-blue
- `syntaxError` → color13 / bright-magenta
- `stringText` → color14 / bright-cyan
- `commentText` → color15 / bright-white

- **验收**:
  - 每个工具的配色文件可被对应工具直接加载
  - 4 个变体（dark/dark-soft/light/light-soft）各生成独立文件
  - 所有生成文件语法正确（TOML/JSON/INI/YAML 等格式校验）

### 5.4 添加 CI 自动生成

- **文件**: `.github/workflows/extras.yml`
- **功能**: push 到 main 时自动运行生成脚本，提交更新的 extras 文件
- **验收**: PR 合并后 extras 文件自动更新

---

## 6. 缺少 CI/CD 和质量保障

### 6.1 添加 GitHub Actions CI

- **文件**: 新建 `.github/workflows/ci.yml`
- **步骤**:
  1. Checkout 代码
  2. 安装 Neovim stable + nightly
  3. 运行 `stylua --check .`
  4. 运行 selene（Lua 静态分析）
  5. 运行 headless Neovim 加载测试（`:colorscheme vitesse` 无报错）
  6. 运行 extras 生成脚本，检查无 diff
- **验收**: PR 提交时自动运行，红色/绿色状态可见

### 6.2 添加 selene 配置

- **文件**: 新建 `selene.toml`
- **内容**:
  ```toml
  std = "lua51"
  [config]
  empty_if = "allow"
  unused_variable = "warn"
  global_usage = "allow"
  ```
- **文件**: 新建 `neovim.yml`（selene Neovim 标准库定义）
- **验收**: `selene .` 无 error 级别告警

### 6.3 添加基础测试

- **文件**: 新建 `tests/theme_spec.lua`
- **测试用例**:
  1. `require('vitesse').setup({})` 不报错
  2. `require('vitesse').colorscheme()` 不报错
  3. `vim.g.colors_name == 'vitesse'` 成立
  4. `require('vitesse').get_colors()` 返回非空 table
  5. 所有 4 个变体均可切换：`setup({ theme = 'dark' })`、`setup({ theme = 'dark-soft' })`、`setup({ theme = 'light' })`、`setup({ theme = 'light-soft' })`
  6. `transparent = true` 后 Normal bg 为 `'NONE'`
  7. `dim_inactive = true` 后 NormalNC 不等于 Normal
  8. `overrides` 能覆盖任意高亮组
  9. `on_colors` 回调被调用且修改生效
  10. `terminal_colors = true` 后 `vim.g.terminal_color_0` 非 nil
- **测试框架**: 使用 Neovim 内置 `vim.test` 或 `plenary.nvim` 的 busted
- **验收**: 所有测试用例通过

### 6.4 添加 CHANGELOG

- **文件**: 新建 `CHANGELOG.md`
- **格式**: Keep a Changelog
- **内容**: 从当前版本开始记录，后续每个 PR 合并时更新
- **验收**: 文件存在且有初始条目

### 6.5 添加 Issue 模板

- **文件**: 新建 `.github/ISSUE_TEMPLATE/bug_report.md`
- **内容**: 标准 bug 报告模板（Neovim 版本、插件版本、复现步骤、截图）
- **文件**: 新建 `.github/ISSUE_TEMPLATE/feature_request.md`
- **内容**: 功能请求模板
- **验收**: GitHub 上创建 Issue 时可选择模板

### 6.6 添加 PR 模板

- **文件**: 新建 `.github/PULL_REQUEST_TEMPLATE.md`
- **内容**: 变更描述、测试步骤、截图
- **验收**: 创建 PR 时自动填充模板

---

## 7. LSP 语义 token 覆盖不完整

**现状**: `lsp.lua` 定义 21 组，覆盖 `@lsp.type.*` 和少量 `@lsp.typemod.*`

**目标**: 完整覆盖 Neovim 0.10+ 的所有 LSP 语义 token 类型和修饰符

### 7.1 补充缺失的 `@lsp.type.*` 类型

- **修改文件**: `lua/vitesse/groups/lsp.lua`
- **新增**:
  ```
  @lsp.type.event         → link @label 或独立颜色
  @lsp.type.keyword       → link @keyword
  @lsp.type.modifier      → link @keyword
  @lsp.type.comment       → link Comment
  @lsp.type.string        → link @string
  @lsp.type.number        → link @number
  @lsp.type.boolean       → link @boolean
  @lsp.type.regexp        → link @string
  @lsp.type.operator      → link @operator
  ```
- **验收**: 打开包含上述 token 类型的文件（如 TypeScript），高亮正确

### 7.2 补充 `@lsp.typemod.*` 修饰符组合

- **修改文件**: `lua/vitesse/groups/lsp.lua`
- **新增**:
  ```
  @lsp.typemod.variable.readonly    → 可调整为更暗的颜色或 link @constant
  @lsp.typemod.variable.global      → 可调整
  @lsp.typemod.property.readonly    → 可调整
  @lsp.typemod.parameter.readonly   → 可调整
  @lsp.typemod.function.defaultLibrary → link @function.builtin
  @lsp.typemod.variable.defaultLibrary → link @variable.builtin
  @lsp.typemod.type.defaultLibrary  → link @type.builtin
  @lsp.typemod.method.declaration   → link @function
  @lsp.typemod.property.declaration → link @property
  @lsp.typemod.variable.declaration → 可调整
  @lsp.typemod.parameter.declaration → 可调整
  ```
- **验收**: 使用 Rust Analyzer 等语言服务器时，readonly 变量、builtin 函数等颜色有区分

### 7.3 补充 `@lsp.mod.*` 修饰符

- **修改文件**: `lua/vitesse/groups/lsp.lua`
- **新增**:
  ```
  @lsp.mod.deprecated     → strikethrough = true
  @lsp.mod.readonly       → 可调整颜色
  @lsp.mod.defaultLibrary → 可调整颜色
  ```
- **验收**: `@deprecated` 标注的符号有删除线

### 7.4 添加 `LspInfo` 高亮

- **修改文件**: `lua/vitesse/groups/lsp.lua`
- **新增**:
  ```
  LspInfoTip       → 注释色
  LspInfoList      → 列表文字
  LspInfoFiletype  → 文件类型
  LspInfoBorder    → 边框色
  ```
- **验收**: `:LspInfo` 窗口颜色正确

---

## 8. 代码质量问题

### 8.1 减少 palette 重复

- **当前问题**: `dark` 和 `dark-soft` 有 27 个 key 完全相同（仅 5 个背景/边框 key 不同）；`light` 和 `light-soft` 同理
- **修改文件**: `lua/vitesse/colorscheme.lua`
- **变更**:
  1. 提取共享基础色表 `dark_base` 和 `light_base`
  2. `dark` = `vim.tbl_extend('force', dark_base, { backgrounds... })`
  3. `dark-soft` = `vim.tbl_extend('force', dark_base, { soft_backgrounds... })`
  4. `light` 和 `light-soft` 同理
- **验收**:
  - 4 个变体的颜色值与修改前完全一致（diff 验证）
  - 代码行数减少

### 8.2 暴露 `hex_to_rgb` 函数

- **当前问题**: `hex_to_rgb` 是 `utils.lua` 中的 local 函数，用户在 `on_colors` 回调中无法使用
- **修改文件**: `lua/vitesse/utils.lua`
- **变更**: 将 `hex_to_rgb` 从 local 改为 `M.hex_to_rgb`
- **验收**: `require('vitesse.utils').hex_to_rgb('#ff0000')` 返回 `{255, 0, 0}`

### 8.3 添加更多颜色工具函数

- **修改文件**: `lua/vitesse/utils.lua`
- **新增函数**:
  1. `M.saturate(color, amount)` — 增加饱和度
  2. `M.desaturate(color, amount)` — 降低饱和度
  3. `M.adjust_hue(color, degrees)` — 色相偏移
  4. `M.hsl_to_hex(h, s, l)` — HSL 转 HEX
  5. `M.hex_to_hsl(hex)` — HEX 转 HSL
  6. `M.rgba_to_hex(r, g, b, a)` — RGBA 转 HEX（支持透明度）
- **验收**:
  - `M.saturate('#808080', 0.5)` 返回比灰色更饱和的颜色
  - `M.desaturate('#ff0000', 0.5)` 返回比纯红更灰的颜色
  - `M.adjust_hue('#ff0000', 120)` 返回绿色系颜色
  - 所有函数有输入校验

### 8.4 扩展 treesitter 查询语言

- **当前**: 仅 JavaScript、TypeScript、Elixir 3 种语言
- **新增文件**:
  1. `after/queries/python/highlights.scm` — Python 特定捕获
  2. `after/queries/rust/highlights.scm` — Rust 特定捕获
  3. `after/queries/go/highlights.scm` — Go 特定捕获
  4. `after/queries/lua/highlights.scm` — Lua 特定捕获
  5. `after/queries/c/highlights.scm` — C 特定捕获
  6. `after/queries/cpp/highlights.scm` — C++ 特定捕获
  7. `after/queries/java/highlights.scm` — Java 特定捕获
  8. `after/queries/ruby/highlights.scm` — Ruby 特定捕获
  9. `after/queries/php/highlights.scm` — PHP 特定捕获
  10. `after/queries/swift/highlights.scm` — Swift 特定捕获
  11. `after/queries/kotlin/highlights.scm` — Kotlin 特定捕获
  12. `after/queries/zig/highlights.scm` — Zig 特定捕获
- **验收**: 打开各语言文件，`@punctuation.separator.keyvalue` 等自定义捕获生效

---

## 9. 文档问题

### 9.1 合并文档文件

- **当前**: `README.md`、`THEME_README.md`、`DEVELOPMENT_GUIDE.md`、`doc/vitesse.txt`、`CLAUDE.md` 五份文档
- **目标**:
  1. `README.md` — 完整用户文档（安装、配置、调色板、集成列表、截图）
  2. `doc/vitesse.txt` — Vimdoc 帮助文件（与 README 内容对应）
  3. `CLAUDE.md` — 保留（开发者/CI 指导）
  4. 删除 `THEME_README.md`（内容合并到 README）
  5. 删除 `DEVELOPMENT_GUIDE.md`（内容合并到 README 的 Contributing 部分）
  6. 删除空的 `docs/` 目录
- **验收**:
  - 项目根目录下无 `THEME_README.md` 和 `DEVELOPMENT_GUIDE.md`
  - `docs/` 目录不存在
  - `README.md` 包含：项目简介、截图、安装（lazy.nvim/packer）、配置表、调色板（30 key 说明）、集成列表、Terminal 颜色设置、API、Contributing、License
  - `doc/vitesse.txt` 与 README 内容同步

### 9.2 完善 README 内容

- **修改文件**: `README.md`
- **必须包含的章节**:
  1. **Features** — 4 变体、242+ 高亮组、30+ 插件集成、terminal 颜色、lualine 主题
  2. **Requirements** — Neovim 0.8+
  3. **Installation** — lazy.nvim（推荐）、packer、手动
  4. **Configuration** — 完整配置表（所有 key、类型、默认值、说明）
  5. **Palette** — 30 个语义 key 的含义说明表
  6. **Integrations** — 内置 vs 可开关的插件列表
  7. **Extras** — 外部工具配色文件列表和使用方法
  8. **API** — `setup()`、`colorscheme()`、`get_colors()` 说明
  9. **Screenshots** — dark / light 变体截图
  10. **Contributing** — 开发环境搭建、代码风格、提交规范
  11. **License** — MIT
- **验收**: 新用户仅阅读 README 即可完成安装、配置、使用

### 9.3 更新 vimdoc 帮助文件

- **修改文件**: `doc/vitesse.txt`
- **变更**: 与 README 同步，确保 `:help vitesse` 内容完整
- **验收**: Neovim 中 `:help vitesse` 可查看完整文档

### 9.4 清理 `docs/` 目录

- **操作**: 删除空的 `docs/` 目录
- **验收**: `docs/` 目录不存在

---

## 10. 缺少 colorscheme 清理逻辑

### 10.1 正确处理 `vim.g.colors_name`

- **当前代码**: `lua/vitesse/init.lua` 第 120 行 `vim.g.colors_name = 'vitesse'`
- **问题**: 没有检查旧的 colorscheme 名称，也没有触发正确的事件
- **修改文件**: `lua/vitesse/init.lua`
- **变更**:
  1. 在 `vim.api.nvim_command('hi clear')` 之前，检查并保存旧的 `vim.g.colors_name`
  2. 触发 `ColorSchemePre` 事件
  3. 设置 `vim.g.colors_name = 'vitesse'`
  4. 在所有高亮设置完成后，触发 `ColorScheme` 事件
- **验收**:
  - 切换 colorscheme 时 `ColorSchemePre` 和 `ColorScheme` 事件正确触发
  - `autocmd ColorScheme` 中的回调被正确调用

### 10.2 版本检查增强

- **当前代码**: `lua/vitesse/init.lua` 第 104 行 `vim.version().minor < 8`
- **问题**: 只检查 minor 版本，不检查 major；且错误处理不够优雅
- **修改文件**: `lua/vitesse/init.lua`
- **变更**:
  ```lua
  local v = vim.version()
  if v.major == 0 and v.minor < 8 then
    vim.notify(...)
    return false
  end
  ```
- **验收**: Neovim 0.7 及以下加载时返回 `false` 并显示通知

### 10.3 `set_groups` 返回状态

- **修改文件**: `lua/vitesse/init.lua`
- **变更**: `set_groups()` 返回 `true` 表示成功，`colorscheme()` 也返回状态
- **验收**: `local ok = require('vitesse').colorscheme()` 可检查成功/失败

---

## 执行顺序建议

按优先级和依赖关系排序：

| 阶段 | 内容 | 预计工作量 |
|------|------|------------|
| P0 | 2. 集成代码组织混乱 | 小（纯重构） |
| P0 | 8.1 减少 palette 重复 | 小 |
| P0 | 9. 文档问题 | 小 |
| P1 | 8.2-8.4 代码质量改进 | 中 |
| P1 | 7. LSP 语义 token 补充 | 中 |
| P1 | 4.1-4.3 配置增强 | 中 |
| P1 | 10. colorscheme 清理逻辑 | 小 |
| P2 | 1.1-1.16 插件集成扩充 | 大（逐步添加） |
| P2 | 6. CI/CD 和质量保障 | 中 |
| P3 | 3. 编译缓存 | 中 |
| P3 | 4.4-4.5 高级配置 | 中 |
| P3 | 5. 外部工具 extras | 大 |
