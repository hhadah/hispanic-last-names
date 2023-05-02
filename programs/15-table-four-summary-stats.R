# summary stats

# table four
# only hispanics

# date: January 19th, 2023

IndividualData <- read_dta(file.path(datasets,"BySexAnalysisData.dta")) |> 
  mutate(Education = as.numeric(Education)) |> 
  filter(Hispanic_ID == 1)
ParentData     <- read_dta(file.path(datasets,"ParentDataFull.dta")) |> 
  mutate(Tot_ed = HusbandEducation + WifeEducation)

row1 <- c("Variables", 
          "\\specialcell{White Father \\\\ White Mother \\\\ (WW) \\\\ (1)}",
          "\\specialcell{White Father \\\\ Hispanic Mother \\\\ (WH) \\\\ (2)}",
          "\\specialcell{Hispanic Father \\\\ White Mother \\\\ (HW) \\\\ (3)}",
          "\\specialcell{Hispanic Father \\\\ Hispanic Mother \\\\ (HH) \\\\ (4)}",
          "\\specialcell{HH - WW \\\\ (5)}",
          "\\specialcell{HW - WH \\\\ (6)}"
          )

dim(row1) <- c(1,7)
row2 <- c("Panel A: Children's Sunthetic Parent", " ", " ", " ", " ", " ", " ")
dim(row2) <- c(1,7)

# parent's panel

## Husband's Education
HusbandEducation <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(HusEducation   = weighted.mean(HusbandEducation, na.rm = T, hhwt),
            HusEducationSD = weighted.sd(HusbandEducation, na.rm = T, hhwt))

model <- lm(HusbandEducation ~ 0 + WW + WM + MW + MM, 
            data = ParentData, 
            weights = hhwt)
