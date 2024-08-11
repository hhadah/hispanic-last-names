/*
This is the do file
for creating sythetic
parents for my
marriage market discrimination
idea
*/

/*
First created: Feb 27, 2021
*/

cls
clear all

#delimit;

global wd 	"/Users/hhadah/Dropbox/Research/My Research Data and Ideas/hispanic-last-names/data/datasets/";
global raw_data 	"/Users/hhadah/Dropbox/Research/My Research Data and Ideas/hispanic-last-names/data/raw";


/*
Open dataset
*/
cd "$wd";
use "$raw_data/usa_00054.dta";

/*
keep 1980 census

keep if year == 1980;
*/

/*
keep all censuses
keep if year <= 1990 & year >= 1880;
*/

/*
keep 1960-1980 censuses

keep if year == 1970 | year == 1960 | year == 1980;
keep if year == 1940 | year == 1950 | year == 1960 | year == 1970 | year == 1980 | year == 1990;

*/
#delimit;
keep if year >= 1950 & year <= 2000;


/*
keep 1930 to 1965 birth cohorts
*/
#delimit;
/*
// gen YOB = year - age;
// keep if YOB>=1940 & YOB <=1965;
*/
gen YOB = year - age;
keep if age_mom>=25 & age_mom <=40;
keep if age_pop>=25 & age_pop <=40;
keep if YOB >= 1950 & YOB <= 2000;
keep if age <= 10;
/*
keep 25<age<40

drop if age < 25 | age > 40;
*/
/*
save
*/
save "ACS19701960.dta", replace;
 
/*
keep 1960 census


keep if year == 1960;
*/

/*
keep year<2001 census


keep if year < 2002;
*/

/*
drop missing values

#delimit;
foreach v of varlist sex age marst birthyr race hispan bpl {;
	drop if missing(`v');
};
*/
/*
save 1980 data

save "1960ACS", replace;
*/

/*
Keep parents born in US and Mexico
*/
/*
keep if bpl == 200 | bpl <= 99;
*/
/*
Keep one person per household
and White couples
*/
#delimit;
// keep if marst 				== 1;
/*
keep if pernum 				== 1;
keep if race_mom 			== 1 & race_pop 			== 1;
*/
keep if race_mom 			== 1 & race_pop				== 1;

/*
#delimit;
keep if (fbpl_mom 				== 200 | /* Mexico*/
		fbpl_mom 				== 210 | /* Central America*/
		fbpl_mom 				== 250 | /* Cuba*/
		fbpl_mom 				== 299 | /* Americas n.s. */
		fbpl_mom 				== 300 | /* South America*/
		fbpl_mom 				<= 99); /* American States */
#delimit;
keep if	(fbpl_pop 				== 200 | /* Mexico*/
		fbpl_pop 				== 210 | /* Central America*/
		fbpl_pop 				== 250 | /* Cuba*/
		fbpl_pop 				== 299 | /* Americas n.s. */
		fbpl_pop 				== 300 | /* South America*/
		fbpl_pop 				<= 99) ; /* American States */
#delimit;
keep if	(mbpl_mom 				== 200 | /* Mexico*/
		mbpl_mom 				== 210 | /* Central America*/
		mbpl_mom 				== 250 | /* Cuba*/
		mbpl_mom 				== 299 | /* Americas n.s. */
		mbpl_mom 				== 300 | /* South America*/
		mbpl_mom 				<= 99) ; /* American States */
#delimit;
keep if	(mbpl_pop 				== 200 | /* Mexico*/
		mbpl_pop 				== 210 | /* Central America*/
		mbpl_pop 				== 250 | /* Cuba*/
		mbpl_pop 				== 299 | /* Americas n.s. */
		mbpl_pop 				== 300 | /* South America*/
		mbpl_pop 				<= 99) ; /* American States */
#delimit;
drop if mbpl_mom == 0 & mbpl_pop == 0 & fbpl_pop == 0 & fbpl_mom == 0;
*/

/*
Keep peopel that were born
in the US or Spanish speaking
countries and drop missing values
*/
#delimit;
keep if   (bpld_mom  <= 12092 | /* USA */
           bpld_mom  == 11000 | /* Puerto Rico */
           bpld_mom  == 30005 | /* Argentina */
           bpld_mom  == 30010 | /* Bolivia */
		   bpld_mom  == 30015 | /* Brazil */
           bpld_mom  == 30020 | /* Chile */
           bpld_mom  == 30025 | /* Colombia */
           bpld_mom  == 26010 | /* Dominican Republic */
           bpld_mom  == 30030 | /* Ecuador */
           bpld_mom  == 21020 | /* Costa Rica */
           bpld_mom  == 21030 | /* El Salvador */
           bpld_mom  == 21040 | /* Guatemala */
           bpld_mom  == 21050 | /* Honduras */
           bpld_mom  == 25000 | /* Cuba */
           bpld_mom  == 20000 | /* Mexico */
           bpld_mom  == 21060 | /* Nicaragua */
           bpld_mom  == 21070 | /* Panama */
           bpld_mom  == 30050 | /* Peru */
           bpld_mom  == 30060 | /* Uruguay */
           bpld_mom  == 30065 | /* Venezuela */
           bpld_mom  == 43800 | /* Spain */
           bpld_mom  == 29900 | /* Americas */
		   bpld_mom  == 21000 | /* Cental America */
           bpld_mom  == 30000) & /* South America */
          (bpld_pop  <= 12092 | /* USA */
           bpld_pop  == 11000 | /* Puerto Rico */
           bpld_pop  == 30005 | /* Argentina */
           bpld_pop  == 30010 | /* Bolivia */
		   bpld_pop  == 30015 | /*  Brazil */
           bpld_pop  == 30020 | /* Chile */
           bpld_pop  == 30025 | /* Colombia */
           bpld_pop  == 26010 | /* Dominican Republic */
           bpld_pop  == 30030 | /* Ecuador */
           bpld_pop  == 21020 | /* Costa Rica */
           bpld_pop  == 21030 | /* El Salvador */
           bpld_pop  == 21040 | /* Guatemala */
           bpld_pop  == 21050 | /* Honduras */
           bpld_pop  == 25000 | /* Cuba */
           bpld_pop  == 20000 | /* Mexico */
           bpld_pop  == 21060 | /* Nicaragua */
           bpld_pop  == 21070 | /* Panama */
           bpld_pop  == 30050 | /* Peru */
           bpld_pop  == 30060 | /* Uruguay */
           bpld_pop  == 30065 | /* Venezuela */
           bpld_pop  == 43800 | /* Spain */
           bpld_pop  == 29900 | /* Americas */
		   bpld_pop  == 21000 | /* Cental America */
           bpld_pop  == 30000);  /* South America */

