# MBA论文撰写AI辅助工具

## 项目简介

这是一个专为MBA/DBA管理类学位论文设计的AI辅助写作项目模板。当前版本以应用型MBA案例研究为默认口径，强调用成熟管理理论解决真实组织或业务问题，而不是追求期刊论文式的理论创新。

## 重要：模板使用方式

**一般使用时模板目录建议保持只读；如需沉淀新的项目工作流，可以先修改模板，再复制到具体论文项目。**

```
正确做法：
1. 复制模板到新目录：cp -r mba-thesis-template 我的MBA论文
2. 在新目录中填写配置和写作
3. 每篇论文一个独立目录

错误做法：
❌ 直接在 mba-thesis-template/ 中写作
❌ 在没有版本记录的情况下随意修改模板文件
```

---

## 快速开始

### 1. 创建新项目

```bash
# 方式一：手动复制
cp -r mba-thesis-template 我的MBA论文
cd 我的MBA论文

# 方式二：使用Web界面（推荐）
open mba-thesis-template/init.html
# 填写信息后，下载配置文件到新项目目录
```

### 2. 填写配置

```bash
# 进入新项目目录
cd 我的MBA论文

# 运行初始化脚本
./init.sh
```

### 3. 按工作流推进

```
Phase 0: 项目初始化 → workflows/00-setup.md
Phase 1: 文献检索   → workflows/01-literature.md
Phase 2: 框架设计   → workflows/02-framework.md
Phase 3: 数据收集   → workflows/03-data-collection.md
Phase 4: 内容生成   → workflows/04-writing.md
Phase 5: 质量审校   → workflows/05-review.md
Phase 6: 答辩准备   → workflows/06-defense.md
```

---

## 目录结构

```
paper-co_trae/
├── mba-thesis-template/     # 模板目录（只读）
│   ├── README.md            # 本文件
│   ├── init.html            # Web界面
│   ├── init.sh              # 命令行向导
│   ├── QUICKSTART.md        # 快速启动指南
│   ├── AGENTS.md            # Claude Code指令
│   ├── CLAUDE.md            # 行为准则指南
│   ├── config/              # 配置文件模板
│   ├── workflows/           # 工作流文档
│   ├── skills/              # Skills工具包
│   ├── templates/           # 文档模板
│   └── sources/             # 文献资料目录
│
├── 论文项目A/               # 从模板复制的项目
│   ├── config/              # 项目A的配置
│   ├── drafts/              # 项目A的草稿
│   └── output/              # 项目A的输出
│
└── 论文项目B/               # 另一个项目
    └── ...
```

---

## 配置文件说明

### thesis-config.yaml

论文核心配置，包含：
- 论文元数据（题目、作者、学校等）
- 研究问题
- 关键词
- 研究方法
- 研究对象
- 论文结构
- 写作进度

### school-format.yaml

学校格式规范，包含：
- 字体格式
- 字号设置
- 页面边距
- 字数要求
- 查重要求
- 参考文献格式

### research-framework.yaml

研究框架配置，包含：
- 理论框架
- 分析工具（PEST、SWOT、STP、4C等；波特五力仅在行业结构分析确有必要时启用）
- 研究框架图设计
- 数据分析方法

### defense-config.yaml

答辩准备配置，包含：
- PPT结构设计
- 答辩时间线
- Q&A问题准备
- 答辩技巧

---

## Skills工具包

详见 `skills/skills-guide.md` 和 `skills/skills-quickref.md`。

> **在 Claude Code / Codex / 其他 AI 工具里如何使用？** 见 `AGENTS.md` 的「多工具支持」一节，完整版见随附《MBA论文撰写AI辅助工具·操作指南》第七部分。

### 核心Skills（高频使用）

| Skill | 用途 |
|-------|------|
| `markitdown` | 格式转换 |
| `pdf` | PDF读取 |
| `docx` | 生成Word |
| `peer-review` | 可借用评审结构，需按MBA应用型论文口径调整 |
| `quality-editor` | 质量编辑 |
| `scientific-critical-thinking` | 批判性思维 |
| `awesome-ai-research-writing` | 学术写作、中英互译 |
| `humanizer` | 去AI化 |
| `humanizer-zh-academic` | 中文降重 |

### 辅助Skills（按需使用）

| Skill | 用途 |
|-------|------|
| `paper-lookup` | 文献检索 |
| `research-lookup` | 研究扩展 |
| `citation-management` | 引用管理 |
| `literature-review` | 文献综述 |
| `scientific-writing` | 学术写作 |
| `scientific-schematics` | 框架图 |
| `academic-plotting` | 统计图表 |
| `pptx` | PPT制作 |
| `dissertation-defense` | 答辩准备 |

---

## 文档模板

| 模板 | 用途 | 路径 |
|------|------|------|
| 案例研究型模板 | 通用案例研究结构+策略检查清单 | `templates/case-study-template.md` |
| 问卷调查型模板 | 假设检验+信效度+SEM流程 | `templates/survey-example.md` |
| 审稿报告模板 | 8维度评分+P0/P1/P2+逻辑链检查 | `templates/review-report-template.md` |
| 参考案例 | J制造公司供应链绩效管理（真实论文） | `templates/case-study-example.md` |
| 问卷模板 | 问卷结构+量表设计 | `templates/questionnaire.md` |
| 访谈提纲模板 | 半结构化访谈设计 | `templates/interview-guide.md` |
| 文献综述模板 | 综述结构+引用格式 | `templates/literature-review.md` |
| 答辩PPT模板 | 20页PPT结构+设计原则 | `templates/defense-ppt.md` |

---

## 使用建议

### 1. 模板只读，项目独立

- 模板目录不要修改
- 每篇论文复制到独立目录
- 多篇论文可以同时进行

### 2. 先初始化，后写作

运行 `./init.sh` 完成基础配置，再按工作流推进。

### 3. 先案例诊断框架，后内容

先完成“现状—问题—成因—方案—保障”的案例诊断框架，再填充具体内容。

### 4. 先初稿，后润色

先完成初稿，再使用Skills进行润色和降重。

### 5. 定期保存

使用 `/checkpoint` 保存进度，避免丢失。

---

## 常见问题

### Q: 模板和项目的关系？

A: 模板是只读的，每次新论文复制一份到独立目录。

### Q: 如何同时写多篇论文？

A: 每篇论文一个独立目录，互不影响。

### Q: 模板更新了怎么办？

A: 新项目用新模板，旧项目继续用旧版本。

### Q: 如何使用Skills？

A: 参考 `skills/skills-guide.md` 和 `skills/skills-quickref.md`。

### Q: 如何生成Word文档？

A: 使用 `/docx` Skills或运行 `python templates/build_thesis.py`。

### Q: 如何降低查重率？

A: 使用 `/humanizer-zh-academic` Skills进行中文降重。

---

## 适用范围

- MBA学位论文
- EMBA学位论文
- DBA学位论文
- 其他管理类学位论文

---

## 更新日志

详见 [CHANGELOG.md](./CHANGELOG.md)

- **2026-06-26**：v1.2.0 — 对外发布准备（移除真实身份信息、删除项目专属审稿报告、清理垃圾文件、修复 defense-config/init.sh/skills编号、新增多工具支持说明、Skill数统一为20）
- **2026-05-20**：v1.1.0 — 通用化增强（新增Survey模板、审稿报告模板、Prompt示例、Skills统一）
- **2026-05-14**：v1.0.0 — 初始版本发布

---

## 许可证

本项目采用 **CC BY-NC 4.0（署名—非商业性使用）** 授权；完整条款见仓库根目录的 `LICENSE` 与 `DISCLAIMER.md`。
