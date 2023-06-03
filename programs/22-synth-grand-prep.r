# prep ACS data to be merged with 
# CPS data

# table two

# date: May 1st, 2023

DATA <- read_dta(file.path(raw,"SynthGrands.dta")) |> 
        mutate(BirthPlaceMom = case_when(bpl_mom  <= 12092  ~ "USA",
           								 bpl_mom  == 11000  ~ "Puerto Rico",
           								 bpl_mom  == 30005  ~ "Argentina",
           								 bpl_mom  == 30010  ~ "Bolivia",
		   								 bpl_mom  == 30015  ~ "Brazil",
           								 bpl_mom  == 30020  ~ "Chile",
           								 bpl_mom  == 30025  ~ "Colombia",
           								 bpl_mom  == 26010  ~ "Dominican Republic",
           								 bpl_mom  == 30030  ~ "Ecuador",
           								 bpl_mom  == 21020  ~ "Costa Rica",
           								 bpl_mom  == 21030  ~ "El Salvador",
           								 bpl_mom  == 21040  ~ "Guatemala",
           								 bpl_mom  == 21050  ~ "Honduras",
           								 bpl_mom  == 25000  ~ "Cuba",
           								 bpl_mom  == 20000  ~ "Mexico",
           								 bpl_mom  == 21060  ~ "Nicaragua",
           								 bpl_mom  == 21070  ~ "Panama",
           								 bpl_mom  == 30050  ~ "Peru",
           								 bpl_mom  == 30060  ~ "Uruguay",
           								 bpl_mom  == 30065  ~ "Venezuela",
           								 bpl_mom  == 43800  ~ "Spain",
           								 bpl_mom  == 29900  ~ "Americas",
		   								 bpl_mom  == 21000  ~ "Cental America",
           								 bpl_mom  == 30000  ~ "South America"),
               BirthPlaceDad = case_when(bpl_pop  <= 12092  ~ "USA",
           								 bpl_pop  == 11000  ~ "Puerto Rico",
           								 bpl_pop  == 30005  ~ "Argentina",
           								 bpl_pop  == 30010  ~ "Bolivia",
		   								 bpl_pop  == 30015  ~ "Brazil",
           								 bpl_pop  == 30020  ~ "Chile",
           								 bpl_pop  == 30025  ~ "Colombia",
           								 bpl_pop  == 26010  ~ "Dominican Republic",
           								 bpl_pop  == 30030  ~ "Ecuador",
           								 bpl_pop  == 21020  ~ "Costa Rica",
           								 bpl_pop  == 21030  ~ "El Salvador",
           								 bpl_pop  == 21040  ~ "Guatemala",
           								 bpl_pop  == 21050  ~ "Honduras",
           								 bpl_pop  == 25000  ~ "Cuba",
           								 bpl_pop  == 20000  ~ "Mexico",
           								 bpl_pop  == 21060  ~ "Nicaragua",
           								 bpl_pop  == 21070  ~ "Panama",
           								 bpl_pop  == 30050  ~ "Peru",
           								 bpl_pop  == 30060  ~ "Uruguay",
           								 bpl_pop  == 30065  ~ "Venezuela",
           								 bpl_pop  == 43800  ~ "Spain",
           								 bpl_pop  == 29900  ~ "Americas",
		   								 bpl_pop  == 21000  ~ "Cental America",
           								 bpl_pop  == 30000  ~ "South America"),
			    GrandParentType = case_when(LAPatGrandDad == 1 ~ "Hispanic paternal grandfather",
											LAPatGrandMom == 1 ~ "Hispanic paternal grandmother",
											LAMatGrandDad == 1 ~ "Hispanic maternal grandfather",
											LAMatGrandMom == 1 ~ "Hispanic maternal grandfather"))
CrossTable(DATA$BirthPlaceMom)
CrossTable(DATA$CoupleType)

# create variables for parents' outcomes

DATA  |> 
	    group_by(CoupleType) |>
    	summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = hwtfinl, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = hwtfinl, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = hwtfinl, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = hwtfinl, na.rm = TRUE),
              # Husband income
              Husband_ftotval       = weighted.mean(Husband_ftotval, weights = hwtfinl, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = hwtfinl, na.rm = TRUE)
              )

ParentData  <-  DATA  |> 
	filter((LAPatGrandDad == 0 & CoupleType == "White-White") | (LAPatGrandDad == 0 & CoupleType == "White-Hispanic") | CoupleType == "Hispanic-White" | CoupleType == "Hispanic-Hispanic") |> 
    group_by(YOB, CoupleType, BirthPlaceMom, BirthPlaceDad
	) |>
    summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = hwtfinl, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = hwtfinl, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = hwtfinl, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = hwtfinl, na.rm = TRUE),
              # Husband income
              Husband_ftotval       = weighted.mean(Husband_ftotval, weights = hwtfinl, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = hwtfinl, na.rm = TRUE)
              )|>
	na.omit()

datasummary(HusbandEducation + WifeEducation + Husband_ftotval + Fertility ~ mean * CoupleType,
            data = ParentData)
DATA  |> 
	    group_by(CoupleType) |>
		summarise(
              # Husband education
              HusbandEducation      = mean(HusbandEducation, na.rm = TRUE),
              # Wife education
              WifeEducation         = mean(WifeEducation, na.rm = TRUE),
              # Husband income
              Husband_ftotval       = mean(Husband_ftotval, na.rm = TRUE),
              # Fertility
              Fertility             = mean(Fertility, na.rm = TRUE)
              )

table(ParentData$YOB)
# save data
write.csv(ParentData, file.path(datasets_git,"ParentData_synth_grands.csv"))
