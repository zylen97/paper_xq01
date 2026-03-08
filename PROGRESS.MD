# Manuscript Progress

> **Paper**: How digital communication tools use shapes improvisation capability in large-scale construction projects: The role of meta-knowledge
> **Target journal**: International Journal of Project Management (IJPM)
> **Theory**: Distributed Cognition Theory
> **Method**: Three-wave time-lagged survey, n=255, CB-SEM (R lavaan)
> **Last updated**: 2026-03-09

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
| **3. Methodology** | 3.1 Data collection | ✅ | Three-wave design; N=255; polished (polish/002.md); Fig. 2 placeholder inserted |
| | 3.2 Bias mitigation and evaluation | ✅ | Ethics; CMB; non-response bias; polished |
| | 3.3 Questionnaire development | ✅ | Expert interview; pilot study (N=35); CITC > 0.4 |
| | 3.4 Measures | ✅ | All scales cited; 5 control variables; polished |
| | 3.5 Analytical methods | ✅ | CB-SEM justification (3 reasons); mediation bootstrap |
| **4. Results** | 4.1 Reliability and validity | ✅ | CFA (lavaan); Tables 2--3; polished (polish/003.md) |
| | 4.2 Hypothesis testing | ✅ | Full SEM results; Tables 4--5; polished |
| | 4.3 Robustness checks | ✅ | Second-order IC model (Table 6); polished |
| **5. Discussion** | 5.1 Main findings | ✅ | Three subsubsections (asymmetric, differentiated, mediating) |
| | 5.2 Theoretical implications | ✅ | Three contributions |
| | 5.3 Practical implications | ✅ | Five recommendations |
| | 5.4 Limitations and future research | ✅ | Three limitations |
| **6. Conclusion** | — | ✅ | Summary + contributions + caveats |
| **Back matter** | Data availability | ✅ | |
| | Acknowledgments | ✅ | NSFC 72371190, 72371189 (titlepage.tex) |
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

**M2: ~~Fig. placeholders~~ RESOLVED (2026-03-09)**
- Fig. 1 (conceptual model, H1a--H5b): `Figures/fig1.tex/pdf` → Sec 2.4
- Fig. 2 (data collection flowchart, three-wave): `Figures/fig2.tex/pdf` → Sec 3.1 (new)
- Fig. 3 (SEM structural results with path coefficients): `Figures/fig3.tex/pdf` → Sec 4.2 + Discussion RQ2
- Fig. 4 (distributed cognition system framework): `Figures/fig4.tex/pdf` → Sec 5.3
- All four placeholders inserted in manuscript; all four PDFs compiled clean

**M3: Table 1 too large for page**
- LaTeX warning: "Float too large for page by 264.56pt on input line 193"
- **Action**: Reduce font size or split table across pages

**M4: Author emails partially resolved**
- `manuscript.tex`: Emails filled in (commented out, blinded for submission) ✅
- `coverletter.tex` L58: `TODO@just.edu.cn` still present
- **Action**: Update coverletter email before unblinding

**M6: Level of analysis — RESOLVED (2026-03-08)** ✅
- All variables confirmed as project team-level (N=255 teams, key informant design)
- Appendix items, definitions, Measures, Discussion, Implications, Limitations all fully corrected
- 0 residual individual-level language conflicting with team-level framing

**M5: ~~Keywords insufficient~~ RESOLVED (2026-03-07)**
- Currently 5 keywords: Digital communication tools, Meta-knowledge, Improvisation capability, Distributed cognition, Large-scale construction projects

### MINOR

**m1: ~~Acknowledgments section empty~~ RESOLVED (2026-03-07)**
- `titlepage.tex`: NSFC funding (72371190, 72371189) added
- Removed empty Funding section (merged into Acknowledgments)

**m2: ~~Appendix not included~~ RESOLVED (2026-03-06)**
- Appendix A (Survey items) with Table A now included at end of manuscript (L660+)
- Contains all measurement items with standardized factor loadings (SFL)

---

## Compilation status

- **Engine**: pdfLaTeX + BibTeX
- **Build output**: root directory (no `build/` subdirectory)
- **Last successful compile**: 2026-03-08
- **Warnings**: 0 undefined citations; 0 undefined references; 1 float too large (Table A)
- **`(ref)` markers**: 0 remaining
- **Track-changes**: `tools/make-diff.sh` + `tools/fix-diff-citations.pl` (auto-triggered on save via latexmkrc)

---

## Change log

### 2026-03-09 --- Fig. 2 (data collection flowchart) + figure renumbering

**Fig. 2 created** (`Figures/fig2.tex`): Full data collection flowchart integrating all Sec 3.1 elements:
- Zone A: Sample source + Eligibility criteria (two side-by-side info boxes with outer border)
- Zone B: Time 1 → Time 2 (+1 month) → Time 3 (+1 month) cloud boxes with thick grey arrows
- Zone C: Variable boxes per wave (Demographics/WU/SU | SM/RM/PM | IMM/CRE)
- Zone D: Timeline with tick marks + response stats (567→409→313→255, phone-number matching)
- Vertical arrow from Zone A bottom to Time 1

**Figure renumbering** (data collection flowchart moved to Fig. 2 to match narrative order):
- Old Fig. 2 (SEM results) → Fig. 3; old Fig. 3 (DCT system) → Fig. 4
- `Figures/fig2.tex/pdf`, `fig3.tex/pdf`, `fig4.tex/pdf` renamed accordingly

