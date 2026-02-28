# Academic English Language Style Guide

> Derived from `~/.claude/agents/language-polisher.md`. Last synced: 2026-02-28. This file defines the language quality standards for all English academic text produced in this project. It applies to all interaction modes: direct conversation, `/draft`, and `/polish`.

---

## Sentence structure principle

**以简洁为默认，以复杂为例外。** Academic writing does not mean long sentences. 能用简单句清晰表达的，不要包装成复杂从句。

- Default to SVO (subject–verb–object); one core idea per sentence.
- If a sentence requires a second reading, split or rewrite it.
- Express complex logic with two short sentences + a connector, not one compound sentence.
- **Exception**: subordinate clauses are fine when they make causal, concessive, or conditional relations more compact (e.g., "Although X, Y" or "X, which enables Y"). Aim for varied rhythm, not uniformly short sentences.

---

## Preservation rules

**DO NOT change**:
- `(ref)` markers
- `\citep{}`, `\citet{}`, or any citation commands
- LaTeX commands, environments, labels, or structure
- Section/subsection titles
- Table content, figure captions, or mathematical expressions
- The meaning, scope, or strength of any academic claim
- Technical terminology and acronyms
- Proper nouns
- Data values or statistical results

---

## Category A: Verb–noun collocation errors

The most common Chinglish pattern — direct translation from Chinese using the wrong verb.

| Chinglish (wrong) | Natural English (correct) | Chinese origin |
|---|---|---|
| "improve the level of..." | "enhance...", "raise the standard of..." | 提高...水平 |
| "put forward a method/framework" | "propose", "introduce", "develop" | 提出 |
| "make a discussion/analysis" | "discuss", "analyze" (use the verb directly) | 进行讨论/分析 |
| "obtain results/findings" | "yield results", "produce findings", "generate insights" | 获得结果 |
| "realize the goal/transformation" | "achieve the goal", "accomplish the transformation" | 实现 |
| "promote the development of..." | "foster", "facilitate", "advance", "drive" | 促进发展 |
| "strengthen the management" | "improve management practices", "enhance management" | 加强管理 |
| "give full play to resources" | "leverage resources", "capitalize on", "harness" | 发挥资源作用 |
| "solve the problem" (overused) | "address the issue", "tackle the challenge", "mitigate" | 解决问题 |
| "has important/great significance" | "is significant", "is important", "matters because..." | 具有重要意义 |
| "make contributions to" | "contribute to" (use verb directly) | 做出贡献 |
| "attract wide attention" | "has garnered considerable scholarly interest", "has received growing attention" | 引起广泛关注 |
| "provide reference for" | "inform", "offer insights for", "guide" | 提供参考 |
| "do research on" | "investigate", "examine", "explore" | 做研究 |
| "play an important role in" | "is critical to", "contributes significantly to", "is central to" (vary!) | 发挥重要作用 |
| "enrich the theory of" | "extend", "advance", "contribute to the theoretical understanding of" | 丰富理论 |

---

## Category B: Chinglish sentence patterns

Sentence-level patterns that signal non-native writing. Rewrite completely.

1. **"With the development of X, Y..."** (随着X的发展) — Replace with specific causal/temporal statements.
   - ❌ "With the development of digital technology, the construction industry has undergone transformation."
   - ✅ "Digital technologies have **transformed** the construction industry over the past decade."

2. **"In recent years..." / "Nowadays..."** (近年来/当今) — Be specific.
   - ❌ "In recent years, more and more scholars have studied this topic."
   - ✅ "**Since 2018, a growing body of research has examined** this topic."

3. **"More and more..."** (越来越多) — Always replace.
   - ✅ "**An increasing number of** enterprises **are adopting**..." / "Digital adoption **continues to grow**."

4. **"Not only...but also..."** (不仅...而且) — Overused. Vary with: "X as well as Y", "Beyond X, Y also...", "In addition to X, Y..."

5. **Topic-comment structure** (主题-评述) — Restructure into SVO.
   - ❌ "About the relationship between X and Y, this study finds..."
   - ✅ "This study finds that X **relates to** Y..."

6. **"On the one hand...on the other hand..."** — Only for genuine contrast. For addition, use "Moreover", "Furthermore".

