# Summary statisitcs

# date: May 15th, 2022

# set working directory
# to table outputs

AddHealth <- read_csv(file.path(datasets_git,"AddHealth_Cleaned.csv"))|> 
                                select(Male, White_w1,Black_w1, Hispanic_w1,
                                Employed_w3, Employed_w4,FullTime_w3, 
                                FullTime_w4,HoursWorkedPerWeek_w3,
                                HoursWorkedPerWeek_w4,PersonalEarnings_w3,
                                PersonalEarnings_w4,FinishedHighschool_w5, 
                                FinishedCollege_w5,EducationYears_w5,Health_w1,
                                Health_w5,GPA,TotalEducation_Parents,
                                PA_FamilyIncome,DadHealth,MomHealth, ParentType)
# summary stat tables by
# generation type


sumstat1 <-   tbl_summary(data =  AddHealth |> filter(ParentType == "Hispanic-White" | ParentType == "White-Hispanic"),
                          by = "ParentType",
                          include = c(Male, White_w1,
                                      Hispanic_w1,
                                      Employed_w3, Employed_w4,
                                      FullTime_w3, FullTime_w4,
                                      HoursWorkedPerWeek_w3,
                                      HoursWorkedPerWeek_w4,
                                      PersonalEarnings_w3,
                                      PersonalEarnings_w4,
                                      FinishedHighschool_w5, 
                                      FinishedCollege_w5,
                                      EducationYears_w5,
                                      Health_w1,
                                      Health_w5,
                                      GPA,
                                      TotalEducation_Parents,
                                      PA_FamilyIncome,
                                      DadHealth,
                                      MomHealth
                                      
                                      
                          ),
                          statistic = list(all_continuous() ~ "{mean} \n({sd})",
                                           all_categorical() ~ "{p}"),
                          digits = all_categorical() ~ function(x) style_number(x, digits = 2),                 
                          label = list(
                            Male~ "Male", 
                            White_w1 ~ "White",
                            Hispanic_w1 ~ "Hispanic",
                            Employed_w3 ~ "Employed (w3)", 
                            Employed_w4 ~ "Employed (w4)",
                            FullTime_w3 ~ "Full time (w3)",
                            FullTime_w4 ~ "Full time (w4)",
                            HoursWorkedPerWeek_w3 ~ "Hours worked (w3)",
                            HoursWorkedPerWeek_w4 ~ "Hours worked (w4)",
                            PersonalEarnings_w3 ~ "Personal earnings (w3)",
                            PersonalEarnings_w4 ~ "Personal earnings (w4)",
                            FinishedHighschool_w5 ~ "Finished High School (w5)", 
                            FinishedCollege_w5 ~ "Finished College (w5)",
                            EducationYears_w5 ~ "Years of Education (w5)",
                            Health_w1 ~ "Health Status (w1)",
                            Health_w5 ~ "Health Status (w5)",
                            GPA ~ "Grade Point Average (GPA)",
                            TotalEducation_Parents ~ "Total Years of Education: Parents",
                            PA_FamilyIncome ~ "Total Family Earnings",
                            DadHealth ~ "Father's Health",
                            MomHealth ~ "Mother's Health"
                            ),
                          
                          missing = "no") %>%
  modify_footnote(update = everything() ~ NA) |>
  add_difference(include ) |>                      
  bold_labels()

# summary stat tables of 
# overall sample

