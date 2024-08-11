# table Five
# Regression

# date: January 19th, 2023

# open data, filter to only have the relevant data
# and impute empty parental charachtersitcs with mean
IndividualData <- read_csv(file.path(datasets,"CPS_synth.csv")) |> 
  mutate(Education = as.numeric(Education)) |> 
  filter(HW == 1 | WH == 1) |> 
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
feols(Education ~ HW  , vcov = ~statefip, data = IndividualData)
feols(Education ~ HW  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(Education ~ HW  +  age +.[ParentControls]  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(Education ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(Education ~ HW*year  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(Education ~ HW*year  + HW*statefip  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)

feols(hs_dropout ~ HW  , vcov = ~statefip, data = IndividualData)
feols(hs_dropout ~ HW  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(hs_dropout ~ HW  +  age +.[ParentControls]  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(hs_dropout ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(hs_dropout ~ HW*year  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(hs_dropout ~ HW*year  + HW*statefip  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)

feols(associate_degree ~ HW  , vcov = ~statefip, data = IndividualData)
feols(associate_degree ~ HW  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(associate_degree ~ HW  +  age +.[ParentControls]  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(associate_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(associate_degree ~ HW*year  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(associate_degree ~ HW*year  + HW*statefip  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)

feols(ba_degree ~ HW  , vcov = ~statefip, data = IndividualData)
feols(ba_degree ~ HW  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(ba_degree ~ HW  +  age +.[ParentControls]  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(ba_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(ba_degree ~ HW*year  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(ba_degree ~ HW*year  + HW*statefip  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)

feols(professional_degree ~ HW  , vcov = ~statefip, data = IndividualData)
feols(professional_degree ~ HW  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(professional_degree ~ HW  +  age +.[ParentControls]  | year + statefip, vcov = ~statefip, data = IndividualData)
feols(professional_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(professional_degree ~ HW*year  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
feols(professional_degree ~ HW*year  + HW*statefip  + .[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)

regression <- list(
  "Panel A: Full Sample" = list(
  "\\specialcell{(1) \\\\ Years of \\\\ Education}"  = feols(Education ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData),
  "\\specialcell{(2) \\\\ High School \\\\ Dropout}"  = feols(hs_dropout ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData),
  "\\specialcell{(3) \\\\ Associate Degree}"         = feols(associate_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData),
  "\\specialcell{(4) \\\\ Bachelor Degree}"          = feols(ba_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData)
  ),

  "Panel B: Women" = list(
  "\\specialcell{(1) \\\\ Years of \\\\ Education}"  = feols(Education ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 2)),
  "\\specialcell{(2) \\\\ High School \\\\ Dropout}"  = feols(hs_dropout ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 2)),
  "\\specialcell{(3) \\\\ Associate Degree}"         = feols(associate_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 2)),
  "\\specialcell{(4) \\\\ Bachelor Degree}"          = feols(ba_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 2))
  ),

  "Panel C: Men" = list(
  "\\specialcell{(1) \\\\ Years of \\\\ Education}"  = feols(Education ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 1)),
  "\\specialcell{(2) \\\\ High School \\\\ Dropout}"  = feols(hs_dropout ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 1)),
  "\\specialcell{(3) \\\\ Associate Degree}"         = feols(associate_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 1)),
  "\\specialcell{(4) \\\\ Bachelor Degree}"          = feols(ba_degree ~ HW  +  age +.[ParentControls]  | year*statefip, vcov = ~statefip, data = IndividualData  |> filter(sex == 1))
  )
)

# calculate mean for all sample
all_sample <- c("Full Sample's Mean", round(mean(IndividualData$Education, na.rm=T), 2), 
                      round(mean(IndividualData$hs_dropout, na.rm=T), 2),
                      round(mean(IndividualData$associate_degree, na.rm=T), 2), 
                      round(mean(IndividualData$ba_degree, na.rm=T), 2))


dim(all_sample) <- c(1,5)
all_sample <- as.data.frame(all_sample)

# calculate mean for women
women_mean_sam <- IndividualData |> filter(sex == 2)
women_sample <- c("Women's Mean", round(mean(women_mean_sam$Education, na.rm=T), 2), 
                      round(mean(women_mean_sam$hs_dropout, na.rm=T), 2),
                      round(mean(women_mean_sam$associate_degree, na.rm=T), 2), 
                      round(mean(women_mean_sam$ba_degree, na.rm=T), 2))


dim(women_sample) <- c(1,5)
women_sample <- as.data.frame(women_sample)

# calculate mean for women
men_mean_sam <- IndividualData |> filter(sex == 1)
men_sample <- c("Men's Mean", round(mean(men_mean_sam$Education, na.rm=T), 2), 
                      round(mean(men_mean_sam$hs_dropout, na.rm=T), 2),
                      round(mean(men_mean_sam$associate_degree, na.rm=T), 2), 
                      round(mean(men_mean_sam$ba_degree, na.rm=T), 2))


dim(men_sample) <- c(1,5)
men_sample <- as.data.frame(men_sample)

all_row <- rbind(
  all_sample, women_sample, men_sample
)

cm <- c("WH"          = "$WH_{ist}$",
        "HW"          = "$HW_{ist}$",
        "HH"          = "$HH_{ist}$",
        "(Intercept)" = "Constant"
) 
gm <- tibble::tribble(
  ~raw,        ~clean,          ~fmt,
#   "FE: statefip", "State FE", 0,
#   "FE: year", "Year FE", 0,
#   "FE: age", "Age FE", 0,
#   "FE: year:statefip", "State-Year FE", 0,
  "std.error.type", "Standard Errors", 0,
  "nobs",      "Observations",             0,
  #"r.squared", "R squared", 3
)

attr(all_row, 'position') <- c(9)
modelsummary(regression, fmt = 2,  
             coef_map = cm,
             add_rows = all_row,
             shape = "rbind",
             gof_map = gm,
             escape = F,
             #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
             stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
             title = "Effect of Having Hispanic Last Name on Educational Outcomes\\label{tab:lastnamereg}") %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")
  ) %>%
  footnote(number = c("\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}). All regressions include state-year fixed effects.}",
                      "\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}",
                      "\\\\footnotesize{Standard errors are clustered on the state level.}"
                      ),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  )

regression_tab <- modelsummary(regression, fmt = 2,
                               output = "latex",
                               coef_map = cm,
                               shape = "rbind",
                               add_rows = all_row,
                               gof_map = gm,
                               escape = F,
                               #gof_omit = 'DF|Deviance|R2|AIC|BIC|Log.Lik.|F|Std.Errors',
                               stars= c('***' = 0.01, '**' = 0.05, '*' = 0.1),
                               title = "Effect of Having Hispanic Last Name \\label{tab:lastname-ed-reg}") %>%
  kable_styling(
                latex_options = c("HOLD_position")
  ) %>%
  footnote(number = c("{\\\\setstretch{1.0}\\\\footnotesize{This table includes the estimation results of equation (\\\\ref{eq:1a}). All regressions include state-year fixed effects.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{HW is an indicator variable that is equal to 1 if a person is the child of a Hispanic-father and White-mother.}}",
                      "{\\\\setstretch{1.0}\\\\footnotesize{Standard errors are clustered on the state level.}}"
                      ),
  footnote_as_chunk = F, title_format = c("italic"),
  escape = F, threeparttable = T
  )


regression_tab %>%
  save_kable(file.path(tables_wd,"tab13-regression.tex"))

regression_tab %>%
  save_kable(file.path(thesis_tabs,"tab13-regression.tex"))

regression_tab %>%
  save_kable(file.path(manuscript_wd,"tab13-regression.tex"))
