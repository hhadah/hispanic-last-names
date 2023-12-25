# prep ACS data to be merged with 
# CPS data

# table two

# date: May 1st, 2023

DATA <- read_dta(file.path(datasets,"ParentDataFull.dta")) |> 
        mutate(BirthPlaceMom = case_when(bpld_mom  <= 12092  ~ "USA",
           								 bpld_mom  == 11000  ~ "Puerto Rico",
           								 bpld_mom  == 30005  ~ "Argentina",
           								 bpld_mom  == 30010  ~ "Bolivia",
		   								 bpld_mom  == 30015  ~ "Brazil",
           								 bpld_mom  == 30020  ~ "Chile",
           								 bpld_mom  == 30025  ~ "Colombia",
           								 bpld_mom  == 26010  ~ "Dominican Republic",
           								 bpld_mom  == 30030  ~ "Ecuador",
           								 bpld_mom  == 21020  ~ "Costa Rica",
           								 bpld_mom  == 21030  ~ "El Salvador",
           								 bpld_mom  == 21040  ~ "Guatemala",
           								 bpld_mom  == 21050  ~ "Honduras",
           								 bpld_mom  == 25000  ~ "Cuba",
           								 bpld_mom  == 20000  ~ "Mexico",
           								 bpld_mom  == 21060  ~ "Nicaragua",
           								 bpld_mom  == 21070  ~ "Panama",
           								 bpld_mom  == 30050  ~ "Peru",
           								 bpld_mom  == 30060  ~ "Uruguay",
           								 bpld_mom  == 30065  ~ "Venezuela",
           								 bpld_mom  == 43800  ~ "Spain",
           								 bpld_mom  == 29900  ~ "Americas",
		   								 bpld_mom  == 21000  ~ "Cental America",
           								 bpld_mom  == 30000  ~ "South America"),
               BirthPlaceDad = case_when(bpld_pop  <= 12092  ~ "USA",
           								 bpld_pop  == 11000  ~ "Puerto Rico",
           								 bpld_pop  == 30005  ~ "Argentina",
           								 bpld_pop  == 30010  ~ "Bolivia",
		   								 bpld_pop  == 30015  ~ "Brazil",
           								 bpld_pop  == 30020  ~ "Chile",
           								 bpld_pop  == 30025  ~ "Colombia",
           								 bpld_pop  == 26010  ~ "Dominican Republic",
           								 bpld_pop  == 30030  ~ "Ecuador",
           								 bpld_pop  == 21020  ~ "Costa Rica",
           								 bpld_pop  == 21030  ~ "El Salvador",
           								 bpld_pop  == 21040  ~ "Guatemala",
           								 bpld_pop  == 21050  ~ "Honduras",
           								 bpld_pop  == 25000  ~ "Cuba",
           								 bpld_pop  == 20000  ~ "Mexico",
           								 bpld_pop  == 21060  ~ "Nicaragua",
           								 bpld_pop  == 21070  ~ "Panama",
           								 bpld_pop  == 30050  ~ "Peru",
           								 bpld_pop  == 30060  ~ "Uruguay",
           								 bpld_pop  == 30065  ~ "Venezuela",
           								 bpld_pop  == 43800  ~ "Spain",
           								 bpld_pop  == 29900  ~ "Americas",
		   								 bpld_pop  == 21000  ~ "Cental America",
           								 bpld_pop  == 30000  ~ "South America"))
CrossTable(DATA$BirthPlaceMom)
write_dta(DATA, file.path(datasets,"ParentDataFull.dta"))
# create variables for parents' outcomes

DATA  |> 
	    group_by(CoupleType) |>
    	summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = Husband_wt, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = Wife_wt, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = Husband_wt, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = Wife_wt, na.rm = TRUE),
              # family income
              Husband_ftotval       = weighted.mean(Husband_ftotval, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourly inctot
              Husband_inctot        = weighted.mean(Hus_log_hourly_earnings_inctot, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourly incwage
              Husband_incwage       = weighted.mean(Hus_log_hourly_earnings_incwage, weights = Husband_wt, na.rm = TRUE),
			  # Wife hourly inctot
              Wife_inctot           = weighted.mean(Wife_log_hourly_earnings_inctot, weights = Wife_wt, na.rm = TRUE),
			  # Wife hourly incwage
              Wife_incwage          = weighted.mean(Wife_log_hourly_earnings_incwage, weights = Wife_wt, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = Wife_wt, na.rm = TRUE)
              )

ParentData  <-  DATA  |> 
    group_by(YOB, CoupleType, BirthPlaceMom, BirthPlaceDad
	) |>
    summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = Husband_wt, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = Wife_wt, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = Husband_wt, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = Wife_wt, na.rm = TRUE),
              # Husband income
              Husband_ftotval       = weighted.mean(Husband_ftotval, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourly inctot
              Husband_inctot        = weighted.mean(Hus_log_hourly_earnings_inctot, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourly incwage
              Husband_incwage       = weighted.mean(Hus_log_hourly_earnings_incwage, weights = Husband_wt, na.rm = TRUE),
			  # Wife hourly inctot
              Wife_inctot           = weighted.mean(Wife_log_hourly_earnings_inctot, weights = Wife_wt, na.rm = TRUE),
			  # Wife hourly incwage
              Wife_incwage          = weighted.mean(Wife_log_hourly_earnings_incwage, weights = Wife_wt, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = Wife_wt, na.rm = TRUE)
              )|>
	na.omit()

ParentData  |> 
	    group_by(CoupleType) |>
    	summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = Husband_wt, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = Wife_wt, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = Husband_wt, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = Wife_wt, na.rm = TRUE),
              # Husband income
              Husband_ftotval       = weighted.mean(Husband_ftotval, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourly inctot
              Husband_inctot        = mean(Husband_inctot, na.rm = TRUE),
			  # Husband hourly incwage
              Husband_incwage       = mean(Husband_incwage, na.rm = TRUE),
			  # Wife hourly inctot
              Wife_inctot           = mean(Wife_inctot, na.rm = TRUE),
			  # Wife hourly incwage
              Wife_incwage          = mean(Wife_incwage, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = Wife_wt, na.rm = TRUE)
              )

# save data
write.csv(ParentData, file.path(datasets_git,"ParentData.csv"))
