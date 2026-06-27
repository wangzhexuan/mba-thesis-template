# Skills 速查表

> **本文档是Skill技术参数速查。用户不需要手动调用——用自然语言描述需求，AI自动选择Skill。**
> 如需了解Skill的详细说明，见 `skills-guide.md`。
> 如需了解在每一步怎么写Prompt，见 `workflows/*.md`。

---

## 按 Phase 速查：哪一步会调用哪个 Skill

### Phase 0: 项目初始化

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 转换已有资料 | `markitdown` | 用户提供PDF/DOCX文件 |
| 读取开题报告 | `pdf` | 用户提供PDF文件 |

---

### Phase 1: 文献检索与管理

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 制定检索策略 | `research-lookup` | 用户要求扩展关键词、查背景 |
| 执行文献检索 | `paper-lookup` | 用户要求检索文献 |
| 文献追溯 | `paper-lookup` | 用户要求查引用关系 |
| 阅读PDF | `pdf` / `markitdown` | 用户提供PDF文件 |
| 文献筛选 | （AI直接处理） | 用户提供文献列表 |
| 精读笔记 | `pdf` | 用户提供PDF |
| 撰写综述 | `literature-review` | 用户要求写综述 |
| 引用格式化 | `citation-management` | 用户要求格式化参考文献 |

---

### Phase 2: 框架设计

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 理论框架选择 | （AI直接分析） | 用户描述研究方向 |
| 绘制框架图 | `scientific-schematics` | 用户要求画框架图/流程图 |
| 绘制技术路线 | `scientific-schematics` | 用户要求画技术路线图 |
| 撰写第1章 | `scientific-writing` | 用户要求写学术正文 |
| 润色第1章 | `awesome-ai-research-writing` | 用户要求润色/翻译 |

---

### Phase 3: 数据收集

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 设计问卷 | （AI直接生成） | 用户描述问卷需求 |
| 设计访谈提纲 | （AI直接生成） | 用户描述访谈需求 |
| 处理问卷数据 | `xlsx` | 用户提供Excel数据 |
| 生成统计图表 | `academic-plotting` | 用户要求生成图表 |
| 撰写研究方法 | `scientific-writing` | 用户要求写方法部分 |

---

### Phase 4: 内容生成

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 摘要翻译 | `awesome-ai-research-writing` | 用户要求中英互译 |
| 撰写各章节 | `scientific-writing` | 用户要求写学术正文 |
| 段落润色 | `awesome-ai-research-writing` | 用户要求润色 |
| 生成图表 | `academic-plotting` | 用户要求数据图表 |
| 生成框架图 | `scientific-schematics` | 用户要求画框架图 |
| 格式化引用 | `citation-management` | 用户要求统一引用格式 |
| 生成Word | `docx` | 用户要求生成论文文档 |

---

### Phase 5: 质量审校

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 综合审校 | `peer-review` | 用户要求评审论文 |
| 术语检查 | `quality-editor` | 用户要求检查术语一致性 |
| 引用检查 | `quality-editor` | 用户要求检查引用完整性 |
| 逻辑检查 | `scientific-critical-thinking` | 用户要求检查论证逻辑 |
| 格式检查 | `quality-editor` + `docx` | 用户要求检查格式 |
| 表达优化 | `quality-editor` + `humanizer` | 用户要求润色表达 |
| 降AI率（AIGC检测） | `humanizer-zh-academic` | 用户要求降低AI率、去AI味 |
| 中文去AI化 | `humanizer-zh` | 用户要求语言自然化（中文通用） |
| 英文去AI化 | `humanizer` | 用户要求语言自然化（英文） |
| 降重（查重率） | Prompt技巧（换词换句式） | 用户要求降低查重率 |

---

### Phase 6: 答辩准备

| 步骤 | Skill | 触发条件 |
|------|-------|---------|
| 制作PPT | `pptx` | 用户要求生成答辩PPT |
| 演讲稿润色 | `awesome-ai-research-writing` | 用户要求润色演讲稿 |
| Q&A题库 | `dissertation-defense` | 用户要求生成答辩问题 |
| 模拟答辩 | `dissertation-defense` | 用户要求模拟Q&A练习 |

---

## 参数速查

### paper-lookup

```
/paper-lookup "关键词"           # 关键词检索
/paper-lookup --doi "DOI"        # DOI检索
/paper-lookup --title "标题"     # 标题检索
/paper-lookup --author "作者"    # 作者检索
```

### scientific-writing

```
/scientific-writing --topic "主题"   # 指定主题
/scientific-writing --improve "内容" # 改进现有内容
/scientific-writing --outline        # 生成大纲
```

### awesome-ai-research-writing

```
/awesome-ai-research-writing "内容"           # 润色
/awesome-ai-research-writing --translate "内容" # 翻译
/awesome-ai-research-writing --shorten "内容"  # 缩短
/awesome-ai-research-writing --expand "内容"   # 扩展
```

### academic-plotting

```
/academic-plotting --data "data.csv"           # 自动选择图表
/academic-plotting --data "data.csv" --type bar    # 柱状图
/academic-plotting --data "data.csv" --type line   # 折线图
/academic-plotting --data "data.csv" --type pie    # 饼图
/academic-plotting --data "data.csv" --type scatter # 散点图
```

### citation-management

```
/citation-management --doi "DOI"              # 获取引用
/citation-management --format "GB/T 7714"     # 格式化
/citation-management --bib "references.bib"   # 管理BibTeX
```

### scientific-schematics

```
/scientific-schematics                    # 默认框架图
/scientific-schematics --type flowchart   # 流程图
/scientific-schematics --type concept     # 概念图
```

### peer-review

```
/peer-review                  # 全文评审
/peer-review --chapter 3      # 评审特定章节
```

### quality-editor

```
/quality-editor                    # 全面检查
/quality-editor --check terminology # 只检查术语
```

### humanizer

```
/humanizer "内容"                    # 处理文本
/humanizer --file "path/to/file.md"  # 处理文件
```

### humanizer-zh-academic（降AI率）

```
/humanizer-zh-academic "内容"                    # 降AI率（先出报告再改写）
/humanizer-zh-academic --file "path/to/file.md"  # 处理文件
```

**效果**：AIGC检测率从 >50% 降至 ~11%

### humanizer-zh（中文通用去AI化）

```
/humanizer-zh "内容"
/humanizer-zh --file "path/to/file.md"
```

**24种AI模式识别**，适合非学术中文文本

---

## 输出文件位置

| Skill | 输出路径 |
|-------|---------|
| `peer-review` | `reviews/peer-review-report.md` |
| `quality-editor` | `reviews/quality-editor-report.md` |
| `scientific-critical-thinking` | `reviews/critical-thinking-report.md` |
| `docx` | `output/thesis.docx` |
| `pptx` | `output/defense.pptx` |
| `citation-management` | `output/references.bib` |
| `academic-plotting` | `output/figures/` |
| `scientific-schematics` | `output/figures/` |

---

## 调用原则

1. **先读后写** — 先读取内容（pdf/markitdown），再处理
2. **先框架后细节** — 先生成框架，再填充内容
3. **先初稿后润色** — 先完成初稿，再优化
4. **输出需保存** — Skill输出不自动保存，需指定路径
5. **人工审核** — AI生成内容需人工确认
