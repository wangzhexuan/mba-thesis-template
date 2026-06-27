# drafts/ - 章节草稿目录

## 文件命名

```
drafts/
├── abstract-zh.md           # 中文摘要
├── abstract-en.md           # 英文摘要
├── chapter1-introduction.md # 第1章 绪论
├── chapter2-literature.md   # 第2章 文献综述
├── chapter3-analysis.md     # 第3章 现状分析
├── chapter4-strategy.md     # 第4章 策略优化
├── chapter5-conclusion.md   # 第5章 结论
└── chapter6-*.md            # 第6章（六章制可选）
```

## 写作建议

1. **推荐写作顺序**：3→4→2→1→5（数据最清晰的先写）
2. **先完成初稿**，再用Skills润色
3. 每章完成后执行 `/checkpoint` 保存进度
4. 使用 `workflows/04-writing.md` 中的章节结构模板

## 保存命令

```bash
"请将第{N}章内容保存到 drafts/chapter{N}-{name}.md"
```