drop if bpl_mom == 0 | bpl_pop == 0;
/*
#delimit;
keep if (bpl_mom 				== 200 | /* Mexico*/
		bpl_mom 				== 210 | /* Central America*/
		bpl_mom 				== 250 | /* Cuba*/
		bpl_mom 				== 299 | /* Americas n.s. */
		bpl_mom 				== 300 | /* South America*/
		bpl_mom 				<= 120) &	 /* American States */
		(bpl_pop 			== 200 | /* Mexico*/
		bpl_pop 			== 210 | /* Central America*/
		bpl_pop 			== 250 | /* Cuba*/
		bpl_pop 			== 299 | /* Americas n.s. */
		bpl_pop 			== 300 | /* South America*/
		bpl_pop 			<= 120);	 /* American States */
drop if bpl_mom == 0 | bpl_pop == 0;
*/
/*
Set global important variables
*/

/*
Generate indicator variables
for Mexican born
husbands and wives
#delimit
gen 		LAHusband 				= .;
gen 		LAWife 					= .;
label var	LAHusband 				"=1 if husband's father and mother were born in Latin America";
label var 	LAWife 					"=1 if Wife's father and mother were born in Latin America";

replace 	LAHusband				= 1			if fbpl_mom 		> 99 	| mbpl_mom 		>  99	& 	sex_mom 		== 1;
replace 	LAHusband				= 1			if fbpl_pop 	> 99 	| mbpl_pop 	>  99	& 	sex_pop 	== 1;

replace 	LAHusband				= 0			if fbpl_mom 		<= 99 	& mbpl_mom 		<= 99 	&	sex_mom 		== 1;
replace 	LAHusband				= 0			if fbpl_pop 	<= 99 	& mbpl_pop 	<= 99	& 	sex_pop 	== 1;

replace 	LAWife					= 1			if fbpl_mom 		> 99 	| mbpl_mom 		>  99	& 	sex_mom 		== 2;
replace 	LAWife					= 1			if fbpl_pop 	> 99 	| mbpl_pop 	>  99	& 	sex_pop 	== 2;

replace 	LAWife					= 0			if fbpl_mom 		<= 99 	& mbpl_mom 		<= 99	& 	sex_mom 		== 2;
replace 	LAWife					= 0			if fbpl_pop 	<= 99 	& mbpl_pop 	<= 99	& 	sex_pop 	== 2;

drop if LAHusband == .;
drop if LAWife	  == .;

tab LAHusband LAWife;
*/

/*
#delimit
gen 		LAHusband 				= .;
gen 		LAWife 					= .;
label var	LAHusband 				"=1 if husband's father was born in Latin America";
label var 	LAWife 					"=1 if Wife's father was born in Latin America";

replace 	LAHusband				= 1			if fbpl_mom 		> 99 	& 	sex_mom 		== 1;
replace 	LAHusband				= 1			if fbpl_pop 	> 99 	& 	sex_pop 	== 1;

replace 	LAHusband				= 0			if fbpl_mom 		<= 99	&	sex_mom 		== 1;
replace 	LAHusband				= 0			if fbpl_pop 	<= 99	& 	sex_pop 	== 1;

replace 	LAWife					= 1			if fbpl_mom 		> 99	& 	sex_mom 		== 2;
replace 	LAWife					= 1			if fbpl_pop 	> 99	& 	sex_pop 	== 2;

replace 	LAWife					= 0			if fbpl_mom 		<= 99	& 	sex_mom 		== 2;
replace 	LAWife					= 0			if fbpl_pop 	<= 99	& 	sex_pop 	== 2;

drop if LAHusband == .;
drop if LAWife	  == .;

tab LAHusband LAWife;
*/

#delimit
gen 		LAHusband 				= .;
gen 		LAWife 					= .;
label var	LAHusband 				"=1 if husband's father was born in Latin America";
label var 	LAWife 					"=1 if Wife's father was born in Latin America";

