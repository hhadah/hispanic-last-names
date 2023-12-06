# summary stats

# table Five
# Regression

# date: January 19th, 2023

IndividualData <- read_dta(file.path(datasets,"BySexAnalysisData.dta")) |> 
  mutate(Education = as.numeric(Education))

# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log annual earnings}" = feols(lninctot_1999 ~ Hispanic_ID+  uhrsworkly | year + age+ statefip, vcov = ~statefip,
                                                        data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed == 0)),
  "\\specialcell{(2) \\\\  Log annual earnings}" = feols(lninctot_1999 ~ Hispanic_ID+  uhrsworkly | year + age + educ+ statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed == 0))
  
)


controling_for <-  c("\\textit{Controlling for:}", " ", "")
dim(controling_for) <- c(1,3)

hoursworked <-  c("Hours Worked", "X", "X")
dim(hoursworked) <- c(1,3)

controling_for <- as.data.frame(controling_for)
hoursworked <- as.data.frame(hoursworked)

all_row <- rbind(controling_for, hoursworked)
attr(all_row, 'position') <- c(4:5)

cm <- c("Hispanic_ID" = "$Hispanic_{i}$"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "nobs",      "Observations",             0,
  "FE: year", "Year FE", 0,
  "FE: statefip", "State FE", 0,
  "FE: age", "Age", 0,
  "FE: educ", "Education", 0,
  "std.error.type", "Standard Errors", 0,
  #"r.squared", "R squared", 3
)

modelsummary(reg1, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Hsiapnic–White Earnings Gap Using Hispanic Variable Only \\label{tab:hispwhitegap}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:naive}).}",
                      "\\\\footnotesize{$Hispanic_{i}$ is a dummy variable equal to one if a person identifies as Hispanic and zero otherwise.}",
                      "\\\\footnotesize{The sample is restricted to men working full time full-year and are waged and salaried workers.}",
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
                               title = "Hsiapnic–White Earnings Gap Using Hispanic Variable Only \\label{tab:hispwhitegap}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:naive}).}",
                      "\\\\footnotesize{$Hispanic_{i}$ is a dummy variable equal to one if a person identifies as Hispanic and zero otherwise.}",
                      "\\\\footnotesize{The sample is restricted to men working full time full-year and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}"
  ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  )


regression_tab %>%
  save_kable(file.path(tables_wd,"tab07-regression.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab07-regression.tex"))

# dissertation table
regression_tab <- modelsummary(reg1, fmt = 2,
                               output = "latex",
                               coef_map = cm,
                               add_rows = all_row,
                               gof_map = gm,
                               escape = F,
                               #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
                               stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1)) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  )


regression_tab %>%
  save_kable(file.path(dissertation_wd,"tables/tab07-naive-regression.tex"))

