# Manuscript Progress

> **Paper**: How digital communication tools use shapes improvisation capability in large-scale construction projects: The role of meta-knowledge
> **Target journal**: International Journal of Project Management (IJPM)
> **Theory**: Distributed Cognition Theory
> **Method**: Time-lagged survey, n=355, CB-SEM (Mplus 8)
> **Last updated**: 2026-03-04 (Track-changes citation line-break fix)

## Status legend

| Icon | Meaning |
|------|---------|
| ✅ | Complete --- written and reviewed |
| 🔧 | Needs revision --- known issues pending |
| ❌ | Empty or placeholder only |
| 📝 | Draft merged --- not yet fully reviewed |

---

## Section completion status

| Section | Subsection | Status | Notes |
|---------|-----------|--------|-------|
| **Frontmatter** | Title | ✅ | |
| | Authors & affiliations | 🔧 | Blinded for submission; two TODO emails (Gan, Zhang) |
| | Abstract | ✅ | 150-word structured abstract |
| | Keywords | 🔧 | 4 keywords; IJPM typically expects 5--6 |
| **1. Introduction** | ¶1 Background + IC definition + case | ✅ | IC defined with knowledge mobilization; HZM Bridge case |
| | ¶2 Antecedent literature → Gap | ✅ | Three streams + communication technology gap |
| | ¶3 DCT importance → Gap | ✅ | Large-scale vs conventional contrast; traditional mechanisms too slow; DCT uniqueness |
| | ¶3.5 DCT use dimensions → Aim 1 | ✅ | Work-oriented vs social-oriented from practice; Aim 1 (bold+italic) |
| | ¶4 Meta-knowledge → Aim 2 | ✅ | Practice-driven MK intro (info density + overload argument); PM gap; Aim 2 (bold+italic) |
| | ¶5 Study overview + theory + RQs | ✅ | Study scope → 3 MK dimensions → method → DCT justify → 2 RQs (no contributions in intro) |
| | ¶6 Structure preview | ✅ | Section roadmap |
| **2. Literature review** | 2.1 IC and DCT usage in project teams | 📝 | Contains Table 1 (antecedent literature) |
| | 2.2 Meta-knowledge in project teams | 📝 | SM/RM/PM conceptualized; procedural MK introduced |
| | 2.3 Mechanisms linking DCT usage and IC: DCT perspective | 📝 | Distributed cognition lens |
| **3. Hypothesis development** | 3.1 DCT usage and meta-knowledge (H1a--H1c) | ✅ | WU → SM/RM/PM |
| | 3.2 Social use and meta-knowledge (H2a--H2c) | ✅ | SU → SM/RM/PM |
| | 3.3 Meta-knowledge and IC (H3--H5) | ✅ | SM/RM/PM → IMM/CRE |
| | 3.4 Mediating role (H6a--H6l) | ✅ | 12 mediation hypotheses |
| **4. Methodology** | 4.1 Data collection | ✅ | Two-wave design; 355 valid responses |
| | 4.2 Measures | ✅ | All scales cited with sources |
| **5. Results** | 5.1 Reliability and validity | ✅ | CFA results reported; Tables 2--3 inserted |
| | 5.2 Hypothesis testing | ✅ | Full SEM results; Tables 3--4 inserted |
| | 5.3 Endogeneity and robustness checks | ✅ | Reverse causality + Durbin--Wu--Hausman test |
| **6. Discussion** | 6.1 Main findings | ✅ | Three subsubsections (asymmetric effects, differentiated effects, mediating role) |
| | 6.2 Theoretical implications | ✅ | Three contributions articulated |
| | 6.3 Practical implications | ✅ | Five actionable recommendations |
| | 6.4 Limitations and future research | ✅ | Three limitations acknowledged |
| **7. Conclusion** | — | ✅ | Summary of findings + contributions + caveats |
| **Back matter** | Data availability | ✅ | |
| | Acknowledgments | ❌ | Empty |
| | Declaration of competing interest | ✅ | |
| | References | 🔧 | 4 undefined citations (see CRITICAL C1 below) |

