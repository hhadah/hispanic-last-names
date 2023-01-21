# Data cleaning and wrangling

# date: May 14th, 2022

# Open data

# AddHealth <- read_dta(file.path(workdir,"AddHealth_Cleaned.dta"))
# 
# write_csv(AddHealth, file.path(workdir,"AddHealth_Cleaned.csv"))

# AddHealth <- read_dta(file.path(workdir,"AddHealth_Cleaned.dta"))
# write_csv(AddHealth, file.path(workdir,"AddHealth_Cleaned.csv"))
AddHealth <- read_csv(file.path(add_health_data_dir,"AddHealth_Cleaned.csv"))

####################
# Data cleaning
####################

# Demographics
AddHealth <- AddHealth %>%
  mutate(SCHL_Sex = ifelse(SCHL_Sex==2,1,0),
         Black_w1 = ifelse(Black_w1==1 & Hispanic_w1 == 0 & White_w1 == 0 & Native_w1 == 0 & Asian_w1 == 0 & Other_w1 == 0,1,0),
         Black_w3 = ifelse(Black_w3==1 & Hispanic_w3 == 0 & White_w3 == 0 & Native_w3 == 0 & Asian_w3 == 0,1,0),
         Other_w1 = ifelse(Other_w1==1 & Hispanic_w1 == 0  & White_w1 == 0 & Native_w1 == 0 & Asian_w1 == 0 & Black_w1 == 0,1,0),
         White_w1 = ifelse(White_w1==1 & Hispanic_w1 == 0   & Other_w1 == 0 & Native_w1 == 0 & Asian_w1 == 0 & Black_w1 == 0,1,0),
         Native_w1 = ifelse(Native_w1==1 & Hispanic_w1 == 0    & Other_w1 == 0 & White_w1 == 0 & Asian_w1 == 0 & Black_w1 == 0,1,0),
         Asian_w1 = ifelse(Asian_w1==1 & Hispanic_w1 == 0     & Other_w1 == 0 & White_w1 == 0 & Native_w1 == 0 & Black_w1 == 0,1,0),
         White_w3 = ifelse(White_w3==1 & Hispanic_w3 == 0  & Black_w3 == 0 & Native_w3 == 0 & Asian_w3 == 0,1,0),
         Race_w1 = case_when(White_w1 == 1 ~"White",
                             Black_w1 == 1 ~"Black",
                             Other_w1 == 1 ~"Other",
                             Native_w1 == 1 ~"Native",
                             Asian_w1 == 1 ~"Asian",
                             Hispanic_w1 == 1 ~"Hispanic"),
         Race_w3 = case_when(White_w3 == 1 ~"White",
                             Black_w3 == 1 ~"Black",
                             Native_w3 == 1 ~"Native",
                             Asian_w3 == 1 ~"Asian",
                             Hispanic_w3 == 1 ~"Hispanic"),
         PA_Hispanic = ifelse(PA_White == 1 & PA_Hispanic == 1, 1, 0),
         SP_Hispanic = ifelse(SP_White == 1 & SP_Hispanic == 1, 1, 0),
         PA_White = ifelse(PA_White == 1 & PA_Hispanic == 0, 1, 0),
         SP_White = ifelse(SP_White == 1 & SP_Hispanic == 0, 1, 0),
         PA_Black = ifelse(PA_Black == 1 & PA_Hispanic == 0, 1, 0),
         SP_Black = ifelse(SP_Black == 1 & SP_Hispanic == 0, 1, 0),
         PA_Native = ifelse(PA_Native == 1 & PA_Hispanic == 0, 1, 0),
         SP_Native = ifelse(SP_Native == 1 & SP_Hispanic == 0, 1, 0),
         PA_Asian = ifelse(PA_Asian == 1 & PA_Hispanic == 0, 1, 0),
         SP_Asian = ifelse(SP_Asian == 1 & SP_Hispanic == 0, 1, 0),
         PA_Other = ifelse(PA_Other == 1 & PA_Hispanic == 0, 1, 0),
         BothParentsUS = ifelse(BioMomBornUS_w1 == 1 &
                                  BioDadBornUS_w1 == 1, 1, 0),
         MomUSDadNo = ifelse(BioMomBornUS_w1 == 1 &
                               BioDadBornUS_w1 == 0, 1, 0),
         MomNoDadUS = ifelse(BioMomBornUS_w1 == 0 &
                               BioDadBornUS_w1 == 1, 1, 0),
         BothParentsNo = ifelse(BioMomBornUS_w1 == 0 &
                                  BioDadBornUS_w1 == 0, 1, 0),
         OneOrTwoPA_HispanicOrigins = ifelse(PA_Hispanic == 1 | SP_Hispanic == 1, 1, 0),
         OneOrTwoPA_SpnshPOB = ifelse(POB_MomSpanish_w1 == 1 | POB_DadSpanish_w1 == 1, 1, 0)
  )


