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
  mutate(EducationQuint      = cut(TotalHHEducation, breaks = quantile(TotalHHEducation, probs = c(0, 0.2, 0.4, 0.6, 0.8, 1), na.rm = TRUE), include.lowest = TRUE)
          )
ParentDummies <- c("HW", "uhrsworkly")

ParentControls  <- c("IncomeQuint", "EducationQuint")
# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies], vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] | year + age + statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] | year + age + educ + statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(5) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + .[ParentControls] | year + age + educ + statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))
  
)

# feols(lninctot_1999 ~ .[ParentDummies] + .[ParentControls], vcov = ~statefip,
#                                                             data = IndividualData |> 
#                                                           filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))

# feols(lninctot_1999 ~ .[ParentDummies] + .[ParentControls] | year + age + statefip, vcov = ~statefip,
#                                                             data = IndividualData |> 
#                                                           filter(sex == 1 & FTFY == 1 & Self_employed == 0 & (HW == 1 | WH == 1)))

# calculate means to add
# as a row


# test1 <- tidy(glht(reg1[[1]], linfct = c("HW - WH = 0")))
# differences1 <- case_when(abs(test1$estimate/test1$std.error)   >= 2.58  ~ paste0(sprintf("%2.5s",round_tidy(test1$estimate, digits = 2)), "***"),
#           abs(test1$estimate/test1$std.error)   <  2.58 & 
#             abs(test1$estimate/test1$std.error) >= 1.96  ~ paste0(sprintf("%2.5s",round_tidy(test1$estimate, digits = 2)), "**"),
#           abs(test1$estimate/test1$std.error)   <  1.96  &
#             abs(test1$estimate/test1$std.error) >= 1.645 ~ paste0(sprintf("%2.5s",round_tidy(test1$estimate, digits = 2)), "*"),
#           abs(test1$estimate/test1$std.error)   < 1.645  ~ round_tidy(test1$estimate, digits = 2)
#           )

# test2 <- tidy(glht(reg1[[2]], linfct = c("HW - WH = 0")))
# differences2 <- case_when(abs(test2$estimate/test2$std.error)   >= 2.58  ~ paste0(sprintf("%2.5s",round_tidy(test2$estimate, digits = 2)), "***"),
#                           abs(test2$estimate/test2$std.error)   <  2.58 & 
#                             abs(test2$estimate/test2$std.error) >= 1.96  ~ paste0(sprintf("%2.5s",round_tidy(test2$estimate, digits = 2)), "**"),
#                           abs(test2$estimate/test2$std.error)   <  1.96  &
#                             abs(test2$estimate/test2$std.error) >= 1.645 ~ paste0(sprintf("%2.5s",round_tidy(test2$estimate, digits = 2)), "*"),
#                           abs(test2$estimate/test2$std.error)   < 1.645  ~ round_tidy(test2$estimate, digits = 2)
# )

# differences_row <-  c('$HW_{i} - WH_{i}$', differences1, differences2)
# dim(differences_row) <- c(1,3)

# pvalue_row <-  c(' ', paste0("(", round(test1$std.error, digits = 2), ")"), paste0("(", round(test2$std.error, digits = 2), ")"))
# dim(pvalue_row) <- c(1,3)

# row_diff <- rbind(differences_row, pvalue_row)
# colnames(row_diff)<-LETTERS[1:3]

# row_diff <- as.data.frame(row_diff)
# attr(row_diff, 'position') <- c(7:8)

controling_for <-  c("\\textit{Controlling for:}", " ", "", " ", "", "")
dim(controling_for) <- c(1,6)

hoursworked <-  c("Hours Worked", " ", "X","X", "X", "X")
parentalback <-  c("Parental Background", " ", " "," ", " ", "X")

dim(hoursworked) <- c(1,6)
dim(parentalback) <- c(1,6)

controling_for <- as.data.frame(controling_for)
hoursworked <- as.data.frame(hoursworked)
parentalback <- as.data.frame(parentalback)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  hoursworked,
  parentalback)

attr(all_row, 'position') <- c(#7:8, 
                              5:6, 11)

cm <- c("WH"          = "$WH_{ist}$",
        "HW"          = "$HW_{ist}$",
        "HH"          = "$HH_{ist}$",
        "(Intercept)" = "Constant"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
  "FE: statefip", "State FE", 0,
  "FE: year", "Year FE", 0,
  "FE: age", "Age FE", 0,
  "FE: educ", "Education FE", 0,
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
             title = "Effect of Having Hispanic Last Name \\label{tab:lastnamereg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time full-year and are waged and salaried workers.}",
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
                               title = "Effect of Having Hispanic Last Name \\label{tab:lastnamereg}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to men working full-time full-year and are wage and salary workers.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, education, year and state fixed effects. Column two has the results after controlling for education.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) #|> 
  #row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab05-regression.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab05-regression.tex"))
regression_tab %>%
  save_kable(file.path("/Users/hhadah/Documents/GiT/my_thesis/tables","tab05-regression.tex"))

