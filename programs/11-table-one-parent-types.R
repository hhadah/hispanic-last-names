# Table of observation number
# of different types of parents

# table one

# date: January 19th, 2023

DATA <- read_csv(file.path(datasets,"CPS_synth.csv"))

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
WW_perc <- paste0(round(WW/ALL, digits = 2))

# calculate the number 
# of hispanic fathers
# white mothers

HW <- DATA %>%
  filter(Type == "Hispanic-White") %>%
  summarise(n())
HW_perc <- paste0(round(HW/ALL, digits = 2))

# calculate the number 
# of white fathers
# hispanic mothers

WH <- DATA %>%
  filter(Type == "White-Hispanic") %>%
  summarise(n())
WH_perc <- paste0(round(WH/ALL, digits = 2))

# calculate the number 
# of hispanic fathers
# hispanic mothers

HH <- DATA %>%
  filter(Type == "Hispanic-Hispanic") %>%
  summarise(n())
HH_perc <- paste0(round(HH/ALL, digits = 2))

# table

first_col <- c(" ",
                paste0("\\specialcell{", 
                "Observations", 
                      "\\\\",
                "Share",
                      "}"
))

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

knitr::kable(Table_cols, "html", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Number of Children by Parental Type \\label{tab:mat1}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c("Source: Current Population Surveys (CPS) 1994-2019",
                      "The sample includes Whites, who are married, and are between the ages 25 and 40. Ethnicity of a person's parents are identified by the parent's place of birth. A parent is Hispanic if she/he was born in a Spanish-speaking country. A parent is White if she/he was born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Perental Type" = 4))

knitr::kable(Table_cols, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = "Number of Children by Parental Type \\label{tab:mat1}") %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c("Source: Current Population Surveys (CPS) 1994-2019",
                      "The sample includes Whites, who are married, and are between the ages 25 and 40. Ethnicity of a person's parents are identified by the parent's place of birth. A parent is Hispanic if she/he was born in a Spanish-speaking country. A parent is White if she/he was born in the United States."),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Perental Type" = 4)) |> 
  save_kable(file.path(tables_wd,"tab01-observations-by-parents.tex")) %>% 
  save_kable(file.path(thesis_tabs,"tab01-observations-by-parents.tex")) |> 
  save_kable(file.path("/Users/hhadah/Documents/GiT/my_thesis/tables","tab01-observations-by-parents.tex"))



# # Pie chat

# # Calculate total number of observations
# ALL <- nrow(DATA)

# # Create dataframe with labels and values
# labels <- c("White-White", "Hispanic-White", "White-Hispanic", "Hispanic-Hispanic")
# values <- c(as.numeric(WW[1,1]), as.numeric(HW[1,1]), as.numeric(WH[1,1]), as.numeric(HH[1,1]))
# percentages <- round(values/ALL * 100, digits = 2)

# df <- data.frame(value = percentages,
#                  num = values,
#                  group = labels)

# df2 <- df %>% 
#   mutate(csum = rev(cumsum(rev(value))), 
#          pos = csum - value/2)

# # Create pie chart with percentages and total number of observations
# ggplot(df, aes(x = "" , y = value, fill = fct_inorder(group))) +
#   geom_col(width = 1, color = 1) +
#   coord_polar(theta = "y") +
#   scale_fill_manual(values = cbbPalette[2:5]) +
#   labs(title = "Types of Parents", 
#        subtitle = paste0("Total observations: ", format(ALL, big.mark = ",")), 
#        fill = "Type of Parents") +
#   theme_void(base_family = "LM Roman 10") +
#   theme(text = element_text(family = "LM Roman 10")) +
#   geom_label_repel(data = df2,
#                    aes(y = pos, label = paste0(format(num, big.mark = ","), "(",value, "%)")),
#                    size = 2, nudge_x =0.9 , show.legend = FALSE,
#                   #  fill = "transparent",
#                    color = "black",
#                    segment.color = "transparent",
#                    segment.size = 0.5,
#                    segment.alpha = 0.7,
#                    radius = 1.2)
