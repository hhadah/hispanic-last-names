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
                                ) |> 
  filter(year <= 2019)
table(IndividualData$year)               
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

IndividualData <- IndividualData |> 
  mutate(
    occupation = case_when(
      occ1990 == 1 ~ "Managers",
      occ1990 == 2 ~ "Business and Financial Operations",
      occ1990 == 3 ~ "Computer and Mathematical",
      occ1990 == 4 ~ "Architecture and Engineering",
      occ1990 == 5 ~ "Life, Physical, and Social Science",
      occ1990 == 6 ~ "Community and Social Services",
      occ1990 == 7 ~ "Legal",
      occ1990 == 8 ~ "Education, Training, and Library",
      occ1990 == 9 ~ "Arts, Design, Entertainment, Sports, and Media",
      occ1990 == 10 ~ "Healthcare Practitioners and Technical",
      occ1990 == 11 ~ "Healthcare Support",
      occ1990 == 12 ~ "Protective Service",
      occ1990 == 13 ~ "Food Preparation and Serving",
      occ1990 == 14 ~ "Building and Grounds Cleaning and Maintenance",
      occ1990 == 15 ~ "Personal Care and Service",
      occ1990 == 16 ~ "Sales and Related",
      occ1990 == 17 ~ "Office and Administrative Support",
      occ1990 == 18 ~ "Farming, Fishing, and Forestry",
      occ1990 == 19 ~ "Construction and Extraction",
      occ1990 == 20 ~ "Installation, Maintenance, and Repair",
      occ1990 == 21 ~ "Production",
      occ1990 == 22 ~ "Transportation and Material Moving",
      occ1990 == 23 ~ "Military"
    )
  )

# By generation
reg1 <- list(
  "\\specialcell{(1) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies], vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(5) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1)))
  
)

CrossTable(IndividualData$BirthPlaceMom, IndividualData$BirthPlaceDad)
reg2 <- list(
  "\\specialcell{(1) \\\\ Unemployment}" = feols(1 - Employed ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Unemployment}" = feols(1 - Employed ~ HW + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Unemployment}" = feols(1 - Employed ~ HW + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Unemployment}" = feols(1 - Employed ~ HW + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1)))
  
)
reg2[[1]]
reg2[[2]]
reg2[[3]]
reg2[[4]]

reg3 <- list(
  "\\specialcell{(1) \\\\ In Labor Force}" = feols(InLaborForce ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ In Labor Force}" = feols(InLaborForce ~ HW + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  In Labor Force}" = feols(InLaborForce ~ HW + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  In Labor Force}" = feols(InLaborForce ~ HW + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1)))
  
)
reg3[[1]]
reg3[[2]]
reg3[[3]]
reg3[[4]]

reg4 <- list(
  "\\specialcell{(1) \\\\ Full Year}" = feols(FullYear ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Full Year}" = feols(FullYear ~ HW + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Full Year}" = feols(FullYear ~ HW + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Full Year}" = feols(FullYear ~ HW + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1)))
  
)
reg4[[1]]
reg4[[2]]
reg4[[3]]
reg4[[4]]

reg5 <- list(
  "\\specialcell{(1) \\\\ Full Time}" = feols(FullTime ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Full Time}" = feols(FullTime ~ HW + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Full Time}" = feols(FullTime ~ HW + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Full Time}" = feols(FullTime ~ HW + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1)))
  
)
reg5[[1]]
reg5[[2]]
reg5[[3]]
reg5[[4]]

reg6 <- list(
  "\\specialcell{(1) \\\\ Self Employed}" = feols(Self_employed ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Self Employed}" = feols(Self_employed ~ HW + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Self Employed}" = feols(Self_employed ~ HW + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Self Employed}" = feols(Self_employed ~ HW + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1)))
  
)
reg6[[1]]
reg6[[2]]
reg6[[3]]
reg6[[4]]

reg7 <- list(
  "\\specialcell{(1) \\\\ Full Time \\\\ Full Year}" = feols(FTFY ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Full Time \\\\ Full Year}" = feols(FTFY ~ HW + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\  Full Time \\\\ Full Year}" = feols(FTFY ~ HW + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Full Time \\\\ Full Year}" = feols(FTFY ~ HW + .[ParentControls] + age + educ | year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & (HW == 1 | WH == 1)))
  
)
reg7[[1]]
reg7[[2]]
reg7[[3]]
reg7[[4]]

reg8 <- list(
  "\\specialcell{(1) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ HW, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies], vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + age | year*statefip, vcov = ~statefip,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + age| occupation + year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(5) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + .[ParentControls] + age | occupation + year*statefip, vcov = ~statefip,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1)))
  
)

