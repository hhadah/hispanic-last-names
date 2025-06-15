# table Five
# Regression

# date: January 19th, 2023

# open data, filter to only have the relevant data
# and impute empty parental charachtersitcs with mean
IndividualData <- read_csv(file.path(datasets,"CPS_synth.csv")) |> 
  mutate(Education = as.numeric(Education)) |> 
  filter((WW == 1 & Hispanic_ID == 0) | WH == 1 | HW == 1 | HH == 1) |> 
  mutate(HusbandEducation = case_when(!is.na(HusbandEducation) ~ HusbandEducation,
                                       is.na(HusbandEducation) ~ mean(HusbandEducation, na.rm = TRUE)),
         WifeEducation = case_when(!is.na(WifeEducation) ~ WifeEducation,
                                    is.na(WifeEducation) ~ mean(WifeEducation, na.rm = TRUE)),
         Husband_ftotval = case_when(!is.na(Husband_ftotval) ~ Husband_ftotval,
                                       is.na(Husband_ftotval) ~ mean(Husband_ftotval, na.rm = TRUE)),
                                )
# create a total education variable
# and a income quintile variable
# and education quintile variable
IndividualData  <- IndividualData  |> 
  mutate(TotalHHEducation = HusbandEducation + WifeEducation,
         IncomeQuint      = cut(Husband_ftotval, breaks = quantile(Husband_ftotval, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE)
          )
IndividualData  <- IndividualData  |> 
  mutate(EducationQuint      = cut(TotalHHEducation, breaks = quantile(TotalHHEducation, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE),
        logearnweek = log(earnweek),
          )
ParentDummies <- c("HW")

# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))  
)


controling_for <-  c("\\textit{Controlling for:}", " ", "", " ")
dim(controling_for) <- c(1,4)

age_cont <-  c("Age", " ", "X","X")
educ_cont <-  c("Education", " ", " ","X")
dim(age_cont) <- c(1,4)
dim(educ_cont) <- c(1,4)

controling_for <- as.data.frame(controling_for)
age_cont <- as.data.frame(age_cont)
educ_cont <- as.data.frame(educ_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  age_cont,
  educ_cont
  )

attr(all_row, 'position') <- c(#7:8, 
                              5, 9:11)

cm <- c("WH"          = "$WH_{ist}$",
        "HW"          = "$HW_{ist}$",
        "HH"          = "$HH_{ist}$",
        "(Intercept)" = "Constant"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "FE: statefip", "State FE", 0,
  "FE: year", "Year FE", 0,
  "FE: year:statefip", "State-Year FE", 0,
  # "FE: age", "Age FE", 0,
  # "FE: educ", "Education FE", 0,
  "std.error.type", "Standard Errors", 0,
  "nobs",      "Observations",             0,
  #"r.squared", "R squared", 3
)

modelsummary(reg1, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name \\label{tab:lastnamereg-weekearm}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}",
                      "\\\\footnotesize{Standard errors are clustered on the state level.}"
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
             title = "Effect of Having Hispanic Last Name (Log Weekly Earnings) \\label{tab:lastnamereg-weekearm}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to men working full-time and are wage and salary workers.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, education, year and state fixed effects. Column two has the results after controlling for education.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) #|> 
  #row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab07-regression-weekearn.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab07-regression-weekearn.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab07-regression-weekearn.tex"))



#------------------------------------------------------------
#------------------------------------------------------------
# Mexican Hispanics
#------------------------------------------------------------
#------------------------------------------------------------
Mexicans_USA  <- IndividualData |> 
    filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1) & !is.na(earnweek) & BirthPlaceMom %in% c("Mexico", "USA") & BirthPlaceDad %in% c("Mexico", "USA"))


# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ HW, vcov = ~statefip,
                                                            data = Mexicans_USA |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age  | year*statefip, vcov = ~statefip,
                                                            data = Mexicans_USA |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age + educ  | year*statefip, vcov = ~statefip,
                                                         data = Mexicans_USA |> 
                                                           filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))
)

controling_for <-  c("\\textit{Controlling for:}", " ", "", " ")
dim(controling_for) <- c(1,4)

age_cont <-  c("Age", " ", "X","X")
educ_cont <-  c("Education", " ", " ","X")
dim(age_cont) <- c(1,4)
dim(educ_cont) <- c(1,4)

controling_for <- as.data.frame(controling_for)
age_cont <- as.data.frame(age_cont)
educ_cont <- as.data.frame(educ_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  age_cont,
  educ_cont)

attr(all_row, 'position') <- c(#7:8, 
                              5, 9:11)

cm <- c("WH"          = "$WH_{ist}$",
        "HW"          = "$HW_{ist}$",
        "HH"          = "$HH_{ist}$",
        "(Intercept)" = "Constant"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "FE: statefip", "State FE", 0,
  "FE: year", "Year FE", 0,
  "FE: year:statefip", "State-Year FE", 0,
  # "FE: age", "Age FE", 0,
  # "FE: educ", "Education FE", 0,
  "std.error.type", "Standard Errors", 0,
  "nobs",      "Observations",             0,
  #"r.squared", "R squared", 3
)

modelsummary(reg1, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name: Hispanics with Mexican Ancestry   \\label{tab:lastnamereg-weekearm-mex}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}",
                      "\\\\footnotesize{Standard errors are clustered on the state level.}"
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
             title = "Effect of Having Hispanic Last Name: Hispanics with Mexican Ancestry  \\label{tab:lastnamereg-weekearm-mex}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to men working full-time and are wage and salary workers.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, education, year and state fixed effects. Column two has the results after controlling for education.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) #|> 
  #row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab08-regression-weekearn-mex.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab08-regression-weekearn-mex.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab08-regression-weekearn-mex.tex"))