replace 	LAHusband				= 1			if (bpld_mom 		> 12092 	| 	bpld_mom 			== 11000) 	&	sex_mom 		== 1;
replace 	LAHusband				= 1			if (bpld_pop 		> 12092 	| 	bpld_pop 			== 11000) 	&	sex_pop 		== 1;

replace 	LAHusband				= 0			if (bpld_mom 		<= 12092	& 	bpld_mom 			!= 11000) &		sex_mom 		== 1;
replace 	LAHusband				= 0			if (bpld_pop 		<= 12092	& 	bpld_pop 			!= 11000) & 	sex_pop 		== 1;

replace 	LAWife					= 1			if (bpld_mom 		> 12092 	| 	bpld_mom 			== 11000) & 	sex_mom 		== 2;
replace 	LAWife					= 1			if (bpld_pop 		> 12092 	| 	bpld_pop 			== 11000) &	sex_pop 		== 2;
                                                   
replace 	LAWife					= 0			if (bpld_mom 		<= 12092	& 	bpld_mom 			!= 11000) & 	sex_mom 		== 2;
replace 	LAWife					= 0			if (bpld_pop 		<= 12092	& 	bpld_pop 			!= 11000) & 	sex_pop 		== 2;

drop if LAHusband == .;
drop if LAWife	  == .;

tab LAHusband LAWife;

/*
Generate indicator variables
for LA born
husbands and wives


gen 		MexicanHusband 				= 0;
gen 		MexicanWife 				= 0;
label var	MexicanHusband 				"=1 if husband is born in Mexico";
label var 	MexicanWife 				"=1 if Wife is born in Mexico";

replace 	MexicanHusband	= 1			if bpl_mom 		== 200 	& 	sex_mom 		== 1;
replace 	MexicanHusband	= 1			if bpl_pop 	== 200 	& 	sex_pop 	== 1;


replace 	MexicanWife		= 1			if bpl_mom 		== 200 	& 	sex_mom 		== 2;
replace 	MexicanWife		= 1			if bpl_pop 	== 200 	& 	sex_pop 	== 2;
*/

/*
gen 		HH_Husband 				= 0;
gen 		HW_Husband 				= 0;
gen 		WH_Husband 				= 0;
gen 		WW_Husband 				= 0;

gen 		HH_Wife 				= 0;
gen 		HW_Wife 				= 0;
gen 		WH_Wife					= 0;
gen 		WW_Wife 				= 0;

replace 	HH_Husband		= 1				if fbpl_mom 		== 200 	& 	mbpl_mom 		== 200 	& sex_mom 		== 1;
replace 	HH_Husband		= 1				if fbpl_pop 	== 200 	& 	mbpl_pop 		== 200 	& sex_pop 		== 1;

replace 	HW_Husband		= 1				if fbpl_mom 		== 200 	& 	mbpl_mom 		!= 200 	& sex_mom 		== 1;
replace 	HW_Husband		= 1				if fbpl_pop 	== 200 	& 	mbpl_pop 		!= 200 	& sex_pop 		== 1;

replace 	WH_Husband		= 1				if fbpl_mom 		!= 200 	& 	mbpl_mom 		== 200 	& sex_mom 		== 1;
replace 	WH_Husband		= 1				if fbpl_pop 	!= 200 	& 	mbpl_pop 		== 200 	& sex_pop 		== 1;

replace 	WW_Husband		= 1				if fbpl_mom 		!= 200 	& 	mbpl_mom 		!= 200 	& sex_mom 		== 1;
replace 	WW_Husband		= 1				if fbpl_pop 	!= 200 	& 	mbpl_pop 		!= 200 	& sex_pop 		== 1;

replace 	HH_Wife			= 1				if fbpl_mom 		== 200 	& 	mbpl_mom 		== 200 	& sex_mom 		== 2;
replace 	HH_Wife			= 1				if fbpl_pop 	== 200 	& 	mbpl_pop 		== 200 	& sex_pop 		== 2;

replace 	HW_Wife			= 1				if fbpl_mom 		== 200 	& 	mbpl_mom 		!= 200 	& sex_mom 		== 2;
replace 	HW_Wife			= 1				if fbpl_pop 	== 200 	& 	mbpl_pop 		!= 200	& sex_pop 		== 2;

replace 	WH_Wife			= 1				if fbpl_mom 		!= 200 	& 	mbpl_mom 		== 200 	& sex_mom 		== 2;
replace 	WH_Wife			= 1				if fbpl_pop 	!= 200 	& 	mbpl_pop 		== 200 	& sex_pop 		== 2;

replace 	WW_Wife			= 1				if fbpl_mom 		!= 200 	& 	mbpl_mom 		!= 200 	& sex_mom 		== 2;
replace 	WW_Wife			= 1				if fbpl_pop 	!= 200 	& 	mbpl_pop 		!= 200 	& sex_pop 		== 2;

*/

/*
Generate four different
couple types:
1) WW: White Husband White Wife
2) WM: White Husband Mexican Wife
3) MW: Mexican Husband White Wife
3) MM: Mexican Husband Mexican Wife
*/
#delimit;
gen WW = 0;
gen WM = 0;
gen MW = 0;
gen MM = 0;

replace WW = 1 if LAHusband == 0 & LAWife == 0;
replace WM = 1 if LAHusband == 0 & LAWife == 1;
replace MW = 1 if LAHusband == 1 & LAWife == 0;
replace MM = 1 if LAHusband == 1 & LAWife == 1;

