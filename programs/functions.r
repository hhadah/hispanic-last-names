# Murphy-Topel (1985) Correction for Two-Stage Estimation with feols
# Required packages
library(fixest)
library(dplyr)

# Function to implement Murphy-Topel correction
murphy_topel_correction <- function(first_stage_model, second_stage_model, 
                                   predicted_var_name = "predicted_values") {
  
  # Extract model matrices and handle potential issues with feols
  first_stage_data <- model.matrix(first_stage_model)
  first_stage_coefs <- coef(first_stage_model)
  first_stage_vcov <- vcov(first_stage_model)
  
  # Get residuals and fitted values from first stage
  first_stage_residuals <- residuals(first_stage_model)
  first_stage_fitted <- fitted(first_stage_model)
  
  # Calculate MSE (ML estimate of sigma^2)
  mse <- mean(first_stage_residuals^2)
  
  # Generate scores for first stage (residuals/mse)
  s1 <- first_stage_residuals / mse
  
  # Extract second stage information
  second_stage_data <- model.matrix(second_stage_model)
  second_stage_coefs <- coef(second_stage_model)
  second_stage_vcov <- vcov(second_stage_model)
  second_stage_residuals <- residuals(second_stage_model)
  
  # Debug: print variable names to help identify the issue
  cat("Second stage variable names:\n")
  print(colnames(second_stage_data))
  cat("\nLooking for variable containing:", predicted_var_name, "\n")
  
  # Get the column index of the predicted variable in second stage
  # More flexible matching
  pred_col_idx <- which(grepl(predicted_var_name, colnames(second_stage_data), fixed = TRUE))
  
  if(length(pred_col_idx) == 0) {
    # Try alternative matching strategies
    pred_col_idx <- which(colnames(second_stage_data) == predicted_var_name)
  }
  
  if(length(pred_col_idx) == 0) {
    # Try partial matching
    pred_col_idx <- which(sapply(colnames(second_stage_data), function(x) grepl(predicted_var_name, x)))
  }
  
  if(length(pred_col_idx) == 0) {
    cat("Available variables in second stage model:\n")
    print(colnames(second_stage_data))
    stop(paste("Predicted variable", predicted_var_name, "not found in second stage model"))
  }
  
  cat("Found predicted variable at column index:", pred_col_idx, "\n")
  
  # Ensure matrices have compatible dimensions
  X1 <- first_stage_data
  X2 <- second_stage_data
  
  # Check if we need to subset to common observations
  n1 <- nrow(X1)
  n2 <- nrow(X2)
  
  if(n1 != n2) {
    cat("Warning: Different number of observations in first and second stage\n")
    cat("First stage:", n1, "observations\n")
    cat("Second stage:", n2, "observations\n")
    
    # Take the minimum number of observations
    n <- min(n1, n2)
    X1 <- X1[1:n, , drop = FALSE]
    X2 <- X2[1:n, , drop = FALSE]
    s1 <- s1[1:n]
    second_stage_residuals <- second_stage_residuals[1:n]
  } else {
    n <- n1
  }
  
  # Calculate the Murphy-Topel adjustment
  # Calculate C matrix (cross-moment matrix)
  # For linear second stage, gradient w.r.t. predicted values is the coefficient
  # times the residual divided by error variance
  second_stage_mse <- mean(second_stage_residuals^2)
  
  # Get the coefficient for the predicted variable
  pred_coef <- second_stage_coefs[pred_col_idx]
  cat("Coefficient for predicted variable:", pred_coef, "\n")
  
  grad2_pred <- second_stage_residuals * pred_coef / second_stage_mse
  
  # Calculate C matrix
  C <- matrix(0, nrow = ncol(X2), ncol = ncol(X1))
  for(i in 1:n) {
    C <- C + (1/n) * outer(X2[i,] * grad2_pred[i], X1[i,] * s1[i])
  }
  
  # Murphy-Topel variance correction
  # V_MT = V2 + V2 * C * V1 * t(C) * V2
  V1 <- first_stage_vcov
  V2 <- second_stage_vcov
  
  # Apply correction
  correction_term <- V2 %*% C %*% V1 %*% t(C) %*% V2
  V_MT <- V2 + correction_term
  
  # Return corrected standard errors
  se_corrected <- sqrt(diag(V_MT))
  
  return(list(
    corrected_vcov = V_MT,
    corrected_se = se_corrected,
    original_se = sqrt(diag(V2)),
    correction_term = correction_term,
    first_stage_model = first_stage_model,
    second_stage_model = second_stage_model
  ))
}

