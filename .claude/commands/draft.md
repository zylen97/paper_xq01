---
description: "从大纲/要点撰写论文段落（4-Agent Pipeline：journal-scout → sci-writer → strict-reviewer → language-polisher）"
---

# Draft Workflow — 从大纲/要点撰写

用户通过选中文本或直接输入提供大纲、要点或需要重写的文本段落，本工作流调用四个 agent 完成从期刊识别到润色的全流程。

## 输入说明

用户输入 `$ARGUMENTS`，格式为：
- 直接传入大纲/要点文本
- 可选参数用 `|` 分隔：`大纲文本 | section=Introduction | words=500`
- 如果用户在 VS Code 中选中了文本，选中内容会作为 `$ARGUMENTS` 传入

## 步骤 0：解析输入与前置检查

1. **解析 `$ARGUMENTS`**：
   - 提取主体内容（大纲/要点文本）
   - 提取可选参数：`section`（section 名称，用于输出文件命名）、`words`（目标字数）
   - 如果没有指定 section，从内容中推断或询问用户

2. **获取项目文件路径**：
   - 从 CLAUDE.md 获取主文件路径（`主文件` 字段）和参考文献文件路径
   - 如果 CLAUDE.md 未声明主文件，fallback：使用 Glob("*.tex") 查找包含 `\documentclass` 的文件，排除 supplementary*.tex、appendix*.tex 和 *.cls
   - 读取主文件，了解当前论文结构和上下文

3. **确定 section 名称**（用于文件命名）：
   - 如果用户指定了 `section=XXX`，使用该名称
   - 否则，根据内容推断属于哪个 section（对照主文件的章节结构）
   - 将 section 名称标准化为文件友好格式（如 `Literature_Review`、`Introduction`、`Discussion`）

4. **创建工作目录**：
   - 生成时间戳：`YYYYMMDD_HHMM` 格式（如 `20260216_1430`）
   - 创建目录：`drafts/{Section}_{timestamp}/`（如 `drafts/Introduction_20260216_1430/`）
   - 如果 `drafts/` 不存在，先创建
   - 将此路径记为 `{WORK_DIR}`，后续所有步骤使用此变量

## 步骤 0.5：生成 Writing Brief

1. **检查现有 Brief 是否可复用**：
   - 读取 `drafts/writing_brief.md`
   - 如果文件不存在或为空 → 执行下方第 2 步（调用 journal-scout）
   - 从 `## Metadata` 提取 `Generated` 时间戳和 `Manuscript word count`
   - 如果 Metadata 缺失（旧格式 Brief） → 执行下方第 2 步
   - **时间检查**：计算当前时间与 `Generated` 的差值。如果 > 24 小时 → 执行下方第 2 步，提示 "Writing Brief 已超过 24 小时，自动重新生成..."
   - **字数检查**：读取当前 manuscript 主文件，估算正文字数。计算 `|当前字数 - Brief记录字数| / Brief记录字数`。如果 > 20% → 执行下方第 2 步，提示 "Manuscript 字数变化超过 20%（Brief 记录 {X}，当前 {Y}），自动重新生成..."
   - 如果两项检查均通过 → **复用现有 Brief**，提示 "使用现有 Writing Brief（期刊：{名称}，生成于 {时间}）"，跳过下方第 2-3 步

2. **调用 journal-scout agent**：
   使用 Task 工具调用 journal-scout agent（`subagent_type: "journal-scout"`）。

   **传递给 journal-scout 的 prompt**：
   ```
   Analyze the manuscript in this project and generate a Writing Brief.
   Output the complete Writing Brief in the conversation.
   ```

3. **保存 Writing Brief**：
   将 journal-scout 输出的 Writing Brief（从 `---BEGIN WRITING BRIEF---` 到 `---END WRITING BRIEF---`）保存到 `drafts/writing_brief.md`（如果 drafts/ 目录不存在，先创建）

4. **向用户展示关键信息**：
   显示 Brief 中的期刊名称、研究情境、信息来源（Web / Knowledge base only）。

## 步骤 1：提取 Anchor Points

从用户提供的大纲/要点中提取 **5-8 个核心要点锚点**（Anchor Points），根据用户内容的密度。

**提取原则**：
- 每个锚点是一个不可省略的核心论点或论证要素
- 锚点应该反映用户的**原始意图**，而非你对内容的二次理解
- 格式：编号列表，每个锚点一句话概括

**示例**：
```
Anchor Points:
1. Social use (rather than purely instrumental use) of digital communication tools is the key driver of meta-knowledge development
2. Meta-knowledge mediates the relationship between DCT usage and improvisational capability
3. Distributed Cognition Theory explains the tool → cognition → capability transmission mechanism
```

