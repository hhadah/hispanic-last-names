********************************************************************************
********************************************************************************
clear all
* Regressions and Analysis 
cls

* global wd
global wd "C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\datasets"
* set working dirrectory
cd "$wd"

use "BySexAnalysisData"

keep if (WW == 1 & Hispanic_ID == 0) | WH == 1 | HW == 1 | HH == 1

gen HW_HispanicID = HW * Hispanic_ID
gen WH_HispanicID = WH * Hispanic_ID
gen WW_HispanicID = WW * Hispanic_ID
gen HH_HispanicID = HH * Hispanic_ID

gen age_sq = age^2
gen age_cube = age^3
gen age_to4 = age^4

gen FirstDecade = 0
replace FirstDecade = 1 if year < 2000

gen SecondDecade = 0
replace SecondDecade = 1 if year < 2010 & year > 1999

gen ThirdDecade = 0
replace ThirdDecade = 1 if year < 2020 & year > 2009

replace uhrsworkly = . if uhrsworkly == 999

keep year age sex FullTime Employed FTFY Education lnftotval_1999 ///
lninctot_1999 lnhourwage_1999 WW WH HW HH Type Hispanic_ID Hispanic ///
Hispanic_Father HW_HispanicID WH_HispanicID WW_HispanicID HH_HispanicID educ ///
Self_employed Self_employed_ASEC age_sq age_cube age_to4 FirstDecade SecondDecade ThirdDecade ///
uhrsworkly

save "IdentityAnalysisData", replace

/*
Regression between 4 groups
using parent's POB only
*/ 

* Put age, age^2, age^3 and age^4

* Group years
global ParentDummies WH HW HH
reghdfe 	lnhourwage_1999 	$ParentDummies  if sex == 1 & Employed == 1 & FullTime == 1 & Self_employed == 0, 				absorb(year age)
lincom      HW - WH
reghdfe 	lnhourwage_1999 	$ParentDummies  if sex == 1 & Employed == 1 & FullTime == 1 & Self_employed == 0, 				absorb(educ year age)
lincom      HW - WH

reghdfe 	lninctot_1999 	$ParentDummies uhrsworkly if sex == 1 & FTFY == 1 & Self_employed == 0, 				absorb(year age)
lincom      HW - WH
reghdfe 	lninctot_1999 	$ParentDummies uhrsworkly if sex == 1 & FTFY == 1 & Self_employed == 0, 				absorb(educ year age)
lincom      HW - WH

reghdfe 	Employed  	$ParentDummies uhrsworkly if sex == 1 & FTFY == 1 & Self_employed == 0, 				absorb(educ year age)
lincom      HW - WH

reghdfe 	InLaborForce	$ParentDummies uhrsworkly if sex == 1 & FTFY == 1 & Self_employed == 0, 				absorb(educ year age)
lincom      HW - WH

global identity_vars WH_HispanicID HW_HispanicID HH_HispanicID WH HW HH

reghdfe 	lninctot_1999 	$identity_vars uhrsworkly if sex == 1 & FTFY == 1 & Self_employed == 0, 				absorb(year age)
lincom      HW_HispanicID - WH_HispanicID
reghdfe 	lninctot_1999 	$identity_vars uhrsworkly if sex == 1 & FTFY == 1 & Self_employed == 0, 				absorb(educ year age)
lincom      HW_HispanicID - WH_HispanicID


reghdfe 	Education 	$ParentDummies if sex == 1, 				absorb(year age)
lincom      HW - WH


reg 		lninctot_1999 	HW WW HH if sex == 1 & FTFY == 1
reg 		lninctot_1999 	HW WW HH experience experience_squared  if sex == 1 & FTFY == 1
reghdfe 	lninctot_1999 	$ParentDummies experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(year)
reghdfe 	lninctot_1999 	$ParentDummies experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(educ year)
lincom      HW - WH


reg 		Education 	HW WW HH if sex == 1 & FTFY == 1
reg 		Education 	HW WW HH age agesquared  if sex == 1 & FTFY == 1 
reghdfe 	Education 	$ParentDummies age agesquared  if sex == 1, 				absorb(year)

reg 		Employed 	HW WW HH if sex == 1 & FTFY == 1
reg 		Employed 	HW WW HH age agesquared  if sex == 1 & FTFY == 1 
reghdfe 	Employed 	HW WW HH experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(educ)
reghdfe 	Employed 	$ParentDummies experience experience_squared  if sex == 1, 				absorb(year)
reghdfe 	Employed 	$ParentDummies  if sex == 1, 				absorb(educ year age)