7. **"X, so Y" / "So, X..."** — Too informal.
   - ✅ "**Given** the limited sample size, the results may not be generalizable."

8. **"The reason is that..." / "The reason why...is because..."** — Redundant.
   - ✅ "This construct matters **because** it creates sustained advantage."

---

## Category C: Adjective–noun collocation errors

| Chinglish | Natural English | Chinese origin |
|---|---|---|
| "big/large influence" | "significant influence", "substantial impact" | 大的影响 |
| "deep research" | "in-depth research", "thorough investigation" | 深入研究 |
| "wide application" | "widespread adoption", "broad application" | 广泛应用 |
| "high efficiency" | "greater efficiency", "improved efficiency" | 高效率 |
| "obvious effect" | "pronounced effect", "notable effect" | 明显效果 |
| "serious problem" | "critical issue", "pressing challenge" | 严重问题 |
| "fast development" | "rapid development", "accelerated growth" | 快速发展 |
| "strong ability" | "robust capability", "considerable capacity" | 强能力 |

---

## Category D: Preposition and article errors

**Article omission** — the single most frequent error:
- ❌ "Construction industry faces..." → ✅ "**The** construction industry faces..."
- ❌ "Result shows that..." → ✅ "**The** result**s** show that..."

**Preposition misuse**:
- "different with" → "different **from**"
- "based in the theory" → "based **on** the theory"
- "research about X" → "research **on** X"
- "contribute for" → "contribute **to**"
- "according with" → "**consistent** with" / "**in accordance** with"
- "aim at doing" → "aim **to do**"
- "superior than" → "superior **to**"

---

## Category E: Redundancy and nominalization

Compress ruthlessly.

| Verbose | Concise |
|---|---|
| "carry out an investigation of" | "investigate" |
| "make an analysis of" | "analyze" |
| "conduct a comparison between" | "compare" |
| "due to the fact that" | "because" |
| "in the process of" | "during" / "while" |
| "for the purpose of" | "to" |
| "in order to" | "to" |
| "a large number of" | "many" / "numerous" |
| "at the present time" | "currently" |
| "in spite of the fact that" | "although" / "despite" |
| "it is worth noting that" | (delete — just state the point) |
| "it can be seen that" | (delete — just state the finding) |
| "as we all know" / "it is well known that" | (delete or replace with a citation) |

---

## Category F: Logical connectors and enumeration

**Enumeration rule**: Use simple ordinal markers for parallel points: **First, ... Second, ... Third, ...**
- ❌ "Moreover... Furthermore... In addition... Besides..." (fancy connectors for parallel items)
- ✅ "First, ... Second, ... Third, ..."

**Other connector fixes**:
- "Besides" at sentence start → "In addition"
- "What's more" → Too informal; remove or use ordinal
- "Hence" overused → Vary with "Therefore", "Thus", "Consequently"
- "Meanwhile" misused for addition → Only for simultaneous events
- "And" starting a sentence → Restructure
- Check that every logical connector accurately reflects the relationship (contrast, addition, cause, result)

---

## Category G: Singular/plural and subject–verb agreement

- "These result indicate..." → "These result**s** indicate..."
- "The data shows..." → "The data **show**..." (data is plural in academic English)
- "A number of studies has..." → "A number of studies **have**..."
- "Each enterprise have..." → "Each enterprise **has**..."
- "The findings suggests..." → "The findings **suggest**..."

---

## Category H: Tense consistency

| Section | Default tense | Rationale |
|---------|--------------|-----------|
| **Introduction** | Present | Stating established facts, current gaps, research aims |
| **Literature Review** | Present (general truths) + Past (specific prior studies) | "Smith (2020) found..." but "Meta-knowledge refers to..." |
| **Methods** | Past | Describing what was done |
| **Results** | Past | Reporting what was found |
| **Discussion** | Present (interpretations) + Past (referencing own results) | "This finding suggests..." but "The analysis revealed..." |
| **Conclusion** | Present (contributions) + Past (summary of findings) | Similar to Discussion |

**Paragraph-level rule**: Do NOT switch tenses within the same paragraph without clear reason.

**Common errors**:

| Error | Correction |
|---|---|
| "This study aims to explored..." | "This study aims to **explore**..." |
| "The results showed that X is important" (in Results) | "The results showed that X **was** important" |
| "We will use questionnaire survey" (in Methods) | "We **used** a questionnaire survey" |

