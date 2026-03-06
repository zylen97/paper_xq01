# ============================================================
# Full Measurement Model CFA on N=255
# For Section 4.1 Reliability and Validity
# ============================================================

library(lavaan)

# --- 1. Read data ---
raw <- read.delim("data/data.dat", header = FALSE, sep = "\t",
                   fileEncoding = "UTF-8-BOM")

col_names <- c("id", "gen", "age", "exper", "edu", "type", "role",
               "propo", "invest", "dura",
               paste0("WU", 1:4), paste0("SU", 1:4),
               paste0("SM", 1:3), paste0("RM", 1:3), paste0("PM", 1:3),
               paste0("IMM", 1:3), paste0("CRE", 1:4), paste0("TU", 1:4))
names(raw) <- col_names
cat("N =", nrow(raw), "\n\n")

# --- 2. Seven-factor CFA (core constructs, no TU) ---
cat("=" , rep("=", 59), "\n", sep = "")
cat("MODEL A: Seven-Factor CFA (core constructs)\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

model_7f <- '
  WU  =~ WU1 + WU2 + WU3 + WU4
  SU  =~ SU1 + SU2 + SU3 + SU4
  SM  =~ SM1 + SM2 + SM3
  RM  =~ RM1 + RM2 + RM3
  PM  =~ PM1 + PM2 + PM3
  IMM =~ IMM1 + IMM2 + IMM3
  CRE =~ CRE1 + CRE2 + CRE3 + CRE4
'

fit_7f <- cfa(model_7f, data = raw, estimator = "MLR")
fm7 <- fitmeasures(fit_7f, c("chisq", "df", "pvalue", "cfi", "tli",
                              "rmsea", "rmsea.ci.lower", "rmsea.ci.upper", "srmr"))
cat(sprintf("chi2(%d) = %.2f, p = %.4f\n", fm7["df"], fm7["chisq"], fm7["pvalue"]))
cat(sprintf("CFI = %.3f, TLI = %.3f\n", fm7["cfi"], fm7["tli"]))
cat(sprintf("RMSEA = %.3f, 90%% CI [%.3f, %.3f]\n", fm7["rmsea"], fm7["rmsea.ci.lower"], fm7["rmsea.ci.upper"]))
cat(sprintf("SRMR = %.3f\n\n", fm7["srmr"]))

# --- 3. Eight-factor CFA (with TU) ---
cat("=" , rep("=", 59), "\n", sep = "")
cat("MODEL B: Eight-Factor CFA (with TU)\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

model_8f <- '
  WU  =~ WU1 + WU2 + WU3 + WU4
  SU  =~ SU1 + SU2 + SU3 + SU4
  SM  =~ SM1 + SM2 + SM3
  RM  =~ RM1 + RM2 + RM3
  PM  =~ PM1 + PM2 + PM3
  IMM =~ IMM1 + IMM2 + IMM3
  CRE =~ CRE1 + CRE2 + CRE3 + CRE4
  TU  =~ TU1 + TU2 + TU3 + TU4
'

fit_8f <- cfa(model_8f, data = raw, estimator = "MLR")
fm8 <- fitmeasures(fit_8f, c("chisq", "df", "pvalue", "cfi", "tli",
                              "rmsea", "rmsea.ci.lower", "rmsea.ci.upper", "srmr"))
cat(sprintf("chi2(%d) = %.2f, p = %.4f\n", fm8["df"], fm8["chisq"], fm8["pvalue"]))
cat(sprintf("CFI = %.3f, TLI = %.3f\n", fm8["cfi"], fm8["tli"]))
cat(sprintf("RMSEA = %.3f, 90%% CI [%.3f, %.3f]\n", fm8["rmsea"], fm8["rmsea.ci.lower"], fm8["rmsea.ci.upper"]))
cat(sprintf("SRMR = %.3f\n\n", fm8["srmr"]))

# --- 4. Reliability & Validity (use 7-factor for core constructs) ---
cat("=" , rep("=", 59), "\n", sep = "")
cat("RELIABILITY & VALIDITY\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

# Function to compute CR and AVE from standardized loadings
compute_reliability <- function(fit, construct_name) {
  sl <- standardizedSolution(fit)
  loadings <- sl[sl$op == "=~" & sl$lhs == construct_name, "est.std"]

  # CR = (sum of loadings)^2 / ((sum of loadings)^2 + sum of error variances)
  error_vars <- 1 - loadings^2
  cr <- sum(loadings)^2 / (sum(loadings)^2 + sum(error_vars))

  # AVE = mean of squared loadings
  ave <- mean(loadings^2)

  return(list(cr = cr, ave = ave, loadings = loadings))
}

constructs <- c("WU", "SU", "SM", "RM", "PM", "IMM", "CRE")
items_list <- list(
  WU = paste0("WU", 1:4), SU = paste0("SU", 1:4),
  SM = paste0("SM", 1:3), RM = paste0("RM", 1:3), PM = paste0("PM", 1:3),
  IMM = paste0("IMM", 1:3), CRE = paste0("CRE", 1:4)
)

cat(sprintf("%-6s  %6s  %6s  %10s  %s\n", "Var", "CR", "AVE", "Cronbach a", "Loadings"))
cat(rep("-", 70), "\n", sep = "")

rel_results <- list()
for (cn in constructs) {
  r <- compute_reliability(fit_7f, cn)
  # Cronbach's alpha
  items_data <- raw[, items_list[[cn]]]
  alpha <- psych::alpha(items_data, check.keys = FALSE)$total$raw_alpha

  rel_results[[cn]] <- list(cr = r$cr, ave = r$ave, alpha = alpha, sqrt_ave = sqrt(r$ave))

  cat(sprintf("%-6s  %.3f   %.3f   %.3f       %s\n",
              cn, r$cr, r$ave, alpha,
              paste(sprintf("%.3f", r$loadings), collapse = ", ")))
}

# --- 5. Discriminant validity (Fornell-Larcker) ---
cat("\n")
cat("=" , rep("=", 59), "\n", sep = "")
cat("DISCRIMINANT VALIDITY (Fornell-Larcker)\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

# Get factor correlation matrix
sl <- standardizedSolution(fit_7f)
cor_rows <- sl[sl$op == "~~" & sl$lhs != sl$rhs & sl$lhs %in% constructs & sl$rhs %in% constructs, ]

# Build correlation matrix
n_c <- length(constructs)
cor_mat <- matrix(1, n_c, n_c, dimnames = list(constructs, constructs))
for (i in 1:nrow(cor_rows)) {
  r_idx <- match(cor_rows$lhs[i], constructs)
  c_idx <- match(cor_rows$rhs[i], constructs)
  cor_mat[r_idx, c_idx] <- cor_rows$est.std[i]
  cor_mat[c_idx, r_idx] <- cor_rows$est.std[i]
}

# Print with sqrt(AVE) on diagonal
cat(sprintf("%-6s", ""))
for (cn in constructs) cat(sprintf("  %6s", cn))
cat("\n")

for (i in seq_along(constructs)) {
  cat(sprintf("%-6s", constructs[i]))
  for (j in seq_along(constructs)) {
    if (i == j) {
      cat(sprintf("  %6.3f", rel_results[[constructs[i]]]$sqrt_ave))
    } else if (j < i) {
      cat(sprintf("  %6.3f", cor_mat[i, j]))
    } else {
      cat(sprintf("  %6s", ""))
    }
  }
  cat("\n")
}

cat("\nNote: Diagonal = sqrt(AVE). All sqrt(AVE) should exceed off-diagonal correlations.\n")

# --- 6. Check discriminant validity ---
cat("\nDiscriminant validity check:\n")
all_pass <- TRUE
for (i in 2:n_c) {
  for (j in 1:(i-1)) {
    sqrtAVE_i <- rel_results[[constructs[i]]]$sqrt_ave
    sqrtAVE_j <- rel_results[[constructs[j]]]$sqrt_ave
    cor_ij <- cor_mat[i, j]
    if (cor_ij > sqrtAVE_i || cor_ij > sqrtAVE_j) {
      cat(sprintf("  WARNING: %s-%s correlation (%.3f) exceeds sqrt(AVE)\n",
                  constructs[i], constructs[j], cor_ij))
      all_pass <- FALSE
    }
  }
}
if (all_pass) cat("  All pairs PASS Fornell-Larcker criterion.\n")

# --- 7. Summary for manuscript ---
cat("\n")
cat("=" , rep("=", 59), "\n", sep = "")
cat("MANUSCRIPT-READY NUMBERS\n")
cat("=" , rep("=", 59), "\n\n", sep = "")

cat("--- For Sec 4.1 opening paragraph ---\n")
cat(sprintf("Measurement model: chi2(%d) = %.2f, p < 0.001; CFI = %.3f; TLI = %.3f; RMSEA = %.3f, 90%% CI [%.3f, %.3f]; SRMR = %.3f\n\n",
            fm7["df"], fm7["chisq"], fm7["cfi"], fm7["tli"],
            fm7["rmsea"], fm7["rmsea.ci.lower"], fm7["rmsea.ci.upper"], fm7["srmr"]))

cat("--- Cronbach's alpha range ---\n")
alphas <- sapply(rel_results, function(x) x$alpha)
cat(sprintf("%.3f to %.3f\n\n", min(alphas), max(alphas)))

cat("--- CR range ---\n")
crs <- sapply(rel_results, function(x) x$cr)
cat(sprintf("%.3f to %.3f\n\n", min(crs), max(crs)))

cat("--- AVE range ---\n")
aves <- sapply(rel_results, function(x) x$ave)
cat(sprintf("%.3f to %.3f\n", min(aves), max(aves)))
