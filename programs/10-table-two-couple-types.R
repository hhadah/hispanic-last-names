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
WW_perc <- paste0("(",round(WW/ALL, digits = 2), ")")

# calculate the number 
# of hispanic Husbands
# white Wifes

HW <- DATA %>%
  filter(CoupleType == "Hispanic-White") %>%
  summarise(n())
HW_perc <- paste0("(",round(HW/ALL, digits = 2), ")")

# calculate the number 
# of white Husbands
# hispanic Wifes

WH <- DATA %>%
  filter(CoupleType == "White-Hispanic") %>%
  summarise(n())
WH_perc <- paste0("(",round(WH/ALL, digits = 2), ")")

# calculate the number 
# of hispanic Husbands
# hispanic Wifes

HH <- DATA %>%
  filter(CoupleType == "Hispanic-Hispanic") %>%
  summarise(n())
HH_perc <- paste0("(",round(HH/ALL, digits = 2), ")")

# table

first_col <- c(" ",
               "Observations"
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

knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Couples' Type \\label{tab:mat2}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")) |> 
  footnote(number = c("The data is restricted to people interviewed in 1970 and 1960 and also White and married. I identify the ethnicity of a person through their place of birth. A parent is Hispanic if they were born in a Spanish-speaking country. A parent is White if they were born in the United States.",
                      "The table includes information on the proportion of the four types of synthetic parents that I have constructed."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Couples\' Type" = 4)) |> 
  save_kable(file.path(tables_wd,"tab02-observations-by-couple.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab02-observations-by-couple.tex"))

# presentation table

knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Couples' Type \\label{tab:mat2}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "hold_position")) |>  
  add_header_above(c(" " = 1, "Couples\' Type" = 4)) |> 
  save_kable(file.path(dissertation_wd,"tables/tab02-observations-by-couple.tex"))