---

## Category I: Academic register

**Informal → Academic verb substitutions**:

| Informal (do not use) | Academic (use instead) |
|---|---|
| get | obtain, acquire, achieve, derive |
| look at | examine, investigate, analyze |
| find out | determine, ascertain, identify |
| think | argue, contend, posit, maintain |
| help | facilitate, enable, support |
| need | require, necessitate |
| try | attempt, endeavor |
| start | initiate, commence |
| end | conclude, terminate |
| go up / go down | increase / decrease, rise / decline |
| kind of / sort of | (delete — state directly) |
| a lot of | considerable, substantial, numerous |
| really / very | (delete or use "substantially", "considerably") |
| things | factors, elements, aspects, components |
| big / small | significant / negligible, substantial / marginal |
| good / bad | favorable / adverse, beneficial / detrimental |

**Context-dependent**:
- "show": Keep for figures/tables ("Figure 3 shows..."). Replace for argumentation ("This **demonstrates** that...").
- "use": Keep for methods ("We use a survey method"). Replace for informal contexts ("They **employ/adopt** this...").

**Contraction ban**: don't → do not, can't → cannot, it's → it is, etc.

---

## Category J: Deep article rules

**Uncountable noun misuse**:

| Error | Correction |
|---|---|
| "a research" | "a study" / "research" (uncountable) |
| "an information" | "information" |
| "a knowledge" | "knowledge" |
| "an evidence" | "evidence" |
| "a literature" | "the literature" |
| "equipments" | "equipment" (no plural) |
| "softwares" | "software" (no plural) |
| "a feedback" | "feedback" |

**Specific vs. general — the/zero article**:

| Context | Rule | Example |
|---------|------|---------|
| First mention, general | Zero article or a/an | "Digital transformation is..." |
| First mention, specific | "the" | "The digital transformation of China's construction industry..." |
| Abstract concepts (general) | Zero article | "Knowledge management improves performance" |
| Abstract concepts (specific) | "the" | "The knowledge management practices adopted by..." |

**Fixed academic phrases** (non-negotiable):
- in **the** literature (NOT "in literature")
- in practice (NOT "in the practice")
- in theory (NOT "in the theory")
- in **the** context of (NOT "in context of")
- on **the** basis of (NOT "on basis of")
- to some extent (NOT "to some extents")
- in terms of (NOT "in term of")
- as a result (NOT "as the result", unless referring to a specific result)
- in **the** field of (NOT "in field of")

---

## Category K: Passive voice

**Passive preferred**: Methods (procedures), Results (statistical outcomes), agent unknown/irrelevant.

**Active preferred**: Contribution statements, research aims, result interpretation, hedged claims.

**Passive red flags** (must convert):

| Red flag | Fix |
|---|---|
| "It is believed/thought/considered that..." | State who: "Scholars argue that..." |
| "It can be seen that..." | Delete the shell; state the finding directly |
| "It should be noted that..." | Delete the shell; state the point directly |
| "It is interesting to note that..." | Delete entirely |
| "X was done by us/the authors" | "We did X" |

**Audit metric**: If a paragraph has > 60% passive sentences, convert 2-3 to active voice.

---

## Category L: Modifier precision

Scientific writing treats modifiers as precision instruments. In Chinese academic writing, however, modifiers are often used as decoration — to signal importance, add emphasis, or pad sentences. This creates a characteristic "hollow weight": the text feels dense but carries little additional information per modifier. Native readers perceive this as insecurity in the argument, not strength.

**Core principle: Every modifier must narrow scope, specify measurement, or disambiguate. Otherwise, delete it.**

**Type 1 — Empty intensifiers** (emphasis disguised as precision — delete or replace with evidence):

| Decorative | Scientific alternative | Why it fails |
|---|---|---|
| "very important" | "important" — or state WHY with evidence | "very" adds no measurable information |
| "extremely challenging" | "challenging" — or quantify: "requiring X resources" | same |
| "highly significant" (non-statistical) | "significant" — or cite effect size | confuses with statistical term |
| "greatly influenced" | "influenced" or "shaped" | "greatly" is unquantified |
| "particularly" / "especially" (no subset specified) | delete — or name the subset: "especially in SMEs" | only valid when selecting a specific subgroup |
| "significantly" (non-statistical) | delete, or "substantially" if emphasis genuinely needed | **Exception**: preserve when reporting statistical tests (p-values, confidence intervals) |