#--------------------------------------
# Earnigns
#--------------------------------------

# calculate mean for all sample
IndividualData_mean <- IndividualData |> 
  filter(HW == 1)
all_sample <- c("\\specialcell{HW's Mean \\\\ Unemployment}", 
                      round(mean(IndividualData_mean$lninctot_1999, na.rm=T), 2),
                      round(mean(IndividualData_mean$lninctot_1999, na.rm=T), 2),
                      round(mean(IndividualData_mean$lninctot_1999, na.rm=T), 2), 
                      round(mean(IndividualData_mean$lninctot_1999, na.rm=T), 2),
                      round(mean(IndividualData_mean$lninctot_1999, na.rm=T), 2))


dim(all_sample) <- c(1,6)
all_sample <- as.data.frame(all_sample)

controling_for <-  c("\\textit{Controlling for:}", " ", "", " ", "", "")
dim(controling_for) <- c(1,6)

hoursworked   <-  c("Hours Worked", " ", "X","X", "X", "X")
age_cont      <-  c("Age", " ", " ","X", "X", "X")
educ_cont     <-  c("Education", " ", " "," ", "X", "X")
parentalback  <-  c("Parental Background", " ", " "," ", " ", "X")

dim(hoursworked) <- c(1,6)
dim(age_cont) <- c(1,6)
dim(educ_cont) <- c(1,6)
dim(parentalback) <- c(1,6)

controling_for <- as.data.frame(controling_for)
hoursworked <- as.data.frame(hoursworked)
parentalback <- as.data.frame(parentalback)
educ_cont <- as.data.frame(educ_cont)
age_cont <- as.data.frame(age_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  hoursworked,
  age_cont,
  educ_cont,
  parentalback
  )

attr(all_row, 'position') <- c(#7:8, 
                              5:7, 11:12)

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
                               title = "Effect of Having Hispanic Last Name (Log Annual Earnings) \\label{tab:lastnamereg}") %>%
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
  save_kable(file.path(manuscript_wd,"tab05-regression.tex"))

#--------------------------------------
# Employment
#--------------------------------------
controling_for <-  c("\\textit{Controlling for:}", "", " ", "", "")
dim(controling_for) <- c(1,5)

age_cont      <-  c("Age", " ","X", "X", "X")
educ_cont     <-  c("Education", " "," ", "X", "X")
parentalback  <-  c("Parental Background", " "," ", " ", "X")
# calculate mean for all sample
IndividualData_mean <- IndividualData |> 
  filter(HW == 1)
all_sample <- c("\\specialcell{HW's Mean \\\\ Unemployment}", round(mean(1 - IndividualData_mean$Employed, na.rm=T), 2), 
                      round(mean(1 - IndividualData_mean$Employed, na.rm=T), 2),
                      round(mean(1 - IndividualData_mean$Employed, na.rm=T), 2), 
                      round(mean(1 - IndividualData_mean$Employed, na.rm=T), 2))


dim(all_sample) <- c(1,5)
all_sample <- as.data.frame(all_sample)

dim(age_cont) <- c(1,5)
dim(educ_cont) <- c(1,5)
dim(parentalback) <- c(1,5)

controling_for <- as.data.frame(controling_for)
parentalback <- as.data.frame(parentalback)
educ_cont <- as.data.frame(educ_cont)
age_cont <- as.data.frame(age_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  age_cont,
  educ_cont,
  parentalback,
  all_sample)

attr(all_row, 'position') <- c(#7:8, 
                              5:6, 10:12)

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

modelsummary(reg2, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name on Employment \\label{tab:lastnamereg-emp}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to prime-age men.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}",
                      "\\\\footnotesize{Standard errors are clustered on the state level.}"
                      ),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  )

