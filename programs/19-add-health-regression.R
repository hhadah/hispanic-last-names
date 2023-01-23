# Regression

# date: January 19th, 2023

AddHealth <- read_csv(file.path(datasets_git,"AddHealth_Cleaned.csv")) |> 
  filter((WW == 1 & Hispanic_w1 == 0) | WH == 1 | HW == 1 | HH == 1)

ParentDummies <- c("WH", "HW", "HH")

BasicControls_w4 <- c("LogFamIncome", "PA_HealthStatus_w1", "SP_HealthStatus_w1", 
                      "TotalEducation_Parents", "Age_w4", "Age_w4_sq", 
                      "Age_w4_cube", "Age_w4_quad", "Male")
BasicControlsEudc_w4 <- c("LogFamIncome", "PA_HealthStatus_w1", "SP_HealthStatus_w1", 
                          "TotalEducation_Parents", "Age_w4", "Age_w4_sq", 
                          "Age_w4_cube", "Age_w4_quad", "Male", 
                          "HighSchl_dropout_w4", "HighSchl_diplona_w4", 
                          "Some_college_w4", "College_w4")              
# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log annual earnings}" = feols(Ln_pers_earns_w4 ~ .[ParentDummies] + .[BasicControls_w4], se = "iid",
                                                        # weights = ~GSWGT4,
                                                            data = AddHealth |> 
                                                          filter(Full_w4 == 1)),
  "\\specialcell{(2) \\\\  Log annual earnings}" = feols(Ln_pers_earns_w4 ~ .[ParentDummies] + .[BasicControlsEudc_w4], se = "iid",
                                                        # weights = ~GSWGT4,
                                                         data = AddHealth |> 
                                                           filter(Full_w4 == 1))
  
)


cm <- c("WH" = "$WH_{i}$",
        "HW" = "$HW_{i}$",
        "HH" = "$HH_{i}$"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "nobs",      "Observations",             0,
#   "FE: year", "Year", 0,
#   "FE: age", "Age", 0,
#   "FE: educ", "Education", 0,
  "std.error.type", "Standard Errors", 0,
  #"r.squared", "R squared", 3
)

modelsummary(reg1, fmt = 2,  
             coef_map = cm,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name \\label{tab:lastnamereg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}",
                      "\\\\footnotesize{The four groups stand for White Husband White Wife (WW), White Husband Hispanic Wife (WH), Hispanic Husband White (HW), and Hispanic Husband Hispanic Wife (HH).}",
                      "\\\\footnotesize{The sample is restricted to men working full-time full-year and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}"
                      ),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  )

regression_tab <- modelsummary(reg1, fmt = 2,
                               output = "latex",
                               coef_map = cm,
                               add_rows = all_row,
                               gof_map = gm,
                               escape = F,
                               #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
                               stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
                               title = "Effect of Having Hispanic Last Name \\label{tab:lastnamereg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}",
                      "\\\\footnotesize{The four groups stand for White Husband White Wife (WW), White Husband Hispanic Wife (WH), Hispanic Husband White (HW), and Hispanic Husband Hispanic Wife (HH).}",
                      "\\\\footnotesize{The sample is restricted to men working full-time full-year and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}"
  ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) |> 
  row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab05-regression.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab05-regression.tex"))
