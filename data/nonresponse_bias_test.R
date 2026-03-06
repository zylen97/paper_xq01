# Non-response bias test (Armstrong & Overton, 1977)
# Early vs late respondent comparison

raw <- read.delim("data/data.dat", header = FALSE, sep = "\t",
                   fileEncoding = "UTF-8-BOM")

col_names <- c("id", "gen", "age", "exper", "edu", "type", "role",
               "propo", "invest", "dura",
               paste0("WU", 1:4), paste0("SU", 1:4),
               paste0("SM", 1:3), paste0("RM", 1:3), paste0("PM", 1:3),
               paste0("IMM", 1:3), paste0("CRE", 1:4), paste0("TU", 1:4))
names(raw) <- col_names

n <- nrow(raw)
cat("Total N =", n, "\n\n")

# Split into early (first half) and late (second half)
mid <- ceiling(n / 2)
early <- raw[1:mid, ]
late  <- raw[(mid+1):n, ]
cat("Early group: n =", nrow(early), "\n")
cat("Late group:  n =", nrow(late), "\n\n")

# --- Gender: Chi-square test ---
cat("=== Gender (Chi-square test) ===\n")
gender_table <- table(
  Group = c(rep("Early", nrow(early)), rep("Late", nrow(late))),
  Gender = c(early$gen, late$gen)
)
print(gender_table)
chi_test <- chisq.test(gender_table)
cat("Chi-square =", round(chi_test$statistic, 3),
    ", df =", chi_test$parameter,
    ", p =", round(chi_test$p.value, 4), "\n\n")

# --- Age: Independent samples t-test ---
cat("=== Age (Independent t-test) ===\n")
cat("Early mean:", round(mean(early$age), 3), "SD:", round(sd(early$age), 3), "\n")
cat("Late  mean:", round(mean(late$age), 3), "SD:", round(sd(late$age), 3), "\n")
t_age <- t.test(early$age, late$age)
cat("t =", round(t_age$statistic, 3),
    ", df =", round(t_age$parameter, 2),
    ", p =", round(t_age$p.value, 4), "\n\n")

# --- Education: Chi-square test ---
cat("=== Education (Chi-square test) ===\n")
edu_table <- table(
  Group = c(rep("Early", nrow(early)), rep("Late", nrow(late))),
  Education = c(early$edu, late$edu)
)
print(edu_table)
chi_edu <- chisq.test(edu_table)
cat("Chi-square =", round(chi_edu$statistic, 3),
    ", df =", chi_edu$parameter,
    ", p =", round(chi_edu$p.value, 4), "\n\n")

# --- Work experience: t-test ---
cat("=== Work Experience (Independent t-test) ===\n")
cat("Early mean:", round(mean(early$exper), 3), "SD:", round(sd(early$exper), 3), "\n")
cat("Late  mean:", round(mean(late$exper), 3), "SD:", round(sd(late$exper), 3), "\n")
t_exp <- t.test(early$exper, late$exper)
cat("t =", round(t_exp$statistic, 3),
    ", df =", round(t_exp$parameter, 2),
    ", p =", round(t_exp$p.value, 4), "\n\n")

cat("=== SUMMARY ===\n")
cat(sprintf("Gender:     chi2 = %.3f, p = %.4f %s\n", chi_test$statistic, chi_test$p.value,
            ifelse(chi_test$p.value > 0.05, "(ns)", "(sig)")))
cat(sprintf("Age:        t = %.3f, p = %.4f %s\n", t_age$statistic, t_age$p.value,
            ifelse(t_age$p.value > 0.05, "(ns)", "(sig)")))
cat(sprintf("Education:  chi2 = %.3f, p = %.4f %s\n", chi_edu$statistic, chi_edu$p.value,
            ifelse(chi_edu$p.value > 0.05, "(ns)", "(sig)")))
cat(sprintf("Experience: t = %.3f, p = %.4f %s\n", t_exp$statistic, t_exp$p.value,
            ifelse(t_exp$p.value > 0.05, "(ns)", "(sig)")))