reg 		InLaborForce 	HW WW HH if sex == 1 & FTFY == 1
reg 		InLaborForce 	HW WW HH age agesquared  if sex == 1 & FTFY == 1 
reghdfe 	InLaborForce 	HW WW HH experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(educ)
reghdfe 	InLaborForce 	$ParentDummies experience experience_squared  if sex == 1, 				absorb(year)
reghdfe 	InLaborForce 	$ParentDummies experience experience_squared  if sex == 1, 				absorb(educ year)
/*
 #delimit;
coefplot 	(did_ethfav_ethFE, label(Completed Primary School))
			(did_eth_Inf, label(Infant survival)) 
			(did_ethfav_ethFE_w, label(Wealth)) 
			(did_ethElectrification, label(Electrification)) 
			(did_ethAccessToWater, label(Access to water)),
			aseq swapnames legend(off)
			title("The co-ethnic effect on the outcomes of interest" "with Ethnic Groups and Time Fixed Effects") 
			keep(coethnic) xline(0, lcolor(red))
			msymbol(O) msize(large) levels(90)
			coeflabels(did_ethfav_ethFE = "Completed Primary School"
					   did_eth_Inf = "Infant survival"
					   did_ethfav_ethFE_w = "Wealth"
					   did_ethElectrification = "Electrification"
					   did_ethAccessToWater = "Access to water");
graph export coeth_ethFE.png, replace;
 #delimit cr
*/
/*
Regression between 4 groups
using parent's POB only and
Hispanic self identification
*/ 
preserve
keep if WW == 1 & Hispanic_ID == 1 | (HW == 1 & Hispanic_ID == 1) | (WH == 1 & Hispanic_ID == 1)  | (HH == 1 & Hispanic_ID == 1)
reghdfe 	lnhourwage_1999 	$ParentDummies experience experience_squared  if sex == 1 & Employed == 1, 				absorb(year)
reghdfe 	lnhourwage_1999 	$ParentDummies experience experience_squared  if sex == 1 & Employed == 1, 				absorb(educ year)

reghdfe 	lninctot_1999 	$ParentDummies experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(year)
reghdfe 	lninctot_1999 	$ParentDummies experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(educ year)

reghdfe 	Education 	$ParentDummies age agesquared  if sex == 1, 				absorb(year)

reghdfe 	Employed 	$ParentDummies experience experience_squared  if sex == 1, 				absorb(educ year)

reghdfe 	InLaborForce 	$ParentDummies experience experience_squared  if sex == 1, 				absorb(educ year)
restore

/*
Identity cost regressions
*/ 

gen HW_HispanicID = HW * Hispanic_ID
gen WH_HispanicID = WH * Hispanic_ID
gen WW_HispanicID = WW * Hispanic_ID
gen HH_HispanicID = HH * Hispanic_ID

gen age_sq = age^2
gen age_cube = age^3
gen age_to4 = age^4

gen FirstDecade = 0
replace FirstDecade = 1 if year < 2000

gen SecondDecade = 0
replace SecondDecade = 1 if year < 2010 & year > 1999

gen ThirdDecade = 0
replace ThirdDecade = 1 if year < 2020 & year > 2009

keep year age sex FullTime Employed FTFY Education lnftotval_1999 ///
lninctot_1999 lnhourwage_1999 WW WH HW HH Type Hispanic_ID Hispanic ///
Hispanic_Father HW_HispanicID WH_HispanicID WW_HispanicID HH_HispanicID educ ///
Self_employed Self_employed_ASEC age_sq age_cube age_to4 FirstDecade SecondDecade ThirdDecade
keep if (WW == 1 & Hispanic_ID == 0) | WH == 1 | HW == 1 | HH == 1

save "IdentityAnalysisData", replace

label var HW_HispanicID "Hispanic-White x Hispanic ID"
label var Hispanic_ID "Hispanic ID"

gen age_sq = age^2
gen age_cube = age^3
gen age_to4 = age^4

gen FirstDecade = 0
replace FirstDecade = 1 if year < 2000

gen SecondDecade = 0
replace SecondDecade = 1 if year < 2010 & year > 

gen ThirdDecade = 0
replace ThirdDecade = 1 if year < 2020 & year > 2009

global identity_vars HW_HispanicID WH_HispanicID HH_HispanicID HW WH HH
reg 		lnhourwage_1999 	$identity_vars age_sq age_cube age_to4 FirstDecade SecondDecade if sex == 1 & Employed == 1 & FullTime ==1 & Self_employed  == 0
reghdfe 	lnhourwage_1999 	$identity_vars age_sq age_cube age_to4 FirstDecade SecondDecade if sex == 1 & Employed == 1 & FullTime ==1 & Self_employed  == 0, 				absorb(educ)

