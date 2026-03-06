# Method 部分修改计划

> 基于 `literature_xq01/` 三份诊断报告，对 Section 3 (Methodology) + Section 4.1 (Reliability and validity) 的系统性修补。

---

## ⚠️ 重要更正（2026-03-06）

用户确认研究实际为**三波设计**（非两波），且样本量数字全面更新：
- **三波设计**：T1(IV+demographics) → T2(Mediators) → T3(DV)，各间隔 1 个月
- **样本量**：T1 发放 567 回收 409 → T2 回收 313 → 最终匹配 255（N=255）
- Section 4 的统计结果基于 N=255，是正确的
- 三波设计意味着 IV/Med/DV 完全时间分离，CMB 威胁大幅降低

---

## 修改项总览

| # | 修改项 | 优先级 | 位置 | 需要数据？ | 状态 |
|---|--------|--------|------|-----------|------|
| 1 | 伦理声明 | A（必修） | Sec 3.2 CMB control | 需确认 IRB | ✅ 已完成 |
| 2 | 时间滞后间隔理论论证 + 三波设计修正 | A | Sec 3.1/3.2 + Abstract + Intro | 否 | ✅ 已完成 |
| 3 | 程序性 CMB 补救措施描述 | A | Sec 3.2 CMB control | 需确认实际做法 | ✅ 已完成 |
| 4 | 流失者分析（Attrition analysis） | A（必修） | Sec 3.1 末尾 | 需跑 T 检验/卡方 | ⏸️ 暂缓 |
| 5 | 先验样本量计算 | B | Sec 3.1 第二段 | 否（G*Power） | ✅ 已完成 |
| 6 | CMB 统计检验 | A（必修） | Sec 4.1 末尾 | 需跑 Mplus 模型 | ✅ 已完成 |
| 7 | 控制变量扩展 | B | Sec 3.3 末段 | 需确认数据字段 + 重跑模型 | ✅ 已完成 |
| 8 | 有/无控制变量稳健性比较 | B | Sec 4.3 | 需跑模型 | ❌ 不做 |
| 9 | 预调研细节补充 | C | Sec 3.1 首段 | 需确认 EFA 结果 | ✅ 数字已更正(47份) |

---

## 已完成的修改

### 1. 伦理声明 ✅
**完成日期**：2026-03-06
- 无 IRB，采用方案 B：知情同意 + 自愿参与 + 保密承诺
- 写入 Sec 3.2 Common method bias control 段首

### 2. 时间滞后间隔理论论证 + 三波设计修正 ✅

**完成日期**：2026-03-06

**修改内容**：
1. **Abstract (L110)**：`355` → `255`，加 `Three-wave`
2. **Introduction (L132)**：`355` → `255`，加 `three-wave`
3. **L253**：`time-lagged survey design` → `three-wave time-lagged survey design`
4. **Data collection 段落**：完全重写
   - 新增时间间隔论证段（引用 Carmeli 2021 + Zaman 2024，三步法：方法论权威→构念特异性→情境稳定性）
   - 三波设计描述：T1(IV+demographics) → T2(Mediators) → T3(DV)
   - 数字全面更新：567→409→313→255
5. **xq01.bib**：添加 `zaman2024Stress` 和 `carmeli2021Resilience` 两条新条目

### 3. 程序性 CMB 补救措施描述 ✅
**完成日期**：2026-03-06
- 三波时间分离（IV/Med/DV 完全分开）+ 匿名保密 + 无对错答案 + 仅学术用途
- 单列 `\subsection{Common method bias control}`（Sec 3.2）

### 5. 先验样本量计算 ✅
**完成日期**：2026-03-06
- G*Power 3.1（Faul et al., 2009），min N=146，实际 N=255
- 添加 `faul2009Statistical` bib 条目

### 9. 预调研数字更正 ✅
**完成日期**：2026-03-06
- 预调研样本量从 137 更正为 47

### 结构调整 ✅
**完成日期**：2026-03-06
- CMB 事前控制从 Data collection 拆出，单列 Sec 3.2 Common method bias control
- 当前 Section 3 结构：3.1 Data collection → 3.2 Common method bias control → 3.3 Measures

---

## 待完成的详细方案

### 1. 伦理声明 ✅ 已完成
见上方"已完成的修改"。

---

### 2. 时间滞后间隔理论论证 ✅ 已完成
见上方"已完成的修改"。

---

### 3. 程序性 CMB 补救措施描述 ✅ 已完成
见上方"已完成的修改"。

---

### 4. 流失者分析（Attrition analysis） ⏸️ 暂缓
**位置**：Sec 3.1 末尾（non-response bias 段之后，或合并到该段）

**需要你跑的数据**：
- 比较 T1 完成但未完成全部三波的 154 人 vs 最终 255 人：
  - 人口统计：性别（卡方）、年龄（T 检验）、教育（卡方或 T 检验）
  - T1 变量：WU、SU 均值（独立样本 T 检验）
- 报告 p 值即可