**manuscript.tex** updates:
- Sec 3.1: added `The overall data collection process is illustrated in Fig. 2.` + placeholder
- Sec 4.2: Fig. 2 → Fig. 3
- Discussion RQ2: Fig. 2 → Fig. 3
- Sec 5.3: Fig. 3 → Fig. 4
- All four figure PDFs compiled clean (0 errors)

**Other manuscript changes (same session)**:
- Terminology: "DCT usage" → "DCT use" throughout; "participants" (survey) → "respondents"
- Hypothesis labels bolded (H1a–H6f) in Sec 2.5
- Subsubsection headings: DCT abbreviated → full name
- Power analysis: 6 → 8 predictors; minimum N 146 → 160
- Pilot study: "satisfactory psychometric properties" → "satisfactory internal consistency reliability (Cronbach's α > 0.70)"
- New Sec 3.3 Questionnaire development (expert interview + pilot study with CITC)
- New Sec 3.5 Analytical methods (CB-SEM justification: 3 reasons + mediation paragraph)
- Section reorder: 3.1 Data collection → 3.2 Bias mitigation → 3.3 Questionnaire development → 3.4 Measures → 3.5 Analytical methods
- Table/figure placeholders inserted for all Tables 1–6 and Figs. 1–4
- Fig. 1 (fig1.tex): removed vertical dashed separator line
- bib: added `anderson1988Structural`, `hair2019Multivariate`, `preacher2008Asymptotic`; fixed `pesämaa` → `pesamaa`

### 2026-03-08 --- Full team-level reconstruction (level of analysis overhaul)

**Background**: Data was collected with "Our team..." wording (N=255 project teams, one key informant per team). All variables are project team-level constructs. A previously applied individual-level reframing (Method A) has been fully reversed and replaced.

**Scope**: 35+ edits across the full manuscript — Appendix, all theory sections, Measures, Discussion, Implications, Limitations.

**Key changes**:
- **Appendix Table A (26 items)**: All survey items corrected to team-level wording
  - WU/SU: "In our project team, we use digital communication tools to..."
  - SM/RM: "Our team members have a good map of each other's..."
  - IMM: "Our project team deals with / thinks on its feet / responds in the moment..."
  - CRE: "Our project team tries / identifies / takes risks / demonstrates originality..."
- **Sec 2.1**: IC defined at team level ("Project teams' improvisation capability"; "the project team's responsiveness under time pressure")
- **Sec 2.2**: "team-level cognitive resources" (was "individual-level cognitive resources")
- **Sec 2.3**: SM/RM/PM definitions changed from "an individual's awareness" → "the project team's collective awareness"; deleted Method A anchoring sentence
- **Sec 2.4**: "enabling team members to navigate" (was "individuals")
- **Sec 2.5 (H1–H5 development)**: 9 instances of "individuals" → team-level throughout hypotheses arguments
- **Abstract**: "255 large-scale construction project teams"; "the project team's collective awareness"
- **Introduction**: 5 instances corrected — "antecedents of improvisation capability in project teams", "the project team's improvisation capability", "255 large-scale construction project teams, with one key informant per team", etc.
- **Sec 3.3 Measures**: Replaced individual-level justification sentence with key informant approach description
- **Discussion**: 5 instances — "the project team", "team-level cognitive resources", "the project team's immediacy and creativity", etc.
- **Sec 5.2 Theoretical implications**: "project teams develop the cognitive awareness"; "Project team improvisation capability depends on the team's collective awareness"
- **Sec 5.3 Practical implications**: "the team's shared awareness of standard workflows"
- **Sec 5.4 Limitations Second**: Replaced multilevel design limitation with key informant single-respondent limitation; Limitations Third: "team-level meta-knowledge"

**Verification**: `grep` — 0 residual `individual-level`, `individual awareness`, `individual's awareness`, `members' improvisation`, `project members'`; pdfLaTeX compiles clean (0 errors, 0 undefined).

### 2026-03-07b --- Figures + Acknowledgments
- **Fig. 1** (`Figures/fig1.tex`): Conceptual model — three-column layout (IV → MK → DV) with H1a–H5b hypothesis labels, uniform arrow style
- **Fig. 2** (`Figures/fig2.tex`): Structural model results — path coefficients with significance stars, dual-pathway mediator highlight (SM, orange), cognitive-capability alignment bands (blue: SU→RM→IMM, red: WU→PM→CRE)
- **manuscript.tex**: Inserted Fig. 1 placeholder (Sec 2.4), Fig. 2 placeholder (Discussion RQ2), Fig. 2 reference (Sec 4.2); "dominant mediator" → "dual-pathway mediator"
- **titlepage.tex**: Acknowledgments filled (NSFC 72371190, 72371189); removed empty Funding section

### 2026-03-07 --- Language polish Sec 3--4
- **Sec 3 (Methodology)**: 12/14 changes from polish/002.md applied — subject-verb agreement ("network includes"), terminology ("construction projects"), em dash→comma, passive→active, redundancy removal; skipped #5 ("The formal survey" kept) and #9 ("were asked to provide" kept)
- **Sec 4 (Results)**: 16 non-tense changes from polish/003.md applied — removed empty modifiers ("proposed", "empirical", "complex"), Fornell--Larcker en dash, "estimations"→"estimates", merged short sentences, robustness passive→active; present tense preserved throughout per user preference

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

1. **Table 1 overflow** --- fix float-too-large warning
2. **Sec 5--6 language polish** --- run language-polisher Mode B (Sec 3--4 done)
3. **Author emails** --- fill in TODO placeholders before unblinding
4. **Cover letter** --- update word count; fix email at L58
5. **Attrition analysis** --- deferred; needs T-test/chi-square data