reg 		lninctot_1999 	$identity_vars age_sq age_cube age_to4 FirstDecade SecondDecade if sex == 1 & FTFY == 1  & Self_employed  == 0
reghdfe 	lninctot_1999 	$identity_vars age_sq age_cube age_to4 FirstDecade SecondDecade if sex == 1 & FTFY == 1  & Self_employed  == 0, 				absorb(educ)

reg 		Education 	$identity_vars age_sq age_cube age_to4 FirstDecade SecondDecade


reghdfe 	lnhourwage_1999 	$identity_vars if Employed == 1 & FullTime ==1 , 				absorb(year age)

reghdfe 	lnhourwage_1999 	$identity_vars experience experience_squared  if sex == 1 & Employed == 1, 				absorb(year)
reghdfe 	lnhourwage_1999 	$identity_vars experience experience_squared  if sex == 1 & Employed == 1, 				absorb(educ year)
lincom HW_HispanicID + Hispanic_ID + HW
lincom WH_HispanicID + Hispanic_ID + WH
lincom HH_HispanicID + Hispanic_ID + HH
gen lnwage_pers_cosHW = _b[HW_HispanicID]
gen lnwage_market_cosHW = _b[Hispanic_ID]
gen lnwage_total_cosHW = lnwage_market_cosHW + lnwage_pers_cosHW
label var lnwage_pers_cosHW "HW's log earnings personal cost"
label var lnwage_market_cosHW "HW's log earnings market cost"
label var lnwage_total_cosHW "HW's log earnings total cost"
graph bar lnwage_pers_cosHW lnwage_market_cosHW lnwage_total_cosHW, legend( label(1 "Personal identetiy cost") label(2 "Market identetiy cost") label(3 "Total identetiy cost")) ///
ytitle("Log hourly earnings") title("Identetiy cost on log hourly earnigns")
lincom HW_HispanicID + Hispanic_ID + HW
lincom WH_HispanicID + Hispanic_ID + WH
lincom HH_HispanicID + Hispanic_ID + HH


/*
gen lnwage_pers_cosHWt = _b[HW_HispanicID]
gen lnwage_market_cosHWt = _b[Hispanic_ID]
graph bar lnwage_pers_cosHWt lnwage_market_cosHWt, stack
gen lnwage_total_cosHWt = lnwage_pers_cosHWt + lnwage_market_cosHWt
graph bar lnwage_pers_cosHWt lnwage_market_cosHWt lnwage_total_cosHWt, stack
graph bar lnwage_pers_cosHWt lnwage_market_cosHWt lnwage_total_cosHWt
di lnwage_total_cosHWt
lincom HW_HispanicID + Hispanic_ID
*/


reghdfe 	lninctot_1999 		$identity_vars experience experience_squared  if sex == 1 & FTFY == 1, 				absorb(year)
reghdfe 	lninctot_1999 		$identity_vars  if sex == 1 & FTFY == 1, 				absorb(educ year age)
lincom HW_HispanicID + Hispanic_ID + HW
lincom WH_HispanicID + Hispanic_ID + WH
lincom HH_HispanicID + Hispanic_ID + HH
gen inctot_pers_cosHW = _b[HW_HispanicID]
gen inctot_market_cosHW = _b[Hispanic_ID]
gen inctot_total_cosHW = inctot_pers_cosHW + inctot_market_cosHW
graph bar inctot_pers_cosHW inctot_market_cosHW inctot_total_cosHW, legend( label(1 "Personal identetiy cost") label(2 "Market identetiy cost") label(3 "Total identetiy cost")) ///
ytitle("Log annual earnings") title("Identetiy cost on log annual earnings")
lincom HW_HispanicID + Hispanic_ID




v

reghdfe 	Education 			$identity_vars age agesquared  if sex == 1, 				absorb(year)
lincom HW_HispanicID + Hispanic_ID + HW
lincom WH_HispanicID + Hispanic_ID + WH
lincom HH_HispanicID + Hispanic_ID + HH
gen educ_pers_cosHW = _b[HW_HispanicID]
gen educ_market_cosHW = _b[Hispanic_ID]
gen educ_total_cosHW = educ_pers_cosHW + educ_market_cosHW
graph bar educ_pers_cosHW educ_market_cosHW educ_total_cosHW, legend( label(1 "Personal identetiy cost") label(2 "Market identetiy cost") label(3 "Total identetiy cost")) ///
ytitle("Years of education") title("Identetiy cost on education")
lincom HW_HispanicID + Hispanic_ID