**写法模板**（结果无显著差异时）：
> "To examine potential attrition bias, we compared respondents who completed all three survey waves (n = 255) with those who completed only the Time 1 survey (n = 154) on demographic characteristics and all Time 1 study variables. Independent-samples t-tests and chi-square tests revealed no significant differences between the two groups (all ps > .05), suggesting that attrition did not introduce systematic bias."

**写法模板**（结果有显著差异时）：
> 需要具体讨论哪些变量有差异，并在 Limitations 中承认。

---

### 5. 先验样本量计算 ✅ 已完成
**完成日期**：2026-03-06

**修改内容**：在 pilot study 段落末尾添加 G*Power 先验功效分析（Faul et al., 2009）。
- 参数：medium effect f²=0.15, α=.05, power=.95, 6 predictors → minimum N=146
- N=255 远超阈值
- 添加 `faul2009Statistical` bib 条目

---

### 6. CMB 统计检验 ✅
**完成日期**：2026-03-06
**位置**：Sec 3.2 Bias control and evaluation (L264)

**实际结果**：

**检验 1 — Harman 单因子检验**：
- 24 个测量题项，未旋转主成分分析
- 提取 7 个特征值 > 1.0 的因子
- 第一因子解释方差：**32.38%**，低于 40% 阈值 ✓

**检验 2 — CFA 模型对比**：
- 七因子模型：χ²(231) = 383.79, CFI = 0.947, TLI = 0.936, RMSEA = 0.051, SRMR = 0.049
- 单因子模型：χ²(252) = 1802.07, CFI = 0.496, TLI = 0.448, RMSEA = 0.155, SRMR = 0.124
- **Δχ²(21) = 1418.28, p < 0.001** → 七因子模型显著优于单因子模型 ✓

**结论**：CMB 不构成严重威胁

---

### 7. 控制变量扩展 ✅
**完成日期**：2026-03-06
**位置**：Sec 3.3 Measures 末段 (L273) + Table 4 (L533)

**扩展结果**：
- 原控制变量：性别、年龄、教育背景（3个）
- 新增控制变量：**项目类型 (ProjType)**、**专业资质 (ProfQual)**（共5个）
- 理论依据已写入 L273（不同项目类型的复杂度差异 + 不同职业角色的决策权与协调责任差异）

**控制变量路径结果**（Table 4）：
| 路径 | β | p | 结论 |
|------|---|---|------|
| Gender → IMM | 0.151 | 0.121 | 不显著 |
| Gender → CRE | −0.101 | 0.280 | 不显著 |
| Age → IMM | **−0.101** | **0.031** | **显著** |
| Age → CRE | 0.006 | 0.900 | 不显著 |
| Education → IMM/CRE | — | > 0.05 | 不显著 |
| ProjType → IMM/CRE | — | > 0.05 | 不显著 |
| ProfQual → IMM/CRE | — | > 0.05 | 不显著 |

**结论**：仅年龄对 IMM 有显著负效应，其余控制变量均不显著

---

### 8. 有/无控制变量稳健性比较 ❌ 不做
**位置**：Sec 4.3 Endogeneity and robustness checks

**修改方案**：
- 参照 Becker et al. (2016) 和 Jia et al. (2025)
- 跑一个不含控制变量的模型，比较核心路径系数是否变化
- 如果结果一致 → "The results remained substantively unchanged when control variables were excluded, supporting the robustness of our findings (Becker et al., 2016)."

**需要跑模型**：去掉控制变量（性别、年龄、教育）重跑一次 SEM

---

### 9. 预调研细节补充 ⬜
**位置**：Sec 3.1 首段（pilot study 段落）

**需要你确认**：
- 预调研是否做了 EFA？因子结构是否清晰？
- 是否有题项修改/删除？
- 预调研样本的人口统计特征

**修改方案**：
> "...yielding an effective response rate of 85.09%. Exploratory factor analysis (EFA) indicated that [k] factors emerged with eigenvalues above 1.0, collectively explaining [X]% of total variance, consistent with the hypothesized factor structure. The pilot results also indicated satisfactory internal consistency for all scales (Cronbach's α > 0.70), with no items requiring modification. These findings supported the suitability of the measurement instrument for the main study."

---

## 执行顺序建议

### Phase 1 — 纯写作 ✅ 全部完成
1. ~~✏️ #2 时间滞后论证~~ ✅（含三波设计修正 + 全文数字更新）
2. ~~✏️ #5 先验样本量计算~~ ✅（G*Power, Faul et al. 2009）

### Phase 2 — 需要确认信息 ✅ 全部完成
3. ~~❓ #1 伦理声明~~ ✅（无 IRB，知情同意）
4. ~~❓ #3 程序性 CMB 描述~~ ✅（单列 Sec 3.2）
5. ~~❓ #9 预调研细节~~ ✅（数字更正 47 份）

### Phase 3 — 需要跑数据（当前阶段）
6. ~~📊 **#6 CMB 统计检验**~~ ✅ 已完成
7. ~~📊 #4 流失者分析~~ ⏸️ 暂缓
8. ~~📊 #7 控制变量扩展~~ ✅ 已完成
9. ~~📊 #8 稳健性比较~~ ❌ 不做
