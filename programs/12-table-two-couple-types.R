# Table of observation number
# of different types of parents

# table two

# date: January 19th, 2023

DATA <- read_dta(file.path(datasets,"ParentDataFull.dta"))

# all observations

ALL <- DATA %>%
  summarise(n())
# calculate the number 
# of white Husbands
# white Wifes

WW <- DATA %>%
  filter(CoupleType == "White-White") %>%
  summarise(n())
# prettyNum(WW, big.mark = ",")
WW_perc <- paste0(round(WW/ALL, digits = 2))

# calculate the number 
# of hispanic Husbands
# white Wifes

HW <- DATA %>%
  filter(CoupleType == "Hispanic-White") %>%
  summarise(n())
HW_perc <- paste0(round(HW/ALL, digits = 2))

# calculate the number 
# of white Husbands
# hispanic Wifes

WH <- DATA %>%
  filter(CoupleType == "White-Hispanic") %>%
  summarise(n())
WH_perc <- paste0(round(WH/ALL, digits = 2))

# calculate the number 
# of hispanic Husbands
# hispanic Wifes

HH <- DATA %>%
  filter(CoupleType == "Hispanic-Hispanic") %>%
  summarise(n())
HH_perc <- paste0(round(HH/ALL, digits = 2))

# table

first_col <- c(" ",
              paste0("\\specialcell{", 
              "Observations", 
                      "\\\\",
                      "Share",
                      "}"
               )
)

second_col <- c("\\specialcell{White Husband \\\\ White Wife}",
                paste0("\\specialcell{", 
                       prettyNum(WW, big.mark = ","), 
                       "\\\\",
                       WW_perc,
                       "}"
                )
)

third_col <- c("\\specialcell{White Husband \\\\ Hispanic Wife}",
               paste0("\\specialcell{", 
                      prettyNum(WH, big.mark = ","), 
                      "\\\\",
                      WH_perc,
                      "}"
               )
)

fourth_col <- c("\\specialcell{Hispanic Husband \\\\ White Wife}",
                paste0("\\specialcell{", 
                       prettyNum(HW, big.mark = ","), 
                       "\\\\",
                       HW_perc,
                       "}"
                )
)

fifth_col <- c("\\specialcell{Hispanic Husband \\\\ Hispanic Wife}",
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

knitr::kable(Table_cols, "html", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Couples' Type \\label{tab:mat2}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c("Source: 1960-1990 Census",
                      "The sample includes Whites, who are married, and are between the ages 25 and 40. Ethnicity of a person's parents are identified by the parent's place of birth. A parent is Hispanic if she/he was born in a Spanish-speaking country. A parent is White if she/he was born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  )

knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Couples' Type \\label{tab:mat2}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c("Source: 1960-2000 Census",
                      "The sample includes Whites, who are married, with kids, and are between the ages 25 and 40. Ethnicity of a person's parents are identified by the parent's place of birth. A parent is Hispanic if she/he was born in a Spanish-speaking country. A parent is White if she/he was born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Couples Type" = 4)) |> 
  save_kable(file.path(tables_wd,"tab02-observations-by-couple.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab02-observations-by-couple.tex"))
