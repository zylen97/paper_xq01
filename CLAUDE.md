# LaTeX项目配置 - Elsarticle模板

## 模板说明
- 使用 **Elsarticle** 文档类（Elsevier期刊标准格式）
- 预印本格式（preprint），适合投稿前准备
- 支持Elsevier旗下期刊投稿要求

## 编译设置
- 使用XeLaTeX编译引擎
- 启用BibTeX处理参考文献
- 临时文件存放在`build/`文件夹
- PDF输出到项目根目录

## 主要文件
- `main.tex` - 论文源文件（elsarticle格式）
- `sections/` - 各章节内容文件（01-introduction.tex, 02-literature.tex等）
- `draft/` - 草稿文件夹（包含各章节的碎片化灵感、思路和初步内容）
- `dj01.bib` - 参考文献（BibTeX格式，Better BibTeX自动导出）
- `elsarticle.cls` - Elsarticle文档类文件
- `elsarticle/` - Elsevier的latex模板文件夹（包含.bst样式文件）
- `figures/` - 图片文件夹
- `build/` - 所有.aux、.log、.bbl等临时文件

## 编译命令
- 编译：`latexmk main.tex`
- 清理：`latexmk -c` 
- 完全清理：`latexmk -C`

## 工作流程
1. 编辑sections/各章节文件或main.tex → 保存(Cmd+S) → 自动编译 → 查看PDF
2. 添加图片到figures/文件夹，使用相对路径引用
3. 编译出错时查看build/main.log日志文件
4. 参考文献自动通过BibTeX处理

## Elsarticle特殊功能
- `frontmatter` 环境包含标题、作者、摘要
- 结构化作者信息：`\affiliation{}`、`\ead{}`
- 关键词格式：`\begin{keyword}...\sep...\end{keyword}`
- 期刊指定：`\journal{期刊名称}`

## 注意
- build/文件夹内容都是自动生成的，不要手动编辑
- 图片路径：`\includegraphics{figures/image.png}`
- 投稿前需修改`\journal{}`为目标期刊名称

## 页边距调整
- **当前设置**：使用geometry宏包调整页边距（左右2.5cm，上下2.5cm）
- **调整方法**：修改main.tex中`\geometry{}`的参数值
- **重要**：投稿前应注释掉geometry相关设置，恢复Elsarticle默认格式
- **其他格式选项**：
  - `preprint`：预印本格式，页边距较大（当前使用）
  - `3p`：单栏紧凑格式，页边距较小
  - `5p`：双栏格式，页边距最小

## 重要提醒
- **文件位置规范**: 所有章节内容必须写入`sections/`文件夹下对应的文件中（如03-methodology.tex），绝不要在项目根目录创建新的章节文件
- 章节文件结构：01-introduction.tex, 02-literature.tex, 03-methodology.tex, 04-experiments.tex, 05-results.tex, 06-conclusion.tex

## ⚠️ 极其重要的编辑规则

- **文献引用标记 (ref)**：文本中标有"(ref)"的地方是待添加文献的标记，**绝对不要修改或删除这些标记**！用户会手动添加对应的文献引用。