gen str CoupleType 	= "none";
replace CoupleType 		= "White-White" 		if WW == 1;
replace CoupleType 		= "White-Hispanic" 			if WM == 1;
replace CoupleType 		= "Hispanic-White" 			if MW == 1;
replace CoupleType 		= "Hispanic-Hispanic" 				if MM == 1;

/*
gen strL CoupleType_Husband = "none";
replace CoupleType_Husband = "White White" 		if WW_Husband == 1;
replace CoupleType_Husband = "White Mexican" 	if WH_Husband == 1;
replace CoupleType_Husband = "Mexican White" 	if HW_Husband == 1;
replace CoupleType_Husband = "Mexican Mexican" 	if HH_Husband == 1;

gen strL CoupleType_Wife = "none";
replace CoupleType_Wife = "White White" 		if WW_Wife == 1;
replace CoupleType_Wife = "White Mexican" 		if WH_Wife == 1;
replace CoupleType_Wife = "Mexican White" 		if HW_Wife == 1;
replace CoupleType_Wife = "Mexican Mexican" 	if HH_Wife == 1;
*/
/*
drop same sex couples
*/
#delimit;
drop if (sex_mom == 1 & sex_pop == 1) | (sex_mom == 2 & sex_pop == 2);
/*
Tab couple types

tab CoupleType_Husband CoupleType_Wife;
*/
/*
Generate education and income
variables for husband and wife
*/

/*
********************************************************************************
* education: educ_pop educ_mom (all series)
********************************************************************************
*/
#delimit;
gen HusbandEducation 	= .;
gen WifeEducation 		= .;
#delimit cr

* Mapping education levels for Husband and Wife based on educd values
foreach educd_value in 0 1 10 11 12 13 14 15 16 17 20 21 22 23 24 25 26 30 40 50 60 61 62 63 64 65 70 71 80 81 82 83 90 100 101 110 111 112 113 114 115 116 {
    local assigned_value = .
    if `educd_value' == 0 | `educd_value' == 1 {
        local assigned_value = 0
    }
    else if `educd_value' == 10 | `educd_value' == 11 | `educd_value' == 12 {
        local assigned_value = 0.5
    }
    else if `educd_value' == 13 | `educd_value' == 14 {
        local assigned_value = 1
    }
    else if `educd_value' == 15 {
        local assigned_value = 2
    }
    else if `educd_value' == 16 {
        local assigned_value = 3
    }
    else if `educd_value' == 17 {
        local assigned_value = 4
    }
    else if `educd_value' == 20 | `educd_value' == 21 | `educd_value' == 22 {
        local assigned_value = 5
    }
    else if `educd_value' == 23 {
        local assigned_value = 6
    }
    else if `educd_value' == 24 | `educd_value' == 25 {
        local assigned_value = 7
    }
    else if `educd_value' == 26 {
        local assigned_value = 8
    }
    else if `educd_value' == 30 {
        local assigned_value = 9
    }
    else if `educd_value' == 40 {
        local assigned_value = 10
    }
    else if `educd_value' == 50 {
        local assigned_value = 11
    }
    else if `educd_value' >= 60 & `educd_value' <= 65 {
        local assigned_value = 12
    }
    else if `educd_value' == 70 | `educd_value' == 71 {
        local assigned_value = 13
    }
    else if `educd_value' >= 80 & `educd_value' <= 83 {
        local assigned_value = 14
    }
    else if `educd_value' == 90 {
        local assigned_value = 15
    }
    else if `educd_value' >= 100 & `educd_value' <= 113 {
        local assigned_value = 16
    }
    else if `educd_value' == 114 {
        local assigned_value = 18
    }
    else if `educd_value' == 115 {
        local assigned_value = 20
    }
    else if `educd_value' == 116 {
        local assigned_value = 21
    }

    replace HusbandEducation = `assigned_value' if (sex_pop == 1 & educd_pop == `educd_value')
    replace HusbandEducation = `assigned_value' if (sex_mom == 1 & educd_mom == `educd_value')
    replace WifeEducation = `assigned_value' if (sex_pop == 2 & educd_pop == `educd_value')
    replace WifeEducation = `assigned_value' if (sex_mom == 2 & educd_mom == `educd_value')
}

#delimit;
gen Husband_ed_level=cond(HusbandEducation<6,1,0);
replace Husband_ed_level=cond(HusbandEducation == 6, 2, Husband_ed_level);
replace Husband_ed_level=cond(HusbandEducation > 6 & educ <11,3,Husband_ed_level);
replace Husband_ed_level=cond(HusbandEducation > 10, 4, Husband_ed_level);

label define Husband_ed_ed_levell 	1 "High school dropout" 
						2 "High school" 
						3 "Some college" 
						4 "4 or more years of college";
label values Husband_ed_level Husband_ed_ed_levell;

gen Wife_ed_level=cond(WifeEducation<6,1,0);
replace Wife_ed_level=cond(WifeEducation == 6, 2, Wife_ed_level);
replace Wife_ed_level=cond(WifeEducation > 6 & educ <11,3,Wife_ed_level);
replace Wife_ed_level=cond(WifeEducation > 10, 4, Wife_ed_level);

label define Wife_ed_ed_levell 	1 "High school dropout" 
						2 "High school" 
						3 "Some college" 
						4 "4 or more years of college";
label values Wife_ed_level Wife_ed_ed_levell;

#delimit cr

