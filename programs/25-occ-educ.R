# This a script to
# run a regression

# date: May 24th, 2022

# data
IndividualData <- read_csv(file.path(datasets,"CPS_synth.csv")) |> 
  mutate(Education = as.numeric(Education)) |> 
  filter((WH == 1) | (HW == 1))

IndividualData <- IndividualData  |> 
  mutate(
    `Managers` = case_when(occ1990 == 1 ~ 1, TRUE ~ 0),
    `Business and Financial Operations` = case_when(occ1990 == 2 ~ 1, TRUE ~ 0),
    `Computer and Mathematical` = case_when(occ1990 == 3 ~ 1, TRUE ~ 0),
    `Architecture and Engineering` = case_when(occ1990 == 4 ~ 1, TRUE ~ 0),
    `Life, Physical, and Social Science` = case_when(occ1990 == 5 ~ 1, TRUE ~ 0),
    `Community and Social Services` = case_when(occ1990 == 6 ~ 1, TRUE ~ 0),
    `Legal` = case_when(occ1990 == 7 ~ 1, TRUE ~ 0),
    `Education, Training, and Library` = case_when(occ1990 == 8 ~ 1, TRUE ~ 0),
    `Arts, Design, Entertainment, Sports, and Media` = case_when(occ1990 == 9 ~ 1, TRUE ~ 0),
    `Healthcare Practitioners and Technical` = case_when(occ1990 == 10 ~ 1, TRUE ~ 0),
    `Healthcare Support` = case_when(occ1990 == 11 ~ 1, TRUE ~ 0),
    `Protective Service` = case_when(occ1990 == 12 ~ 1, TRUE ~ 0),
    `Food Preparation and Serving` = case_when(occ1990 == 13 ~ 1, TRUE ~ 0),
    `Building and Grounds Cleaning and Maintenance` = case_when(occ1990 == 14 ~ 1, TRUE ~ 0),
    `Personal Care and Service` = case_when(occ1990 == 15 ~ 1, TRUE ~ 0),
    `Sales and Related` = case_when(occ1990 == 16 ~ 1, TRUE ~ 0),
    `Office and Administrative Support` = case_when(occ1990 == 17 ~ 1, TRUE ~ 0),
    `Farming, Fishing, and Forestry` = case_when(occ1990 == 18 ~ 1, TRUE ~ 0),
    `Construction and Extraction` = case_when(occ1990 == 19 ~ 1, TRUE ~ 0),
    `Installation, Maintenance, and Repair` = case_when(occ1990 == 20 ~ 1, TRUE ~ 0),
    `Production` = case_when(occ1990 == 21 ~ 1, TRUE ~ 0),
    `Transportation and Material Moving` = case_when(occ1990 == 22 ~ 1, TRUE ~ 0),
    `Military` = case_when(occ1990 == 23 ~ 1, TRUE ~ 0)
  )
# IndividualData <- IndividualData  |> 
#     mutate(Type = case_when(Type == "Hispanic-White" ~ "Hispanic-White",
#                             Type == "White-Hispanic" ~ "White-Hispanic"))
IndividualData <- IndividualData  |> 
    select(`Managers`, `Business and Financial Operations`, 
           `Computer and Mathematical`, `Architecture and Engineering`, 
           `Life, Physical, and Social Science`, `Community and Social Services`, 
           `Legal`, `Education, Training, and Library`, `Arts, Design, Entertainment, Sports, and Media`, 
           `Healthcare Practitioners and Technical`, `Healthcare Support`, 
           `Protective Service`, `Food Preparation and Serving`, 
           `Building and Grounds Cleaning and Maintenance`, 
           `Personal Care and Service`, `Sales and Related`, 
           `Office and Administrative Support`, `Farming, Fishing, and Forestry`, 
           `Construction and Extraction`, `Installation, Maintenance, and Repair`, 
           `Production`, `Transportation and Material Moving`, `Military`, Type) 

IndividualData <- IndividualData  |> 
  mutate(
    `Management and Business` = Managers + `Business and Financial Operations`,
    `STEM Occupations` = `Computer and Mathematical` + `Architecture and Engineering` + `Life, Physical, and Social Science`,
    `Healthcare Occupations` = `Healthcare Practitioners and Technical` + `Healthcare Support`,
    `Education and Social Services` = `Education, Training, and Library` + `Community and Social Services`,
    `Arts, Media, and Entertainment` = `Arts, Design, Entertainment, Sports, and Media` + Legal,
    `Service Occupations` = `Personal Care and Service` + `Food Preparation and Serving` + `Building and Grounds Cleaning and Maintenance` + `Protective Service`,
    `Manual and Industrial Labor` = `Construction and Extraction` + `Installation, Maintenance, and Repair` + Production + `Transportation and Material Moving` + `Farming, Fishing, and Forestry`
  ) |> 
  select(`Management and Business`, `STEM Occupations`, `Healthcare Occupations`, `Education and Social Services`, 
         `Arts, Media, and Entertainment`, `Service Occupations`, `Manual and Industrial Labor`, Type)


# Calculate means by Type and perform t-tests
results <- IndividualData %>%
  group_by(Type) %>%
  summarise(across(starts_with("Management and Business"):`Manual and Industrial Labor`, mean, na.rm = TRUE)) %>%
  pivot_longer(cols = -Type, names_to = "Occupation", values_to = "Mean") %>%
  pivot_wider(names_from = Type, values_from = Mean) %>%
  rowwise() %>%
  mutate(
    Difference = `Hispanic-White` - `White-Hispanic`,
    `p value` = t.test(IndividualData[[Occupation]][IndividualData$Type == "Hispanic-White"],
                     IndividualData[[Occupation]][IndividualData$Type == "White-Hispanic"])$p.value
  ) %>%
  ungroup()

# Round the results to the nearest three
results <- results %>%
  mutate(
    `Hispanic-White` = round(`Hispanic-White`, 3),
    `White-Hispanic` = round(`White-Hispanic`, 3),
    Difference = round(Difference, 3),
    `p value` = round(`p value`, 3)
  )

# View the rounded results
print(results)

caption <- 'Descriptive Statistics About Selection Into Occupation by Type \\label{tab:occ-sum}'
reference <- 'Source: Current Population Survey (CPS) 1994-2019.'

results |> kbl()

knitr::kable(results, "html", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = caption) %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c(reference),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Hispanic Last Name" = 1, "White Last Name" = 1, " " = 2))

knitr::kable(results, "latex", align = "lcccc",
             booktabs = T,
             escape = F,
             caption = caption) %>%
  column_spec(1, bold = T) %>%
  kable_classic(full_width = F) %>%
  kable_styling(bootstrap_options = c("hover", "condensed"), 
                latex_options = c("scale_down", "HOLD_position")) |> 
  footnote(number = c(reference),
           footnote_as_chunk = F, title_format = c("italic"),
           escape = F, threeparttable = T
  ) |> 
  add_header_above(c(" " = 1, "Hispanic Last Name" = 1, "White Last Name" = 1, "Difference-in-means: HW - WH" = 2)) |> 
  save_kable(file.path("/Users/hhadah/Documents/GiT/hispanic-last-names/manuscripts/labour-v5","/tab12-occ.tex"))