**Type 2 — Filler adverbs** (zero-information words — delete unconditionally):

| Filler | Example → Fix |
|---|---|
| basically | "This is basically a survey study" → "This is a survey study" |
| actually | "The results actually show..." → "The results show..." |
| essentially | "X is essentially a form of Y" → "X is a form of Y" |
| naturally | "This naturally leads to..." → "This leads to..." |
| obviously / clearly | "Obviously, X affects Y" → "X affects Y" — if it is obvious, the statement stands alone |
| certainly / indeed | "This is certainly relevant" → "This is relevant" |
| importantly | "Importantly, this study finds..." → "This study finds..." — let readers judge importance |

**Type 3 — Self-evaluative modifiers** (author declares quality instead of demonstrating it):

| Self-congratulatory | Why problematic | Fix |
|---|---|---|
| "novel approach" | novelty is demonstrated by the work, not declared | → "approach" — explain what is new in the content |
| "important contribution" | importance is judged by readers and reviewers | → "contribution" |
| "crucial role" | same — let the evidence show cruciality | → "role" |
| "key factor" | if you are discussing it, the reader already knows it matters | → "factor" |
| "unique perspective" | uniqueness must be shown, not claimed | → "perspective" |
| "innovative method" | innovation is for reviewers to assess | → "method" |

**Type 4 — Stacked synonymous modifiers** (two words, one meaning — keep the more precise one):
- ~~"critical and essential"~~ → "essential"
- ~~"important and significant"~~ → "significant"
- ~~"various and diverse"~~ → "diverse"
- ~~"new and innovative"~~ → "innovative"
- ~~"comprehensive and thorough"~~ → "thorough"
- **Rule**: when two modifiers overlap > 80% in meaning, keep the one with more precise denotation.

**Type 5 — Hedging clutter** (vague qualifiers that add false precision — either make precise or delete):

| Vague hedge | Fix | Keep only when... |
|---|---|---|
| "relatively important" | → "important" or add explicit comparison: "more important than X" | an explicit comparator follows |
| "somewhat surprising" | → "surprising" or explain the degree of surprise | a follow-up explanation specifies why |
| "certain factors" | → name the factors, or use "some factors" | "certain" = "specific unnamed" is genuinely intended |
| "particular characteristics" | → name them, or just "characteristics" | "particular" genuinely selects a subset |

**Audit metric**: Apply the three-function test (narrow scope / specify measurement / disambiguate) to every modifier in the text. A well-edited academic paragraph of 5-6 sentences should contain at most 3-4 modifiers that are NOT performing one of these three functions. Exceeding this threshold signals residual decoration.

---

## Category M: Em dash discipline

Chinese academic writing produced with AI assistance frequently overuses em dashes as generic connectors, replacing commas, colons, and semicolons that are more precise in academic English.

Em dashes (`---`) are reserved for exactly two uses:
1. **Strong parenthetical aside** that genuinely interrupts sentence flow
2. **Abrupt contrast** at sentence end where "but" or "however" would be weaker

**Substitution table**:

| Overused pattern | Correct replacement |
|---|---|
| `X---such as A, B, and C---Y` | comma: `X, such as A, B, and C, Y` or parentheses |
| `X---including A, B, and C` | comma: `X, including A, B, and C` |
| `X---from A to B---Y` | comma or split into two sentences |
| `X adopt Y---embedding A into Z---rather than W` | `X adopt Y by embedding A into Z, rather than W` |

**Structural variety**: Vary list-insertion structures across consecutive paragraphs (colon, parentheses, sentence split).

**Audit rule**: At most one em dash (or one em dash pair) per paragraph, only if it creates genuine dramatic effect. If more exist, replace all that serve as routine connectors.

---

## Basic grammar checklist (secondary priority)

After applying the categories above, also check:
1. Parallel structure in lists
2. Dangling modifiers: "Using [method], the results show..." → "**Through [method] analysis, this study reveals that**..."
3. Hedging balance: neither too many nor too few
4. Sentence length: split any sentence exceeding ~35 words
5. Repetitive sentence openings: vary "This study...", "The results...", "The findings..."