# Simplified wrapper function for common two-stage scenarios
two_stage_murphy_topel <- function(data, first_stage_formula, second_stage_formula, 
                                  cluster_var = NULL, predicted_name = "zhat") {
  
  # Run first stage regression
  if(!is.null(cluster_var)) {
    first_stage <- feols(first_stage_formula, data = data, vcov = cluster_var)
  } else {
    first_stage <- feols(first_stage_formula, data = data)
  }
  
  # Generate predicted values
  data[[predicted_name]] <- fitted(first_stage)
  
  # Update second stage formula to include predicted values
  # This assumes the second stage formula has a placeholder for the predicted variable
  second_stage_formula_updated <- update(second_stage_formula, 
                                        paste("~ . +", predicted_name))
  
  # Run second stage regression
  if(!is.null(cluster_var)) {
    second_stage <- feols(second_stage_formula_updated, data = data, vcov = cluster_var)
  } else {
    second_stage <- feols(second_stage_formula_updated, data = data)
  }
  
  # Apply Murphy-Topel correction
  mt_results <- murphy_topel_correction(first_stage, second_stage, predicted_name)
  
  return(mt_results)
}

# Example usage function that mimics the Stata code structure
run_murphy_topel_example <- function() {
  # This is a template for how you would apply it to your specific case
  
  # Example: Two-stage estimation
  # First stage: instrument regression
  # z ~ age + income + ownrent + selfemp
  
  # Second stage: outcome regression with predicted z
  # y ~ age + income + avgexp + zhat
  
  # Step 1: Run first stage
  first_stage <- feols(z ~ age + income + ownrent + selfemp, data = your_data)
  
  # Step 2: Generate predicted values and residuals
  your_data$zhat <- fitted(first_stage)
  first_residuals <- residuals(first_stage)
  first_residuals_sq <- first_residuals^2
  
  # Step 3: Calculate MSE
  mse <- mean(first_residuals_sq)
  
  # Step 4: Generate scores
  s1 <- first_residuals / mse
  
  # Step 5: Run second stage
  second_stage <- feols(y ~ age + income + avgexp + zhat, data = your_data)
  
  # Step 6: Apply Murphy-Topel correction
  mt_correction <- murphy_topel_correction(first_stage, second_stage, "zhat")
  
  # Step 7: Display results with corrected standard errors
  coefs <- coef(second_stage)
  se_original <- sqrt(diag(vcov(second_stage)))
  se_corrected <- mt_correction$corrected_se
  
  results_table <- data.frame(
    Coefficient = names(coefs),
    Estimate = coefs,
    SE_Original = se_original,
    SE_MurphyTopel = se_corrected,
    t_stat = coefs / se_corrected,
    p_value = 2 * (1 - pnorm(abs(coefs / se_corrected)))
  )
  
  return(list(
    results_table = results_table,
    first_stage = first_stage,
    second_stage = second_stage,
    murphy_topel = mt_correction
  ))
}

