# output/ - 最终输出目录

## 文件说明

```
output/
├── thesis.docx          # 论文Word终稿（由 build_thesis.py 或 /docx 生成）
├── defense.pptx         # 答辩PPT（由 /pptx 生成）
├── references.bib       # 参考文献库（由 /citation-management 管理）
└── figures/             # 图表目录
    ├── framework.png    # 研究框架图
    ├── swot.png         # SWOT分析图
    ├── data-*.png       # 数据图表
    └── ...
```

## 生成命令

```bash
# 生成Word文档
python templates/build_thesis.py

# 或使用Skills
/docx

# 生成答辩PPT
/pptx

# 生成图表
/academic-plotting --data "data.csv"
/scientific-schematics
```

## 注意

- 此目录内容可随时重新生成
- figures/ 中的图片应为300dpi以上、PNG格式
- thesis.docx 生成后需在Word中手动更新目录