# Generational variables (4 gens)
AddHealth <- AddHealth %>%
  mutate(FirstGen = ifelse(POB_Spanish_w1 == 1, 1,0),
         SecondGen = ifelse(POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 1,1 ,0 ),
         ThirdGen = ifelse(POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 0 & SpanishSpeakingCntryOrigin_w3 == 1, 1, 0),
         FourthGen = ifelse(POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 0 & SpanishSpeakingCntryOrigin_w3 == 0 & (OneOrTwoPA_HispanicOrigins == 1 
                                                                                                                   # | Hispanic_w1 == 1
         ), 1, 0),
         FourthGen_White = ifelse(POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 0 & SpanishSpeakingCntryOrigin_w3 == 0 & PA_Hispanic == 0 & SP_Hispanic == 0 & PA_White == 1 & SP_White == 1 
                                  # & White_w1 == 1
                                  , 1, 0),
         Type := case_when(FirstGen == 1 ~ "First Generation",
                           SecondGen == 1 ~ "Second Generation",
                           ThirdGen == 1 ~ "Third Generation",
                           FourthGen == 1 ~ "Fourth Generation+ Hispanic",
                           FourthGen_White == 1 ~ "Fourth Generation+ White"),
         NumberHispanicParents = case_when((PA_Hispanic == 1 & SP_Hispanic == 0) | (PA_Hispanic == 0 & SP_Hispanic == 1) ~ 1,
                                           
                                           PA_Hispanic == 1 & SP_Hispanic == 1 ~ 2,
                                           PA_Hispanic == 0 & SP_Hispanic == 0 ~ 0))

# Generational variables (three gens)
AddHealth <- AddHealth %>%
  mutate(FirstGen_2 = ifelse(POB_Spanish_w1 == 1, 1,0),
         SecondGen_2 = ifelse(POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 1,1 ,0 ),
         ThirdGen_2 = ifelse((POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 0 & (SpanishSpeakingCntryOrigin_w3 == 1 | PA_Hispanic == 1 | SP_Hispanic == 1)), 1, 0),
         ThirdGen_White_2 = ifelse(POB_Spanish_w1 == 0 & OneOrTwoPA_SpnshPOB == 0 & SpanishSpeakingCntryOrigin_w3 == 0 & PA_Hispanic == 0 & SP_Hispanic == 0 & PA_White == 1 & SP_White == 1 
                                   # & White_w1 == 1
                                   , 1, 0),
         Type_2 = case_when(FirstGen_2 == 1 ~ "First Generation",
                            SecondGen_2 == 1 ~ "Second Generation",
                            ThirdGen_2 == 1 ~ "Third Generation+",
                            ThirdGen_White_2 == 1 ~ "Third Generation+ White")
  )

