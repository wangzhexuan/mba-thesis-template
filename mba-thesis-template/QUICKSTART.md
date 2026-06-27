# MBA论文项目快速启动指南

## 重要说明

**模板目录（mba-thesis-template/）是只读的，不要直接修改！**

每次新论文项目，都应该：
1. 复制模板到新目录
2. 在新目录中填写配置和写作

---

## 一分钟快速开始

### 第一步：创建新项目

```bash
# 方式一：手动复制
cp -r mba-thesis-template 我的MBA论文

# 方式二：使用Web界面（推荐）
open mba-thesis-template/init.html
```

### 第二步：填写配置

```bash
# 进入新项目目录
cd 我的MBA论文

# 运行初始化向导
./init.sh
```

或使用Web界面：
- 双击 `init.html` 打开
- 填写论文信息
- 下载配置文件到 `config/` 目录

### 第三步：开始写作

```bash
# 查看工作流指南
cat workflows/00-setup.md

# 查看Skills速查
cat skills/skills-quickref.md
```

---

## 目录结构说明

```
paper-co_trae/
├── mba-thesis-template/     # 模板目录（只读，不要修改）
│   ├── init.html            # Web界面
│   ├── init.sh              # 命令行向导
│   ├── config/              # 配置文件模板
│   ├── workflows/           # 工作流文档
│   ├── skills/              # Skills工具包
│   └── templates/           # 文档模板
│
├── 我的MBA论文/              # 项目1（从模板复制）
│   ├── config/              # 项目1的配置
│   ├── drafts/              # 项目1的草稿
│   ├── output/              # 项目1的输出
│   └── ...
│
└── 另一篇论文/              # 项目2（从模板复制）
    ├── config/              # 项目2的配置
    └── ...
```

---

## 工作流程

```
Phase 0: 项目初始化 → 运行 init.sh 或 init.html
    ↓
Phase 1: 文献检索与管理 → workflows/01-literature.md
    ↓
Phase 2: 框架设计 → workflows/02-framework.md
    ↓
Phase 3: 数据收集 → workflows/03-data-collection.md
    ↓
Phase 4: 内容生成 → workflows/04-writing.md
    ↓
Phase 5: 质量审校 → workflows/05-review.md
    ↓
Phase 6: 答辩准备 → workflows/06-defense.md
```

---

## 常用命令速查

### 文献管理

```bash
/paper-lookup "关键词"        # 查找文献
/citation-management          # 格式化引用
```

### 写作辅助

```bash
/awesome-ai-research-writing       # 英文润色、中英互译
/humanizer                         # 去AI化
/humanizer-zh-academic             # 中文降重
/scientific-writing                # 学术写作
/literature-review                 # 文献综述
```

### 质量审校

```bash
/peer-review                  # 同行评审
/quality-editor               # 质量编辑
/humanizer-zh-academic        # 中文降重
```

### 输出生成

```bash
/docx                         # 生成Word文档
/pptx                         # 生成PPT
```

---

## 常见问题

### Q: 模板和项目的关系？

A: 模板是只读的，每次新论文复制一份到独立目录。

### Q: 如何同时写多篇论文？

A: 每篇论文一个独立目录，互不影响。

### Q: 模板更新了怎么办？

A: 新项目用新模板，旧项目继续用旧版本。

### Q: 如何选择研究框架？

A: 参考 `templates/case-study-example.md` 中的案例。

---

**祝你论文写作顺利！**
