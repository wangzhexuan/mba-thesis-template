# Skills 使用指南

## 概述

本文档是AI内部调用的Skills技术参考。**用户不需要手动调用这些Skill**——只需在对应的工作流步骤中用自然语言描述需求，AI会自动选择并调用合适的Skill。

> **用户视角**：看 `workflows/*.md`，按步骤写Prompt即可。
> **本文档用途**：了解AI有哪些能力、每个Skill做什么、在哪个步骤会被调用。

---

## Skill 调用逻辑

AI根据用户的自然语言描述，自动匹配Skill：

```
用户说："帮我检索关于你的研究主题的文献"
  ↓ AI识别意图
  ↓ 匹配 Skill: paper-lookup + research-lookup
  ↓ 执行并返回结果
```

**触发规则**：AI根据语义匹配，而非关键词。你不需要使用特定格式。

---

## 核心 Skills 清单

### 1. markitdown — 格式转换

**能力**：将各种格式文件转换为Markdown

| 输入格式 | 说明 |
|---------|------|
| PDF | 文献、开题报告 |
| DOCX | 已有文档 |
| PPTX | 演示文稿 |
| XLSX | 数据表格 |
| 图片 | OCR识别 |
| HTML/CSV/JSON | 结构化数据 |

**自动触发场景**：
- Phase 0：转换已有开题报告
- Phase 1：转换下载的PDF文献

**内部参数**：
```
/markitdown "文件路径"
```

---

### 2. pdf — PDF读取

**能力**：直接读取PDF文件内容，提取文字、表格、元数据

**自动触发场景**：
- Phase 1：精读文献PDF、提取摘要和数据

**内部参数**：
```
/pdf "文件路径"
/pdf "文件路径" --pages 1-5        # 指定页码
```

---

### 3. paper-lookup — 文献检索

**能力**：检索10个学术数据库（PubMed、PMC、arXiv、bioRxiv、medRxiv、OpenAlex、Crossref、Semantic Scholar、CORE、Unpaywall）

**自动触发场景**：
- Phase 1 Step 1-2：按关键词、DOI、标题、作者检索文献

**内部参数**：
```
/paper-lookup "关键词"              # 关键词检索
/paper-lookup --doi "10.xxx"       # DOI检索
/paper-lookup --title "论文标题"    # 标题检索
/paper-lookup --author "作者名"     # 作者检索
```

---

### 4. research-lookup — 研究扩展

**能力**：扩展研究信息，获取背景资料、最新进展、综述性内容

**自动触发场景**：
- Phase 1 Step 1：扩展检索关键词
- Phase 1 Step 2：补充背景信息

**内部参数**：
```
/research-lookup "研究主题"
/research-lookup --recent "研究主题"   # 最新进展
```

---

### 5. citation-management — 引用管理

**能力**：管理参考文献，生成BibTeX条目，格式化引用，验证引用信息

**自动触发场景**：
- Phase 1 Step 3：格式化引用列表
- Phase 4 Step 4：统一参考文献格式

**支持格式**：GB/T 7714-2015、APA、IEEE、Chicago等

**内部参数**：
```
/citation-management --doi "10.xxx"           # DOI转BibTeX
/citation-management --format "GB/T 7714"     # 格式化
/citation-management --bib "references.bib"   # 管理BibTeX
```

---

### 6. literature-review — 文献综述

**能力**：辅助撰写文献综述，生成综述框架，基于文献列表生成综述文本

**自动触发场景**：
- Phase 1 Step 5：撰写文献综述

**内部参数**：
```
/literature-review
/literature-review --sources "文献列表"
```

---

### 7. scientific-writing — 学术写作

**能力**：辅助撰写学术正文段落，包括段落写作、论证构建、语言优化、逻辑梳理

**自动触发场景**：
- Phase 2 Step 5：撰写第1章
- Phase 4 Step 3：撰写各章节正文

**内部参数**：
```
/scientific-writing --topic "段落主题"
/scientific-writing --improve "段落内容"
/scientific-writing --outline               # 生成大纲
```

---

### 8. scientific-schematics — 框架图生成

**能力**：生成研究框架图、流程图、概念图、架构图、模型图

**自动触发场景**：
- Phase 2 Step 2：绘制研究框架图
- Phase 2 Step 4：绘制技术路线图
- Phase 4 Step 4：生成分析图表

**内部参数**：
```
/scientific-schematics
/scientific-schematics --type flowchart     # 流程图
/scientific-schematics --type concept       # 概念图
```

---

### 9. academic-plotting — 统计图表