test1 <- tidy(glht(model, linfct = c("MM - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("MW - WM = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row3 <- c(
  "Husband’seducation (Total Years)",
  paste0("\\specialcell{", 
         round(HusbandEducation[4,2], digits = 2), 
         "\\\\",
         "(",
         round(HusbandEducation[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(HusbandEducation[3,2], digits = 2), 
         "\\\\",
         "(",
         round(HusbandEducation[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(HusbandEducation[2,2], digits = 2), 
         "\\\\",
         "(",
         round(HusbandEducation[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(HusbandEducation[1,2], digits = 2), 
         "\\\\",
         "(",
         round(HusbandEducation[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row3) <- c(1,7)

## Wife's Education
WifeEducation <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(WEducation   = weighted.mean(WifeEducation, na.rm = T, hhwt),
            WEducationSD = weighted.sd(WifeEducation, na.rm = T, hhwt))

model <- lm(WifeEducation ~ 0 + WW + WM + MW + MM, 
            data = ParentData, 
            weights = hhwt)
test1 <- tidy(glht(model, linfct = c("MM - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("MW - WM = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row4 <- c(
  "Wife’seducation (Total Years)",
  paste0("\\specialcell{", 
         round(WifeEducation[4,2], digits = 2), 
         "\\\\",
         "(",
         round(WifeEducation[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WifeEducation[3,2], digits = 2), 
         "\\\\",
         "(",
         round(WifeEducation[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WifeEducation[2,2], digits = 2), 
         "\\\\",
         "(",
         round(WifeEducation[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WifeEducation[1,2], digits = 2), 
         "\\\\",
         "(",
         round(WifeEducation[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row4) <- c(1,7)

## Total Education
TotalEducation <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(HHducation   = weighted.mean(Tot_ed, na.rm = T, hhwt),
            HHducationSD = weighted.sd(Tot_ed, na.rm = T, hhwt))

model <- lm(Tot_ed ~ 0 + WW + WM + MW + MM, 
            data = ParentData, 
            weights = hhwt)
test1 <- tidy(glht(model, linfct = c("MM - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("MW - WM = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row5 <- c(
  "Total Household seducation (Total Years)",
  paste0("\\specialcell{", 
         round(TotalEducation[4,2], digits = 2), 
         "\\\\",
         "(",
         round(TotalEducation[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(TotalEducation[3,2], digits = 2), 
         "\\\\",
         "(",
         round(TotalEducation[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(TotalEducation[2,2], digits = 2), 
         "\\\\",
         "(",
         round(TotalEducation[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(TotalEducation[1,2], digits = 2), 
         "\\\\",
         "(",
         round(TotalEducation[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row5) <- c(1,7)

# Panel B
# Age and Education
row6 <- c("Panel B: Education ", " ", " ", " ", " ", " ", " ")
dim(row6) <- c(1,7)

## Man's Education
ManEducation <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(EducationMean   = mean(Education, na.rm = T),
            EducationSD = sd(Education, na.rm = T))

model <- lm(Education ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row7 <- c(
  "Men’s education (Total Years)",
  paste0("\\specialcell{", 
         round(ManEducation[4,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEducation[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(ManEducation[3,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEducation[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(ManEducation[2,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEducation[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(ManEducation[1,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEducation[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%.2f", round(differences1, 2)), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row7) <- c(1,7)
## Wife's Education
WomanEducation <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(EducationMean   = mean(Education, na.rm = T),
            EducationSD = sd(Education, na.rm = T))

model <- lm(Education ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row8 <- c(
  "Women’s education (Total Years)",
  paste0("\\specialcell{", 
         round(WomanEducation[4,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEducation[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WomanEducation[3,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEducation[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WomanEducation[2,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEducation[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WomanEducation[1,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEducation[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row8) <- c(1,7)





# Panel C
# Employment and Earnings
row9 <- c("Panel C: Children's Employment and Earnings ", " ", " ", " ", " ", " ", " ")
dim(row9) <- c(1,7)

## Man's employment
ManEmployed <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(EmployedMean   = mean(Employed, na.rm = T),
            EmployedSD = sd(Employed, na.rm = T))

model <- lm(Employed ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row10 <- c(
  "Men’s Employment Rate",
  paste0("\\specialcell{", 
         round(ManEmployed[4,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEmployed[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(ManEmployed[3,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEmployed[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(ManEmployed[2,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEmployed[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(ManEmployed[1,2], digits = 2), 
         "\\\\",
         "(",
         round(ManEmployed[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%.2f",round(differences1[[1]], digits = 2)), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%.2f",round(pvalues1[[1]], digits = 2)),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%.2f",round(pvalues2[[1]], digits = 2)),
         ")}"
  )
)
dim(row10) <- c(1,7)
## Woman's employment
WomanEmployed <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(EmployedMean   = mean(Employed, na.rm = T),
            EmployedSD = sd(Employed, na.rm = T))

model <- lm(Employed ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row11 <- c(
  "Women’s Employment Rate",
  paste0("\\specialcell{", 
         round(WomanEmployed[4,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEmployed[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WomanEmployed[3,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEmployed[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WomanEmployed[2,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEmployed[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(WomanEmployed[1,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEmployed[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%.2f",round(differences1[[1]], digits = 2)), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%.2f",round(pvalues1[[1]], digits = 2)),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%.2f",round(pvalues2[[1]], digits = 2)),
         ")}"
  )
)
dim(row11) <- c(1,7)


## Man's log hourly earns
Manlnhourwage_1999 <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(lnhourwage_1999Mean   = mean(lnhourwage_1999, na.rm = T),
            lnhourwage_1999SD = sd(lnhourwage_1999, na.rm = T))

model <- lm(lnhourwage_1999 ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row12 <- c(
  "Men’s Log Hourly Earnings",
  paste0("\\specialcell{", 
         round(Manlnhourwage_1999[4,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlnhourwage_1999[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Manlnhourwage_1999[3,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlnhourwage_1999[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Manlnhourwage_1999[2,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlnhourwage_1999[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Manlnhourwage_1999[1,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlnhourwage_1999[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%.2f", round(differences2, 2)), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row12) <- c(1,7)
## Woman's log hourly earns
Womanlnhourwage_1999 <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(lnhourwage_1999Mean   = mean(lnhourwage_1999, na.rm = T),
            lnhourwage_1999SD = sd(lnhourwage_1999, na.rm = T))

model <- lm(lnhourwage_1999 ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row13 <- c(
  "Women’s Log Hourly Earnings",
  paste0("\\specialcell{", 
         round(Womanlnhourwage_1999[4,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlnhourwage_1999[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Womanlnhourwage_1999[3,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlnhourwage_1999[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Womanlnhourwage_1999[2,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlnhourwage_1999[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Womanlnhourwage_1999[1,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlnhourwage_1999[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row13) <- c(1,7)





## Man's log annual earns
Manlninctot_1999 <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(lninctot_1999Mean   = mean(lninctot_1999, na.rm = T),
            lninctot_1999SD = sd(lninctot_1999, na.rm = T))

model <- lm(lninctot_1999 ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row14 <- c(
  "Men’s Log Annual Earnings",
  paste0("\\specialcell{", 
         round(Manlninctot_1999[4,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlninctot_1999[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Manlninctot_1999[3,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlninctot_1999[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Manlninctot_1999[2,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlninctot_1999[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Manlninctot_1999[1,2], digits = 2), 
         "\\\\",
         "(",
         round(Manlninctot_1999[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%.2f", round(differences2, 2)), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row14) <- c(1,7)
## Woman's log hourly earns
Womanlninctot_1999 <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(lninctot_1999Mean   = mean(lninctot_1999, na.rm = T),
            lninctot_1999SD = sd(lninctot_1999, na.rm = T))

model <- lm(lninctot_1999 ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row15 <- c(
  "Women’s Log Annual Earnings",
  paste0("\\specialcell{", 
         round(Womanlninctot_1999[4,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlninctot_1999[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Womanlninctot_1999[3,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlninctot_1999[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Womanlninctot_1999[2,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlninctot_1999[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(Womanlninctot_1999[1,2], digits = 2), 
         "\\\\",
         "(",
         round(Womanlninctot_1999[1,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences1[[1]], digits = 2), 
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues1[[1]], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(differences2[[1]], digits = 2), 
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         round(pvalues2[[1]], digits = 2),
         ")}"
  )
)
dim(row15) <- c(1,7)






Table_rows <- rbind(row1,  row2,   row3,  row4, 
                    row5,  row6,   row7,  row8, 
                    row9,  row10,  row11, row12,
                    row13, row14,  row15)

Table_rows <-  Table_rows |> 
  row_to_names(row_number = 1)

knitr::kable(Table_rows, "latex", align = "lcccccc",
             booktabs = T,
             escape = F,
             caption = "Summary statistics of outcomes using parent's place of birth only for those that self-identify as Hispanic \\label{tab:c&p2}") %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", 
                "HOLD_position"
              #   "repeat_header"
                )) |> 
  footnote(number = c("Source: The 1970-1990 Census for synthetic parents, and 1994-2019 Current Population Surveys (CPS) for children's outcomes",
                      "The data is restricted to native-born United States citizens between 1994 and 2019 who are also White and between the ages of 25 and 40, and who identify as Hispanic. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if they were born in a Spanish-speaking country. A parent is White if they were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T

  ) |> 
  add_header_above(c(" " = 1, "Father's and Mother's Ethnicities" = 4,
                     "Differences" = 2)) |> 
  row_spec(c(1,5,8), bold = T) |> 
  add_indent(c(2:4)) %>%
  add_indent(c(6:7)) %>%
  add_indent(c(9:14)) %>%
  save_kable(file.path(tables_wd,"tab04-summary-stats.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab04-summary-stats.tex")) |> 
  save_kable(file.path("/Users/hhadah/Documents/GiT/my_thesis/tables","tab04-summary-stats.tex"))


