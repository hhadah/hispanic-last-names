# Merge CPS and ACS data
# this script will merge
# the synthetic parents
# from the census
# with the CPS data
# the merging will happen
# by the following variables
# year of birth of child
# mom's birth place
# dad's birth place

# date: May 4th, 2023

# open synthetic parents data
# and CPS data
# and merge them

SyntheticParents  <- read.csv(file.path(datasets_git,"ParentData.csv")) |> 
        select("YOB",
               "CoupleType",
               "BirthPlaceMom",   
               "BirthPlaceDad",    
               "LAHusband",        
               "LAWife",           
               "HusbandEducation", 
               "WifeEducation",    
               "Husband_ftotval",
			   "Husband_inctot",
			   "Husband_incwage",
			   "Wife_inctot",
			   "Wife_incwage",  
               "Fertility")

CPS  <- read_dta(file.path(datasets,"BySexAnalysisData.dta"))|> 
        mutate(BirthPlaceMom = case_when(mbpl      <= 12092  ~ "USA",
           								 mbpl      == 11000  ~ "Puerto Rico",
           								 mbpl      == 30005  ~ "Argentina",
           								 mbpl      == 30010  ~ "Bolivia",
		   								 mbpl      == 30015  ~ "Brazil",
           								 mbpl      == 30020  ~ "Chile",
           								 mbpl      == 30025  ~ "Colombia",
           								 mbpl      == 26010  ~ "Dominican Republic",
           								 mbpl      == 30030  ~ "Ecuador",
           								 mbpl      == 21020  ~ "Costa Rica",
           								 mbpl      == 21030  ~ "El Salvador",
           								 mbpl      == 21040  ~ "Guatemala",
           								 mbpl      == 21050  ~ "Honduras",
           								 mbpl      == 25000  ~ "Cuba",
           								 mbpl      == 20000  ~ "Mexico",
           								 mbpl      == 21060  ~ "Nicaragua",
           								 mbpl      == 21070  ~ "Panama",
           								 mbpl      == 30050  ~ "Peru",
           								 mbpl      == 30060  ~ "Uruguay",
           								 mbpl      == 30065  ~ "Venezuela",
           								 mbpl      == 43800  ~ "Spain",
           								 mbpl      == 29900  ~ "Americas",
		   								 mbpl      == 21000  ~ "Cental America",
           								 mbpl      == 30000  ~ "South America"),
               BirthPlaceDad = case_when(fbpl  	   <= 12092  ~ "USA",
           								 fbpl  	   == 11000  ~ "Puerto Rico",
           								 fbpl  	   == 30005  ~ "Argentina",
           								 fbpl  	   == 30010  ~ "Bolivia",
		   								 fbpl  	   == 30015  ~ "Brazil",
           								 fbpl  	   == 30020  ~ "Chile",
           								 fbpl  	   == 30025  ~ "Colombia",
           								 fbpl  	   == 26010  ~ "Dominican Republic",
           								 fbpl  	   == 30030  ~ "Ecuador",
           								 fbpl  	   == 21020  ~ "Costa Rica",
           								 fbpl  	   == 21030  ~ "El Salvador",
           								 fbpl  	   == 21040  ~ "Guatemala",
           								 fbpl  	   == 21050  ~ "Honduras",
           								 fbpl  	   == 25000  ~ "Cuba",
           								 fbpl  	   == 20000  ~ "Mexico",
           								 fbpl  	   == 21060  ~ "Nicaragua",
           								 fbpl  	   == 21070  ~ "Panama",
           								 fbpl  	   == 30050  ~ "Peru",
           								 fbpl  	   == 30060  ~ "Uruguay",
           								 fbpl  	   == 30065  ~ "Venezuela",
           								 fbpl  	   == 43800  ~ "Spain",
           								 fbpl  	   == 29900  ~ "Americas",
		   								 fbpl  	   == 21000  ~ "Cental America",
           								 fbpl  	   == 30000  ~ "South America"),
				CoupleType = Type)

CrossTable(CPS$Type)
summary(CPS$age)

# merge the two datasets
# by year of birth
# mom's birth place
# dad's birth place

MergedData  <- left_join(CPS,
                        SyntheticParents,
                        by = c("YOB", "CoupleType", "BirthPlaceMom", "BirthPlaceDad")) |> 
               mutate()
summary(MergedData$Husband_ftotval)
summary(MergedData$HusbandEducation)
summary(MergedData$WifeEducation)
CrossTable(MergedData$Type)

MergedData  |> 
	    group_by(Type) |>
    	summarise(
              # Husband is foreign born
              LAHusband             = weighted.mean(LAHusband, weights = Husband_wt, na.rm = TRUE),
              # Wife is foreign born
              LAWife                = weighted.mean(LAWife, weights = Wife_wt, na.rm = TRUE),
              # Husband education
              HusbandEducation      = weighted.mean(HusbandEducation, weights = Husband_wt, na.rm = TRUE),
              # Wife education
              WifeEducation         = weighted.mean(WifeEducation, weights = Wife_wt, na.rm = TRUE),
			  # Husband hourly inctot
              Husband_ftotval        = weighted.mean(Husband_ftotval, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourlt incwage
              Husband_incwage       = weighted.mean(Husband_incwage, weights = Husband_wt, na.rm = TRUE),
			  # Wife hourly inctot
              Wife_inctot           = weighted.mean(Wife_inctot, weights = Wife_wt, na.rm = TRUE),
			  # Wife hourlt incwage
              Wife_incwage          = weighted.mean(Wife_incwage, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = Wife_wt, na.rm = TRUE)
              )

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
			  # Husband hourly inctot
              Husband_ftotval        = weighted.mean(Husband_ftotval, weights = Husband_wt, na.rm = TRUE),
			  # Husband hourlt incwage
            #   Husband_incwage       = weighted.mean(Husband_incwage, weights = Husband_wt, na.rm = TRUE),
			#   # Wife hourly inctot
            #   Wife_inctot           = weighted.mean(Wife_inctot, weights = Wife_wt, na.rm = TRUE),
			#   # Wife hourlt incwage
            #   Wife_incwage          = weighted.mean(Wife_incwage, na.rm = TRUE),
              # Fertility
              Fertility             = weighted.mean(Fertility, weights = Wife_wt, na.rm = TRUE)
              )
# save data
write.csv(MergedData, file.path(datasets,"CPS_synth.csv"), row.names = FALSE)