**能力**：生成学术统计图表（柱状图、折线图、饼图、散点图、箱线图、热力图）

**自动触发场景**：
- Phase 3 Step 6：生成数据分析图表
- Phase 4 Step 4：论文配图

**内部参数**：
```
/academic-plotting --data "data.csv"                # 自动选择图表
/academic-plotting --data "data.csv" --type bar     # 柱状图
/academic-plotting --data "data.csv" --type line    # 折线图
/academic-plotting --data "data.csv" --type pie     # 饼图
/academic-plotting --data "data.csv" --type scatter # 散点图
```

---

### 10. awesome-ai-research-writing — 学术写作与翻译

**能力**：学术润色、中英互译、语言优化、逻辑梳理、reviewer视角分析

**自动触发场景**：
- Phase 2 Step 5：润色第1章
- Phase 4 Step 2：摘要翻译
- Phase 4 Step 3：章节润色
- Phase 6 Step 2：演讲稿润色

**内部参数**：
```
/awesome-ai-research-writing "内容"              # 润色
/awesome-ai-research-writing --translate "内容"   # 翻译
/awesome-ai-research-writing --shorten "内容"     # 缩短
/awesome-ai-research-writing --expand "内容"      # 扩展
```

---

### 11. xlsx — 数据处理

**能力**：创建/编辑Excel表格，含公式、格式、数据分析、可视化

**自动触发场景**：
- Phase 3 Step 5：处理问卷数据
- Phase 3 Step 6：描述性统计

**内部参数**：
```
/xlsx
/xlsx --data "questionnaire.xlsx"
```

---

### 12. peer-review — 同行评审

**能力**：模拟同行评审，从8个维度评估论文质量，输出评审报告

**评审维度**：选题价值、文献综述、研究设计、数据分析、论证逻辑、策略建议、写作规范、学术规范

**自动触发场景**：
- Phase 5 Step 1：综合审校

**内部参数**：
```
/peer-review
/peer-review --chapter 3               # 评审特定章节
```

**输出**：`reviews/peer-review-report.md`

---

### 13. quality-editor — 质量编辑

**能力**：检查术语一致性、引用完整性、格式规范性、逻辑连贯性

**自动触发场景**：
- Phase 5 Step 5：格式与规范检查
- Phase 5 Step 6：表达优化

**内部参数**：
```
/quality-editor
/quality-editor --check terminology     # 只检查术语
```

**输出**：`reviews/quality-editor-report.md`

---

### 14. scientific-critical-thinking — 批判性思维

**能力**：检查论文的逻辑性，包括假设检验、论证逻辑、证据质量、替代解释、局限性

**自动触发场景**：
- Phase 5 Step 2：逻辑链检查
- Phase 5 Step 3：数据检查

**内部参数**：
```
/scientific-critical-thinking
/scientific-critical-thinking --argument "论证内容"
```

**输出**：`reviews/critical-thinking-report.md`

---

### 15. humanizer — 去AI化（通用）

**能力**：去除AI生成的痕迹，使语言更自然。基于Wikipedia的"Signs of AI writing"指南，识别24种AI写作模式。

**自动触发场景**：
- Phase 4 Step 3：章节润色
- Phase 5 Step 6：表达优化

**内部参数**：
```
/humanizer "内容"
/humanizer --file "path/to/file.md"
```

---

### 16. humanizer-zh-academic — 中文学术降AI率

**能力**：专为中文学术写作设计的AIGC检测率降低工具。识别16种AI写作模式，含7项硬约束、4步SOP、6维质量评分（含"抗检测性"维度）。实测AIGC率从>50%降至11%。

**与humanizer的区别**：
- `humanizer` — 通用去AI化，适合任何文本
- `humanizer-zh-academic` — 专为中文学术论文设计，针对AIGC检测器优化

**核心机制**：AIGC检测器识别的是写作模式的统计规律，而非内容本身。本Skill通过打破AI写作的模式规律性，注入人类写作的随机性与真实感。

**自动触发场景**：
- Phase 5 Step 6：降AI率处理