# Education 
AddHealth <- AddHealth |> 
  mutate(
         Parent_Schooling = case_when(PA_Schooling == 1 ~ 8,
                                      PA_Schooling == 10 ~ 0,
                                      PA_Schooling == 2 ~ 11,
                                      PA_Schooling == 3 ~ 11,
                                      PA_Schooling == 4 ~ 12,
                                      PA_Schooling == 5 ~ 12,
                                      PA_Schooling == 6 ~ 12,
                                      PA_Schooling == 7 ~ 13,
                                      PA_Schooling == 8 ~ 16,
                                      PA_Schooling == 9 ~ 18
         ),
         Spouse_Schooling = case_when(SP_Schooling == 1 ~ 8,
                                      SP_Schooling == 10 ~ 0,
                                      SP_Schooling == 2 ~ 11,
                                      SP_Schooling == 3 ~ 11,
                                      SP_Schooling == 4 ~ 12,
                                      SP_Schooling == 5 ~ 12,
                                      SP_Schooling == 6 ~ 12,
                                      SP_Schooling == 7 ~ 13,
                                      SP_Schooling == 8 ~ 16,
                                      SP_Schooling == 9 ~ 18
         ),
         TotalEducation_Parents = Parent_Schooling + Spouse_Schooling,
         EducationYears_w3 = case_when(
           HighestGrade_w3 == 6 ~  6,
           HighestGrade_w3 == 7 ~  7,
           HighestGrade_w3 == 8 ~  8,
           HighestGrade_w3 == 9 ~  9,
           HighestGrade_w3 == 10 ~ 10,
           HighestGrade_w3 == 11 ~ 11,
           HighestGrade_w3 == 12 ~ 12,
           HighestGrade_w3 == 13 ~ 13,
           HighestGrade_w3 == 14 ~ 14,
           HighestGrade_w3 == 15 ~ 15,
           HighestGrade_w3 == 16 ~ 16,
           HighestGrade_w3 == 17 ~ 16,
           HighestGrade_w3 == 18 ~ 17,
           HighestGrade_w3 == 19 ~ 18,
           HighestGrade_w3 == 20 ~ 19,
           HighestGrade_w3 == 21 ~ 20,
           HighestGrade_w3 == 22 ~ 21
         ),
         EducationYears_w4 = case_when(
           HighestGrade_w4 == 1 ~  8,
           HighestGrade_w4 == 2 ~  9,
           HighestGrade_w4 == 3 ~  12,
           HighestGrade_w4 == 4 ~  12,
           HighestGrade_w4 == 5 ~  13,
           HighestGrade_w4 == 6 ~  13,
           HighestGrade_w4 == 7 ~  16,
           HighestGrade_w4 == 8 ~  17,
           HighestGrade_w4 == 9 ~  18,
           HighestGrade_w4 == 10 ~ 19,
           HighestGrade_w4 == 11 ~ 21,
           HighestGrade_w4 == 12 ~ 16,
           HighestGrade_w4 == 13 ~ 21
         ),
         EducationYears_w5 = case_when(
           HighestGrade_w5 == 1 ~  8,
           HighestGrade_w5 == 2 ~  9,
           HighestGrade_w5 == 3 ~  12,
           HighestGrade_w5 == 4 ~  12,
           HighestGrade_w5 == 5 ~  13,
           HighestGrade_w5 == 6 ~  13,
           HighestGrade_w5 == 7 ~  16,
           HighestGrade_w5 == 8 ~  14,
           HighestGrade_w5 == 9 ~  13,
           HighestGrade_w5 == 10 ~ 16,
           HighestGrade_w5 == 11 ~ 17,
           HighestGrade_w5 == 12 ~ 18,
           HighestGrade_w5 == 13 ~ 19,
           HighestGrade_w5 == 14 ~ 21,
           HighestGrade_w5 == 15 ~ 16,
           HighestGrade_w5 == 16 ~ 20
         ),
         Age_w1 = IYEAR - BirthYear_w1,
         Age_w1_sq = Age_w1^2,
         Age_w1_cube = Age_w1^3,
         Age_w1_quad = Age_w1^4,
         Age_w2 = IYEAR2 - BirthYear_w2,
         Age_w2_sq = Age_w2^2,
         Age_w2_cube = Age_w1^3,
         Age_w2_quad = Age_w1^4,
         Age_w3 = IYEAR3 - BirthYear_w3,
         Age_w3_sq = Age_w3^2,
         Age_w3_cube = Age_w1^3,
         Age_w3_quad = Age_w1^4,
         Age_w4 = IYEAR4 - BirthYear_w4,
         Age_w4_sq = Age_w4^2,
         Age_w4_cube = Age_w1^3,
         Age_w4_quad = Age_w1^4,
         Age_w5 = IYEAR5 - BirthYear_w5,
         Age_w5_sq = Age_w5^2,
         Age_w5_cube = Age_w1^3,
         Age_w5_quad = Age_w1^4,
         EducationYears_sq   = EducationYears_w5^2,
         EducationYears_cube = EducationYears_w5^3,
         EducationYears_quad = EducationYears_w5^4
         # ,
         # EducationYears_w1 = case_when(
         #   HighestGrade_w1 == 1 ~  8,
         #   HighestGrade_w1 == 2 ~  9,
         #   HighestGrade_w1 == 3 ~  12,
         #   HighestGrade_w1 == 4 ~  12,
         #   HighestGrade_w1 == 5 ~  13,
         #   HighestGrade_w1 == 6 ~  13,
         #   HighestGrade_w1 == 7 ~  16,
         #   HighestGrade_w1 == 8 ~  17,
         #   HighestGrade_w1 == 9 ~  18,
         #   HighestGrade_w1 == 10 ~ 19,
         #   HighestGrade_w1 == 11 ~ 21,
         #   HighestGrade_w1 == 12 ~ 16,
         #   HighestGrade_w1 == 13 ~ 21
         # ),
         # EducationYears_w2 = case_when(
         #   HighestGrade_w2 == 1 ~  8,
         #   HighestGrade_w2 == 2 ~  9,
         #   HighestGrade_w2 == 3 ~  12,
         #   HighestGrade_w2 == 4 ~  12,
         #   HighestGrade_w2 == 5 ~  13,
         #   HighestGrade_w2 == 6 ~  13,
         #   HighestGrade_w2 == 7 ~  16,
         #   HighestGrade_w2 == 8 ~  17,
         #   HighestGrade_w2 == 9 ~  18,
         #   HighestGrade_w2 == 10 ~ 19,
         #   HighestGrade_w2 == 11 ~ 21,
         #   HighestGrade_w2 == 12 ~ 16,
         #   HighestGrade_w2 == 13 ~ 21
         # )
  )