---

## Variable system

| Abbreviation | Full name | Role |
|-------------|-----------|------|
| WU | Work-oriented use (of DCTs) | Independent variable |
| SU | Social-oriented use (of DCTs) | Independent variable |
| SM | Structural meta-knowledge | Mediator |
| RM | Relational meta-knowledge | Mediator |
| PM | Procedural meta-knowledge | Mediator |
| IMM | Immediacy (of IC) | Dependent variable |
| CRE | Creativity (of IC) | Dependent variable |

---

## Open issues

### CRITICAL --- require action

**C1: ~~4 undefined bib entries~~ RESOLVED (2026-03-03)**
- `kyriakopoulos2011` --- ✅ added to xq01.bib
- `liu2023` --- ✅ added to xq01.bib
- `brownEisenhardt1997` --- ✅ added to xq01.bib
- `zhang2026Knowledge` --- removed from manuscript; 2 `(ref)` markers left at L207 (Sec 2.2) and L245 (Sec 3.2) pending user-provided citation

### MODERATE

**M1: ~~Tables 2--5 not yet inserted~~ RESOLVED (2026-03-06)**
- Table 1 (demographic information) --- ✅ L440
- Table 2 (validity and construct correlations) --- ✅ L501
- Table 3 (hypotheses testing / SEM paths) --- ✅ L533
- Table 4 (mediating results) --- ✅ L579
- Table 5 (measurement items) --- ✅ L625

**M2: Fig. 1 placeholder**
- L222: `[Insert Fig. 1 here]` --- conceptual/research model figure not yet created
- **Action**: Create figure and replace placeholder

**M3: Table 1 too large for page**
- LaTeX warning: "Float too large for page by 264.56pt on input line 193"
- **Action**: Reduce font size or split table across pages

**M4: Author emails missing**
- L76: `TODO@just.edu.cn` (Gan Xueqing, corresponding author)
- L78: `TODO@tongji.edu.cn` (Zhang Zhe)
- **Action**: Fill in correct email addresses before unblinding

**M5: Keywords insufficient**
- Currently 4 keywords; IJPM typically expects 5--6
- **Action**: Add 1--2 keywords (e.g., "Distributed cognition", "Construction project teams")

### MINOR

**m1: Acknowledgments section empty**
- L436: `\section*{Acknowledgments}` has no content
- **Action**: Add funding information and acknowledgments

**m2: Appendix not included**
- L330 references "reported in the Appendix" for measurement items, but no appendix exists in the document
- **Action**: Create appendix with full measurement scales

---

## Compilation status

- **Engine**: pdfLaTeX + BibTeX
- **Build output**: root directory (no `build/` subdirectory)
- **Last successful compile**: 2026-03-04
- **Warnings**: 7--8 undefined citations (bib entries needed) + 1 float too large (Table 1)
- **`(ref)` markers**: 2 remaining at L207 and L245 (pending `zhang2026Knowledge` replacement)
- **Track-changes**: `tools/make-diff.sh` + `tools/fix-diff-citations.pl` (auto-triggered on save via latexmkrc)

---

## Change log

### 2026-03-04 --- Track-changes citation line-break fix
- **Problem**: latexdiff wraps `\citep`/`\citet` in `\mbox{}`, preventing multi-citation references from breaking across lines in track-changes PDF (overfull hbox)
- **Fix**: Added `tools/fix-diff-citations.pl` post-processing script, called by `make-diff.sh`:
  1. Strips `\mbox{%DIFAUXCMD...}\hskip0pt%DIFAUXCMD` wrappers from all citations (fixes blue added text)
  2. Extracts citations from `\DIFdel{...}` blocks into `{\color{delcolor}\citep{...}}` (fixes red deleted text — citations keep red color but lose strikethrough so they can line-break)
  3. Cleans up empty `\DIFdel{}` remnants
- **Preamble** (`tools/latexdiff-preamble.tex`): kept `\sout` strikethrough for `\DIFdel`; citations handled by post-processing
- **Result**: Overfull hbox warnings reduced from 47 → 27; no compilation errors
- **`make-diff.sh`**: Also improved exit logic — checks PDF existence instead of latexmk return code (unresolved citations are non-fatal)

