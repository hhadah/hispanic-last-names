# summary stats

# table three

# date: January 19th, 2023

ParentData     <- read_csv(file.path(datasets,"CPS_synth.csv")) |> 
  mutate(Tot_ed = HusbandEducation + WifeEducation)

# Only Non-Mexicans
`%notin%` <- Negate(`%in%`)
ParentData <- ParentData |> 
       filter(BirthPlaceMom %notin% c("Mexico") & BirthPlaceDad %notin% c("Mexico"))


row1 <- c("Variables", 
          "\\specialcell{White \\\\ White \\\\ (WW) \\\\ (1)}",
          "\\specialcell{White \\\\ Hispanic \\\\ (WH) \\\\ (2)}",
          "\\specialcell{Hispanic \\\\ White \\\\ (HW) \\\\ (3)}",
          "\\specialcell{Hispanic \\\\ Hispanic \\\\ (HH) \\\\ (4)}",
          "\\specialcell{HH - WW \\\\ (5)}",
          "\\specialcell{HW - WH \\\\ (6)}"
          )
dim(row1) <- c(1,7)

# parent's panel

## Husband's Education
HusbandEducation <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(HusEducation   = mean(HusbandEducation, na.rm = T),
            HusEducationSD = sd(HusbandEducation, na.rm = T))