/*
********************************************************************************
* Imputing weeks worked for wkswork2_pop and wkswork2_mom
********************************************************************************
*/
gen wkswork1_pop_2 = .  
replace wkswork1_pop_2 = 13 if wkswork2_pop == 1  
replace wkswork1_pop_2 = 26 if wkswork2_pop == 2  
replace wkswork1_pop_2 = 39 if wkswork2_pop == 3  
replace wkswork1_pop_2 = 47 if wkswork2_pop == 4  
replace wkswork1_pop_2 = 49 if wkswork2_pop == 5  
replace wkswork1_pop_2 = 52 if wkswork2_pop == 6  

gen wkswork1_mom_2 = .  
replace wkswork1_mom_2 = 13 if wkswork2_mom == 1  
replace wkswork1_mom_2 = 26 if wkswork2_mom == 2  
replace wkswork1_mom_2 = 39 if wkswork2_mom == 3  
replace wkswork1_mom_2 = 47 if wkswork2_mom == 4  
replace wkswork1_mom_2 = 49 if wkswork2_mom == 5  
replace wkswork1_mom_2 = 52 if wkswork2_mom == 6  

/*
* Calculating mean for each interval of wkswork1_pop_2
bysort wkswork1_pop_2: egen mean_wkswork1_pop = mean(wkswork1_pop)
*/

/*
* Calculating mean for each interval of wkswork1_mom_2
*/

bysort wkswork1_mom_2: egen mean_wkswork1_mom = mean(wkswork1_mom)
bysort wkswork1_pop_2: egen mean_wkswork1_pop = mean(wkswork1_pop)

/*
* To list or summarize the results for pop
*/

tabulate wkswork1_pop_2, summarize(mean_wkswork1_pop)
tabulate wkswork1_mom_2, summarize(mean_wkswork1_mom)

/*
********************************************************************************
* Age
********************************************************************************
*/
#delimit;
gen HusbandAge = .;
gen WifeAge = .;

replace HusbandAge = age_pop if sex_pop == 1;
replace HusbandAge = age_mom if sex_mom == 1;

replace WifeAge = age_pop if sex_pop == 2;
replace WifeAge = age_mom if sex_mom == 2;

keep if WifeAge >= 25 & WifeAge<=40;
keep if HusbandAge >= 25 & HusbandAge<=40;

/*
********************************************************************************
* impute log hourly wages
********************************************************************************
*/
#delimit;
gen experience_mom = .;
replace experience_mom = WifeAge - 17 if WifeEducation == .;
replace experience_mom = min(WifeAge - WifeEducation - 7, WifeAge - 17);

gen experience_dad = .;
replace experience_dad = HusbandAge - 17 if HusbandEducation == .;
replace experience_dad = min(HusbandAge - HusbandEducation - 7, HusbandAge - 17);
#delimit cr

// keep if experience_dad >= 0
// keep if experience_mom >= 0

/*
I first regressed hours last week on education dummies,
a quartic in experience, dummies for the weeks worked brackets,
and a dummy for part-time (hours less than 35) for each year,
thereby obtaining predicted log hours last week for every worker in
the wage sample
*/
#delimit cr
gen PartTime_mom = 1- hrswork2_mom > 3
gen PartTime_pop = 1- hrswork2_pop > 3
gen FTFY_mom = 0
gen FTFY_pop = 0
replace FTFY_mom = 1 if PartTime_mom == 0 & mean_wkswork1_mom > 48
replace FTFY_pop = 1 if PartTime_pop == 0 & mean_wkswork1_pop > 48

/*
********************************************************************************
* Total family income
********************************************************************************
* ftotval in 1999's $:
*/
replace ftotinc_pop = . if ftotinc_pop >= 9999998

* Generate a local macro containing all unique years
levelsof year, local(years)

* Top code ftotinc_pop by year and print original and new maximum
foreach y of local years {
    * Find original maximum
    qui sum ftotinc_pop if year == `y', detail
    local orig_max_ftotinc_pop = r(max)
    display "Year `y': Original Max ftotinc_pop is " `orig_max_ftotinc_pop'

    * Calculate top-coded maximum and replace
    local max_ftotinc_pop = `orig_max_ftotinc_pop' * 1.33
    replace ftotinc_pop = `max_ftotinc_pop' if ftotinc_pop == `orig_max_ftotinc_pop' & year == `y'
}

gen lnftotval_pop1999 = ln(cpi99 * ftotinc_pop) if FTFY_pop == 1
gen lnftotval_mom1999 = ln(cpi99 * ftotinc_mom) if FTFY_mom == 1


gen Husband_ftotval = .

replace Husband_ftotval = lnftotval_pop1999 if sex_pop == 1 & ftotinc_pop < 9999998
replace Husband_ftotval = lnftotval_mom1999 if sex_mom == 1 & ftotinc_mom < 9999998


/*
********************************************************************************
* Total personal income
********************************************************************************
* inctot in 1999's $:
*/
* Deal with inctot_pop and inctot_mom outliers
replace inctot_pop =. if inctot_pop >= 9999999
replace inctot_mom =. if inctot_mom >= 9999999

* Generate a local macro containing all unique years
levelsof year, local(years)

* Top code ftotinc_pop by year and print original and new maximum
foreach y of local years {
    * Find original maximum
    qui sum inctot_pop if year == `y', detail
    local orig_max_inctot_pop = r(max)
    display "Year `y': Original Max inctot_pop is " `orig_max_inctot_pop'

    * Calculate top-coded maximum and replace
    local max_inctot_pop = `orig_max_inctot_pop' * 1.33
    replace inctot_pop = `max_inctot_pop' if inctot_pop == `orig_max_inctot_pop' & year == `y'
}