**输出与保存**：
1. 在对话中显示提取的 anchor points
2. 将用户原始大纲/要点保存到 `{WORK_DIR}/00_user_outline.md`
3. 将 anchor points 保存到 `{WORK_DIR}/00_anchor_points.md`，格式：
   ```markdown
   # Anchor Points — {Section}
   ## Mode: Draft
   ## Date: {current date}

   1. {anchor point 1}
   2. {anchor point 2}
   3. ...
   ```

## 步骤 2：调用 sci-writer 撰写初稿

使用 Task 工具调用 sci-writer agent（`subagent_type: "sci-writer"`）。

**传递给 sci-writer 的 prompt 必须包含**：

```
## 任务：撰写初稿

### 写作环境
请先读取 `drafts/writing_brief.md` 获取期刊要求、领域情境和项目文件路径。

### 上下文
- Section: {section名称}
- 工作模式：Draft（从大纲/要点撰写）

### Anchor Points（不可偏离）
请读取 `{WORK_DIR}/00_anchor_points.md` 获取完整 anchor points。

### 用户提供的大纲/要点
请读取 `{WORK_DIR}/00_user_outline.md` 获取用户原始大纲。

### 编排约束（必须遵守）
1. **字数控制**：{如果用户指定了字数} 目标字数 {words} 字（允许 ±10%，即 {words*0.9}-{words*1.1} 字）。当内容完整性与字数约束冲突时，优先满足字数要求。
   {如果用户未指定字数} 用户未指定字数，按内容需要自行把控，但需在输出开头标注实际字数。
2. **加粗格式**：默认不添加 \textbf{} 加粗。让用户自己决定强调重点。
3. **引用处理**：禁止添加 \citep{}/\citet{} 等引用命令。需要引用的地方标记 (ref)。

### 输出要求
按照你的 Output Protocol 输出。在输出末尾标注实际字数，并包含 Anchor Point Verification 表格。
```

**Checkpoint**：将 sci-writer 输出保存到 `{WORK_DIR}/01_draft_v1.md`。

## 步骤 3：第 1 轮审稿-修改循环

### 3a. 调用 strict-reviewer 审稿

使用 Task 工具调用 strict-reviewer agent（`subagent_type: "strict-reviewer"`）。

**传递给 strict-reviewer 的 prompt**：

```
## 任务：审稿（第 1 轮）

### 审稿环境
请先读取 `drafts/writing_brief.md` 获取期刊标准和领域审查要点。

### 上下文
- Section: {section名称}
- 工作模式：Draft（从大纲/要点撰写）
- 这是初稿的第 1 轮审稿

### Anchor Points（审稿时参照）
请读取 `{WORK_DIR}/00_anchor_points.md` 获取完整 anchor points。

### 待审文本
请读取 `{WORK_DIR}/01_draft_v1.md` 获取待审文本。

### 编排约束
1. **字数约束**：{如果有字数要求} 用户指定目标字数 {words} 字（±10%）。不得要求增加内容导致超出此范围。如发现超标，应建议精简而非扩充。
   {如果无字数要求} 用户未指定字数，按合理长度审查。
2. **Drift Check**：重点检查文本是否偏离 anchor points。请在审稿报告中包含 Anchor Point Verification 表格。

### 输出要求
按照你的 Review Output Format 输出。
```

**Checkpoint**：将 strict-reviewer 输出保存到 `{WORK_DIR}/02_review_r1.md`。

### 3b. 调用 sci-writer 根据审稿意见修改

使用 Task 工具调用 sci-writer agent（`subagent_type: "sci-writer"`）。

**传递给 sci-writer 的 prompt**：

```
## 任务：根据审稿意见修改（第 1 轮）

### 写作环境
请先读取 `drafts/writing_brief.md` 获取期刊要求、领域情境和项目文件路径。

### 上下文
- Section: {section名称}
- 工作模式：Draft

### Anchor Points（不可偏离）
请读取 `{WORK_DIR}/00_anchor_points.md` 获取完整 anchor points。

### 你的当前版本
请读取 `{WORK_DIR}/01_draft_v1.md` 获取你之前的初稿。

### 审稿意见
请读取 `{WORK_DIR}/02_review_r1.md` 获取审稿报告。

### 编排约束
1. **字数控制**：{同步骤2的字数约束}
2. **加粗格式**：默认不添加 \textbf{} 加粗。
3. **引用处理**：禁止添加引用命令，用 (ref) 标记。
4. **Anchor Points 优先**：如审稿意见与 anchor point 冲突，保留 anchor point，在修改说明中解释原因。
5. **如审稿建议会大幅超出字数限制，拒绝该建议并说明"用户指定字数限制"。**

### 输出要求
按照你的 Output Protocol 输出修改后的完整文本。标注：(a) 针对每条审稿意见的处理方式，(b) 实际字数。在输出末尾包含 Anchor Point Verification 表格。
```