reghdfe 	Employed 			$identity_vars experience experience_squared  if sex == 1, 				absorb(educ year)
lincom HW_HispanicID + Hispanic_ID + HW
lincom WH_HispanicID + Hispanic_ID + WH
lincom HH_HispanicID + Hispanic_ID + HH

reghdfe 	InLaborForce 		$identity_vars experience experience_squared  if sex == 1, 				absorb(educ year)
lincom HW_HispanicID + Hispanic_ID + HW
lincom WH_HispanicID + Hispanic_ID + WH
lincom HH_HispanicID + Hispanic_ID + HH

global graphvars HW_HispanicID Hispanic_ID
reg 		lnhourwage_1999 	i.(HW WW HH)##i.Hispanic_ID
reg 		lnhourwage_1999 	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex  Education
reghdfe 	lnhourwage_1999 	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex  Education, 				absorb(i.county##year)
reghdfe 	lnhourwage_1999 	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex  Education, 				absorb(i.year i.county)

quietly eststo wage: reghdfe 	lnhourwage_1999 	HW_HispanicID WW_HispanicID HH_HispanicID HW WW HH Hispanic_ID experience experience_squared  sex  Education, 				absorb(i.county##year)
 

reg 		Education 	i.(HW WW HH)##i.Hispanic_ID 
reg 		Education 	i.(HW WW HH)##i.Hispanic_ID age agesquared  sex 
reghdfe 	Education 	i.(HW WW HH)##i.Hispanic_ID age agesquared  sex , 				absorb(i.county##year)
reghdfe 	Education 	i.(HW WW HH)##i.Hispanic_ID age agesquared  sex , 				absorb(i.year i.county)

quietly eststo education: reghdfe 	Education 	HW_HispanicID WW_HispanicID HH_HispanicID HW WW HH Hispanic_ID experience experience_squared  sex, 				absorb(i.county##year)

reghdfe 	FullTime  	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex , 				absorb(i.county##year)
reghdfe 	FullTime  	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex , 				absorb(i.year i.county)

quietly eststo fulltime: reghdfe 	FullTime 	HW_HispanicID WW_HispanicID HH_HispanicID HW WW HH Hispanic_ID experience experience_squared  sex  Education, 				absorb(i.county##year)


reghdfe 	PartTime  	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex , 				absorb(i.county##year)
reghdfe 	PartTime  	i.(HW WW HH)##i.Hispanic_ID experience experience_squared  sex , 				absorb(i.year i.county)

quietly eststo parttime: reghdfe 	PartTime 	HW_HispanicID WW_HispanicID HH_HispanicID HW WW HH Hispanic_ID experience experience_squared  sex  Education, 				absorb(i.county##year)

 #delimit;
coefplot 	wage,
			aseq legend(off) label
			vertical rescale(100) ytitle(Estimate)		
			recast(bar) barwidth(0.25) fcolor(*.5) ciopts(recast(rcap)) citop
			keep($graphvars);
/*graph export coeth_ethFE.png, replace;*/
 #delimit 
 
  #delimit;
coefplot 	education,
			aseq legend(off) label
			vertical rescale(100) ytitle(Estimate)		
			recast(bar) barwidth(0.25) fcolor(*.5) ciopts(recast(rcap)) citop
			keep($graphvars);
/*graph export coeth_ethFE.png, replace;*/
 #delimit cr
 
  #delimit;
coefplot 	fulltime,
			aseq legend(off) label
			vertical rescale(100) ytitle(Estimate)		
			recast(bar) barwidth(0.25) fcolor(*.5) ciopts(recast(rcap)) citop
			keep($graphvars);
/*graph export coeth_ethFE.png, replace;*/
 #delimit cr
 
  #delimit;
coefplot 	parttime,
			aseq legend(off) label
			vertical rescale(100) ytitle(Estimate)		
			recast(bar) barwidth(0.25) fcolor(*.5) ciopts(recast(rcap)) citop
			keep($graphvars);
/*graph export coeth_ethFE.png, replace;*/
 #delimit cr
 
 #delimit;
coefplot 	wage, bylabel(Log hourly wage) ||
			education, bylabel(Education) ||
			fulltime, bylabel(Full Time Employment) ||
			parttime, bylabel(Part Time Employment) ||
			, aseq  label byopts(yrescale)
			vertical ytitle(Estimate)		
			recast(bar) barwidth(0.25) fcolor(*.5) ciopts(recast(rcap)) citop
			subtitle(, bcolor(white)) yline(0)
			keep($graphvars);
graph export identity_regression.png, replace;
 #delimit cr
/*
Save
*/
save "BySexAnalysisImpVars", replace;
