# summary stats

# table about first
# generation immigrants
# Native born
# and Hisapnic identity

# date: January 19th, 2023

ParentData     <- read_dta(file.path(datasets,"ParentDataFull.dta")) |> 
  mutate(Tot_ed = HusbandEducation + WifeEducation)

CrossTable(ParentData$LAHusband, ParentData$Hispanic_Husband)
CrossTable(ParentData$LAWife, ParentData$Hispanic_Wife)

# Spanish-speaking country
# place of birth husbands
# in America

LA_Husbands <- ParentData %>%
    filter(LAHusband == 1) %>%
    summarise(n())

# Spanish-speaking country
# place of birth husbands
# in America

LA_Hispanic_Husbands <- ParentData %>%
    filter(LAHusband == 1 & Hispanic_Husband == 1) %>%
    summarise(n())

# Percent Spanish-speaking country
# and Hispanic husbands

LA_Hispanic_Husbands_perc <- as.numeric(paste0(round(LA_Hispanic_Husbands/LA_Husbands, digits = 2)))

# Native born husbands
# in America

NA_Husbands <- ParentData %>%
    filter(LAHusband == 0) %>%
    summarise(n())

# Native born and Hispanic
# husbands

NA_Hispanic_Husbands <- ParentData %>%
    filter(LAHusband == 0 & Hispanic_Husband == 1) %>%
    summarise(n())

# Percent Native born and Hispanic
# husbands

NA_Hispanic_Husbands_perc <- as.numeric(paste0(round(NA_Hispanic_Husbands/NA_Husbands, digits = 2)))

# Spanish-speaking country
# place of birth wives
# in America

LA_Wifes <- ParentData %>%
    filter(LAWife == 1) %>%
    summarise(n())

# Spanish-speaking country
# place of birth wives
# in America

LA_Hispanic_Wifes <- ParentData %>%
    filter(LAWife == 1 & Hispanic_Wife == 1) %>%
    summarise(n())

# Percent Spanish-speaking country
# and Hispanic wives

LA_Hispanic_Wifes_perc <- as.numeric(paste0(round(LA_Hispanic_Wifes/LA_Wifes, digits = 2)))

# Native born wives
# in America

NA_Wifes <- ParentData %>%
    filter(LAWife == 0) %>%
    summarise(n())

# Native born and Hispanic
# wives

NA_Hispanic_Wifes <- ParentData %>%
    filter(LAWife == 0 & Hispanic_Wife == 1) %>%
    summarise(n())

# Percent Native born and Hispanic
# wives

NA_Hispanic_Wifes_perc <- as.numeric(paste0(round(NA_Hispanic_Wifes/NA_Wifes, digits = 2)))


# table

first_col <- c(" ",
                paste0("\\specialcell{", 
                "Percent White", 
                      "\\\\",
                "Percent Hispanic",
                      "}"
))

second_col <- c("\\specialcell{Native Born Husband}",
               paste0("\\specialcell{", 
                      1 - NA_Hispanic_Husbands_perc, 
                      "\\\\",
                      NA_Hispanic_Husbands_perc,
                      "}"
                      )
)

third_col <- c("\\specialcell{Spanish-Speaking \\\\ Place of Birth \\\\ Husband}",
                paste0("\\specialcell{", 
                       1 - LA_Hispanic_Husbands_perc, 
                       "\\\\",
                       LA_Hispanic_Husbands_perc,
                       "}"
                )
)

fourth_col <- c("\\specialcell{Native Born Wife}",
                paste0("\\specialcell{", 
                       1 - NA_Hispanic_Wifes_perc, 
                       "\\\\",
                       NA_Hispanic_Wifes_perc,
                       "}"
                )
)

fifth_col <- c("\\specialcell{Spanish-Speaking \\\\ Place of Birth \\\\ Wife}",
                paste0("\\specialcell{", 
                       1 - LA_Hispanic_Wifes_perc, 
                       "\\\\",
                       LA_Hispanic_Wifes_perc,
                       "}"
                )
)



Table_cols <- cbind(first_col, second_col,  third_col, fourth_col, fifth_col)

Table_cols <-  Table_cols |> 
  row_to_names(row_number = 1)

knitr::kable(Table_cols, "html", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Number of Children by Parental Type \\label{tab:mat1}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c("Source: 1960-2000 Census",
                      "The sample includes Whites, who are married, and are between the ages 25 and 40."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  )

knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Self-reported Hispanic Identity Among First-Generation Hispanic Immigrants and Native-Born \\label{tab:mat3}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c("Source: 1960-2000 Census",
                      "The sample includes Whites, who are married, and are between the ages 25 and 40."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  save_kable(file.path(tables_wd,"tab11-measurement-error.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab11-measurement-error.tex"))