# Murphy-Topel correction for generated regressors (quintiles)
murphy_topel_for_generated_regressors <- function(original_model, first_stage_formulas, data, 
                                                 generated_vars, cluster_var = NULL) {
  
  # Step 1: Run first stage regressions for each generated variable
  first_stage_models <- list()
  
  for(i in seq_along(generated_vars)) {
    var_name <- generated_vars[i]
    formula_name <- names(first_stage_formulas)[i]
    
    cat("Running first stage for", var_name, "with formula:", deparse(first_stage_formulas[[i]]), "\n")
    
    if(!is.null(cluster_var)) {
      first_stage_models[[var_name]] <- feols(first_stage_formulas[[i]], data = data, vcov = cluster_var)
    } else {
      first_stage_models[[var_name]] <- feols(first_stage_formulas[[i]], data = data)
    }
  }
  
  # Step 2: Get model information
  X2 <- model.matrix(original_model)  # Second stage design matrix
  beta2 <- coef(original_model)
  V2 <- vcov(original_model)
  u2 <- residuals(original_model)
  n <- length(u2)
  
  # Step 3: Calculate Murphy-Topel correction for multiple generated regressors
  sigma2_sq <- sum(u2^2) / n
  
  # Initialize total correction term
  total_correction <- matrix(0, nrow = ncol(X2), ncol = ncol(X2))
  
  # Apply correction for each generated regressor
  for(var_name in generated_vars) {
    first_stage <- first_stage_models[[var_name]]
    
    # Get first stage information
    X1 <- model.matrix(first_stage)
    beta1 <- coef(first_stage)
    V1 <- vcov(first_stage)
    u1 <- residuals(first_stage)[1:n]  # Ensure same length
    
    sigma1_sq <- sum(u1^2) / n
    
    # Find columns corresponding to this generated variable in second stage
    # For factor variables like quintiles, there will be multiple columns
    generated_cols <- grep(var_name, colnames(X2))
    
    if(length(generated_cols) == 0) {
      cat("Warning: Generated variable", var_name, "not found in second stage model\n")
      next
    }
    
    cat("Found", length(generated_cols), "columns for", var_name, "\n")
    
    # Calculate cross-moment matrix C for this generated regressor
    C <- matrix(0, nrow = ncol(X2), ncol = ncol(X1))
    
    for(i in 1:n) {
      # Score for first stage
      score1_i <- X1[i, ] * u1[i] / sigma1_sq
      
      # Score for second stage
      score2_i <- X2[i, ] * u2[i] / sigma2_sq
      
      # For generated regressors, we need to account for the derivative
      # of the generated variable w.r.t. the first stage parameters
      
      # Cross moment
      C <- C + (1/n) * outer(score2_i, score1_i)
    }
    
    # Add this variable's contribution to the total correction
    correction_component <- V2 %*% C %*% V1 %*% t(C) %*% V2
    total_correction <- total_correction + correction_component
    
    cat("Added correction component for", var_name, "with norm:", norm(correction_component, "F"), "\n")
  }
  
  # Final corrected variance-covariance matrix
  V_MT <- V2 + total_correction
  
  # Return results
  se_original <- sqrt(diag(V2))
  se_corrected <- sqrt(diag(V_MT))
  
  cat("Total correction norm:", norm(total_correction, "F"), "\n")
  cat("Max SE change:", max(abs(se_corrected - se_original)), "\n")
  
  return(list(
    coefficients = beta2,
    vcov_original = V2,
    vcov_corrected = V_MT,
    se_original = se_original,
    se_corrected = se_corrected,
    first_stage_models = first_stage_models,
    original_model = original_model,
    correction_applied = TRUE,
    generated_vars = generated_vars
  ))
}

# Function to apply Murphy-Topel correction for generated regressors to your regression list
apply_murphy_topel_generated <- function(reg_list, data, first_stage_formulas, 
                                        generated_vars, cluster_var = NULL) {
  
  corrected_results <- list()
  
  for(i in seq_along(reg_list)) {
    reg_name <- names(reg_list)[i]
    original_model <- reg_list[[i]]
    
    cat("\n" , rep("=", 60), "\n")
    cat("Processing:", reg_name, "\n")
    cat(rep("=", 60), "\n")
    
    # Check if this model uses any generated regressors
    model_vars <- all.vars(formula(original_model))
    uses_generated <- any(sapply(generated_vars, function(x) any(grepl(x, model_vars))))
    
    if(!uses_generated) {
      cat("Model does not use generated regressors, skipping correction\n")
      corrected_results[[reg_name]] <- list(
        coefficients = coef(original_model),
        se_original = sqrt(diag(vcov(original_model))),
        se_corrected = sqrt(diag(vcov(original_model))),
        correction_applied = FALSE,
        reason = "No generated regressors in model"
      )
      next
    }
    
    tryCatch({
      # Apply Murphy-Topel correction
      mt_results <- murphy_topel_for_generated_regressors(
        original_model = original_model,
        first_stage_formulas = first_stage_formulas,
        data = data,
        generated_vars = generated_vars,
        cluster_var = cluster_var
      )
      
      corrected_results[[reg_name]] <- mt_results
      
    }, error = function(e) {
      cat("Error in Murphy-Topel correction for", reg_name, ":", e$message, "\n")
      corrected_results[[reg_name]] <- list(
        coefficients = coef(original_model),
        se_original = sqrt(diag(vcov(original_model))),
        se_corrected = sqrt(diag(vcov(original_model))),
        correction_applied = FALSE,
        error = e$message
      )
    })
  }
  
  return(corrected_results)
}

