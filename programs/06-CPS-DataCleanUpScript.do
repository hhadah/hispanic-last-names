/*
This do file is clean CPS data
This data include individual data on
married white couples that are
between the ages of 18 and 65. 
In the period of 1994 to 2019.
Observations are US born citizens.
*/
********************************************************************************
clear
cls
********************************************************************************
* Global directories
global wd "/Users/hhadah/Dropbox/Research/My Research Data and Ideas/hispanic-last-names/data/datasets"
* set working dirrectory
cd "$wd"

* open data
use "$wd/FullData"

****
/*
Keep cohorts the are 25 and 55 years away from 1970
*/
********************************************************************************
* keep year = 2010
*keep if year == 2010
* limit to observations 1994<year<2019
drop if year < 1993 | year > 2025
********************************************************************************
* Race Variable for Blacks, Hispanics and Whites
********************************************************************************
// gen White = .
// gen Black = .
// gen Hispanic_WageGap = .
//
// replace White = 1 if race == 100 & hispan == 0
// replace White = 0 if (race > 100 & race < 999) | (hispan >= 100 & hispan<= 612)
//
// replace Black = 1 if race == 200 & hispan == 0
// replace Black = 0 if race == 100 |( race < 999 & race > 200) | (hispan >= 100 & hispan<= 612)
//
// replace Hispanic_WageGap = 1 if race == 100 & hispan > 0 & hispan < 901
// replace Hispanic_WageGap = 0 if (race > 100 & race < 999) | (hispan == 0)
// ********************************************************************************
// * Plot proportion of Blacks and Hispanics over time
// ********************************************************************************
// egen Percent_His = mean(Hispanic_WageGap), by(year) 
// egen Percent_Black = mean(Black), by(year) 
// replace Percent_His = Percent_His*100
// replace Percent_Black = Percent_Black*100
//
// twoway (line Percent_His year) (line Percent_Black year), xtitle("Year") ytitle("Percent of Population") ///
// 					legend(label(1 "Hispanics") label(2 "Blacks"))
// graph export HispanicBlackPercent.png, replace
* generate cohort = survey year - age
gen cohort = year - age

* keep 1960 to 1970 cohorts
// keep if cohort >= 1950 & cohort <= 2000

* keep 25 to 55 year old
keep if age < 41 & age > 24

* keep native born and whites only
* Keep US born citizens only
keep if citizen == 1

* Keep Whites
keep if race == 100

* drop seperated couples
*drop if marst >= 2

* keep one person from each household
// drop if pernum > 1

* Keep US born citizens only
*keep if citizen == 1

* Keep Whites
*keep if race == 100
* drop missing values
///age_head age_sp sex_head sex_sp race_head race_sp hispan_head hispan_sp
foreach i in age sex race marst hispan{
drop if missing(`i')
}

* Keep White cpuples
* keep if race_sp == 100 | race_head == 100

* save new dataset
save "CleanIndividualData", replace