sumstat_all <-   tbl_summary(data = AddHealth |> 
                               mutate(DadHealth = case_when(
                                 PA_Sex == 1 & PA_HealthStatus_w1 == 1 ~ "Excellent",
                                 PA_Sex == 1 & PA_HealthStatus_w1 == 2 ~ "Very good",
                                 PA_Sex == 1 & PA_HealthStatus_w1 == 3 ~ "Good",
                                 PA_Sex == 1 & PA_HealthStatus_w1 == 4 ~ "Fair",
                                 PA_Sex == 1 & PA_HealthStatus_w1 == 5 ~ "Poor",
                                 SP_Sex == 1 & SP_HealthStatus_w1 == 1 ~ "Excellent",
                                 SP_Sex == 1 & SP_HealthStatus_w1 == 2 ~ "Very good",
                                 SP_Sex == 1 & SP_HealthStatus_w1 == 3 ~ "Good",
                                 SP_Sex == 1 & SP_HealthStatus_w1 == 4 ~ "Fair",
                                 SP_Sex == 1 & SP_HealthStatus_w1 == 5 ~ "Poor"),
                                 MomHealth = case_when(
                                   PA_Sex == 2 & PA_HealthStatus_w1 == 1 ~ "Excellent",
                                   PA_Sex == 2 & PA_HealthStatus_w1 == 2 ~ "Very good",
                                   PA_Sex == 2 & PA_HealthStatus_w1 == 3 ~ "Good",
                                   PA_Sex == 2 & PA_HealthStatus_w1 == 4 ~ "Fair",
                                   PA_Sex == 2 & PA_HealthStatus_w1 == 5 ~ "Poor",
                                   SP_Sex == 2 & SP_HealthStatus_w1 == 1 ~ "Excellent",
                                   SP_Sex == 2 & SP_HealthStatus_w1 == 2 ~ "Very good",
                                   SP_Sex == 2 & SP_HealthStatus_w1 == 3 ~ "Good",
                                   SP_Sex == 2 & SP_HealthStatus_w1 == 4 ~ "Fair",
                                   SP_Sex == 2 & SP_HealthStatus_w1 == 5 ~ "Poor"),
                                 Health_w1 = case_when(
                                   HealthStatus_w1 == 1 ~ "Excellent",
                                   HealthStatus_w1 == 2 ~ "Very good",
                                   HealthStatus_w1 == 3 ~ "Good",
                                   HealthStatus_w1 == 4 ~ "Fair",
                                   HealthStatus_w1 == 5 ~ "Poor"),
                                 Health_w5 = case_when(
                                   HealthStatus_w5 == 1 ~ "Excellent",
                                   HealthStatus_w5 == 2 ~ "Very good",
                                   HealthStatus_w5 == 3 ~ "Good",
                                   HealthStatus_w5 == 4 ~ "Fair",
                                   HealthStatus_w5 == 5 ~ "Poor")),
                             include = c(Male, White_w1,
                                         Black_w1, Hispanic_w1,
                                         Employed_w3, Employed_w4,
                                         FullTime_w3, FullTime_w4,
                                         HoursWorkedPerWeek_w3,
                                         HoursWorkedPerWeek_w4,
                                         PersonalEarnings_w3,
                                         PersonalEarnings_w4,
                                         FinishedHighschool_w5, 
                                         FinishedCollege_w5,
                                         EducationYears_w5,
                                         Health_w1,
                                         Health_w5,
                                         GPA,
                                         TotalEducation_Parents,
                                         PA_FamilyIncome,
                                         DadHealth,
                                         MomHealth
                                         
                             ),
                             statistic = list(all_continuous() ~ "{mean} ({sd})"),
                             label = list(
                               Male~ "Male", 
                               White_w1 ~ "White",
                               Black_w1 ~ "Black",
                               Hispanic_w1 ~ "Hispanic",
                               Employed_w3 ~ "Employed (w3)", 
                               Employed_w4 ~ "Employed (w4)",
                               FullTime_w3 ~ "Full time (w3)",
                               FullTime_w4 ~ "Full time (w4)",
                               HoursWorkedPerWeek_w3 ~ "Hours worked (w3)",
                               HoursWorkedPerWeek_w4 ~ "Hours worked (w4)",
                               PersonalEarnings_w3 ~ "Personal earnings (w3)",
                               PersonalEarnings_w4 ~ "Personal earnings (w4)",
                               FinishedHighschool_w5 ~ "Finished High School (w5)", 
                               FinishedCollege_w5 ~ "Finished College (w5)",
                               EducationYears_w5 ~ "Years of Education (w5)",
                               Health_w1 ~ "Health Status (w1)",
                               Health_w5 ~ "Health Status (w5)",
                               GPA ~ "Grade Point Average (GPA)",
                               TotalEducation_Parents ~ "Total Years of Education: Parents",
                               PA_FamilyIncome ~ "Total Family Earnings",
                               DadHealth ~ "Father's Health",
                               MomHealth ~ "Mother's Health"
                             ),
                             missing = "no") %>% 
  bold_labels()

sumstat <- tbl_merge(tbls = list(sumstat_all, sumstat1),
                     tab_spanner = c("**Overall**", "**By Generation**"))

# sumstat_all %>% 
#   as_gt() %>% 
#   gt::gtsave(filename = file.path(tables_wd,"SumStatOverAll.tex"))

# save overall table
sumstat_all %>% 
  as_kable_extra(format = "latex",
                 booktabs = TRUE,
                 linesep = "",
                 escape = T,
                 caption = "Summary Statistics of the Add Health's Full Sample \\label{tab:sumstatfull}")  %>%
  kable_styling(bootstrap_options = c("hover", "condensed", "responsive"), latex_options = "scale_down", full_width = FALSE,  font_size = 12) %>%
  save_kable(file.path(tables_wd,"SumStatOverAll.tex"))
sumstat_all %>% 
  as_kable_extra(format = "latex",
                 booktabs = TRUE,
                 linesep = "",
                 escape = T,
                 caption = "Summary Statistics of the Add Health's Full Sample \\label{tab:sumstatfull}")  %>%
  kable_styling(full_width = FALSE,  font_size = 10) %>%
  save_kable(file.path(thesis_tabs,"tab01-SumStatOverAll.tex"))
# save table by type

sumstat %>% 
  as_kable_extra(format = "latex",
                 booktabs = TRUE,
                 linesep = "",
                 escape = T,
                 caption = "Summary Statistics of the Add Health: By Generation \\label{tab:sumstatbygen}")   %>%
  kable_styling(bootstrap_options = c("hover", "condensed", "responsive"), latex_options = "scale_down", full_width = FALSE,  font_size = 12) %>% 
  save_kable(file.path(tables_wd,"SumStat.tex"))

sumstat %>% 
  as_kable_extra(format = "latex",
                 booktabs = TRUE,
                 linesep = "",
                 escape = T,
                 caption = "Summary Statistics of the Add Health: By Generation \\label{tab:sumstatbygen}")   %>%
  kable_styling(bootstrap_options = c("hover", "condensed", "responsive"), latex_options = "scale_down", full_width = FALSE,  font_size = 12) %>% 
  landscape() %>% 
  save_kable(file.path(thesis_tabs,"tab02-SumStat.tex"))