# Updated print function for generated regressors
print_murphy_topel_generated <- function(mt_results, model_name = "Model") {
  if(!mt_results$correction_applied) {
    cat("\n", model_name, "- No Murphy-Topel Correction Applied\n")
    if(!is.null(mt_results$reason)) {
      cat("Reason:", mt_results$reason, "\n")
    }
    if(!is.null(mt_results$error)) {
      cat("Error:", mt_results$error, "\n")
    }
    return()
  }
  
  cat("\n", model_name, "- Murphy-Topel Correction for Generated Regressors\n")
  cat(rep("=", 80), "\n")
  
  coefs <- mt_results$coefficients
  se_original <- mt_results$se_original
  se_corrected <- mt_results$se_corrected
  
  # Calculate t-statistics and p-values
  t_original <- coefs / se_original
  t_corrected <- coefs / se_corrected
  p_original <- 2 * (1 - pnorm(abs(t_original)))
  p_corrected <- 2 * (1 - pnorm(abs(t_corrected)))
  
  # Create comparison table
  comparison_df <- data.frame(
    Variable = names(coefs),
    Coefficient = round(coefs, 6),
    SE_Original = round(se_original, 6),
    SE_MurphyTopel = round(se_corrected, 6),
    SE_Ratio = round(se_corrected / se_original, 3),
    t_Original = round(t_original, 3),
    t_MurphyTopel = round(t_corrected, 3),
    p_Original = round(p_original, 4),
    p_MurphyTopel = round(p_corrected, 4)
  )
  
  print(comparison_df, row.names = FALSE)
  cat("\nGenerated regressors corrected:", paste(mt_results$generated_vars, collapse = ", "), "\n")
  cat("SE_Ratio > 1 indicates Murphy-Topel correction increased standard errors\n\n")
}

# Function to apply Murphy-Topel correction to your regression list
apply_murphy_topel_corrected <- function(reg_list, data, first_stage_formula, 
                                        endogenous_var = "HW", cluster_var = NULL) {
  
  corrected_results <- list()
  
  for(i in seq_along(reg_list)) {
    reg_name <- names(reg_list)[i]
    original_model <- reg_list[[i]]
    
    cat("\nProcessing:", reg_name, "\n")
    
    tryCatch({
      # Apply Murphy-Topel correction
      mt_results <- murphy_topel_correction_fixed(
        original_model = original_model,
        first_stage_formula = first_stage_formula,
        data = data,
        endogenous_var = endogenous_var,
        cluster_var = cluster_var
      )
      
      corrected_results[[reg_name]] <- mt_results
      
    }, error = function(e) {
      cat("Error in Murphy-Topel correction for", reg_name, ":", e$message, "\n")
      corrected_results[[reg_name]] <- list(
        original_model = original_model,
        error = e$message,
        correction_applied = FALSE
      )
    })
  }
  
  return(corrected_results)
}

# Updated print function that shows comparison
print_murphy_topel_comparison <- function(mt_results, model_name = "Model") {
  if(!mt_results$correction_applied) {
    cat("\nError in", model_name, ":", mt_results$error, "\n")
    return()
  }
  
  cat("\n", model_name, "- Murphy-Topel Comparison\n")
  cat(rep("=", 80), "\n")
  
  coefs <- mt_results$coefficients
  se_original <- mt_results$se_original
  se_corrected <- mt_results$se_corrected
  
  # Calculate t-statistics and p-values for both
  t_original <- coefs / se_original
  t_corrected <- coefs / se_corrected
  p_original <- 2 * (1 - pnorm(abs(t_original)))
  p_corrected <- 2 * (1 - pnorm(abs(t_corrected)))
  
  # Create comparison table
  comparison_df <- data.frame(
    Variable = names(coefs),
    Coefficient = round(coefs, 6),
    SE_Original = round(se_original, 6),
    SE_MurphyTopel = round(se_corrected, 6),
    SE_Ratio = round(se_corrected / se_original, 3),
    t_Original = round(t_original, 3),
    t_MurphyTopel = round(t_corrected, 3),
    p_Original = round(p_original, 4),
    p_MurphyTopel = round(p_corrected, 4)
  )
  
  print(comparison_df, row.names = FALSE)
  cat("\nNote: SE_Ratio > 1 indicates Murphy-Topel correction increased standard errors\n")
  cat("Note: Coefficients remain unchanged, only standard errors are corrected\n\n")
}

# Print function for Murphy-Topel results
print_murphy_topel_results <- function(mt_results, model_name = "Model") {
  cat("\n", model_name, "- Murphy-Topel Corrected Results\n")
  cat(rep("=", 60), "\n")
  
  coefs <- coef(mt_results$second_stage_model)
  se_corrected <- mt_results$corrected_se
  t_stats <- coefs / se_corrected
  p_values <- 2 * (1 - pnorm(abs(t_stats)))
  
  # Calculate confidence intervals
  ci_lower <- coefs - 1.96 * se_corrected
  ci_upper <- coefs + 1.96 * se_corrected
  
  results_df <- data.frame(
    Variable = names(coefs),
    Coef = round(coefs, 6),
    Std_Err = round(se_corrected, 6),
    z = round(t_stats, 2),
    P_value = round(p_values, 3),
    CI_Lower = round(ci_lower, 6),
    CI_Upper = round(ci_upper, 6)
  )
  
  print(results_df, row.names = FALSE)
  cat("\n")
}