# Calculate GPA

AddHealth <- AddHealth %>%
  mutate(EnglishGrade = case_when(EnglishGrade_w1 == 1 ~ 4,
                                  EnglishGrade_w1 == 2 ~ 3,
                                  EnglishGrade_w1 == 3 ~ 2,
                                  EnglishGrade_w1 == 4 ~ 1),
         MathGrade =    case_when(MathGrade_w1    == 1 ~ 4,
                                  MathGrade_w1    == 2 ~ 3,
                                  MathGrade_w1    == 3 ~ 2,
                                  MathGrade_w1    == 4 ~ 1),
         HistoryGrade = case_when(HistoryGrade_w1 == 1 ~ 4,
                                  HistoryGrade_w1 == 2 ~ 3,
                                  HistoryGrade_w1 == 3 ~ 2,
                                  HistoryGrade_w1 == 4 ~ 1),
         ScienceGrade = case_when(ScienceGrade_w1 == 1 ~ 4,
                                  ScienceGrade_w1 == 2 ~ 3,
                                  ScienceGrade_w1 == 3 ~ 2,
                                  ScienceGrade_w1 == 4 ~ 1))
AddHealth <- AddHealth %>%
  mutate(GPA = rowMeans(AddHealth[,c("EnglishGrade", "MathGrade" ,"HistoryGrade", 
                                     "ScienceGrade")]))