* Top code ftotinc_mom by year and print original and new maximum
foreach y of local years {
    * Find original maximum
    qui sum inctot_mom if year == `y', detail
    local orig_max_inctot_mom = r(max)
    display "Year `y': Original Max inctot_mom is " `orig_max_inctot_mom'

    * Calculate top-coded maximum and replace
    local max_inctot_mom = `orig_max_inctot_mom' * 1.33
    replace inctot_mom = `max_inctot_mom' if inctot_mom == `orig_max_inctot_mom' & year == `y'
}

* Generate the new variables
gen lninctot_pop1999 = ln(cpi99 * inctot_pop) if FTFY_pop == 1
gen lninctot_mom1999 = ln(cpi99 * inctot_mom) if FTFY_mom == 1

* Initialize Husband_inctot and Wife_inctot variables
gen Husband_inctot = .
gen Wife_inctot = .

* Conditionally replace values for Husband_inctot and Wife_inctot
replace Husband_inctot = lninctot_pop1999 if sex_pop == 1 & inctot_pop < 999998
replace Husband_inctot = lninctot_mom1999 if sex_mom == 1 & inctot_mom < 999998

replace Wife_inctot = lninctot_pop1999 if sex_pop == 2 & inctot_pop < 999998
replace Wife_inctot = lninctot_mom1999 if sex_mom == 2 & inctot_mom < 999998

/*
********************************************************************************
* Wage and Salary Income
********************************************************************************
* incwage in 1999's $:
*/

replace incwage_pop = . if incwage_pop >= 999998
replace incwage_mom = . if incwage_mom >= 999998
replace incwage_pop = . if incwage_pop <= 0
replace incwage_mom = . if incwage_mom <= 0
* Generate a local macro containing all unique years
levelsof year, local(years)
* Top code ftotinc_pop by year and print original and new maximum
foreach y of local years {
    * Find original maximum
    qui sum incwage_pop if year == `y', detail
    local orig_max_incwage_pop = r(max)
    display "Year `y': Original Max incwage_pop is " `orig_max_incwage_pop'

    * Calculate top-coded maximum and replace
    local max_incwage_pop = `orig_max_incwage_pop' * 1.33
    replace incwage_pop = `max_incwage_pop' if incwage_pop == `orig_max_incwage_pop' & year == `y'
}

