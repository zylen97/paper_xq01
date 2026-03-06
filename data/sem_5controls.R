# SEM with 5 control variables (gen, age, edu, type, propo)
# Replicating the Mplus model in lavaan, adding ProjType and ProfQual controls

library(lavaan)

# --- Read data ---
dat <- read.table("data/data.dat", header = FALSE, sep = "\t")
colnames(dat) <- c("id", "gen", "age", "exper", "edu", "type", "role",
                    "propo", "invest", "dura",
                    paste0("WU", 1:4), paste0("SU", 1:4),
                    paste0("SM", 1:3), paste0("RM", 1:3), paste0("PM", 1:3),
                    paste0("IMM", 1:3), paste0("CRE", 1:4),
                    paste0("TU", 1:4))

cat("N =", nrow(dat), "\n")
cat("Columns =", ncol(dat), "\n\n")

# --- Model specification ---
model <- '
  # Measurement model
  WU  =~ WU1 + WU2 + WU3 + WU4
  SU  =~ SU1 + SU2 + SU3 + SU4
  SM  =~ SM1 + SM2 + SM3
  RM  =~ RM1 + RM2 + RM3
  PM  =~ PM1 + PM2 + PM3
  IMM =~ IMM1 + IMM2 + IMM3
  CRE =~ CRE1 + CRE2 + CRE3 + CRE4
  TU  =~ TU1 + TU2 + TU3 + TU4

  # Structural model
  SM  ~ WU + SU
  RM  ~ WU + SU
  PM  ~ WU + SU

  # DV regressions with 5 controls
  IMM ~ SM + PM + RM + gen + age + edu + type + propo + WU + SU
  CRE ~ SM + PM + RM + gen + age + edu + type + propo + WU + SU
'

# --- Fit model (ML estimator, bootstrap for CIs) ---
set.seed(2026)
fit <- sem(model, data = dat, estimator = "ML",
           se = "bootstrap", bootstrap = 5000)

cat("=== Model Fit ===\n")
print(fitMeasures(fit, c("chisq", "df", "cfi", "tli", "rmsea",
                          "rmsea.ci.lower", "rmsea.ci.upper", "srmr")))

# --- Extract standardized results ---
std <- standardizedSolution(fit, type = "std.all")

# Filter structural paths only
struct_paths <- std[std$op == "~", ]

cat("\n=== All Structural Paths (Standardized) ===\n")
print(struct_paths[, c("lhs", "op", "rhs", "est.std", "ci.lower", "ci.upper",
                        "se", "pvalue")], row.names = FALSE)

# --- Extract the 4 TODO paths ---
cat("\n\n========== TODO PATHS FOR TABLE 4 ==========\n")
todo_paths <- struct_paths[
  (struct_paths$lhs %in% c("IMM", "CRE")) &
  (struct_paths$rhs %in% c("type", "propo")),
]

for (i in seq_len(nrow(todo_paths))) {
  r <- todo_paths[i, ]
  cat(sprintf("\n%s -> %s:\n  Effect = %.3f\n  95%% CI = [%.3f, %.3f]\n  SE = %.3f\n  p = %.4f\n",
              r$rhs, r$lhs, r$est.std, r$ci.lower, r$ci.upper, r$se, r$pvalue))
}

# --- Also print the original 3 controls for comparison ---
cat("\n\n========== ORIGINAL 3 CONTROLS (for verification) ==========\n")
orig_controls <- struct_paths[
  (struct_paths$lhs %in% c("IMM", "CRE")) &
  (struct_paths$rhs %in% c("gen", "age", "edu")),
]
for (i in seq_len(nrow(orig_controls))) {
  r <- orig_controls[i, ]
  cat(sprintf("\n%s -> %s:\n  Effect = %.4f\n  95%% CI = [%.3f, %.3f]\n  SE = %.4f\n  p = %.4f\n",
              r$rhs, r$lhs, r$est.std, r$ci.lower, r$ci.upper, r$se, r$pvalue))
}

# --- Print ALL hypothesis paths for full comparison ---
cat("\n\n========== HYPOTHESIS PATHS (H1-H5) ==========\n")
hyp_paths <- struct_paths[
  (struct_paths$lhs %in% c("SM", "RM", "PM") & struct_paths$rhs %in% c("WU", "SU")) |
  (struct_paths$lhs %in% c("IMM", "CRE") & struct_paths$rhs %in% c("SM", "RM", "PM", "WU", "SU")),
]
for (i in seq_len(nrow(hyp_paths))) {
  r <- hyp_paths[i, ]
  cat(sprintf("\n%s -> %s:\n  Effect = %.4f\n  95%% CI = [%.3f, %.3f]\n  SE = %.4f\n  p = %.4f\n",
              r$rhs, r$lhs, r$est.std, r$ci.lower, r$ci.upper, r$se, r$pvalue))
}