model <- lm(HusbandEducation ~ 0 + WW + WH + HW + HH, 
    data = ParentData)
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row3 <- c(
  "Husband's education (Total Years)",
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(HusbandEducation[4,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(HusbandEducation[4,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(HusbandEducation[3,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(HusbandEducation[3,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(HusbandEducation[2,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(HusbandEducation[2,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(HusbandEducation[1,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(HusbandEducation[1,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences1[[1]], digits = 2)),  
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues1[[1]], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences2[[1]], digits = 2)),  
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues2[[1]], digits = 2)), 
         ")}"
  )
)
dim(row3) <- c(1,7)

## Wife's Education
WifeEducation <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(WEducation   = mean(WifeEducation, na.rm = T),
            WEducationSD = sd(WifeEducation, na.rm = T))

model <- lm(WifeEducation ~ 0 + WW + WH + HW + HH, 
             data = ParentData)
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row4 <- c(
  "Wife's education (Total Years)",
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(WifeEducation[4,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(WifeEducation[4,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(WifeEducation[3,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(WifeEducation[3,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(WifeEducation[2,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(WifeEducation[2,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(WifeEducation[1,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(WifeEducation[1,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences1[[1]], digits = 2)),  
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues1[[1]], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences2[[1]], digits = 2)),  
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues2[[1]], digits = 2)), 
         ")}"
  )
)
dim(row4) <- c(1,7)

## Total Education
TotalEducation <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(HHducation   = mean(Tot_ed, na.rm = T),
            HHducationSD = sd(Tot_ed, na.rm = T))

model <- lm(Tot_ed ~ 0 + WW + WH + HW + HH, 
             data = ParentData)
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row5 <- c(
  "Total Household education (Total Years)",
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalEducation[4,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalEducation[4,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalEducation[3,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalEducation[3,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalEducation[2,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalEducation[2,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalEducation[1,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalEducation[1,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences1[[1]], digits = 2)),  
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues1[[1]], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences2[[1]], digits = 2)),  
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues2[[1]], digits = 2)), 
         ")}"
  )
)
dim(row5) <- c(1,7)

## Total Family Income
TotalFamInc <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(IncTotAvg   = mean(Husband_ftotval, na.rm = T),
            IncTotSD    = sd(Husband_ftotval, na.rm = T))

model <- lm(Husband_ftotval ~ 0 + WW + WH + HW + HH, 
             data = ParentData)
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row6 <- c(
  "Log Total Family Income",
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalFamInc[4,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalFamInc[4,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalFamInc[3,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalFamInc[3,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalFamInc[2,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalFamInc[2,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(TotalFamInc[1,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(TotalFamInc[1,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences1[[1]], digits = 2)),  
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues1[[1]], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences2[[1]], digits = 2)),  
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues2[[1]], digits = 2)), 
         ")}"
  )
)
dim(row6) <- c(1,7)

## Fertility
FertilityAvg <- ParentData |> 
  group_by(CoupleType) |> 
  summarise(FertAvg   = mean(Fertility, na.rm = T),
            FertSD    = sd(Fertility, na.rm = T))

model <- lm(Fertility ~ 0 + WW + WH + HW + HH, 
             data = ParentData)
test1 <- tidy(glht(model, linfct = c("HH - WW = 0")))
pvalues1 <- test1$std.error
differences1 <- test1$estimate

test2 <- tidy(glht(model, linfct = c("HW - WH = 0")))
pvalues2 <- test2$std.error
differences2 <- test2$estimate

row7 <- c(
  "Fertility",
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(FertilityAvg[4,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(FertilityAvg[4,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(FertilityAvg[3,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(FertilityAvg[3,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(FertilityAvg[2,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(FertilityAvg[2,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(FertilityAvg[1,2], digits = 2)),  
         "\\\\",
         "(",
         sprintf("%0.2f",round(FertilityAvg[1,3], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences1[[1]], digits = 2)),  
         symnum(pvalues1[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues1[[1]], digits = 2)), 
         ")}"
  ),
  paste0("\\specialcell{", 
         sprintf("%0.2f",round(differences2[[1]], digits = 2)),  
         symnum(pvalues2[[1]], corr = FALSE, na = FALSE, cutpoints = c(0, 0.01, 0.05, 0.1), symbols = c("***", "**", "*")),
         "\\\\",
         "(",
         sprintf("%0.2f",round(pvalues2[[1]], digits = 2)), 
         ")}"
  )
)
dim(row7) <- c(1,7)


Table_rows <- rbind(row1,  row3,  row4, 
                    row5,  row6, row7)

Table_rows <-  Table_rows |> 
  row_to_names(row_number = 1)

knitr::kable(Table_rows, "html", align = "lcccccc",
             booktabs = T,
             escape = F,
       #       longtable = T, 
             caption = "Summary statistics of synthetic parents by couple type (Non-Mexican Hispanics) \\label{tab:syntnonmex}") |>
  kable_classic(full_width = F) |>
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", 
                "HOLD_position"
              #   "repeat_header"
                )) |> 
  footnote(number = c("Source: The 1960-2000 Census for synthetic parents, and 1994-2019 Current Population Surveys (CPS) for children's outcomes",
                      "The data is restricted to native-born United States citizens who are also White, between the ages of 25 and 40, and have kids. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if they were born in a Spanish-speaking country. A parent is White if they were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Father's and Mother's Ethnicities" = 4,
                     "Differences" = 2)) |> 
  column_spec(1, width = "5cm")

knitr::kable(Table_rows, "latex", align = "lcccccc",
             booktabs = T,
             escape = F,
       #       longtable = T, 
             caption = "Summary statistics of synthetic parents by couple type (Non-Mexican Hispanics) \\label{tab:syntnonmex}") |>
  kable_classic(full_width = F) |>
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", 
                "HOLD_position"
              #   "repeat_header"
                )) |> 
  footnote(number = c("Source: The 1960-2000 Census for synthetic parents, and 1994-2019 Current Population Surveys (CPS) for children's outcomes",
                      "The data is restricted to native-born United States citizens who are also White, between the ages of 25 and 40, and have kids. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if they were born in a Spanish-speaking country other than Mexico. A parent is White if they were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Father's and Mother's Ethnicities" = 4,
                     "Differences" = 2)) |> 
  column_spec(1, width = "5cm") |> 
  save_kable(file.path(tables_wd,"tab03a-summary-stats-nonmex.tex")) |> 
  save_kable(file.path(thesis_tabs,"tab03a-summary-stats-nonmex.tex"))  |> 
  save_kable(file.path("/Users/hhadah/Documents/GiT/my_thesis/tables","tab03a-summary-stats-nonmex.tex"))