* Top code ftotinc_mom by year and print original and new maximum
foreach y of local years {
    * Find original maximum
    qui sum incwage_mom if year == `y', detail
    local orig_max_incwage_mom = r(max)
    display "Year `y': Original Max incwage_mom is " `orig_max_incwage_mom'

    * Calculate top-coded maximum and replace
    local max_incwage_mom = `orig_max_incwage_mom' * 1.33
    replace incwage_mom = `max_incwage_mom' if incwage_mom == `orig_max_incwage_mom' & year == `y'
}


gen lnincwage_pop1999 = ln(cpi99 * incwage_pop) if FTFY_pop == 1
gen lnincwage_mom1999 = ln(cpi99 * incwage_mom) if FTFY_mom == 1

gen Husband_incwage = .
gen Wife_incwage = .

replace Husband_incwage = lnincwage_pop1999 if sex_pop == 1 & incwage_pop < 999998
replace Husband_incwage = lnincwage_mom1999 if sex_mom == 1 & incwage_mom < 999998

replace Wife_incwage = lnincwage_pop1999 if sex_pop == 2 & incwage_pop < 999998
replace Wife_incwage = lnincwage_mom1999 if sex_mom == 2 & incwage_mom < 999998

/*
********************************************************************************
* impute log hourly wages
********************************************************************************
*/

gen log_hrswork1_mom = ln(hrswork1_mom) if FTFY_mom == 1
gen log_hrswork1_pop = ln(hrswork1_pop) if FTFY_pop == 1

reg log_hrswork1_mom c.WifeEducation c.experience_mom##c.experience_mom##c.experience_mom##c.experience_mom c.wkswork1_mom_2 c.PartTime_mom if FTFY_mom == 1

predict predicted_log_hrswork1_mom, xb

reg log_hrswork1_pop c.HusbandEducation c.experience_dad##c.experience_dad##c.experience_dad##c.experience_dad c.wkswork1_pop_2 c.PartTime_pop if FTFY_pop == 1

predict predicted_log_hrswork1_pop, xb

/*
Then, using data from 1976-1988 surveys, I
regressed log hours last year on predicted log hours last week,
actual log hours last week, a set of dummies for different combina-
tions of full-time employment last week and last year, and dum-
mies for weeks worked brackets
*/
gen log_uhrswork_mom = ln(uhrswork_mom) if FTFY_mom == 1
gen log_uhrswork_pop = ln(uhrswork_pop) if FTFY_pop == 1

reg log_uhrswork_mom hrswork1_mom c.PartTime_mom c.hrswork2_mom if year == 1950 | year == 1980 | year == 1990 | year == 2000 & FTFY_mom == 1

predict predicted_log_uhrswork_mom, xb

reg log_uhrswork_pop hrswork1_pop c.PartTime_pop c.hrswork2_pop if year == 1950 | year == 1980 | year == 1990 | year == 2000 & FTFY_pop == 1

predict predicted_log_uhrswork_pop, xb

/*
To
obtain a consistent log weeks series, I regressed log weeks on a
constant term, log annual earnings, a quartic in experience, a
linear education term, and a dummy for full-time separately by
weeks worked brackets on the data from the years 1976-1988.
*/
gen log_mean_wkswork1_pop = ln(mean_wkswork1_pop) if FTFY_pop == 1
gen log_mean_wkswork1_mom = ln(mean_wkswork1_mom) if FTFY_mom == 1

reg log_mean_wkswork1_pop Husband_inctot c.experience_dad##c.experience_dad##c.experience_dad##c.experience_dad HusbandEducation if FTFY_pop == 1
predict predicted_log_mean_wkswork1_pop, xb

reg log_mean_wkswork1_mom Wife_inctot c.experience_mom##c.experience_mom##c.experience_mom##c.experience_mom WifeEducation if FTFY_mom == 1
predict predicted_log_mean_wkswork1_mom, xb
/*
Generate Log hourly wages
*/
gen Hus_hourly_earnings_inctot = inctot_pop / (exp(predicted_log_hrswork1_pop) * exp(predicted_log_mean_wkswork1_pop))
gen Hus_log_hourly_earnings_inctot = log(Hus_hourly_earnings_inctot)

gen Wife_hourly_earnings_inctot = inctot_mom / (exp(predicted_log_hrswork1_mom) * exp(predicted_log_mean_wkswork1_mom))
gen Wife_log_hourly_earnings_inctot = log(Wife_hourly_earnings_inctot)

gen Hus_hourly_earnings_incwage = incwage_pop / (exp(predicted_log_hrswork1_pop) * exp(predicted_log_mean_wkswork1_pop))
gen Hus_log_hourly_earnings_incwage = log(Hus_hourly_earnings_incwage)

gen Wife_hourly_earnings_incwage = incwage_mom / (exp(predicted_log_hrswork1_mom) * exp(predicted_log_mean_wkswork1_mom))
gen Wife_log_hourly_earnings_incwage = log(Wife_hourly_earnings_incwage)

// gen Hus_Log_hour_inctot = Husband_inctot/(predicted_log_mean_wkswork1_pop*predicted_log_uhrswork_pop)
// gen Wife_Log_hour_inctot = Wife_inctot/(predicted_log_mean_wkswork1_pop*predicted_log_uhrswork_pop)
//
// gen Hus_Log_hour_incwage = Husband_incwage/(predicted_log_mean_wkswork1_pop*predicted_log_uhrswork_pop)
// gen Wife_Log_hour_incwage = Wife_incwage/(predicted_log_mean_wkswork1_pop*predicted_log_uhrswork_pop)
//
// sum Hus_Log_hour_inctot Wife_Log_hour_inctot Hus_Log_hour_incwage Wife_Log_hour_incwage
// sum Hus_log_hourly_earnings_inctot Wife_log_hourly_earnings_inctot Hus_hourly_earnings_incwage Wife_hourly_earnings_incwage
sort Couple
by CoupleType: sum Hus_hourly_earnings_inctot Hus_log_hourly_earnings_inctot 
by CoupleType: sum Wife_hourly_earnings_inctot Wife_log_hourly_earnings_inctot
by CoupleType: sum Hus_hourly_earnings_incwage Hus_log_hourly_earnings_incwage
by CoupleType: sum Wife_hourly_earnings_incwage Wife_log_hourly_earnings_incwage
/*
********************************************************************************
* Year of birth
********************************************************************************
*/
#delimit;

gen HusbandYOB = .;
gen WifeYOB = .;

replace HusbandYOB = birthyr_pop if sex_pop == 1;
replace HusbandYOB = birthyr_mom if sex_mom == 1;

replace WifeYOB = birthyr_pop if sex_pop == 2;
replace WifeYOB = birthyr_mom if sex_mom == 2;
/*
********************************************************************************
* person weight: perwt
********************************************************************************
*/
#delimit;
gen Husband_wt = .;
gen Wife_wt = .;

replace Husband_wt = perwt if sex_pop == 1;
replace Husband_wt = perwt if sex_mom == 1;

replace Wife_wt = perwt if sex_pop == 2;
replace Wife_wt = perwt if sex_mom == 2;

/*
********************************************************************************
* fbpl: fbpl_pop fbpl_mom (all series)
********************************************************************************
*/

gen Husband_fbpl = .;
gen Wife_fbpl = .;

replace Husband_fbpl = fbpl_pop if sex_pop == 1;
replace Husband_fbpl = fbpl_mom if sex_mom == 1;

replace Wife_fbpl = fbpl_pop if sex_pop == 2;
replace Wife_fbpl = fbpl_mom if sex_mom == 2;

/*
********************************************************************************
* hispan: hispan_pop hispan_mom  (all series)
********************************************************************************
*/
gen Hispanic_Husband =.;
gen Hispanic_Wife =.;

replace Hispanic_Husband = 1 if hispan_pop == 1 & sex_pop == 1;
replace Hispanic_Husband = 1 if hispan_mom == 1 & sex_mom == 1;

replace Hispanic_Husband = 1 if hispan_pop == 2 & sex_pop == 1;
replace Hispanic_Husband = 1 if hispan_mom == 2 & sex_mom == 1;

replace Hispanic_Husband = 1 if hispan_pop == 3 & sex_pop == 1;
replace Hispanic_Husband = 1 if hispan_mom == 3 & sex_mom == 1;

replace Hispanic_Husband = 1 if hispan_pop == 4 & sex_pop == 1;
replace Hispanic_Husband = 1 if hispan_mom == 4 & sex_mom == 1;

replace Hispanic_Husband = 0 if hispan_pop == 0 & sex_pop == 1;
replace Hispanic_Husband = 0 if hispan_mom == 0 & sex_mom == 1;


replace Hispanic_Wife = 1 if hispan_pop == 1 & sex_pop == 2;
replace Hispanic_Wife = 1 if hispan_mom == 1 & sex_mom == 2;

replace Hispanic_Wife = 1 if hispan_pop == 2 & sex_pop == 2;
replace Hispanic_Wife = 1 if hispan_mom == 2 & sex_mom == 2;

replace Hispanic_Wife = 1 if hispan_pop == 3 & sex_pop == 2;
replace Hispanic_Wife = 1 if hispan_mom == 3 & sex_mom == 2;

replace Hispanic_Wife = 1 if hispan_pop == 4 & sex_pop == 2;
replace Hispanic_Wife = 1 if hispan_mom == 4 & sex_mom == 2;

replace Hispanic_Wife = 0 if hispan_pop == 0 & sex_pop == 2;
replace Hispanic_Wife = 0 if hispan_mom == 0 & sex_mom == 2;

tab Hispanic_Wife Hispanic_Husband;

/*
********************************************************************************
* chborn_mom : fertility  (all series)
********************************************************************************
*/
#delimit;
gen Fertility =.;

replace Fertility =chborn_mom if chborn_mom >= 1;
replace Fertility =. if chborn_mom >= 14;

/*
********************************************************************************
* histograms for level of schooling by type by sex
********************************************************************************

levelsof year, local(levels);
preserve;
keep if WM == 1 | MW == 1;
foreach i of local levels{;

/*
Histogram of distibutions on
educatiob by the different groups
*/

hist Husband_ed_level if year == `i', discrete percent by(CoupleType) xlabel( 1 "High school dropout"  
												 2 "High school" 
												 3 "Some college" 
												 4 "4 or more years of college", angle(45))
							 title("`i' Census year: Husbands") xtitle("Husband's education level");