regression_tab <- modelsummary(reg2, fmt = 2,
                               output = "latex",
                               coef_map = cm,
                               add_rows = all_row,
                               gof_map = gm,
                               escape = F,
                               #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
                               stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
                               title = "Effect of Having Hispanic Last Name on Employment \\label{tab:lastnamereg-emp}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to prime-age men.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  ) #|> 
  #row_spec(8, hline_after = T)


regression_tab %>%
  save_kable(file.path(tables_wd,"tab14-emp-regression.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab14-emp-regression.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab14-emp-regression.tex"))

#--------------------------------------
# Earnigns: with Occupation FE
#--------------------------------------

controling_for <-  c("\\textit{Controlling for:}", " ", "", " ", "", "")
dim(controling_for) <- c(1,6)

hoursworked   <-  c("Hours Worked", " ", "X","X", "X", "X")
age_cont      <-  c("Age", " ", " ","X", "X", "X")
parentalback  <-  c("Parental Background", " ", " "," ", " ", "X")

dim(hoursworked) <- c(1,6)
dim(age_cont) <- c(1,6)
dim(parentalback) <- c(1,6)

controling_for <- as.data.frame(controling_for)
hoursworked <- as.data.frame(hoursworked)
parentalback <- as.data.frame(parentalback)
age_cont <- as.data.frame(age_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  hoursworked,
  age_cont,
  parentalback)

attr(all_row, 'position') <- c(#7:8, 
                              5:7, 12)

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
  "FE: occupation", "Occupation FE", 0,
  # "FE: age", "Age FE", 0,
  # "FE: educ", "Education FE", 0,
  "std.error.type", "Standard Errors", 0,
  "nobs",      "Observations",             0,
  #"r.squared", "R squared", 3
)

modelsummary(reg8, fmt = 2,  
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

regression_tab <- modelsummary(reg8, fmt = 2,
                               output = "latex",
                               coef_map = cm,
                               add_rows = all_row,
                               gof_map = gm,
                               escape = F,
                               #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
                               stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
                               title = "Effect of Having Hispanic Last Name (Log Annual Earnings) \\label{tab:lastnamereg}") %>%
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
  save_kable(file.path(tables_wd,"tab15-regression-occ-fe.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab15-regression-occ-fe.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab15-regression-occ-fe.tex"))
#--------------------------------------
# Labor Force Participation
#--------------------------------------

#--------------------------------------
# Full Year
#--------------------------------------

#--------------------------------------
# Full Time
#--------------------------------------

#--------------------------------------
# Self Employed
#--------------------------------------

#--------------------------------------
# Full Time Full Year
#--------------------------------------



















reg1 <- list(
  "\\specialcell{(1) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ HW, vcov = ~serial,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(2) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies], vcov = ~serial,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(3) \\\\ Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + age | year*statefip, vcov = ~serial,
                                                            data = IndividualData |> 
                                                          filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(4) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + age + educ | year*statefip, vcov = ~serial,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1))),
  "\\specialcell{(5) \\\\  Log annual \\\\ earnings}" = feols(lninctot_1999 ~ .[ParentDummies] + .[ParentControls] + age + educ | year*statefip, vcov = ~serial,
                                                         data = IndividualData |> 
                                                           filter(sex == 1 & FTFY == 1 & Self_employed_ASEC == 0 & (HW == 1 | WH == 1)))
  
)

#--------------------------------------
# Earnigns
#--------------------------------------

# calculate mean for all sample

dim(all_sample) <- c(1,6)
all_sample <- as.data.frame(all_sample)

controling_for <-  c("\\textit{Controlling for:}", " ", "", " ", "", "")
dim(controling_for) <- c(1,6)

hoursworked   <-  c("Hours Worked", " ", "X","X", "X", "X")
age_cont      <-  c("Age", " ", " ","X", "X", "X")
educ_cont     <-  c("Education", " ", " "," ", "X", "X")
parentalback  <-  c("Parental Background", " ", " "," ", " ", "X")

dim(hoursworked) <- c(1,6)
dim(age_cont) <- c(1,6)
dim(educ_cont) <- c(1,6)
dim(parentalback) <- c(1,6)

controling_for <- as.data.frame(controling_for)
hoursworked <- as.data.frame(hoursworked)
parentalback <- as.data.frame(parentalback)
educ_cont <- as.data.frame(educ_cont)
age_cont <- as.data.frame(age_cont)

all_row <- rbind(
  # differences_row, 
  # pvalue_row, 
  controling_for, 
  hoursworked,
  age_cont,
  educ_cont,
  parentalback
  )

attr(all_row, 'position') <- c(#7:8, 
                              5:7, 11:12)

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
             title = "Effect of Having Hispanic Last Name \\label{tab:lastnamereg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{The sample is restricted to men working full-time full-year and are waged and salaried workers.}",
                      "\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, and fixed effects. Column two has the results after controlling for education.}",
                      "\\\\footnotesize{Standard errors are clustered on the parental birth place level.}"
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
                               title = "Effect of Having Hispanic Last Name (Log Annual Earnings) \\label{tab:lastnamereg}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}).}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{The sample is restricted to men working full-time full-year and are wage and salary workers.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Column one has the regression results when controlling for hours worked, age, education, year and state fixed effects. Column two has the results after controlling for education.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered at the mother's and father's birthplace level.}}"
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
  save_kable(file.path(manuscript_wd,"tab0000-regression-cluster.tex"))
