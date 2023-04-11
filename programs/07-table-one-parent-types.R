# Table of observation number
# of different types of parents

# table one

# date: January 19th, 2023

DATA <- read_dta(file.path(datasets,"BySexAnalysisData.dta"))

# all observations

ALL <- DATA %>%
  summarise(n())
# calculate the number 
# of white fathers
# white mothers

WW <- DATA %>%
  filter(Type == "White-White") %>%
  summarise(n())
# prettyNum(WW, big.mark = ",")
WW_perc <- paste0("(",round(WW/ALL, digits = 2), ")")

# calculate the number 
# of hispanic fathers
# white mothers

HW <- DATA %>%
  filter(Type == "Hispanic-White") %>%
  summarise(n())
HW_perc <- paste0("(",round(HW/ALL, digits = 2), ")")

# calculate the number 
# of white fathers
# hispanic mothers

WH <- DATA %>%
  filter(Type == "White-Hispanic") %>%
  summarise(n())
WH_perc <- paste0("(",round(WH/ALL, digits = 2), ")")

# calculate the number 
# of hispanic fathers
# hispanic mothers

HH <- DATA %>%
  filter(Type == "Hispanic-Hispanic") %>%
  summarise(n())
HH_perc <- paste0("(",round(HH/ALL, digits = 2), ")")

# table

first_col <- c(" ",
               "Observations"
)

second_col <- c("\\specialcell{White Father \\\\ White Mother}",
               paste0("\\specialcell{", 
                      prettyNum(WW, big.mark = ","), 
                      "\\\\",
                      WW_perc,
                      "}"
                      )
)

third_col <- c("\\specialcell{White Father \\\\ Hispanic Mother}",
                paste0("\\specialcell{", 
                       prettyNum(WH, big.mark = ","), 
                       "\\\\",
                       WH_perc,
                       "}"
                )
)

fourth_col <- c("\\specialcell{Hispanic Father \\\\ White Mother}",
                paste0("\\specialcell{", 
                       prettyNum(HW, big.mark = ","), 
                       "\\\\",
                       HW_perc,
                       "}"
                )
)

fifth_col <- c("\\specialcell{Hispanic Father \\\\ Hispanic Mother}",
                paste0("\\specialcell{", 
                       prettyNum(HH, big.mark = ","), 
                       "\\\\",
                       HH_perc,
                       "}"
                )
)

Table_cols <- cbind(first_col, second_col,  third_col, fourth_col, fifth_col)

Table_cols <-  Table_cols |> 
  row_to_names(row_number = 1)

knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Number of Children from the Different Types of Parents \\label{tab:mat1}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")) |> 
  footnote(number = c("The data is restricted to people interviewed between 1994 and 2019, also White, married, and between the ages of 18 and 65. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if both her parents were born in a Spanish-speaking country. A parent is White if born parents were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Perent\'s Type" = 4)) |> 
  save_kable(file.path(tables_wd,"tab01-observations-by-parents.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab01-observations-by-parents.tex"))

# presentation table
knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Number of Children from the Different Types of Parents \\label{tab:mat1}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")) |> 
  footnote(number = c("The data is restricted to people interviewed between 1994 and 2019, also White, married, and between the ages of 18 and 65. I identify the ethnicity of a person's parents through the parent's place of birth. A parent is Hispanic if both her parents were born in a Spanish-speaking country. A parent is White if born parents were born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Perent\'s Type" = 4)) |> 
  save_kable(file.path(dissertation_wd,"tables/tab01-observations-by-parents.tex"))