graph export "`i'Males.pdf", replace;
};

restore;

preserve;
keep if WM == 1 | MW == 1;
foreach i of local levels{;

/*
Histogram of distibutions on
educatiob by the different groups
*/

hist Wife_ed_level if year == `i', discrete percent by(CoupleType) xlabel( 1 "High school dropout"  
												 2 "High school" 
												 3 "Some college" 
												 4 "4 or more years of college", angle(45))
							 title("`i' Census year: Wives") xtitle("Wife's education level");
graph export "`i'Females.pdf", replace;
};
restore;
*/
/*
Keep main variables
*/
#delimit;
keep year hhwt HusbandEducation WifeEducation Husband_wt Wife_wt Fertility
Husband_ftotval Husband_inctot Wife_inctot Husband_incwage 
Wife_incwage cpi99 region stateicp statefip countyicp countyfip urban metro city
HusbandAge WifeAge HusbandYOB WifeYOB LAHusband LAWife CoupleType Husband_ed_level 
Wife_ed_level Wife_fbpl Husband_fbpl Hispanic_Husband Hispanic_Wife age year YOB
bpl bpl_mom bpl_pop fbpl fbpl_mom fbpl_pop mbpl mbpl_mom mbpl_pop bpld bpld_mom bpld_pop
Hus_hourly_earnings_inctot Hus_log_hourly_earnings_inctot 
Wife_hourly_earnings_inctot Wife_log_hourly_earnings_inctot
Hus_hourly_earnings_incwage Hus_log_hourly_earnings_incwage
Wife_hourly_earnings_incwage Wife_log_hourly_earnings_incwage
experience_dad experience_mom HusbandAge WifeAge;

/*
Save full parent's data
*/
save "ParentDataFull.dta", replace;

/*
Generate Couple types dummies
*/

#delimit;
gen WW = 0;
gen WH = 0;
gen HW = 0;
gen HH = 0;

replace WW = 1 if CoupleType == "White-White";
replace WH = 1 if CoupleType == "White-Hispanic";
replace HW = 1 if CoupleType == "Hispanic-White";
replace HH = 1 if CoupleType == "Hispanic-Hispanic";

tab Wife_ed_level, gen(ed_level_dummy_w);
tab Husband_ed_level, gen(ed_level_dummy_h);

sort CoupleType;
by CoupleType: sum HusbandEducation WifeEducation  Husband_ftotval Husband_inctot Husband_incwage  Wife_inctot Wife_incwage Fertility;

reg Fertility WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;

reg HusbandEducation  WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg WifeEducation   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg Husband_ftotval   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg Husband_inctot   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg Husband_incwage   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg Wife_inctot   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg Wife_incwage   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg HusbandAge   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg WifeAge   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg experience_dad   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;
reg experience_mom   WW WH HW HH, nocon;
lincom HW - WH;
lincom WW - HH;

sort CoupleType;
by CoupleType: sum HusbandEducation WifeEducation 
				   Husband_ftotval Husband_inctot Husband_incwage 
				   Wife_inctot Wife_incwage Fertility;			  
save "ParentDataFull.dta", replace;
