# summary stats

# table three

# library(Hmisc)

# date: January 19th, 2023

IndividualData <- read_csv(file.path(datasets,"CPS_synth.csv")) |> 
  mutate(Education = as.numeric(Education)) |> 
  filter(WW == 1 | (WH == 1) | (HW == 1) | (HH == 1))

CrossTable(IndividualData$Type, IndividualData$Hispanic_ID)
row1 <- c("Variables", 
          "\\specialcell{White \\\\ White \\\\ (WW) \\\\ (1)}",
          "\\specialcell{White \\\\ Hispanic \\\\ (WH) \\\\ (2)}",
          "\\specialcell{Hispanic \\\\ White \\\\ (HW) \\\\ (3)}",
          "\\specialcell{Hispanic \\\\ Hispanic \\\\ (HH) \\\\ (4)}",
          "\\specialcell{HH - WW \\\\ (5)}",
          "\\specialcell{HW - WH \\\\ (6)}"
          )
dim(row1) <- c(1,7)

# Panel A
# Age and Education
row6 <- c("Panel A: Children's Education ", " ", " ", " ", " ", " ", " ")
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

## Man's High School dropout
ManEducation <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(
    hs_dropout_mean = mean(hs_dropout, na.rm = TRUE),
    hs_dropout_sd   = sd(hs_dropout, na.rm = TRUE)
  )

