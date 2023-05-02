# prep ACS data to be merged with 
# CPS data

# table two

# date: May 1st, 2023

DATA <- read_dta(file.path(datasets,"ParentDataFull.dta")) |> 
        mutate(BirthPlaceMom = case_when(bpld_mom  <=  09900  ~ "USA",
								         bpld_mom  ==  11000 ~ "Puerto Rico",
								         bpld_mom  ==  20000 ~ "Mexico",
										 bpld_mom  ==  21020 ~ "Costa Rica",
										 bpld_mom  ==  21030 ~ "El Salvador",
								         bpld_mom  ==  30025 ~ "Colombia",
								         bpld_mom  ==  54800 ~ "Spain",
								         bpld_mom  ==  30005 ~ "Argentina",
								         bpld_mom  ==  30050 ~ "Peru",
								         bpld_mom  ==  30065 ~ "Venzuela",
								         bpld_mom  ==  30020 ~ "Chile",
								         bpld_mom  ==  30030 ~ "Ecuador",
								         bpld_mom  ==  21040 ~ "Guatemala",
								         bpld_mom  ==  25000 ~ "Cuba",
								         bpld_mom  ==  30010 ~ "Bolivia",
								         bpld_mom  ==  26010 ~ "Dominican Republic",
								         bpld_mom  ==  21050 ~ "Honduras",
								         bpld_mom  ==  30070 ~ "Paraguay",
								         bpld_mom  ==  21060 ~ "Nicaragua",
								         bpld_mom  ==  21070 ~ "Panama",
								         bpld_mom  ==  30060 ~ "Uruguay",
								         bpld_mom  ==  30000 ~ "South America"),
                BirthPlaceDad = case_when(bpld_pop  <=  09900  ~ "USA",
								          bpld_pop  ==  11000 ~ "Puerto Rico",
								          bpld_pop  ==  20000 ~ "Mexico",
								          bpld_pop  ==  30025 ~ "Colombia",
								          bpld_pop  ==  54800 ~ "Spain",
								          bpld_pop  ==  30005 ~ "Argentina",
								          bpld_pop  ==  30050 ~ "Peru",
								          bpld_pop  ==  30065 ~ "Venzuela",
								          bpld_pop  ==  30020 ~ "Chile",
								          bpld_pop  ==  30030 ~ "Ecuador",
								          bpld_pop  ==  21040 ~ "Guatemala",
								          bpld_pop  ==  25000 ~ "Cuba",
								          bpld_pop  ==  30010 ~ "Bolivia",
								          bpld_pop  ==  26010 ~ "Dominican Republic",
								          bpld_pop  ==  21050 ~ "Honduras",
								          bpld_pop  ==  30070 ~ "Paraguay",
								          bpld_pop  ==  21030 ~ "El Salvador",
								          bpld_pop  ==  21060 ~ "Nicaragua",
								          bpld_pop  ==  21020 ~ "Costa Rica",
								          bpld_pop  ==  21070 ~ "Panama",
								          bpld_pop  ==  30060 ~ "Uruguay",
								          bpld_pop  ==  30000 ~ "South America"))

table(DATA$BirthPlaceMom)
# create variables for parents' outcomes
ParentData  <-  DATA  |> 
    group_by(YOB, CoupleType, bpld_mom, bpld_pop) |>
    summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = hhwt, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = hhwt, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = hhwt, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = hhwt, na.rm = TRUE),
              # Husband income
              Husband_ftotval       = weighted.mean(Husband_ftotval, weights = hhwt, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = hhwt, na.rm = TRUE)
              )
