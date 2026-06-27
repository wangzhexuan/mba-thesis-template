# Changelog

All notable changes to this template will be documented in this file.

## [1.2.0] - 2026-06-26

> 对外发布准备：脱敏、清理、修复与跨工具支持。

### Security（隐私脱敏）
- 移除全部真实身份信息：`templates/case-study-example.md` 及 `init.html` 内嵌副本中的真实姓名、学号、导师姓名，统一改为示例占位（张三 / 李四 / 某高校）。
- 删除 `reviews/` 下 9 份针对真实论文的审稿报告（含敏感评价），改为 `reviews/README.md` 用途说明 + 复用 `templates/review-report-template.md`。
- 案例域去标识化：移除原本遍布各文档、与某真实论文绑定的具体案例内容（章节标题、示例 Prompt、引用/文献范例、责任主体范例等，含 `init.html` 内嵌副本），统一改为中性表述（如"X公司某业务""你的研究主题"）。STP/4C/4P 等通用分析工具作为可选项保留。

### Fixed
- `config/defense-config.yaml`：补回第 5 周缺失的 `tasks:` 键（原会被静默解析为空，丢失该周任务）。
- `init.sh`：章节草稿命名修正为 `chapter2-literature` / `chapter3-analysis` / `chapter4-strategy` / `chapter5-conclusion`（原对全部 5 章硬编码 `-introduction`，与 AGENTS.md 约定不符）；并修复 `[ -f "...chapter*.md" ]` 通配判断失效问题，确保幂等。
- `skills/skills-guide.md`：修正重复编号（两个"17"），skill 列表统一为 1–20，清理多余分隔线。

### Changed
- `docs/wechat-article.md`：顶部标注为「公众号投稿版」（正式介绍以《推介》为准）；Skill 数口径由 19 更正为 20。
- `AGENTS.md`：在「多工具支持」中补充 Codex / 通用 AI 的使用要点。
- `README.md`：新增「多工具使用」指引指针；更新日志增补。

### Added
- `AGENTS.md`：新增「多工具支持（Claude Code / Codex / 其他 AI）」一节，作为 Codex 等工具的跨工具使用入口。
- `reviews/README.md`：审稿目录用途说明。

### Removed
- 清理随包垃圾文件：第三方 skill 内嵌的 `.git/`、`.DS_Store`、`templates/__pycache__`。

## [1.1.0] - 2026-05-20

### Added
- `templates/case-study-template.md`：案例研究型通用模板（含占位符和策略检查清单）
- `templates/survey-example.md`：问卷调查型论文模板（含假设检验、信效度标准、SEM流程）
- `templates/review-report-template.md`：审稿报告空白模板（8维度评分+P0/P1/P2+逻辑链检查）
- `requirements.txt`：build_thesis.py 的 Python 依赖声明
- `CHANGELOG.md`：版本记录
- `sources/README.md`、`drafts/README.md`、`output/README.md`：目录使用说明
- 每个 workflow 文件新增 `💬 Prompt` 示例（共75个），嵌入每一步
- 每个 workflow 文件新增 `💡 使用方式` 说明（prompt驱动，无需手动调用skill）
- 02-framework.md 新增问卷调查型框架设计路径
- 03-data-collection.md 新增问卷调查型专项指导（假设→变量→量表映射）
- 04-writing.md 新增问卷调查型章节结构差异

### Changed
- `AGENTS.md`：重写为项目级指令，去除与CLAUDE.md重叠内容，新增研究类型支持说明
- `CLAUDE.md`：重写为行为级规范，统一Skills引用，新增安全边界和研究类型适配
- `skills/skills-guide.md`：完全重写 — 以prompt为中心，按工作阶段组织，移除所有`/skill`命令示例
- `skills/skills-quickref.md`：完全重写 — 按7个Phase组织，每项用"你想做什么→怎么说"格式
- 所有 `workflows/*.md`：移除 `## Skills调用` 表格和 `## Prompt 示例` 独立板块，改为每步嵌入 `💬 Prompt`
- `templates/case-study-example.md`：保留为参考案例，新增通用模板链接说明
- `README.md`：新增文档模板表格、更新日志引用

### Fixed
- Skills引用不一致问题：CLAUDE.md 原引用 nature-polishing/nature-writing 等不在可用列表中的Skills
- 用户体验问题：原来需要记住`/skill`命令，现在只需用自然语言描述需求

## [1.0.0] - 2026-05-14

### Added
- 初始版本发布
- 7阶段工作流（00-setup → 06-defense）
- 4个配置文件（thesis-config/school-format/research-framework/defense-config）
- init.sh + init.html 初始化工具
- Skills使用指南和速查表
- 文档模板（问卷、访谈提纲、文献综述、答辩PPT、大纲）
- build_thesis.py Word文档生成脚本
- 审稿报告模板与评分结构（见 templates/review-report-template.md）
