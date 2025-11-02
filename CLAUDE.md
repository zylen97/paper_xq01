# LaTeX项目配置 - Elsarticle模板

## 核心配置
- **模板**: Elsarticle (preprint格式)
- **编译引擎**: XeLaTeX + BibTeX
- **触发方式**: 保存时自动编译（`onSave`）

## 文件结构
- `main.tex` - 论文主文件
- `sections/` - 章节内容（01-introduction.tex, 02-literature.tex, 03-methodology.tex等）
- `draft/` - 草稿文件夹（碎片化灵感、思路和初步内容）
- `figures/` - 图片文件夹
- `build/` - 编译临时文件（.aux, .log, .bbl, .blg等）
- `dj01.bib` - 参考文献（Better BibTeX自动导出）
- `elsarticle.cls` + `elsarticle/` - Elsevier模板文件

## 配置文件交互逻辑
- **settings.json** (VS Code层)
  - 控制编译触发时机（保存时自动编译）
  - 定义调用latexmk的方式和参数
  - 指定PDF输出位置（根目录）

- **latexmkrc** (latexmk层)
  - 控制编译引擎（XeLaTeX）和BibTeX处理
  - 管理文件输出位置：PDF→根目录，临时文件→build/
  - 配置持续监控模式

- **修改建议**:
  - 调整编译参数 → 改`latexmkrc`
  - 调整触发方式/PDF查看 → 改`settings.json`

## 快速命令（终端）
- 编译: `latexmk main.tex`
- 清理临时文件: `latexmk -c`
- 完全清理: `latexmkrc -C`

## ⚠️ 关键规则

### 1. 文件位置规范
**所有章节内容必须写入`sections/`文件夹**，绝不要在项目根目录创建新的章节文件。

### 2. 文献引用标记
文本中标有 **`(ref)`** 的地方是待添加文献的标记，**绝对不要修改或删除这些标记**！用户会手动添加对应的文献引用。

### 3. 投稿前准备
- 注释掉`main.tex`中的geometry页边距设置，恢复Elsarticle默认格式
- 修改`\journal{}`为目标期刊名称
