# Missing References Report

*Updated: 2026-02-23*

## 仍未解决 — 4 个 undefined cite key（需手动提供文献信息）

| cite key | 行号 | 引用上下文 | 备注 |
|----------|------|-----------|------|
| `kyriakopoulos2011` | 139 | IC概念定义："the real-time convergence of conception and execution" | bib 和 reflist 中均无 |
| `liu2023` | 139 | "This definition has since been widely adopted in subsequent research" | bib 和 reflist 中均无 |
| `brownEisenhardt1997` | 148 | meta-knowledge 早期研究："tasks require contributions from multiple specialists" | bib 和 reflist 中均无 |
| `zhang2026Knowledge` | 158, 196 | meta-knowledge在稳定团队vs临时团队 & SU对SM的作用 | **2026年疑似笔误**，bib 和 reflist 中均无 |

## 已解决 — 全部合并至 xq01.bib

> `xq01_additional.bib` 已弃用，所有条目已由用户手动整合至 xq01.bib。

### A. 新增 bib 条目（11项）

| xq01.bib 中的 key | 论文 | 来源 |
|-------------------|------|------|
| `okhuysen200910` | Okhuysen & Bechky (2009), Academy of Management Annals | 原 undefined |
| `faraj2000Coordinating` | Faraj & Sproull (2000), Management Science | 原 undefined + 替换错误的 `kane2000Coordinating` |
| `safadi2024Balancing` | Safadi (2024), MIS Quarterly | 原 undefined |
| `crossan2003Making` | Crossan & Sorrenti (2003), Routledge | 原 undefined |
| `pesämaa2021Publishing` | Pesämaa et al. (2021), IJPM | 原 undefined |
| `zhu2023Dynamics` | Zhu & Jin (2023), Applied Mathematics and Computation | 原纯文本引用 |
| `jiang2025Confronting` | Jiang et al. (2025), IJPM | 原纯文本引用 |
| `jia2025Knowledge` | Jia et al. (2025), IJPM | 原纯文本引用（年份从2024更正为2025） |
| `lewis2003Measuring` | Lewis K. (2003), Journal of Applied Psychology | 替换错误的 `lewis2021Dark` / `meyer2014Measuring` |
| `sun2021Dark` | Sun Y. et al. (2021), IJIM | 替换错误的 `sun2025Organic`（在L119/351处） |
| `perry-smith2017Creativity` | Perry-Smith & Mannucci (2017), AMR | 替换错误的 `perry-smith2014Social` |

### B. manuscript 引用修正汇总

| 行号 | 原引用 | 修正后 | 类型 |
|------|--------|--------|------|
| 119 | `sun2025Organic` | `sun2021Dark` | key 替换 |
| 121 | `(Zhu and Jin, 2023)` 纯文本 | `\citep{zhu2023Dynamics}` | 纯文本→citep |
| 141 | `lewis2021Dark` | `lewis2003Measuring` | key 替换 |
| 145 | `oostervink2025Knowledge` | `jia2025Knowledge` | key 替换（旧条目已删） |
| 150 | `lewis2021Dark` | `lewis2003Measuring` | key 替换 |
| 152, 189, 221, 281, 328, 339 | `kane2000Coordinating` | `faraj2000Coordinating` | key 替换（×6处） |
| 209 | `crossanSorrenti2003` | `crossan2003Making` | key 对齐 |
| 238 | `(Jiang et al., 2025)` 纯文本 | `\citep{jiang2025Confronting}` | 纯文本→citep |
| 272 | `(Zhu and Jin, 2023; jia2024Knowledge)` 纯文本 | `\citep{zhu2023Dynamics, jia2025Knowledge}` | 纯文本→citep |
| 276 | `oostervink2025Knowledge, meyer2014Measuring` | `jia2025Knowledge, becker2016Statistical` | key 替换（旧条目已删） |
| 328 | `perry-smith2014Social` | `perry-smith2017Creativity` | key 替换 |
| 351 | `sun2025Organic` | `sun2021Dark` | key 替换 |

---

## 编译状态

- **最初**: 18 次 undefined citation warning
- **当前**: 5 次 warning（4 个 key：`kyriakopoulos2011`, `liu2023`, `brownEisenhardt1997`, `zhang2026Knowledge`×2处）