model <- lm(hs_dropout ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row16 <- c(
  "Men’s High School Dropout Rate",
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
dim(row16) <- c(1,7)

## Wife's High School dropout
WomanEducation <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(
    hs_dropout_mean = mean(hs_dropout, na.rm = TRUE),
    hs_dropout_sd   = sd(hs_dropout, na.rm = TRUE)
  )

model <- lm(hs_dropout ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row17 <- c(
  "Women’s High School Dropout Rate",
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
dim(row17) <- c(1,7)


## Man's associate degree
ManEducation <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(
    associate_degree_mean = mean(associate_degree, na.rm = TRUE),
    associate_degree_sd   = sd(associate_degree, na.rm = TRUE)
  )

model <- lm(associate_degree ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row20 <- c(
  "Men’s Associate Degree Rate",
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
dim(row20) <- c(1,7)

## Wife's associate degree
WomanEducation <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(
    associate_degree_mean = mean(associate_degree, na.rm = TRUE),
    associate_degree_sd   = sd(associate_degree, na.rm = TRUE)
  )

model <- lm(associate_degree ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row21 <- c(
  "Women’s Associate Degree Rate",
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
dim(row21) <- c(1,7)

## Man's BA degree
ManEducation <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(
    ba_degree_mean = mean(ba_degree, na.rm = TRUE),
    ba_degree_sd   = sd(ba_degree, na.rm = TRUE)
  )

model <- lm(ba_degree ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row22 <- c(
  "Men’s BA Degree Rate",
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
dim(row22) <- c(1,7)

## Wife's BA degree
WomanEducation <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(
    ba_degree_mean = mean(ba_degree, na.rm = TRUE),
    ba_degree_sd   = sd(ba_degree, na.rm = TRUE)
  )

model <- lm(ba_degree ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row23 <- c(
  "Women’s BA Degree Rate",
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
dim(row23) <- c(1,7)

## Man's Professional Degree
ManEducation <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(
    professional_degree_mean = mean(professional_degree, na.rm = TRUE),
    professional_degree_sd   = sd(professional_degree, na.rm = TRUE)
  )

model <- lm(professional_degree ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 1))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row24 <- c(
  "Men’s Professional Degree Rate",
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
dim(row24) <- c(1,7)

## Wife's Professional Degree
WomanEducation <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(
    professional_degree_mean = mean(professional_degree, na.rm = TRUE),
    professional_degree_sd   = sd(professional_degree, na.rm = TRUE)
  )

model <- lm(professional_degree ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2))

test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row25 <- c(
  "Women’s Professional Degree Rate",
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
dim(row25) <- c(1,7)

# Panel B
# Employment and Earnings
row9 <- c("Panel B: Children's Employment and Earnings ", " ", " ", " ", " ", " ", " ")
dim(row9) <- c(1,7)

## Man's employment
ManEmployed <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(EmployedMean   = mean(Employed, na.rm = T),
            EmployedSD = sd(Employed, na.rm = T))

model <- lm(1-Employed ~ 0 + WW + WH + HW + HH, 
             data = IndividualData |> filter(sex == 1))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row10 <- c(
  "Men’s Unemployment Rate",
  paste0("\\specialcell{", 
         round(1-ManEmployed[4,2], digits = 2), 
         "\\\\",
         "(",
         round(1-ManEmployed[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(1-ManEmployed[3,2], digits = 2), 
         "\\\\",
         "(",
         round(1-ManEmployed[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(1-ManEmployed[2,2], digits = 2), 
         "\\\\",
         "(",
         round(1-ManEmployed[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(1-ManEmployed[1,2], digits = 2), 
         "\\\\",
         "(",
         round(1-ManEmployed[1,3], digits = 2),
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

model <- lm(1-Employed ~ 0 + WW + WH + HW + HH, 
             data = IndividualData |> filter(sex == 2))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row11 <- c(
  "Women’s Unemployment Rate",
  paste0("\\specialcell{", 
         round(1-WomanEmployed[4,2], digits = 2), 
         "\\\\",
         "(",
         round(1-WomanEmployed[4,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(1-WomanEmployed[3,2], digits = 2), 
         "\\\\",
         "(",
         round(WomanEmployed[3,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(1-WomanEmployed[2,2], digits = 2), 
         "\\\\",
         "(",
         round(1-WomanEmployed[2,3], digits = 2),
         ")}"
  ),
  paste0("\\specialcell{", 
         round(1-WomanEmployed[1,2], digits = 2), 
         "\\\\",
         "(",
         round(1-WomanEmployed[1,3], digits = 2),
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
  filter(sex == 2 & FullTime_ASEC == 1) |> 
  group_by(Type) |> 
  summarise(lninctot_1999Mean   = mean(lninctot_1999, na.rm = T),
            lninctot_1999SD = sd(lninctot_1999, na.rm = T))

model <- lm(lninctot_1999 ~ 0 + WW + WH + HW + HH, 
            data = IndividualData |> filter(sex == 2 & FullTime_ASEC == 1))
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


# Panel C
# Hispanic Identity
row26 <- c("Panel C: Children's Hispanic Identity ", " ", " ", " ", " ", " ", " ")
dim(row26) <- c(1,7)

## Man's Identity
ManHispanic <- IndividualData |> 
  filter(sex == 1) |> 
  group_by(Type) |> 
  summarise(HispanicMan   = mean(Hispanic_ID, na.rm = T),
            HispanicSD = sd(Hispanic_ID, na.rm = T))

model <- lm(Hispanic_ID ~ 0 + WW + WH + HW + HH, 
             data = IndividualData |> filter(sex == 1))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row27 <- c(
  "Men",
  paste0("\\specialcell{", 
         round(ManHispanic[4,2], digits = 2),
         "}"
  ),
  paste0("\\specialcell{", 
         round(ManHispanic[3,2], digits = 2), 
         "}"
  ),
  paste0("\\specialcell{", 
         round(ManHispanic[2,2], digits = 2), 
         "}"
  ),
  paste0("\\specialcell{", 
         round(ManHispanic[1,2], digits = 2), 
         "}"
  ),
  paste0(" "
  ),
  paste0(" "
  )
)

dim(row27) <- c(1,7)
## Womens's Identity
WomenHispanic <- IndividualData |> 
  filter(sex == 2) |> 
  group_by(Type) |> 
  summarise(HispanicWoman   = mean(Hispanic_ID, na.rm = T),
            HispanicSD = sd(Hispanic_ID, na.rm = T))

model <- lm(Hispanic_ID ~ 0 + WW + WH + HW + HH, 
             data = IndividualData |> filter(sex == 2))
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row28 <- c(
  "Women",
  paste0("\\specialcell{", 
         round(WomenHispanic[4,2], digits = 2),
         "}"
  ),
  paste0("\\specialcell{", 
         round(WomenHispanic[3,2], digits = 2), 
         "}"
  ),
  paste0("\\specialcell{", 
         round(WomenHispanic[2,2], digits = 2), 
         "}"
  ),
  paste0("\\specialcell{", 
         round(WomenHispanic[1,2], digits = 2), 
         "}"
  ),
  paste0(" "
  ),
  paste0(" "
  )
)
dim(row28) <- c(1,7)


Table_rows <- rbind(row1,  row6,   row7,  row8,
                    row16, row17,
                    row20, row21,  row22, row23,
                    row24, row25,
                    row9,  row10,  row11, row12,
                    row13, row14,  row15, row26,
                    row27, row28)

Table_rows <-  Table_rows |> 
  row_to_names(row_number = 1)

knitr::kable(Table_rows, "html", align = "lcccccc",
             booktabs = T,
             escape = F,
             longtable = T, 
             caption = "Summary statistics of outcomes using parent's place of birth only for those that self-identify as Hispanic \\label{tab:c&p2}") %>%
  kable_classic(full_width = F) |>
  kable_styling(#bootstrap_options = c("hover", "condensed"), 
                latex_options = c(#"scale_down", 
                "HOLD_position",
                "repeat_header"
                ),
                repeat_header_continued = "\\textit{(Continued on Next Page...)}") |> 
  footnote(number = c("Source: The 1960-2000 Census for synthetic parents, and 1994-2019 Current Population Surveys (CPS) for children's outcomes",
                      "The data is restricted to native-born United States citizens between 1994 and 2019 who are also White and between the ages of 25 and 40. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if they were born in a Spanish-speaking country. A parent is White if they were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Father's and Mother's Ethnicities" = 4,
                     "Differences" = 2)) |> 
  column_spec(1, width = "5cm") |> 
  row_spec(c(1,12, 19), bold = T) |> 
  add_indent(c(2:11)) |>
  add_indent(c(13:18))|>
  add_indent(c(20:21))

knitr::kable(Table_rows, "latex", align = "lcccccc",
             booktabs = T,
             escape = F,
             longtable = T, 
             caption = "Summary Statistics of Outcomes Using Parent's Place of Birth \\label{tab:c&p2}") %>%
  kable_classic(full_width = F) |>
  kable_styling(#bootstrap_options = c("hover", "condensed"), 
                latex_options = c(#"scale_down", 
                "HOLD_position",
                "repeat_header"
                ),
                repeat_header_continued = "\\textit{(Continued on Next Page...)}") |> 
  footnote(number = c("Source: The 1994-2019 Current Population Surveys (CPS) for children's outcomes",
                      "The data is restricted to native-born United States citizens between 1994 and 2019 who are also White and between the ages of 25 and 40. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if they were born in a Spanish-speaking country. A parent is White if they were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Father's and Mother's Ethnicities" = 4,
                     "Differences" = 2)) |> 
  column_spec(1, width = "5cm") |> 
  row_spec(c(1,12, 19), bold = T) |> 
  add_indent(c(2:11)) |>
  add_indent(c(13:18))|>
  add_indent(c(20:21)) |> 
  landscape() |>
  save_kable(file.path(tables_wd,"tab04-summary-stats.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab04-summary-stats.tex")) |> 
  save_kable(file.path(manuscript_wd,"tab04-summary-stats.tex"))