#------------------------------------------------------------
#------------------------------------------------------------
# Non-Mexican Hispanics and US Whites
#------------------------------------------------------------
#------------------------------------------------------------

`%notin%` <- Negate(`%in%`)
NonMexican_USA <-  IndividualData |> 
    filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1) & !is.na(earnweek) & BirthPlaceMom %notin% c("Mexico") & BirthPlaceDad %notin% c("Mexico"))

# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ HW, vcov = ~statefip,
                                                            data = NonMexican_USA |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age  | year*statefip, vcov = ~statefip,
                                                            data = NonMexican_USA |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age + educ  | year*statefip, vcov = ~statefip,
                                                         data = NonMexican_USA |> 
                                                           filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))
)


controling_for <-  c("\\textit{Controlling for:}", " ", "", " ")
dim(controling_for) <- c(1,4)

age_cont <-  c("Age", " ", "X","X")
educ_cont <-  c("Education", " ", " ","X")
dim(age_cont) <- c(1,4)
dim(educ_cont) <- c(1,4)

parentalback <-  c("Parental Background", " ", " "," ")
dim(parentalback) <- c(1,4)

controling_for <- as.data.frame(controling_for)
age_cont <- as.data.frame(age_cont)
educ_cont <- as.data.frame(educ_cont)
parentalback <- as.data.frame(parentalback)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  age_cont,
  educ_cont,
  parentalback)

attr(all_row, 'position') <- c(#7:8, 
                              5, 9:11)

cm <- c("WH"          = "$WH_{ist}$",
        "HW"          = "$HW_{ist}$",
        "HH"          = "$HH_{ist}$",
        "(Intercept)" = "Constant"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "FE: statefip", "State FE", 0,
  "FE: year", "Year FE", 0,
  "FE: year:statefip", "State-Year FE", 0,
  # "FE: age", "Age FE", 0,
  # "FE: educ", "Education FE", 0,
  "std.error.type", "Standard Errors", 0,
  "nobs",      "Observations",             0,
  #"r.squared", "R squared", 3
)

modelsummary(reg1, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name: Hispanics with Non-Mexican Ancestry  \\label{tab:lastnamereg-weekearm-nonmex}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}",
                      "\\\\footnotesize{Standard errors are clustered on the state level.}"
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
             title = "Effect of Having Hispanic Last Name: Hispanics with Non-Mexican Ancestry  \\label{tab:lastnamereg-weekearm-nonmex}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to men working full-time and are wage and salary workers.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, education, year and state fixed effects. Column two has the results after controlling for education.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) #|> 
  #row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab09-regression-weekearn-nonmex.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab09-regression-weekearn-nonmex.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab09-regression-weekearn-nonmex.tex"))

#------------------------------------------------------------
#------------------------------------------------------------
# Cuban Hispanics
#------------------------------------------------------------
#------------------------------------------------------------
Cuban_USA  <- IndividualData |> 
    filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1) & !is.na(earnweek) & BirthPlaceMom %in% c("Cuba", "USA") & BirthPlaceDad %in% c("Cuba", "USA"))

IndividualData |> 
    filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1) & !is.na(earnweek)) |> 
    group_by(BirthPlaceMom, BirthPlaceDad) |>
    summarise(n()) |> 
    kbl()
# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ HW, vcov = ~statefip,
                                                            data = Cuban_USA |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age  | year*statefip, vcov = ~statefip,
                                                            data = Cuban_USA |> 
                                                          filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Log weekly \\\\ earnings}" = feols(logearnweek ~ .[ParentDummies] + age + educ  | year*statefip, vcov = ~statefip,
                                                         data = Cuban_USA |> 
                                                           filter(sex == 1 & FullTime == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))
  
)

controling_for <-  c("\\textit{Controlling for:}", " ", "", " ")
dim(controling_for) <- c(1,4)

age_cont <-  c("Age", " ", "X","X")
educ_cont <-  c("Education", " ", " ","X")
dim(age_cont) <- c(1,4)
dim(educ_cont) <- c(1,4)

controling_for <- as.data.frame(controling_for)
age_cont <- as.data.frame(age_cont)
educ_cont <- as.data.frame(educ_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  age_cont,
  educ_cont)

attr(all_row, 'position') <- c(#7:8, 
                              5, 9:11)

cm <- c("WH"          = "$WH_{ist}$",
        "HW"          = "$HW_{ist}$",
        "HH"          = "$HH_{ist}$",
        "(Intercept)" = "Constant"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "FE: statefip", "State FE", 0,
  "FE: year", "Year FE", 0,
  "FE: year:statefip", "State-Year FE", 0,
  # "FE: age", "Age FE", 0,
  # "FE: educ", "Education FE", 0,
  "std.error.type", "Standard Errors", 0,
  "nobs",      "Observations",             0,
  #"r.squared", "R squared", 3
)

modelsummary(reg1, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name: Hispanics with Cuban Ancestry   \\label{tab:lastnamereg-weekearm-cub}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}",
                      "\\\\footnotesize{Standard errors are clustered on the state level.}"
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
             title = "Effect of Having Hispanic Last Name: Hispanics with Cuban Ancestry  \\label{tab:lastnamereg-weekearm-cub}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}) where the dependent variable is log weekly earnings.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to men working full-time and are wage and salary workers.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, education, year and state fixed effects. Column two has the results after controlling for education.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) #|> 
  #row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab10-regression-weekearn-cuba.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab10-regression-weekearn-cuba.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab10-regression-weekearn-cuba.tex"))
