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

## Academic Writing Workflow (3-Agent Pipeline)

### Agent 概览

| Agent | 角色 | 权限 | 模型 |
|-------|------|------|------|
| **sci-writer** | JME 学术论文撰写/修改 | Read-only | opus |
| **strict-reviewer** | JME 严格审稿人 | Read-only | opus |
| **language-polisher** | 学术英语润色编辑 | Read-only | opus |

**所有 agent 均不直接修改 manuscript.tex。** 输出为独立 .md 文件，用户自行决定合并。

### 两个工作流

#### 工作流 A：`draft`（从大纲/要点撰写）

适用于：用户提供大纲、要点或选中一段需要重写的文本

```
用户输入（大纲/要点/选中文本）
  ↓  主会话提取 anchor points（3-5 个核心要点锚点）
sci-writer 撰写初稿
  ↓
[strict-reviewer 审稿 → sci-writer 修改] × 2 轮（每轮对照 anchor points）
  ↓
language-polisher 润色
  ↓
输出：drafts/{Section}_changelog.md + drafts/{Section}_final.md
```

#### 工作流 B：`polish`（打磨已有文本）

适用于：用户选中一段已写好的文本，需要提升质量

```
用户选中已有文本
  ↓  主会话提取 anchor points（核心论点 + 论证链条）
[strict-reviewer 审稿 → sci-writer 修改] × 2 轮（每轮对照 anchor points 检查逻辑一致性）
  ↓
language-polisher 润色
  ↓
输出：drafts/{Section}_changelog.md + drafts/{Section}_final.md
```

### 调用方式

在 VS Code 中选中一段 tex 文本，然后在 Claude Code 对话中说：
- **`draft`**：基于选中的大纲/要点从零撰写
- **`polish`**：打磨选中的已有文本

### Anchor Points 机制

两个工作流均使用 anchor points，但**目的不同**：

#### Draft 工作流（撰写模式）
**目的**：防止偏离用户原始意图
- 从用户的大纲/要点中提取 3-5 个 **核心要点锚点**
- **作用**：
  - **sci-writer**：按照 anchor points 构建论证逻辑
  - **strict-reviewer**：检查是否偏离用户原始意图

#### Polish 工作流（打磨模式）
**目的**：维护多轮修改中的逻辑一致性
- 从用户选中的已有文本中提取：
  - **核心论点**：每段的主要观点
  - **论证链条**：前提 → 推理 → 结论的逻辑关系
- **作用**：
  - **sci-writer**：修改时**不得破坏**这些逻辑结构，但不需要按其撰写
  - **strict-reviewer**：检查修改是否破坏了原文逻辑结构

### Agent 行为规范

#### sci-writer 规范

1. **逻辑结构保持**：
   - Draft 模式：按照用户提供的 anchor points 构建逻辑
   - Polish 模式：**严格保持原文段落的核心论点和论证链条**，不得改变因果关系和论证层次

2. **引用处理**：
   - **绝对禁止添加任何 LaTeX 引用命令**（`\citep{}`、`\citet{}` 等）
   - 在需要引用支持的地方标记 `(ref)`
   - 标记原则：论断性陈述、引用他人观点、数据/统计、定义等

3. **加粗格式**：
   - **默认不添加 `\textbf{}` 加粗**
   - 只有用户明确要求时才使用加粗
   - 让用户自己决定强调的重点

4. **字数控制**：
   - **必须遵守用户指定的字数要求（±10%）**
   - 如用户要求 500 字，输出应控制在 450-550 字之间
   - 字数优先级：当内容完整性与字数约束冲突时，优先满足字数要求
   - 如审稿人建议会大幅超出字数，必须拒绝并说明"用户指定字数限制"

#### strict-reviewer 规范

1. **引用审查**：
   - 检查 sci-writer 标记的 `(ref)` 是否合理
   - **补充**遗漏的 `(ref)` 标记
   - **移除**不必要的 `(ref)` 标记
   - 不要建议具体文献，只关注标记位置

2. **逻辑审查**：
   - Draft 模式：检查是否偏离用户原始意图（对照 anchor points）
   - Polish 模式：检查是否破坏了原文逻辑结构（对照 anchor points）

3. **字数约束**：
   - **不得要求增加内容导致超出用户指定的字数范围（±10%）**
   - 如发现字数超标，应建议"精简"而非"扩充"
   - 如用户指定 500 字，审稿时应确保最终版本不超过 550 字

#### language-polisher 规范

1. **润色范围**：
   - 专注于学术英语：语法、词汇、句式
   - **不改变逻辑结构和论证链条**

2. **输出格式**：
   - **不使用 `\textbf{}` 标记修改**，输出干净的 LaTeX 文本
   - 所有修改记录在 Change Summary 中

### 输出文件

所有输出存放在 `drafts/` 目录，每次工作流只生成两个文件：

| 文件 | 内容 |
|------|------|
| `drafts/{Section}_changelog.md` | 过程总结：anchor points、每轮审稿要点、修改说明、drift check 状态、润色统计 |
| `drafts/{Section}_final.md` | 最终 LaTeX 文本，用户复制到 manuscript.tex |

**注**：Agent 输出为 Markdown 格式（.md），用户可自行转换为 Word 文档。

### 注意事项
- **manuscript.tex 全程只读**，所有 agent 只读取不修改
- 润色后检查 `drafts/{Section}_final.md`，确认后手动合并到 tex
- 全流程中保持 `(ref)` 标记不变
- 每个 agent 在工作前会自动读取完整的 manuscript 上下文
- **sci-writer 会标记 `(ref)` 但不添加引用**，strict-reviewer 负责确认和补充