### 2026-03-03 --- Introduction complete revision (all paragraphs)
- **¶1 (L118)**: Rewrote IC definition to include "rapidly mobilizing and recombining existing knowledge and resources"; merged redundant sentences; added Moorman+Miner refs for core IC features; removed unsupported "resource constraints"
- **¶2 (L120)**: Fixed "none of studies" → "no study has"; changed "technological infrastructure" → "communication technology"; "contribute" → "contributes" (subject-verb agreement)
- **¶3 (L122)**: Split opening sentence + added magni2009 ref; added large-scale vs conventional project comparison with 3 positioned refs; added traditional mechanism contrast + DCT "uniquely positioned" argument; changed "Despite" → "However"
- **¶3.5 (L124)**: New paragraph --- DCT use dimensions from practice (not literature-driven); work-oriented vs social-oriented with examples; Aim 1 added (bold+italic); reduced dash usage
- **¶4 (L126)**: Rewrote meta-knowledge introduction --- practice-driven (info density + time pressure + overload consequence); PM gap (knowledge vs meta-knowledge); removed redundant S2/S4 overlap and S3 appositive; added treem2013, leonardi2015Ambient, sun2021Dark refs; Aim 2 added (bold+italic)
- **¶5 (L128)**: Restructured --- study scope first, then 3 MK dimensions (with parenthetical definitions), then method, then DCT theory + justification; removed contributions (moved to Discussion); reduced 3 RQs to 2 RQs; reduced dash usage
- **Formatting**: Removed excessive em-dashes (4 → 1 pair in intro); added bold+italic to IC, DCTs, meta-knowledge first definitions and both Aim statements; suppressed overfull hbox warnings in VS Code

### 2026-03-03 --- Introduction ¶2--¶5 initial rewrite + progress.md creation
- **¶1 (L118)**: Replaced 5 `(ref)` markers with proper citations; replaced inaccurate bridge silt example with documented HZM Bridge final joint re-docking case; added `21cbh2018Redocking` bib entry
- **¶2 (L120)**: Fixed flawed "common limitation" gap statement → "notable absence"; unified terminology to IC
- **¶3 (L122)**: Added transition bridge sentence; restructured Gap 2 + Gap 3; removed Chinese annotation; added meta-knowledge hint
- **¶4 (L124)**: Wrote new meta-knowledge paragraph (replaced Chinese placeholder "元知识段落。")
- **¶5 (L126)**: Wrote new DCT theory + research overview paragraph (replaced Chinese placeholder)
- **Compilation**: Resolved 93 undefined citation warnings (BibTeX hadn't run); reduced to 4 genuinely missing bib entries
- **Created** `progress.md` (this file)

### 2026-02-24 --- Literature review table and language toolchain
- Added Table 1 (antecedent literature review, `tab:antecedents`)
- Added language style guide for academic English quality
- Added Mode B polisher output persistence workflow

### 2026-02-24 --- Build engine switch
- Switched from XeLaTeX to pdfLaTeX (with XeLaTeX fallback in latexmkrc)
- Added auto track-changes toolchain (latexdiff)
- Fixed BibTeX key unicode issues

### 2026-02-22 --- Initial manuscript assembly
- Assembled all sections into single `manuscript.tex`
- IJPM submission format configured (elsarticle, authoryear)

---

## Next writing priorities

1. **Literature review (Sec 2)** --- review and revise 2.1, 2.2, 2.3 (currently draft status)
2. **Tables 2--5** --- insert regression/mediation/hypothesis summary tables from Mplus output
3. **Fig. 1** --- create and insert conceptual model figure
4. **Table 1 overflow** --- fix float-too-large warning
5. **Keywords** --- expand to 5--6 terms
6. **Appendix** --- add measurement scale items
7. **Acknowledgments** --- add funding and acknowledgment information
8. **Author emails** --- fill in TODO placeholders before unblinding
