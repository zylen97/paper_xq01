# LaTeX项目配置 - Elsarticle模板

## 核心配置
- **模板**: Elsarticle (preprint格式)
- **编译引擎**: XeLaTeX + BibTeX
- **触发方式**: 保存时自动编译（`onSave`）

## 文件结构
- `main.tex` - **论文主文件（包含所有章节内容，单文件结构）**
  - 所有章节（Abstract, Introduction, Literature, Methods, Results, Discussion, Conclusion）均已整合到main.tex中
  - Abstract使用`\section*{Abstract}`格式（不编号section），确保显示行号
  - 不再使用`\input{sections/...}`引用外部章节文件
- `figures/` - 图片、图表及相关Python绘图脚本
- `build/` - 编译临时文件（.aux, .log, .bbl, .blg等）
- `dj01.bib` - 参考文献（Better BibTeX自动导出）
- `elsarticle.cls` + `elsarticle/` - Elsevier模板文件
- ~~`sections/`~~ - **已废弃**：原章节文件夹已删除，所有内容已整合到main.tex

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

### 1. 文件结构规范
**本项目采用单文件结构**：所有章节内容均在`main.tex`中，不使用外部章节文件。
- 直接在main.tex中编辑各章节内容
- 禁止创建新的章节文件或重新拆分sections/文件夹
- Abstract采用`\section*{Abstract}`格式（不编号），确保行号显示

### 2. 行号配置
- 使用`\runninglinenumbers`和`\modulolinenumbers[1]`确保所有内容（包括Abstract）显示行号
- Abstract已从frontmatter移出，作为正文第一个section
- 已移除frontmatter后的双横线（通过自定义`\pprintMaketitle`）

### 3. 文献引用标记
文本中标有 **`(ref)`** 的地方是待添加文献的标记，**绝对不要修改或删除这些标记**！用户会手动添加对应的文献引用。

### 4. 投稿前准备
- 注释掉`main.tex`中的geometry页边距设置，恢复Elsarticle默认格式
- 修改`\journal{}`为目标期刊名称

### 5. 标题大写规范
**所有章节标题（section、subsection、subsubsection）和表格/图片标题均使用 Sentence case（句式大写），而非 Title Case（标题式大写）。**

- ✅ **正确**：只在第一个单词首字母大写
  - `\section{Results of necessary condition analysis}`
  - `\caption{Descriptive statistics and correlation matrix}`

- ❌ **错误**：不要每个单词首字母都大写
  - `\section{Results of Necessary Condition Analysis}`
  - `\caption{Descriptive Statistics and Correlation Matrix}`

**例外**：专有名词（如人名、地名、缩写）保持原有大写形式（例如：COVID-19、China、TSQCA）。

## 📊 表格绘制规范

### 必需宏包
```latex
\usepackage{booktabs}       % 专业表格横线
\usepackage{threeparttable} % 表格注释
\usepackage{caption}        % Caption格式控制
```

### 标准模板
```latex
\begin{table}[!htbp]
\centering
\captionsetup{font=normalsize, labelsep=period}
\setlength{\abovecaptionskip}{5pt}
\setlength{\belowcaptionskip}{0pt}
\caption{表格标题}
\label{tab:label_name}
\small
\begin{threeparttable}
\begin{tabular*}{0.9\textwidth}{@{\extracolsep{\fill}}lccccccc}
\toprule
\textbf{列标题1} & \textbf{列标题2} & ... \\
\midrule
\textit{变量1} & 数据 & ... \\
\textit{变量2} & 数据 & ... \\
\bottomrule
\end{tabular*}
\begin{tablenotes}[flushleft]
\small\linespread{1}\selectfont
\item \textit{Note}: 注释内容...
\end{tablenotes}
\end{threeparttable}
\end{table}
\vspace{-15pt}
```

### 关键设置
- **Caption**：`font=normalsize, labelsep=period`（字体适中，点分隔）
- **浮动**：`[!htbp]`（强制位置）
- **宽度**：`0.9\textwidth`（90%页宽）
- **字体**：
  - 表格主体：统一使用 `\small`（**禁止使用** `\footnotesize` 或其他字体大小）
  - 表头（第一行）：`\textbf{}`（加粗，保持 `\small` 字体大小）
  - 第一列变量：`\textit{}`（斜体，保持 `\small` 字体大小）
  - 表格符号：直接使用符号，**不添加** `\Large`、`\huge` 等字体大小命令
  - Notes行：`\small\linespread{1}\selectfont`
- **Notes**：`[flushleft]`左对齐，`\linespread{1}`单倍行距
- **列对齐**：第一列`l`，数据列`c`

**⚠️ 字体大小一致性原则**：
- 所有表格必须统一使用 `\small` 作为基础字体
- 标题行的 `\textbf{}` 仅改变字重（加粗），不改变字体大小
- 禁止在表格内使用 `\footnotesize`、`\normalsize`、`\Large`、`\huge` 等字体大小命令
- 这确保所有表格的视觉一致性和专业性
