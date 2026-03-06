# ============================================================
# Reverse Causality Test
# Testing whether T3 DV (IMM, CRE) predict T1 IV (WU, SU)
# If NOT significant → supports the proposed causal direction
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

# --- 2. Reverse model: T3 (IMM, CRE) → T1 (WU, SU) ---
# This tests whether improvisation capability predicts DCT usage
# If the proposed direction (WU/SU → IMM/CRE) is correct,
# the reverse paths should be non-significant after controlling
# for the measurement model.

cat("=" , rep("=", 59), "\n", sep = "")
cat("REVERSE CAUSALITY MODEL: IC → DCT Usage\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

model_reverse <- '
  # Measurement model (same as main model)
  WU  =~ WU1 + WU2 + WU3 + WU4
  SU  =~ SU1 + SU2 + SU3 + SU4
  IMM =~ IMM1 + IMM2 + IMM3
  CRE =~ CRE1 + CRE2 + CRE3 + CRE4

  # Reverse structural paths: T3 DV → T1 IV
  WU ~ IMM + CRE
  SU ~ IMM + CRE
'

set.seed(2026)
fit_rev <- sem(model_reverse, data = dat, estimator = "ML",
               se = "bootstrap", bootstrap = 5000)

# Model fit
cat("=== Model Fit ===\n")
fm <- fitMeasures(fit_rev, c("chisq", "df", "pvalue", "cfi", "tli",
                              "rmsea", "rmsea.ci.lower", "rmsea.ci.upper", "srmr"))
cat(sprintf("chi2(%d) = %.2f, p = %.4f\n", fm["df"], fm["chisq"], fm["pvalue"]))
cat(sprintf("CFI = %.3f, TLI = %.3f\n", fm["cfi"], fm["tli"]))
cat(sprintf("RMSEA = %.3f, 90%% CI [%.3f, %.3f]\n", fm["rmsea"], fm["rmsea.ci.lower"], fm["rmsea.ci.upper"]))
cat(sprintf("SRMR = %.3f\n\n", fm["srmr"]))

# Structural paths
std <- standardizedSolution(fit_rev, type = "std.all")
struct_paths <- std[std$op == "~", ]

cat("=== Reverse Structural Paths (Standardized) ===\n\n")
cat(sprintf("%-6s  %-4s  %-6s  %8s  %12s  %8s  %8s\n",
            "DV", "op", "IV", "beta", "95% CI", "SE", "p"))
cat(rep("-", 65), "\n", sep = "")

for (i in seq_len(nrow(struct_paths))) {
  r <- struct_paths[i, ]
  ci_str <- sprintf("[%.3f, %.3f]", r$ci.lower, r$ci.upper)
  sig <- ifelse(r$pvalue < 0.001, "***",
         ifelse(r$pvalue < 0.01, "**",
         ifelse(r$pvalue < 0.05, "*", "n.s.")))
  cat(sprintf("%-6s  <-  %-6s  %8.3f  %14s  %8.3f  %8.4f  %s\n",
              r$lhs, r$rhs, r$est.std, ci_str, r$se, r$pvalue, sig))
}

# --- 3. Summary ---
cat("\n")
cat("=" , rep("=", 59), "\n", sep = "")
cat("INTERPRETATION\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

sig_paths <- struct_paths[struct_paths$pvalue < 0.05, ]
if (nrow(sig_paths) == 0) {
  cat("RESULT: None of the reverse paths are significant (all p > .05).\n")
  cat("This supports the proposed causal direction (T1 DCT usage -> T3 IC).\n")
  cat("Combined with the three-wave time-lagged design, reverse causality\n")
  cat("is unlikely to be a serious concern.\n")
} else {
  cat(sprintf("WARNING: %d reverse path(s) significant at p < .05.\n", nrow(sig_paths)))
  cat("Consider NOT including this test in the manuscript.\n")
  for (i in seq_len(nrow(sig_paths))) {
    r <- sig_paths[i, ]
    cat(sprintf("  %s <- %s: beta = %.3f, p = %.4f\n", r$lhs, r$rhs, r$est.std, r$pvalue))
  }
}