**16种AI模式**：
| 层面 | 模式 | 典型特征 |
|------|------|---------|
| 内容 | 理论起笔 | "依据XX理论"开头 |
| 内容 | 套路结尾 | "此案例印证了""由此可见" |
| 内容 | 整齐编号 | "首先/其次/再次"等长并列 |
| 内容 | 被动套话 | "该处理体现了""该设计基于" |
| 内容 | 模板问题 | "面临的核心问题是" |
| 内容 | 对称并列 | 三项完全等长并列句 |
| 内容 | 蛇足总结 | "综上所述""不难发现" |
| 内容 | 模糊归因 | "专家认为"无出处 |
| 内容 | 填充短语 | "值得注意的是" |
| 内容 | 泛化结尾 | "具有重要意义""前景广阔" |
| 语言 | AI高频词 | 深入探讨、不可或缺、深刻揭示 |
| 语言 | 系动词回避 | "扮演着…角色" |
| 语言 | 过度排比 | 突破了…填补了…创新了 |
| 语言 | 三维等重 | "从经济/社会/文化三个维度" |
| 风格 | 破折号滥用 | 一段内4次以上 |
| 风格 | 加粗滥用 | 全文超过5处 |

**内部参数**：
```
/humanizer-zh-academic "内容"
/humanizer-zh-academic --file "path/to/file.md"
```

**输出**：风险识别报告 + 改写版本 + 6维质量评分（/60）

---

### 17. humanizer-zh — 中文通用去AI化

**能力**：`blader/humanizer`（19.9k stars）的中文汉化版，识别24种AI写作模式，适合通用中文文本。

**与前两个的区别**：
- `humanizer` — 英文原版，通用去AI化
- `humanizer-zh-academic` — 中文学术专项，针对AIGC检测器
- `humanizer-zh` — 中文通用版，适合非学术中文文本

**安装**：`npx skills add https://github.com/op7418/Humanizer-zh.git`

---

### 18. docx — Word文档生成

**能力**：创建和编辑Word文档，支持样式、目录、页眉页脚、图表、格式规范

**自动触发场景**：
- Phase 4 Step 5：生成论文Word终稿

**内部参数**：
```
/docx
```

---

### 19. pptx — PPT制作

**能力**：制作答辩PPT，支持模板、图表、动画

**自动触发场景**：
- Phase 6 Step 1：制作答辩PPT

**内部参数**：
```
/pptx
/pptx --outline "templates/defense-ppt.md"
```

---

### 20. dissertation-defense — 答辩准备

**能力**：生成Q&A题库、模拟答辩练习、提供应答策略、评估准备情况

**自动触发场景**：
- Phase 6 Step 3：准备Q&A
- Phase 6 Step 4：模拟答辩

**内部参数**：
```
/dissertation-defense
/dissertation-defense --mock            # 模拟练习
```

---

## Skills 按 Phase 分配总览

```
Phase 0: 项目初始化
├── markitdown      ← 转换已有资料
└── pdf             ← 读取PDF文档

Phase 1: 文献检索与管理
├── paper-lookup          ← 检索文献
├── research-lookup       ← 扩展研究
├── pdf / markitdown      ← 阅读PDF
├── citation-management   ← 管理引用
└── literature-review     ← 撰写综述

Phase 2: 框架设计
├── scientific-schematics         ← 绘制框架图
├── scientific-writing            ← 撰写第1章
└── awesome-ai-research-writing   ← 润色

Phase 3: 数据收集
├── xlsx                      ← 处理问卷数据
├── scientific-writing        ← 撰写方法部分
└── academic-plotting         ← 生成统计图表

Phase 4: 内容生成
├── scientific-writing            ← 撰写正文
├── awesome-ai-research-writing   ← 润色翻译
├── academic-plotting             ← 生成图表
├── scientific-schematics         ← 框架图
├── citation-management           ← 参考文献
├── humanizer                     ← 去AI化
└── docx                          ← 生成Word

Phase 5: 质量审校
├── peer-review                   ← 同行评审
├── quality-editor                ← 质量编辑
├── scientific-critical-thinking  ← 逻辑检查
├── humanizer-zh-academic         ← 降AI率（AIGC检测）
├── humanizer-zh                  ← 中文通用去AI化
├── humanizer                     ← 英文去AI化
└── docx                          ← 格式检查

Phase 6: 答辩准备
├── pptx                  ← 制作PPT
├── dissertation-defense  ← 答辩模拟
└── awesome-ai-research-writing   ← 演讲稿润色
```

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

## 使用原则

1. **用户不需要手动调用** — 用自然语言描述需求，AI自动选择Skill
2. **先读后写** — 先读取内容（pdf/markitdown），再处理（scientific-writing）
3. **先框架后细节** — 先生成框架（scientific-schematics），再填充内容
4. **先初稿后润色** — 先完成初稿，再用humanizer/awesome-ai-research-writing优化
5. **输出需保存** — Skill输出不自动保存，Prompt中指定"保存到{路径}"
6. **人工审核** — AI生成内容需人工确认
