# Manuscript Progress

> **Paper**: How digital communication tools use shapes improvisation capability in large-scale construction projects: The role of meta-knowledge
> **Target journal**: International Journal of Project Management (IJPM)
> **Theory**: Distributed Cognition Theory
> **Method**: Three-wave time-lagged survey, n=255, CB-SEM (R lavaan)
> **Last updated**: 2026-03-07

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
| | Authors & affiliations | 🔧 | Blinded for submission; coverletter.tex email TODO |
| | Abstract | ✅ | 150-word structured abstract |
| | Keywords | ✅ | 5 keywords |
| **1. Introduction** | ¶1--¶6 | ✅ | Fully revised + polished (polish/001.md) |
| **2. Theoretical foundations and hypotheses development** | 2.1 IC in large-scale construction projects | ✅ | Polished |
| | 2.2 DCT use in project teams | ✅ | Contains Table 1 (antecedent literature) |
| | 2.3 Meta-knowledge in project teams | ✅ | SM/RM/PM conceptualized |
| | 2.4 Distributed cognition perspective | ✅ | Theoretical lens |
| | 2.5 Hypotheses development (2.5.1--2.5.4) | ✅ | 18 hypotheses: H1--H2 (DCT→MK), H3--H5 (MK→IC), H6 (mediation) |
| **3. Methodology** | 3.1 Data collection | ✅ | Three-wave design; N=255; eligibility criteria |
| | 3.2 Bias control and evaluation | ✅ | Ethics; CMB procedural + statistical (Harman + CFA); non-response bias |
| | 3.3 Measures | ✅ | All scales cited; 5 control variables |
| **4. Results** | 4.1 Reliability and validity | ✅ | CFA (lavaan); Tables 2--3 inserted |
| | 4.2 Hypothesis testing | ✅ | Full SEM results; Tables 4--5 inserted |
| | 4.3 Robustness checks | ✅ | Three-wave temporal precedence + second-order IC model (Table 6) |
| **5. Discussion** | 5.1 Main findings | ✅ | Three subsubsections (asymmetric, differentiated, mediating) |
| | 5.2 Theoretical implications | ✅ | Three contributions |
| | 5.3 Practical implications | ✅ | Five recommendations |
| | 5.4 Limitations and future research | ✅ | Three limitations |
| **6. Conclusion** | — | ✅ | Summary + contributions + caveats |
| **Back matter** | Data availability | ✅ | |
| | Acknowledgments | ❌ | Empty |
| | Declaration of competing interest | ✅ | |
| | References | ✅ | All citations resolved |
| **Appendix** | Survey items (Table A) | ✅ | All measurement items with SFL values |

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
- Table 1 (antecedent literature) --- ✅ present
- Table 2 (demographic information) --- ✅ inserted
- Table 3 (validity and construct correlations) --- ✅ inserted
- Table 4 (hypotheses testing / SEM paths) --- ✅ inserted
- Table 5 (mediating results) --- ✅ inserted
- Table 6 (robustness: second-order IC model) --- ✅ inserted

**M2: Fig. 1 placeholder**
- L170: `[Insert Fig. 1 here]` --- conceptual/research model figure not yet created
- **Action**: Create figure and replace placeholder

**M3: Table 1 too large for page**
- LaTeX warning: "Float too large for page by 264.56pt on input line 193"
- **Action**: Reduce font size or split table across pages

**M4: Author emails partially resolved**
- `manuscript.tex`: Emails filled in (commented out, blinded for submission) ✅
- `coverletter.tex` L58: `TODO@just.edu.cn` still present
- **Action**: Update coverletter email before unblinding

**M5: ~~Keywords insufficient~~ RESOLVED (2026-03-07)**
- Currently 5 keywords: Digital communication tools, Meta-knowledge, Improvisation capability, Distributed cognition, Large-scale construction projects

### MINOR

**m1: Acknowledgments section empty**
- L374: `\section*{Acknowledgments}` has no content
- **Action**: Add funding information and acknowledgments

**m2: ~~Appendix not included~~ RESOLVED (2026-03-06)**
- Appendix A (Survey items) with Table A now included at end of manuscript (L660+)
- Contains all measurement items with standardized factor loadings (SFL)

---

## Compilation status

- **Engine**: pdfLaTeX + BibTeX
- **Build output**: root directory (no `build/` subdirectory)
- **Last successful compile**: 2026-03-06
- **Warnings**: 0 undefined citations; 1 float too large (Table 1)
- **`(ref)` markers**: 0 remaining
- **Track-changes**: `tools/make-diff.sh` + `tools/fix-diff-citations.pl` (auto-triggered on save via latexmkrc)

---

## Change log

### 2026-03-06 --- Methodology revision + robustness checks rewrite
- **Sec 3.1**: Three-wave design (T1/T2/T3), N=255 (567→409→313→255), eligibility criteria consolidated (≥US$100M per Harrison 2024, ≥6 months, regular DCT use), gift compensation added
- **Sec 3.2**: Renamed to "Bias control and evaluation"; added ethics statement, CMB procedural remedies, Harman single-factor test (32.38%), CFA model comparison (Δχ²(21)=1418.28), non-response bias test
- **Sec 3.3**: Control variables expanded from 3 to 5 (added project type, professional qualifications)
- **Sec 4.3**: Completely rewritten — removed flawed reverse causality / DWH tests; added three-wave temporal precedence + second-order IC model robustness check
- **Table 6**: New table — second-order IC model (Panel A: structural paths, Panel B: indirect effects)
- **References**: Fixed lavaan citation (rosseel2012), added harrison2024Scale, charoensukmongkol2019, faul2009Statistical, carmeli2021, zaman2024
- **R scripts added**: `cfa_n255.R`, `cmb_test.R`, `nonresponse_bias_test.R`, `sem_5controls.R`, `reverse_causality.R`, `robustness_2nd_order.R`

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

1. **Fig. 1** --- create and insert conceptual model figure
2. **Table 1 overflow** --- fix float-too-large warning
3. **Sec 3--6 language polish** --- run language-polisher Mode B
4. **Acknowledgments** --- add funding and acknowledgment information
5. **Author emails** --- fill in TODO placeholders before unblinding
6. **Attrition analysis** --- deferred; needs T-test/chi-square data (see method_revision_plan.md #4)