AddHealth <- AddHealth %>%
  mutate(WhiteMom = case_when(PA_White == 1 & PA_Sex == 2 ~ 1,
                              SP_White == 1 & SP_Sex == 2 ~ 1,
                              PA_White == 0 & PA_Sex == 2 ~ 0,
                              SP_White == 0 & SP_Sex == 2 ~ 0),
         WhiteDad = case_when(PA_White == 1 & PA_Sex == 1 ~ 1,
                              SP_White == 1 & SP_Sex == 1 ~ 1,
                              PA_White == 0 & PA_Sex == 1 ~ 0,
                              SP_White == 0 & SP_Sex == 1 ~ 0),
         HispanicMom = case_when(PA_Hispanic == 1 & PA_Sex == 2 ~ 1,
                                 SP_Hispanic == 1 & SP_Sex == 2 ~ 1,
                                 PA_Hispanic == 0 & PA_Sex == 2 ~ 0,
                                 SP_Hispanic == 0 & SP_Sex == 2 ~ 0),
         HispanicDad = case_when(PA_Hispanic == 1 & PA_Sex == 1 ~ 1,
                                 SP_Hispanic == 1 & SP_Sex == 1 ~ 1,
                                 PA_Hispanic == 0 & PA_Sex == 1 ~ 0,
                                 SP_Hispanic == 0 & SP_Sex == 1 ~ 0),
         # WW = ifelse((DadBornUSA_w1 == 1 & MomBornUSA_w1 == 1), 1, 0),
         # WH = ifelse((DadBornUSA_w1 == 1 & POB_MomSpanish_w1 == 1), 1, 0),
         # HW = ifelse((POB_DadSpanish_w1 == 1 & MomBornUSA_w1 == 1), 1, 0),
         # HH = ifelse((POB_DadSpanish_w1 == 1 & POB_MomSpanish_w1 == 1), 1, 0),
         WW = ifelse((WhiteDad == 1 & WhiteMom == 1), 1, 0),
         WH = ifelse((WhiteDad == 1 & HispanicMom == 1), 1, 0),
         HW = ifelse((HispanicDad == 1 & WhiteMom == 1), 1, 0),
         HH = ifelse((HispanicDad == 1 & HispanicMom == 1), 1, 0),
         Male = ifelse(BIO_SEX_w1 == 1, 1, 0),
         ParentType = case_when(WW == 1 ~"White-White",
                                WH == 1 ~ "White-Hispanic",
                                HW == 1 ~ "Hispanic-White",
                                HH == 1 ~ "Hispanic-Hispanic"))

# Log personal earnings
AddHealth <- AddHealth %>%
  mutate(PersonalEarnings_w3 = ifelse(PersonalEarnings_w3 >= 1, PersonalEarnings_w3, 1),
         PersonalEarnings_w4 = ifelse(PersonalEarnings_w4 >= 1, PersonalEarnings_w4, 1),
         TotPersonalEarnings_w3 = ifelse(TotPersonalEarnings_w3 >= 1, TotPersonalEarnings_w3, 1),
         TotalHHIncome_w3 = ifelse(TotalHHIncome_w3 >= 1, TotalHHIncome_w3, 1),
         Ln_pers_earns_w3 = log(PersonalEarnings_w3),
         Ln_pers_earns_w4 = log(PersonalEarnings_w4),
         Ln_tot_pers_earns_w3 =  log(TotPersonalEarnings_w3),
         Ln_tot_income_w3 = log(TotalHHIncome_w3))

# Employment

AddHealth <- AddHealth %>% 
  mutate(FullTime_w3 = case_when(HoursWorkedPerWeek_w3 >= 35 ~ "Full time",
                                 HoursWorkedPerWeek_w3 < 35 & HoursWorkedPerWeek_w3 > 0~ "Part time",
                                 HoursWorkedPerWeek_w3 == 0 | is.na(HoursWorkedPerWeek_w3)~ "Does not work"),
         FullTime_w4 = case_when(HoursWorkedPerWeek_w4 >= 35 ~ "Full time",
                                 HoursWorkedPerWeek_w4 < 35 & HoursWorkedPerWeek_w4 > 0~ "Part time",
                                 HoursWorkedPerWeek_w4 == 0  | is.na(HoursWorkedPerWeek_w4) ~ "Does not work"),
         Full_w3 = ifelse(FullTime_w3 == "Full time", 1, 0),
         Full_w4 = ifelse(FullTime_w4 == "Full time", 1, 0),
         FullYear_w3 = ifelse(FullYear1999_w3 == 1, 1, 0),
         Employed_w3 = case_when(CurrentlyEmployedA_w3 == 1 ~ 1,
                                 CurrentlyEmployedA_w3 != 1 ~ 0,
                                 is.na(CurrentlyEmployedA_w3) ~ 0),
         Employed_w4 = case_when(CurrentlyEmployedA_w4 == 1 | HoursWorkedPerWeek_w4 > 0~ 1,
                                 CurrentlyEmployedA_w4 != 1 ~ 0,
                                 is.na(CurrentlyEmployedA_w4) ~ 0),
         Employed_w5 = case_when(CurrentlyEmployedA_w5 == 1 ~ 1,
                                 CurrentlyEmployedA_w5 != 1 ~ 0,
                                 is.na(CurrentlyEmployedA_w5) ~ 0))


