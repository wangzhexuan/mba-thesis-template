# sources/ - 文献资料目录

## 目录结构

```
sources/
├── Classic/       # 经典文献（5-10%）— 学科奠基性著作
├── KeyTexts/      # 核心文献（20-30%）— 高质量、高相关性研究
└── Supporting/    # 支撑文献（60-70%）— 背景支撑、数据来源
```

## 使用方法

1. 将下载的PDF文献按重要性分类放入对应目录
2. 命名规范：`[作者]_[年份]_[关键词].pdf`
   - 例：`Kotler_2016_Marketing_Management.pdf`
   - 例：`张三_2024_研究主题.pdf`

## 文献金字塔

```
        /\
       /  \        Classic（经典）：学科奠基理论
      /    \       例：Porter竞争战略、Barney资源基础观
     /------\
    /        \     KeyTexts（核心）：近5年高引研究
   /          \    例：与你课题直接相关的核心论文
  /------------\
 /              \  Supporting（支撑）：背景、数据、方法论
/________________\ 例：行业报告、政策文件、统计数据
```

## 注意

- PDF文件不纳入版本控制（已在.gitignore中排除）
- 文献元数据记录在 `output/references.bib` 中
- 使用 `/paper-lookup` 和 `/citation-management` 管理文献信息
