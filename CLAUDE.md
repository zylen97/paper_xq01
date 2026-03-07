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
├── xq01.bib                   # 参考文献数据库
├── polish/                    # Mode B 语言润色输出（顺序编号 001.md, 002.md, ...）
├── .vscode/settings.json      # VS Code配置
├── latexmkrc                  # latexmk编译配置
└── elsarticle.cls             # Elsevier模板文件
```

## 编译目录策略

**所有编译产物（`.aux`, `.bbl`, `.log` 等）直接生成在根目录**，不使用 `build/` 子目录。原因：
- VS Code LaTeX Workshop 会在根目录额外运行 pdflatex 生成诊断信息，若 `.bbl` 在 `build/` 中则找不到，导致满屏 citation 警告
- 根目录编译确保 latexmk 和 LaTeX Workshop 共享同一套 `.bbl`/`.aux`，避免双重编译环境不同步

**目录整洁方案**：
- `.gitignore` — 排除所有临时文件，不进入版本控制
- `.vscode/settings.json` 的 `files.exclude` — 在文件浏览器中隐藏临时文件，视觉上保持根目录整洁
- 排错时通过终端直接访问日志：`cat manuscript.log`

**禁止事项**：
- ❌ 不要在 `latexmkrc` 中设置 `$out_dir` / `$aux_dir`
- ❌ 不要在 VS Code tool args 中传 `-outdir=build`
- ❌ 不要启用 `$preview_continuous_mode = 1`（与 LaTeX Workshop 的 `onSave` 冲突）

## 编译命令
```bash
latexmk manuscript.tex           # 编译
latexmk -pvc- -pv- manuscript.tex  # 单次编译（不进入持续监听模式）
latexmk -c                       # 清理临时文件（保留PDF）
latexmk -C                       # 完全清理（包括PDF）
```

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

### 5. 语言规范

**权威规则源**: `~/.claude/agents/language-polisher.md`（Categories A–M，含 Chinglish 消除、时态、修饰语、破折号等 13 类规则）。

主 agent 撰写英文文本时专注内容质量，**不需要**执行语言自检。
用户需要语言润色时会手动指示调用 `language-polisher` agent（Mode B），届时按提示执行即可。

#### Mode B 输出保存
调用 language-polisher（Mode B）后，主 agent **必须**将完整输出保存到文件：
- **目录**: `polish/`（项目根目录下，不存在则创建）
- **文件名**: 三位顺序编号，如 `001.md`、`002.md`（扫描已有文件取最大编号 +1）
- **内容**: polisher 返回的完整输出（润色后文本 + Change Summary），原样保存，不做额外加工
- **语言**: 报告使用**中文**撰写
- **保存后**：告知用户文件路径，方便查阅和合并

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

- [x] ~~补充淦雪晴（通讯作者）的邮箱~~ — `manuscript.tex` 已填（blinded），`coverletter.tex` L58 仍为 `TODO@just.edu.cn`
- [x] ~~补充张哲（第三作者）的邮箱~~ — `manuscript.tex` 已填（blinded）
- [ ] 核实 CRediT 贡献分配是否准确（见 `titlepage.tex`）
- [ ] 补充 Funding 信息（见 `titlepage.tex`）
- [ ] 补充 Acknowledgments 信息（见 `titlepage.tex`）
- [ ] 插入 Fig. 1 实际图片（当前为占位符 `[Insert Fig. 1 here]`，L170）
- [x] ~~补充 Table 1–5 到 `manuscript.tex`~~ — Tables 1–6 + Table A (appendix) 均已插入
- [ ] 修复 Table 1 溢出警告（float too large for page）
- [ ] 更新 Cover letter 中的字数统计（见 `coverletter.tex`）
- [ ] Sec 3–6 语言润色（language-polisher Mode B）
- [ ] 流失者分析（Attrition analysis）— 需跑数据
- [ ] （可选）准备 Graphical abstract