AddHealth <- AddHealth %>%
  mutate(
    PA_FamilyIncome = ifelse(PA_FamilyIncome >= 999, NA, PA_FamilyIncome*1000),
    PA_FamilyIncome = ifelse(PA_FamilyIncome <= 1, 1, PA_FamilyIncome),
    LogFamIncome = log(PA_FamilyIncome))

AddHealth <- AddHealth %>% 
  mutate(FinishedHighschool_w5 = ifelse(HighestGrade_w5 >= 3, 1, 0),
         FinishedCollege_w5 = ifelse(HighestGrade_w5 >= 7, 1, 0),
         OrderedTotPersonalEarnings_w5 = as.ordered(TotPersonalEarnings_w5),
         ThirdGenHispanic = ifelse(ThirdGen == 1 & Hispanic_w1 == 1, 1, 0),
         ThirdGenNonHispanic = ifelse(ThirdGen == 1 & Hispanic_w1 == 0, 1, 0),
         FourthGenHispanic = ifelse(FourthGen == 1 & Hispanic_w1 == 1, 1, 0),
         FourthGenNonHispanic = ifelse(FourthGen == 1 & Hispanic_w1 == 0, 1, 0),
         Experience_w3 = Age_w3 - EducationYears_w3 - 6,
         Experience_w4 = Age_w4 - EducationYears_w4 - 6,
         Experience_w5 = Age_w5 - EducationYears_w5 - 6,
         Experience_sq_w3 = Experience_w3^2,
         Experience_sq_w4 = Experience_w4^2,
         Experience_sq_w5 = Experience_w5^2)

