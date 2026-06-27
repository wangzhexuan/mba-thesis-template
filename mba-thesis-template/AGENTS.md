# AGENTS.md - MBA论文写作项目指令

## 项目概述

MBA毕业论文AI辅助写作模板。默认口径：应用型案例研究（用成熟管理理论解决真实管理问题，非期刊式理论创新）。

## 角色分工

- **用户**：论文写作者，负责所有最终决策
- **AI**：写作助手，负责辅助检索、写作、审校、图表、答辩

## 工作原则

1. **用户主导**：AI提建议，用户做决定
2. **学术诚信**：引用必须真实可追溯，不得编造文献或数据
3. **质量优先**：逻辑清晰 > 文字华丽；学术规范 > 个人风格
4. **渐进优化**：先完成初稿，再逐步打磨

## 目录结构

```
项目根目录/
├── AGENTS.md            # 本文件 — 项目级指令
├── CLAUDE.md            # 行为级规范（AI角色、沟通、安全）
├── config/              # 配置文件（YAML）
│   ├── thesis-config.yaml
│   ├── school-format.yaml
│   ├── research-framework.yaml
│   └── defense-config.yaml
├── workflows/           # 7阶段工作流
├── skills/              # Skills使用指南
├── templates/           # 文档模板
├── sources/             # 文献PDF（Classic/KeyTexts/Supporting）
├── drafts/              # 章节草稿
├── reviews/             # 审稿报告
└── output/              # 最终输出（Word/PPT/PDF）
```

## 工作流

| 阶段 | 文件 | 核心任务 |
|------|------|---------|
| Phase 0 | `workflows/00-setup.md` | 项目初始化、配置确认 |
| Phase 1 | `workflows/01-literature.md` | 文献检索、分类、综述撰写 |
| Phase 2 | `workflows/02-framework.md` | 理论框架、分析框架、技术路线 |
| Phase 3 | `workflows/03-data-collection.md` | 问卷/访谈设计、数据收集与清洗 |
| Phase 4 | `workflows/04-writing.md` | 全章节撰写、图表、参考文献 |
| Phase 5 | `workflows/05-review.md` | MBA应用型论文质量审校 |
| Phase 6 | `workflows/06-defense.md` | 答辩PPT、演讲、Q&A准备 |

按顺序推进，完成检查点后进入下一阶段。

## Skills使用

> **你不需要手动输入 `/skill` 命令。用自然语言告诉AI要做什么，AI会自动调用合适的Skill。**

详见 `skills/skills-guide.md`（完整能力说明）和 `skills/skills-quickref.md`（按阶段速查）。

使用原则：
1. 用自然语言描述需求，AI自动选择Skill
2. 提供足够上下文（题目、对象、阶段、数据）
3. 需要保存时说"保存到{路径}"
4. AI生成内容需人工审核

## 多工具支持（Claude Code / Codex / 其他 AI）

本工具可跨 AI 工具使用，核心资产（7 阶段工作流、Prompt、模板、配置）工具无关：
- **Claude Code**（原生最省事）：自动读取本文件与 `CLAUDE.md`，用自然语言即可自动调用 skill。
- **Codex**：原生读取本 `AGENTS.md`。注意 Codex 不会自动解析"按名字引用"的 skill——纯指令型 skill 需手动把对应 `SKILL.md` 喂给它；工具型 skill（查文献 / 读 PDF / 出图 / 出 Word）改为人工或脚本完成（出 Word 可直接用 `templates/build_thesis.py`）。
- **通用对话 AI**：直接复制 `workflows/*.md` 里的 Prompt 使用。

完整逐工具步骤与能力对照表见随附《MBA论文撰写AI辅助工具·操作指南》的「第七部分」。

## 文件命名

```
drafts/
├── chapter1-introduction.md
├── chapter2-literature.md
├── chapter3-analysis.md
├── chapter4-strategy.md
└── chapter5-conclusion.md

output/
├── thesis.docx
├── defense.pptx
├── references.bib
└── figures/

reviews/
├── mba-applied-review-report.md
├── peer-review-report.md
└── quality-editor-report.md
```

## 研究类型支持

本工具支持以下MBA论文类型，通过 `config/thesis-config.yaml` 的 `methodology.type` 配置：

| 类型 | 适用场景 | 核心数据 |
|------|---------|---------|
| `case_study` | 深入分析单一/多个企业案例 | 访谈+文档+观察 |
| `survey` | 大样本量化研究 | 问卷+统计分析 |
| `action_research` | 解决实际管理问题 | 实践记录+反思 |
| `mixed` | 多角度验证 | 多种方法组合 |

默认以案例研究为主路径，问卷调查型的差异点在各工作流中以 `> 📊 问卷调查型` 标注。
