# summary stats

# table Five
# Regression

# date: January 19th, 2023

IndividualData <- read_dta(file.path(datasets,"BySexAnalysisData.dta")) |> 
  mutate(Education = as.numeric(Education)) |> 
  filter((WW == 1 & Hispanic_ID == 0) | WH == 1 | HW == 1 | HH == 1)

ParentDummies <- c("WH:Hispanic_ID", "HW:Hispanic_ID", "HH:Hispanic_ID","WH", "HW", "HH", "uhrsworkly")

# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log annual earnings}" = feols(lninctot_1999 ~ .[ParentDummies] | year + age, se = "iid",
                                                        data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed == 0)),
  "\\specialcell{(2) \\\\  Log annual earnings}" = feols(lninctot_1999 ~ .[ParentDummies] | year + age + educ, se = "iid",
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed == 0))
  
)

# calculate means to add
# as a row


test1 <- tidy(glht(reg1[[1]], linfct = c("Hispanic_ID:HW - WH:Hispanic_ID = 0")))
differences1 <- case_when(abs(test1$estimate/test1$std.error)   >= 2.58  ~ paste0(sprintf("%2.5s",round_tidy(test1$estimate, digits = 2)), "***"),
                          abs(test1$estimate/test1$std.error)   <  2.58 & 
                            abs(test1$estimate/test1$std.error) >= 1.96  ~ paste0(sprintf("%2.5s",round_tidy(test1$estimate, digits = 2)), "**"),
                          abs(test1$estimate/test1$std.error)   <  1.96  &
                            abs(test1$estimate/test1$std.error) >= 1.645 ~ paste0(sprintf("%2.5s",round_tidy(test1$estimate, digits = 2)), "*"),
                          abs(test1$estimate/test1$std.error)   < 1.645  ~ round_tidy(test1$estimate, digits = 2)
)

test2 <- tidy(glht(reg1[[2]], linfct = c("Hispanic_ID:HW - WH:Hispanic_ID = 0")))
differences2 <- case_when(abs(test2$estimate/test2$std.error)   >= 2.58  ~ paste0(sprintf("%2.5s",round_tidy(test2$estimate, digits = 2)), "***"),
                          abs(test2$estimate/test2$std.error)   <  2.58 & 
                            abs(test2$estimate/test2$std.error) >= 1.96  ~ paste0(sprintf("%2.5s",round_tidy(test2$estimate, digits = 2)), "**"),
                          abs(test2$estimate/test2$std.error)   <  1.96  &
                            abs(test2$estimate/test2$std.error) >= 1.645 ~ paste0(sprintf("%2.5s",round_tidy(test2$estimate, digits = 2)), "*"),
                          abs(test2$estimate/test2$std.error)   < 1.645  ~ round_tidy(test2$estimate, digits = 2)
)

differences_row <-  c('$HW_{i} \\times Hispanic_{i} - WH_{i} \\times Hispanic_{i}$', differences1, differences2)
dim(differences_row) <- c(1,3)

pvalue_row <-  c(' ', paste0("(", round(test1$std.error, digits = 2), ")"), paste0("(", round(test2$std.error, digits = 2), ")"))
dim(pvalue_row) <- c(1,3)

row_diff <- rbind(differences_row, pvalue_row)
colnames(row_diff)<-LETTERS[1:3]

row_diff <- as.data.frame(row_diff)
attr(row_diff, 'position') <- c(13:14)

controling_for <-  c("\\textit{Controlling for:}", " ", "")
dim(controling_for) <- c(1,3)

hoursworked <-  c("Hours Worked", "X", "X")
dim(hoursworked) <- c(1,3)

controling_for <- as.data.frame(controling_for)
hoursworked <- as.data.frame(hoursworked)

all_row <- rbind(differences_row, pvalue_row, controling_for, hoursworked)
attr(all_row, 'position') <- c(13:14, 16:17)

cm <- c("WH:Hispanic_ID" = "$WH_{i} \\times Hispanic_{i}$",
        "Hispanic_ID:HW" = "$HW_{i} \\times Hispanic_{i}$",
        "Hispanic_ID:HH" = "$HH_{i} \\times Hispanic_{i}$",
        "WH" = "$WH_{i}$",
        "HW" = "$HW_{i}$",
        "HH" = "$HH_{i}$"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "nobs",      "Observations",             0,
  "FE: age", "Age", 0,
  "FE: year", "Year FE", 0,
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
             title = "Effect of Having Hispanic Last Name \\label{tab:identreg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:iden}).}",
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
                               title = "Effect of Having Hispanic Last Name \\label{tab:identreg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:iden}).}",
                      "\\\\footnotesize{The four groups stand for White Husband White Wife (WW), White Husband Hispanic Wife (WH), Hispanic Husband White (HW), and Hispanic Husband Hispanic Wife (HH). $Hispanic_{i}$ is a dummy variable equal to one if a person identifies as Hispanic and zero otherwise.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time full-year and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and years of fixed effects. Column two has the results after controlling for education.}"
  ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) |> 
  row_spec(14, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab06-regression.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab06-regression.tex"))