AddHealth <- AddHealth %>% 
  # select(aid, IYEAR, IYEAR2, IYEAR3, IYEAR4, IYEAR5, 
  #        IDAY, IDAY2, IDAY3, IDAY4,
  #        IMONTH, IMONTH2, IMONTH3, IMONTH4, IMONTH5, 
  #        GSWGT1,  GSWGT2, EducationYears_w4, FinishedHighschool_w5, 
  #        FinishedCollege_w5, FirstGen, SecondGen, 
  #        ThirdGen, FourthGen, FourthGen_White, 
  #        White_w1, Hispanic_w1, GSW5, 
  #        TotalEducation_Parents, 
  #        EducationYears_w3, EducationYears_w5, HH, WW, HW, WH, LogFamIncome, 
  #        Male, Ln_pers_earns_w4, HealthStatus_w1, GSWGT3, GSWGT4, 
  #        HealthStatus_w5, HealthStatus_w2, HealthStatus_w3, 
  #        HealthStatus_w4, Ln_pers_earns_w3, TotPersonalEarnings_w5, 
  #        Hispanic_w3, Hispanic_w5, Age_w1, Age_w1_sq, Age_w2, 
  #        Age_w2_sq, Age_w3, Age_w3_sq, Age_w4, Age_w4_sq, Age_w5, 
  #        Age_w5_sq, PA_Schooling, SP_Schooling, ThirdGenHispanic, 
  #        ThirdGenNonHispanic, FourthGenHispanic, FourthGenNonHispanic, 
  #        TotalEducation_Parents, Male, CurrentlyEmployedA_w3, 
  #        CurrentlyEmployedA_w4, CurrentlyEmployedA_w5, 
  #        HoursWorkedPerWeek_w3, HoursWorkedPerWeek_w4, 
  #        HoursWorkedPerWeek_w5, HourlyPay_w3, TotalHHIncome_w3, 
  #        TotalHHIncome_w4, TotalHHIncome_w5, PersonalEarnings_w3, 
  #        PersonalEarnings_w4, TotPersonalEarnings_w3, 
  #        TotPersonalEarnings_w5, FullTime_w3, FullTime_w4, 
  #        FullYear_w3, Employed_w3, Employed_w4, Employed_w5, 
  #        Experience_w3, Experience_w4, Experience_w5, 
  #        Experience_sq_w3, Experience_sq_w4, Experience_sq_w5, 
  #        Full_w3, Full_w4, Age_w4_cube, Age_w4_quad, Age_w5_cube, 
  #        Age_w5_quad, Age_w3_cube, Age_w3_quad, Age_w2_cube, 
  #        Age_w2_quad, Age_w1_cube, Age_w1_quad, PA_HealthStatus_w1, 
  #        SP_HealthStatus_w1, EducationYears_sq,
  #        EducationYears_cube, EducationYears_quad, HighestGrade_w5,
  #        w1state, w2state, w3group, 
  #        w5group1, w5group2, w5group3, w5group4, w5group5, 
  #        w3group, w4group0, w4group1,
  #        HighestGrade_w3, HighestGrade_w4, HighestGrade_w5, GPA,
  #        PA_Sex, SP_Sex) %>% 
  # state vars wave 1 & 2
  rename(state_w1 = w1state,
         state_w2 = w2state) %>% 
  # create a state variable
  # using grouping variable
  # the first two digits
  # represent a psuedo state
  separate(w3group, sep = 2, c("state_w3", "rest_w3")) %>% 
  separate(w4group1, sep = 2, c("state_w4", "rest_w4")) %>% 
  separate(w5group1, sep = 2, c("state_w1_2010", "rest_w1")) %>%
  separate(w5group2, sep = 2, c("state_w2_2010", "rest_w2")) %>%
  separate(w5group3, sep = 2, c("state_w3_2010", "rest_w3")) %>%
  separate(w5group4, sep = 2, c("state_w4_2010", "rest_w4")) %>%
  separate(w5group5, sep = 2, c("state_w5_2010", "rest_w5"))

# create 5 schooling dummies

AddHealth <- AddHealth %>% 
  mutate(
    HighSchl_dropout_w3 = ifelse(HighestGrade_w3 <= 11, 1, 0),
    HighSchl_diplona_w3 = ifelse(HighestGrade_w3 == 12, 1, 0),
    Some_college_w3 = ifelse(HighestGrade_w3 <= 15 & HighestGrade_w3 >= 13, 1, 0),
    College_w3 = ifelse(HighestGrade_w3 >= 16 & HighestGrade_w3 <= 17, 1, 0),
    GraduateSchl_w3 = ifelse(HighestGrade_w3 <= 22 & HighestGrade_w3 >= 18, 1, 0),
    HighSchl_dropout_w4 = ifelse(HighestGrade_w4 <= 2, 1, 0),
    HighSchl_diplona_w4 = ifelse(HighestGrade_w4 == 3, 1, 0),
    Some_college_w4 = ifelse(HighestGrade_w4 <= 6 & HighestGrade_w4 >= 4, 1, 0),
    College_w4 = ifelse(HighestGrade_w4 == 7, 1, 0),
    GraduateSchl_w4 = ifelse(HighestGrade_w4 <= 13 & HighestGrade_w4 >= 8, 1, 0),
    HighSchl_dropout_w5 = ifelse(HighestGrade_w5 <= 2, 1, 0),
    HighSchl_diplona_w5 = ifelse(HighestGrade_w5 == 3, 1, 0),
    Some_college_w5 = ifelse(HighestGrade_w5 <= 6 & HighestGrade_w5 >= 4, 1, 0),
    College_w5 = ifelse(HighestGrade_w5 == 7, 1, 0),
    GraduateSchl_w5 = ifelse(HighestGrade_w5 <= 13 & HighestGrade_w5 >= 8, 1, 0))


write_csv(AddHealth, file.path(datasets_git,"AddHealth_Cleaned.csv"))
