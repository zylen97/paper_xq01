# LaTeX项目配置 - Elsarticle模板

## 核心配置
- **模板**: Elsarticle (preprint格式)
- **编译引擎**: pdfLaTeX + BibTeX
- **触发方式**: 保存时自动编译（`onSave`）
- **主文件**: `manuscript.tex` (单文件，所有内容已合并)
- **参考文献**: `xq01.bib`

## 文件结构
```
项目根目录/
├── manuscript.tex              # 论文主文件（单文件，包含所有section）
├── manuscript-original.tex     # 基准版本（⚠️ 禁止修改！latexdiff 基线）
├── manuscript-track-changes.tex # 自动生成（latexdiff 输出，不纳入版本控制）
├── manuscript-track-changes.pdf # 自动生成（蓝色新增 + 红色删除线）
├── xq01.bib                   # 参考文献数据库
├── tools/                     # 差异生成工具链
│   ├── make-diff.sh           # 生成 track-changes PDF 的脚本
│   └── latexdiff-preamble.tex # 自定义差异渲染样式
├── build/                     # 编译临时文件（.aux, .log, .bbl等）
├── .vscode/settings.json      # VS Code配置
├── latexmkrc                  # latexmk编译配置（含自动diff触发）
└── elsarticle.cls             # Elsevier模板文件
```

## 编译命令
```bash
latexmk manuscript.tex           # 编译（自动触发 track-changes）
latexmk -pvc- -pv- manuscript.tex  # 单次编译（不进入持续监听模式）
bash tools/make-diff.sh          # 手动生成 track-changes PDF
latexmk -c                       # 清理临时文件（保留PDF）
latexmk -C                       # 完全清理（包括PDF）
```

## Track Changes 工作流

保存 `manuscript.tex` 后自动触发：
1. pdfLaTeX 编译 → `manuscript.pdf`（干净版）
2. latexdiff 对比 `manuscript-original.tex` vs `manuscript.tex`
3. 编译差异文件 → `manuscript-track-changes.pdf`（蓝色新增 / 红色删除线）

### 关键规则
- **`manuscript-original.tex` 严禁修改** — 这是 latexdiff 的对比基线
- 所有修改都在 `manuscript.tex` 上进行
- `manuscript-track-changes.tex` 是自动生成的，不要手动编辑

## 关键规则

### 1. 文献引用标记
文本中标有 **`(ref)`** 的地方是待添加文献的标记，**不要修改或删除**！

### 2. Unicode 字符
pdfLaTeX 不支持直接使用 Unicode 希腊字母和特殊符号。正文中必须使用 LaTeX 命令：
- β → `$\beta$`，α → `$\alpha$`，χ → `$\chi$`
- → → `$\rightarrow$`，− → `$-$`
- 禁止使用全角标点（，。；等）

### 3. 投稿前准备
- 注释掉`manuscript.tex`中的geometry页边距设置，恢复Elsarticle默认格式
- 修改`\journal{}`为目标期刊名称
- 确保`xq01.bib`文件完整且格式正确

### 4. 标题大写规范
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
- 编译问题：`Cmd+Shift+P` → `Kill LaTeX compiler process`，或手动 `latexmk -pvc- -pv- manuscript.tex`
- 参考文献不显示：确认 `\bibliography{xq01}` 和 `xq01.bib` 存在
- Track changes 编译失败：检查 `build/manuscript-track-changes.log`，常见原因是 Unicode 字符或 booktabs 兼容性

## Academic Writing Workflow

本项目使用全局 4-Agent Pipeline（`~/.claude/agents/` + `~/.claude/commands/`）进行论文撰写和打磨。

| 命令 | 用途 |
|------|------|
| `/draft` | 从大纲/要点撰写 |
| `/polish` | 打磨已有文本 |

**使用方式**：在 VS Code 中选中文本，输入 `/draft` 或 `/polish`。

**输出**：`drafts/writing_brief.md`（期刊简报）+ `drafts/{Section}_{timestamp}/`（含 checkpoint 文件、changelog.md、final.md）+ `drafts/{Section}_latest_final.md`（便捷入口）。

**核心规则**：manuscript 文件全程只读 · 确认后手动合并 · 保持 `(ref)` 标记不变。

## 投稿待办 (TODO)

- [ ] 补充淦雪晴（通讯作者）的邮箱 — `titlepage.tex`、`manuscript.tex`、`coverletter.tex` 中当前为 `TODO@just.edu.cn`
- [ ] 补充张哲（第三作者）的邮箱 — `titlepage.tex` 和 `manuscript.tex` 中当前为 `TODO@tongji.edu.cn`
- [ ] 核实 CRediT 贡献分配是否准确（见 `titlepage.tex`）
- [ ] 补充 Funding 信息（见 `titlepage.tex`）
- [ ] 补充 Acknowledgments 信息（见 `titlepage.tex`）
- [ ] 插入 Fig. 1 实际图片（当前为占位符 `[Insert Fig. 1 here]`）
- [ ] 补充 Table 1–5 到 `manuscript.tex`（正文引用了但未包含表格环境）
- [ ] 更新 Cover letter 中的字数统计（见 `coverletter.tex`）
- [ ] （可选）准备 Graphical abstract
