# LaTeX项目配置 - Elsarticle模板

## 核心配置
- **模板**: Elsarticle (preprint格式)
- **编译引擎**: XeLaTeX + BibTeX
- **触发方式**: 保存时自动编译（`onSave`）
- **主文件**: `manuscript.tex` (单文件，所有内容已合并)

## 文件结构
```
项目根目录/
├── manuscript.tex              # 论文主文件（单文件，包含所有section）
├── supplementary-materials.tex # 补充材料（独立文件）
├── xq01.bib                   # 参考文献数据库
├── figures/                   # 图片、图表及Python绘图脚本
├── build/                     # 编译临时文件（.aux, .log, .bbl等）
├── drafts/                    # Agent工作流输出（changelog + final）
├── .vscode/settings.json      # VS Code配置
├── latexmkrc                  # latexmk编译配置
└── elsarticle.cls             # Elsevier模板文件
```

## 编译命令
```bash
latexmk manuscript.tex   # 编译
latexmk -c               # 清理临时文件（保留PDF）
latexmk -C               # 完全清理（包括PDF）
```

## 关键规则

### 1. 文献引用标记
文本中标有 **`(ref)`** 的地方是待添加文献的标记，**不要修改或删除**！

### 2. 投稿前准备
- 注释掉`manuscript.tex`中的geometry页边距设置，恢复Elsarticle默认格式
- 修改`\journal{}`为目标期刊名称
- 确保`xq01.bib`文件完整且格式正确

### 3. 标题大写规范
**所有标题均使用 Sentence case（句式大写），而非 Title Case（标题式大写）。**
- ✅ `\section{Results of necessary condition analysis}`
- ❌ `\section{Results of Necessary Condition Analysis}`
- **例外**：专有名词和缩写保持原有大写（如 COVID-19、China、BIM、QCA 等）

## 表格规范

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

### 核心规则
- 统一 `\small` 字体，**禁止** `\footnotesize`、`\Large` 等
- 表头 `\textbf{}`，第一列 `\textit{}`，数据列居中 `c`
- 宽度 `0.9\textwidth`，浮动 `[!htbp]`

## 故障排查
- 编译问题：`Cmd+Shift+P` → `Kill LaTeX compiler process`，或手动 `latexmk -xelatex manuscript.tex`
- 参考文献不显示：确认 `\bibliography{xq01}` 和 `xq01.bib` 存在

## Academic Writing Workflow

本项目使用全局 4-Agent Pipeline（`~/.claude/agents/` + `~/.claude/commands/`）进行论文撰写和打磨。

| 命令 | 用途 |
|------|------|
| `/draft` | 从大纲/要点撰写 |
| `/polish` | 打磨已有文本 |

**使用方式**：在 VS Code 中选中文本，输入 `/draft` 或 `/polish`。

**输出**：`drafts/writing_brief.md`（期刊简报）+ `drafts/{Section}_changelog.md` + `drafts/{Section}_final.md`。

**核心规则**：manuscript 文件全程只读 · 确认后手动合并 · 保持 `(ref)` 标记不变。
