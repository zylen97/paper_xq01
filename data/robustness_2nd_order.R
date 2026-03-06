# ============================================================
# Robustness Check: Second-Order IC Model (No Controls)
# IC as a second-order reflective construct (IC =~ IMM + CRE)
# Compare with first-order model where IMM/CRE are separate DVs
# ============================================================

library(lavaan)

# --- 1. Read data ---
dat <- read.table("data/data.dat", header = FALSE, sep = "\t")
colnames(dat) <- c("id", "gen", "age", "exper", "edu", "type", "role",
                    "propo", "invest", "dura",
                    paste0("WU", 1:4), paste0("SU", 1:4),
                    paste0("SM", 1:3), paste0("RM", 1:3), paste0("PM", 1:3),
                    paste0("IMM", 1:3), paste0("CRE", 1:4),
                    paste0("TU", 1:4))

cat("N =", nrow(dat), "\n\n")

# --- 2. Second-order model ---
cat("=" , rep("=", 59), "\n", sep = "")
cat("SECOND-ORDER IC MODEL (no controls)\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

model_2nd <- '
  # First-order measurement model
  WU  =~ WU1 + WU2 + WU3 + WU4
  SU  =~ SU1 + SU2 + SU3 + SU4
  SM  =~ SM1 + SM2 + SM3
  RM  =~ RM1 + RM2 + RM3
  PM  =~ PM1 + PM2 + PM3
  IMM =~ IMM1 + IMM2 + IMM3
  CRE =~ CRE1 + CRE2 + CRE3 + CRE4

  # Second-order factor: IC measured by IMM and CRE
  IC =~ IMM + CRE

  # Structural model: IV → Mediators
  SM ~ WU + SU
  RM ~ WU + SU
  PM ~ WU + SU

  # Structural model: Mediators → IC (second-order)
  IC ~ SM + RM + PM + WU + SU
'

set.seed(2026)
fit_2nd <- sem(model_2nd, data = dat, estimator = "ML",
               se = "bootstrap", bootstrap = 5000)

# Model fit
cat("=== Model Fit ===\n")
fm <- fitMeasures(fit_2nd, c("chisq", "df", "pvalue", "cfi", "tli",
                              "rmsea", "rmsea.ci.lower", "rmsea.ci.upper", "srmr"))
cat(sprintf("chi2(%d) = %.2f, p = %.4f\n", fm["df"], fm["chisq"], fm["pvalue"]))
cat(sprintf("CFI = %.3f, TLI = %.3f\n", fm["cfi"], fm["tli"]))
cat(sprintf("RMSEA = %.3f, 90%% CI [%.3f, %.3f]\n", fm["rmsea"], fm["rmsea.ci.lower"], fm["rmsea.ci.upper"]))
cat(sprintf("SRMR = %.3f\n\n", fm["srmr"]))

# --- 3. Structural paths ---
std <- standardizedSolution(fit_2nd, type = "std.all")
struct_paths <- std[std$op == "~", ]

cat("=== Structural Paths (Standardized) ===\n\n")

# IV → Mediators (H1, H2)
cat("--- IV → Mediators ---\n")
cat(sprintf("%-6s  %-4s  %-6s  %8s  %16s  %8s  %8s  %s\n",
            "DV", "op", "IV", "beta", "95% CI", "SE", "p", "sig"))
cat(rep("-", 75), "\n", sep = "")

iv_med <- struct_paths[struct_paths$lhs %in% c("SM", "RM", "PM"), ]
for (i in seq_len(nrow(iv_med))) {
  r <- iv_med[i, ]
  ci_str <- sprintf("[%.3f, %.3f]", r$ci.lower, r$ci.upper)
  sig <- ifelse(r$pvalue < 0.001, "***",
         ifelse(r$pvalue < 0.01, "**",
         ifelse(r$pvalue < 0.05, "*", "n.s.")))
  cat(sprintf("%-6s  <-  %-6s  %8.3f  %16s  %8.3f  %8.4f  %s\n",
              r$lhs, r$rhs, r$est.std, ci_str, r$se, r$pvalue, sig))
}

# Mediators → IC (second-order)
cat("\n--- Mediators/IV → IC (second-order) ---\n")
cat(sprintf("%-6s  %-4s  %-6s  %8s  %16s  %8s  %8s  %s\n",
            "DV", "op", "IV", "beta", "95% CI", "SE", "p", "sig"))
cat(rep("-", 75), "\n", sep = "")

med_ic <- struct_paths[struct_paths$lhs == "IC", ]
for (i in seq_len(nrow(med_ic))) {
  r <- med_ic[i, ]
  ci_str <- sprintf("[%.3f, %.3f]", r$ci.lower, r$ci.upper)
  sig <- ifelse(r$pvalue < 0.001, "***",
         ifelse(r$pvalue < 0.01, "**",
         ifelse(r$pvalue < 0.05, "*", "n.s.")))
  cat(sprintf("%-6s  <-  %-6s  %8.3f  %16s  %8.3f  %8.4f  %s\n",
              r$lhs, r$rhs, r$est.std, ci_str, r$se, r$pvalue, sig))
}

# Second-order loadings
cat("\n--- Second-Order Loadings (IC =~ IMM + CRE) ---\n")
so_loadings <- std[std$op == "=~" & std$lhs == "IC", ]
for (i in seq_len(nrow(so_loadings))) {
  r <- so_loadings[i, ]
  cat(sprintf("IC =~ %-6s  loading = %.3f, p = %.4f\n", r$rhs, r$est.std, r$pvalue))
}

# --- 4. Indirect effects (mediation) ---
cat("\n")
cat("=" , rep("=", 59), "\n", sep = "")
cat("MEDIATION: INDIRECT EFFECTS (IV → MK → IC)\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

model_2nd_med <- '
  # First-order measurement model
  WU  =~ WU1 + WU2 + WU3 + WU4
  SU  =~ SU1 + SU2 + SU3 + SU4
  SM  =~ SM1 + SM2 + SM3
  RM  =~ RM1 + RM2 + RM3
  PM  =~ PM1 + PM2 + PM3
  IMM =~ IMM1 + IMM2 + IMM3
  CRE =~ CRE1 + CRE2 + CRE3 + CRE4

  # Second-order factor
  IC =~ IMM + CRE

  # Structural model
  SM ~ a1*WU + a4*SU
  RM ~ a2*WU + a5*SU
  PM ~ a3*WU + a6*SU

  IC ~ b1*SM + b2*RM + b3*PM + WU + SU

  # Indirect effects
  WU_SM_IC := a1*b1
  WU_RM_IC := a2*b2
  WU_PM_IC := a3*b3
  SU_SM_IC := a4*b1
  SU_RM_IC := a5*b2
  SU_PM_IC := a6*b3

  # Total indirect
  WU_total_ind := a1*b1 + a2*b2 + a3*b3
  SU_total_ind := a4*b1 + a5*b2 + a6*b3
'

set.seed(2026)
fit_2nd_med <- sem(model_2nd_med, data = dat, estimator = "ML",
                   se = "bootstrap", bootstrap = 5000)

std_med <- standardizedSolution(fit_2nd_med, type = "std.all")
ind_effects <- std_med[std_med$op == ":=", ]

cat(sprintf("%-14s  %8s  %16s  %8s  %8s  %s\n",
            "Path", "beta", "95% CI", "SE", "p", "sig"))
cat(rep("-", 70), "\n", sep = "")

for (i in seq_len(nrow(ind_effects))) {
  r <- ind_effects[i, ]
  ci_str <- sprintf("[%.3f, %.3f]", r$ci.lower, r$ci.upper)
  sig <- ifelse(r$pvalue < 0.001, "***",
         ifelse(r$pvalue < 0.01, "**",
         ifelse(r$pvalue < 0.05, "*", "n.s.")))
  # Check if CI excludes zero
  ci_excl <- ifelse(r$ci.lower > 0 | r$ci.upper < 0, "CI excl. 0", "CI incl. 0")
  cat(sprintf("%-14s  %8.3f  %16s  %8.3f  %8.4f  %-4s  %s\n",
              r$lhs, r$est.std, ci_str, r$se, r$pvalue, sig, ci_excl))
}

# --- 5. Comparison summary ---
cat("\n")
cat("=" , rep("=", 59), "\n", sep = "")
cat("COMPARISON: FIRST-ORDER vs SECOND-ORDER MODEL\n")
cat("=" , rep("=", 59), "\n\n", sep = "")
cat("If the direction and significance of core paths remain consistent\n")
cat("across both models, the findings are robust to the operationalization\n")
cat("of improvisation capability.\n")
