# Block Bootstrap with Your Exact Fixed Effects Regressions
library(dplyr)
library(haven)
library(fixest)

# Simple block bootstrap with exact original regressions
simple_block_bootstrap_fe <- function(B = 999) {
  
  cat("Running block bootstrap with fixed effects regressions...\n")
  cat("Bootstrap replications:", B, "\n\n")
  
  # Load original data
  SyntheticParents <- read.csv(file.path(datasets_git, "ParentData.csv"))
  CPS <- read_dta(file.path(datasets, "BySexAnalysisData.dta"))
  
  # Prepare CPS data with birth place variables (from your merge script)
  CPS <- CPS |> 
    mutate(BirthPlaceMom = case_when(mbpl <= 12092 ~ "USA",
                                     mbpl == 11000 ~ "Puerto Rico",
                                     mbpl == 30005 ~ "Argentina",
                                     mbpl == 30010 ~ "Bolivia",
                                     mbpl == 30015 ~ "Brazil",
                                     mbpl == 30020 ~ "Chile",
                                     mbpl == 30025 ~ "Colombia",
                                     mbpl == 26010 ~ "Dominican Republic",
                                     mbpl == 30030 ~ "Ecuador",
                                     mbpl == 21020 ~ "Costa Rica",
                                     mbpl == 21030 ~ "El Salvador",
                                     mbpl == 21040 ~ "Guatemala",
                                     mbpl == 21050 ~ "Honduras",
                                     mbpl == 25000 ~ "Cuba",
                                     mbpl == 20000 ~ "Mexico",
                                     mbpl == 21060 ~ "Nicaragua",
                                     mbpl == 21070 ~ "Panama",
                                     mbpl == 30050 ~ "Peru",
                                     mbpl == 30060 ~ "Uruguay",
                                     mbpl == 30065 ~ "Venezuela",
                                     mbpl == 43800 ~ "Spain",
                                     mbpl == 29900 ~ "Americas",
                                     mbpl == 21000 ~ "Cental America",
                                     mbpl == 30000 ~ "South America"),
           BirthPlaceDad = case_when(fbpl <= 12092 ~ "USA",
                                     fbpl == 11000 ~ "Puerto Rico",
                                     fbpl == 30005 ~ "Argentina",
                                     fbpl == 30010 ~ "Bolivia",
                                     fbpl == 30015 ~ "Brazil",
                                     fbpl == 30020 ~ "Chile",
                                     fbpl == 30025 ~ "Colombia",
                                     fbpl == 26010 ~ "Dominican Republic",
                                     fbpl == 30030 ~ "Ecuador",
                                     fbpl == 21020 ~ "Costa Rica",
                                     fbpl == 21030 ~ "El Salvador",
                                     fbpl == 21040 ~ "Guatemala",
                                     fbpl == 21050 ~ "Honduras",
                                     fbpl == 25000 ~ "Cuba",
                                     fbpl == 20000 ~ "Mexico",
                                     fbpl == 21060 ~ "Nicaragua",
                                     fbpl == 21070 ~ "Panama",
                                     fbpl == 30050 ~ "Peru",
                                     fbpl == 30060 ~ "Uruguay",
                                     fbpl == 30065 ~ "Venezuela",
                                     fbpl == 43800 ~ "Spain",
                                     fbpl == 29900 ~ "Americas",
                                     fbpl == 21000 ~ "Cental America",
                                     fbpl == 30000 ~ "South America"),
           CoupleType = Type)
  
  # Store bootstrap results for each model
  boot_results <- array(NA, dim = c(B, 5))  # 5 models
  
  for (i in 1:B) {
    if (i %% 100 == 0) cat("Bootstrap iteration:", i, "\n")
    
    tryCatch({
      # Step 1: Resample synthetic parents
      n_synth <- nrow(SyntheticParents)
      boot_indices <- sample(1:n_synth, n_synth, replace = TRUE)
      boot_synthetic <- SyntheticParents[boot_indices, ]
      
      # Step 2: Re-merge
      boot_merged <- left_join(CPS, boot_synthetic,
                              by = c("YOB", "CoupleType", "BirthPlaceMom", "BirthPlaceDad"))
      
      # Step 3: Apply your exact data processing
      IndividualData <- boot_merged |> 
        mutate(Education = as.numeric(Education)) |> 
        filter((WW == 1 & Hispanic_ID == 0) | WH == 1 | HW == 1 | HH == 1) |> 
        mutate(HusbandEducation = case_when(!is.na(HusbandEducation) ~ HusbandEducation,
                                           is.na(HusbandEducation) ~ mean(HusbandEducation, na.rm = TRUE)),
               WifeEducation = case_when(!is.na(WifeEducation) ~ WifeEducation,
                                        is.na(WifeEducation) ~ mean(WifeEducation, na.rm = TRUE)),
               Husband_ftotval = case_when(!is.na(Husband_ftotval) ~ Husband_ftotval,
                                          is.na(Husband_ftotval) ~ mean(Husband_ftotval, na.rm = TRUE))) |> 
        filter(year <= 2019)
      
      # Step 4: Create generated regressors
      IndividualData <- IndividualData |> 
        mutate(TotalHHEducation = HusbandEducation + WifeEducation,
               IncomeQuint = cut(Husband_ftotval, breaks = quantile(Husband_ftotval, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE),
               EducationQuint = cut(TotalHHEducation, breaks = quantile(TotalHHEducation, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE))
      
      # Step 5: Define ParentDummies and ParentControls
      ParentDummies <- c("HW", "uhrsworkly")
      ParentControls <- c("IncomeQuint", "EducationQuint")
      
      # Step 6: Run your EXACT original regressions with fixed effects
      reg_data <- IndividualData |> 
        filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))
      
      if (nrow(reg_data) < 100) next
      
      # Your exact 5 regression models from reg1
      model1 <- feols(lninctot_1999 ~ HW, 
                     data = reg_data)
      
      model2 <- feols(lninctot_1999 ~ HW + uhrsworkly, 
                     data = reg_data)
      
      model3 <- feols(lninctot_1999 ~ HW + uhrsworkly + age | year*statefip, 
                     data = reg_data)
      
      model4 <- feols(lninctot_1999 ~ HW + uhrsworkly + age + educ | year*statefip, 
                     data = reg_data)
      
      model5 <- feols(lninctot_1999 ~ HW + uhrsworkly + IncomeQuint + EducationQuint + age + educ | year*statefip, 
                     data = reg_data)
      
      # Store HW coefficients
      boot_results[i, 1] <- coef(model1)["HW"]
      boot_results[i, 2] <- coef(model2)["HW"]
      boot_results[i, 3] <- coef(model3)["HW"]
      boot_results[i, 4] <- coef(model4)["HW"]
      boot_results[i, 5] <- coef(model5)["HW"]
      
    }, error = function(e) {
      # Skip failed iterations
    })
  }
  
  # Clean results
  boot_results <- boot_results[complete.cases(boot_results), ]
  successful_boots <- nrow(boot_results)
  
  # Calculate bootstrap statistics
  boot_means <- apply(boot_results, 2, mean)
  boot_se <- apply(boot_results, 2, sd)
  boot_ci_lower <- apply(boot_results, 2, quantile, 0.025)
  boot_ci_upper <- apply(boot_results, 2, quantile, 0.975)
  
  # Run original regressions for comparison
  original_data <- read_csv(file.path(datasets, "CPS_synth.csv")) |> 
    mutate(Education = as.numeric(Education)) |> 
    filter((WW == 1 & Hispanic_ID == 0) | WH == 1 | HW == 1 | HH == 1) |> 
    mutate(HusbandEducation = case_when(!is.na(HusbandEducation) ~ HusbandEducation,
                                       is.na(HusbandEducation) ~ mean(HusbandEducation, na.rm = TRUE)),
           WifeEducation = case_when(!is.na(WifeEducation) ~ WifeEducation,
                                    is.na(WifeEducation) ~ mean(WifeEducation, na.rm = TRUE)),
           Husband_ftotval = case_when(!is.na(Husband_ftotval) ~ Husband_ftotval,
                                      is.na(Husband_ftotval) ~ mean(Husband_ftotval, na.rm = TRUE))) |> 
    filter(year <= 2019) |>
    mutate(TotalHHEducation = HusbandEducation + WifeEducation,
           IncomeQuint = cut(Husband_ftotval, breaks = quantile(Husband_ftotval, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE),
           EducationQuint = cut(TotalHHEducation, breaks = quantile(TotalHHEducation, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE)) |>
    filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))
  
  # Original models (your exact reg1 specifications)
  orig_model1 <- feols(lninctot_1999 ~ HW, data = original_data)
  orig_model2 <- feols(lninctot_1999 ~ HW + uhrsworkly, data = original_data)
  orig_model3 <- feols(lninctot_1999 ~ HW + uhrsworkly + age | year*statefip, data = original_data)
  orig_model4 <- feols(lninctot_1999 ~ HW + uhrsworkly + age + educ | year*statefip, data = original_data)
  orig_model5 <- feols(lninctot_1999 ~ HW + uhrsworkly + IncomeQuint + EducationQuint + age + educ | year*statefip, data = original_data)
  
  # Extract original coefficients and standard errors
  original_coefs <- c(coef(orig_model1)["HW"], coef(orig_model2)["HW"], coef(orig_model3)["HW"], 
                     coef(orig_model4)["HW"], coef(orig_model5)["HW"])
  
  original_se <- c(se(orig_model1)["HW"], se(orig_model2)["HW"], se(orig_model3)["HW"],
                  se(orig_model4)["HW"], se(orig_model5)["HW"])
  
  # Calculate bootstrap p-values
  boot_pvals <- 2 * (1 - pnorm(abs(original_coefs / boot_se)))
  
  # Print results
  cat("\nBLOCK BOOTSTRAP RESULTS (WITH FIXED EFFECTS)\n")
  cat("============================================\n")
  cat("Successful iterations:", successful_boots, "out of", B, "\n\n")
  
  model_names <- c("Model 1: HW only", 
                   "Model 2: + hours", 
                   "Model 3: + age + year*state FE", 
                   "Model 4: + education + year*state FE", 
                   "Model 5: + parent controls + year*state FE")
  
  for (j in 1:5) {
    cat(model_names[j], ":\n")
    cat("  Original coefficient:", round(original_coefs[j], 4), "\n")
    cat("  Original SE (clustered):", round(original_se[j], 4), "\n")
    cat("  Bootstrap SE:", round(boot_se[j], 4), "\n")
    cat("  Bootstrap 95% CI: [", round(boot_ci_lower[j], 4), ",", round(boot_ci_upper[j], 4), "]\n")
    cat("  Bootstrap p-value:", round(boot_pvals[j], 4), "\n\n")
  }
  
  # Create comparison table
  comparison_table <- data.frame(
    Model = paste("Model", 1:5),
    Original_Coef = round(original_coefs, 4),
    Original_SE = round(original_se, 4),
    Bootstrap_SE = round(boot_se, 4),
    Bootstrap_pval = round(boot_pvals, 4),
    CI_Lower = round(boot_ci_lower, 4),
    CI_Upper = round(boot_ci_upper, 4)
  )
  
  cat("COMPARISON TABLE:\n")
  print(comparison_table)
  
  return(list(
    original_coefficients = original_coefs,
    original_se = original_se,
    bootstrap_se = boot_se,
    bootstrap_pvals = boot_pvals,
    bootstrap_ci_lower = boot_ci_lower,
    bootstrap_ci_upper = boot_ci_upper,
    bootstrap_results = boot_results,
    comparison_table = comparison_table,
    successful_boots = successful_boots
  ))
}

# Run the block bootstrap with fixed effects
cat("BLOCK BOOTSTRAP FOR YOUR EXACT REGRESSIONS\n")
cat("==========================================\n")
cat("This runs your exact feols regressions with year*statefip fixed effects\n")
cat("and accounts for generated regressor uncertainty.\n\n")

# Execute the bootstrap
results <- simple_block_bootstrap_fe(B = 999)

cat("\nKEY FINDINGS:\n")
cat("=============\n")
cat("Model 5 (your main specification):\n")
cat("- Original coefficient:", round(results$original_coefficients[5], 4), "\n")
cat("- Bootstrap SE:", round(results$bootstrap_se[5], 4), "\n") 
cat("- Bootstrap p-value:", round(results$bootstrap_pvals[5], 4), "\n")
cat("- Bootstrap 95% CI: [", round(results$bootstrap_ci_lower[5], 4), ",", round(results$bootstrap_ci_upper[5], 4), "]\n")

cat("\nUSAGE:\n")
cat("======\n")
cat("results <- simple_block_bootstrap_fe(B = 999)\n")
cat("This gives you the correct standard errors for your regressions with generated regressors.\n")