**Checkpoint**：将 sci-writer 输出保存到 `{WORK_DIR}/03_revision_r1.md`。

## 步骤 4：第 2 轮审稿-修改循环

重复步骤 3 的结构，但标注为"第 2 轮"。

### 4a. strict-reviewer 第 2 轮审稿
- prompt 结构同 3a，但标注"第 2 轮"
- 待审文本改为：`请读取 {WORK_DIR}/03_revision_r1.md`
- **Checkpoint**：输出保存到 `{WORK_DIR}/04_review_r2.md`

### 4b. sci-writer 第 2 轮修改
- prompt 结构同 3b，但标注"第 2 轮"
- "### 你的当前版本" 改为：`请读取 {WORK_DIR}/03_revision_r1.md` 获取第 1 轮修改后的文本
- "### 审稿意见" 改为：`请读取 {WORK_DIR}/04_review_r2.md` 获取第 2 轮审稿报告
- **Checkpoint**：输出保存到 `{WORK_DIR}/05_revision_r2.md`

## 步骤 5：调用 language-polisher 润色

使用 Task 工具调用 language-polisher agent（`subagent_type: "language-polisher"`）。

**传递给 language-polisher 的 prompt**：

```
## 任务：语言润色

### 润色环境
请先读取 `drafts/writing_brief.md` 获取期刊和领域信息。

### 上下文
- Section: {section名称}
- 这是经过 2 轮审稿修改后的最终文本

### Anchor Points（润色时不得改变其含义、强度和范围）
请读取 `{WORK_DIR}/00_anchor_points.md` 获取 anchor points。润色时可以改善 anchor point 的语言表达，但不得改变其学术含义、论证强度或适用范围。

### 待润色文本
请读取 `{WORK_DIR}/05_revision_r2.md` 获取待润色文本。

### 约束
1. 不改变逻辑结构和论证链条
2. 不使用 \textbf{} 标记修改，输出干净的 LaTeX 文本
3. 所有 (ref) 标记保持不变
4. 所有已有的 \citep{}/\citet{} 引用保持不变
5. 所有修改记录在 Change Summary 中

### 输出要求
按照你的 Output Protocol 输出。
```

**Checkpoint**：将 language-polisher 输出保存到 `{WORK_DIR}/06_polished.md`。

## 步骤 6：生成输出文件

将整个流程的结果写入工作目录：

### 文件 1：`{WORK_DIR}/changelog.md`

```markdown
# {Section} — Draft Changelog

## Date: {current date}
## Mode: Draft (from outline)
## Work Directory: {WORK_DIR}

## Anchor Points
{list all anchor points}

## Round 1 — Review
{strict-reviewer Round 1 review summary}

## Round 1 — Revision
{sci-writer Round 1 revision summary}

## Round 2 — Review
{strict-reviewer Round 2 review summary}

## Round 2 — Revision
{sci-writer Round 2 revision summary}

## Language Polish
{language-polisher Change Summary}

## Final Word Count: {final word count}
## Drift Check: {whether all anchor points are intact}
```

### 文件 2：`{WORK_DIR}/final.md`

````markdown
# {Section} — Final Draft

> Ready to copy into the manuscript

```latex
{final LaTeX text from language-polisher}
```

## Target location in manuscript: {section location in manuscript}
## Final word count: {final word count}
````

### 文件 3（便捷入口）：`drafts/{Section}_latest_final.md`

复制 `{WORK_DIR}/final.md` 的内容到此文件。此文件始终指向该 section 最新一次运行的结果，方便快速访问。**注意**：如果此文件已存在，直接覆盖（这是设计行为，历史版本保存在带时间戳的工作目录中）。

## 步骤 7：完成提示

向用户显示：
1. 工作流完成状态
2. 工作目录路径：`{WORK_DIR}/`
3. 便捷入口：`drafts/{Section}_latest_final.md`
4. 字数统计
5. Anchor points 完整性状态
6. Checkpoint 文件清单（列出工作目录中所有文件）
7. 提醒用户检查 `{WORK_DIR}/final.md`，确认后手动合并到主文件
