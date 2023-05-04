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


/*
Open dataset
*/
cd "$wd";
use "$wd/ACS.dta";

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
keep if age < 18;
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

replace HusbandEducation 	= .		if (sex_pop == 1 & educd_pop == 0);
replace HusbandEducation 	= . 	if (sex_mom == 1 & educd_mom == 0);
replace WifeEducation 		= . 	if (sex_pop == 2 & educd_pop == 0);
replace WifeEducation 		= . 	if (sex_mom == 2 & educd_mom == 0);

replace HusbandEducation 	= . 	if (sex_pop == 1 & educd_pop == 1);
replace HusbandEducation 	= . 	if (sex_mom == 1 & educd_mom == 1);
replace WifeEducation 		= . 	if (sex_pop == 2 & educd_pop == 1);
replace WifeEducation 		= . 	if (sex_mom == 2 & educd_mom == 1);

replace HusbandEducation 	= 0 	if (sex_pop == 1 & educd_pop == 2);
replace HusbandEducation 	= 0 	if (sex_mom == 1 & educd_mom == 2);
replace WifeEducation 		= 0 	if (sex_pop == 2 & educd_pop == 2);
replace WifeEducation 		= 0 	if (sex_mom == 2 & educd_mom == 2);

replace HusbandEducation 	= 4 	if (sex_pop == 1 & educd_pop == 10);
replace HusbandEducation 	= 4 	if (sex_mom == 1 & educd_mom == 10);
replace WifeEducation 		= 4 	if (sex_pop == 2 & educd_pop == 10);
replace WifeEducation 		= 4 	if (sex_mom == 2 & educd_mom == 10);

replace HusbandEducation 	= 1 	if (sex_pop == 1 & educd_pop == 11);
replace HusbandEducation 	= 1 	if (sex_mom == 1 & educd_mom == 11);
replace WifeEducation 		= 1 	if (sex_pop == 2 & educd_pop == 11);
replace WifeEducation 		= 1 	if (sex_mom == 2 & educd_mom == 11);

replace HusbandEducation 	= 2 	if (sex_pop == 1 & educd_pop == 12);
replace HusbandEducation 	= 2 	if (sex_mom == 1 & educd_mom == 12);
replace WifeEducation 		= 2 	if (sex_pop == 2 & educd_pop == 12);
replace WifeEducation 		= 2 	if (sex_mom == 2 & educd_mom == 12);

replace HusbandEducation 	= 4 	if (sex_pop == 1 & educd_pop == 13);
replace HusbandEducation	= 4 	if (sex_mom == 1 & educd_mom == 13);
replace WifeEducation 		= 4 	if (sex_pop == 2 & educd_pop == 13);
replace WifeEducation 		= 4 	if (sex_mom == 2 & educd_mom == 13);

replace HusbandEducation 	= 1 	if (sex_pop == 1 & educd_pop == 14);
replace HusbandEducation 	= 1 	if (sex_mom == 1 & educd_mom == 14);
replace WifeEducation 		= 1 	if (sex_pop == 2 & educd_pop == 14);
replace WifeEducation 		= 1 	if (sex_mom == 2 & educd_mom == 14);

replace HusbandEducation 	= 2 	if (sex_pop == 1 & educd_pop == 15);
replace HusbandEducation 	= 2 	if (sex_mom == 1 & educd_mom == 15);
replace WifeEducation 		= 2 	if (sex_pop == 2 & educd_pop == 15);
replace WifeEducation 		= 2 	if (sex_mom == 2 & educd_mom == 15);

replace HusbandEducation 	= 3 	if (sex_pop == 1 & educd_pop == 16);
replace HusbandEducation 	= 3 	if (sex_mom == 1 & educd_mom == 16);
replace WifeEducation	 	= 3 	if (sex_pop == 2 & educd_pop == 16);
replace WifeEducation 		= 3 	if (sex_mom == 2 & educd_mom == 16);

replace HusbandEducation 	= 4 	if (sex_pop == 1 & educd_pop == 17);
replace HusbandEducation 	= 4 	if (sex_mom == 1 & educd_mom == 17);
replace WifeEducation 		= 4 	if (sex_pop == 2 & educd_pop == 17);
replace WifeEducation 		= 4 	if (sex_mom == 2 & educd_mom == 17);

replace HusbandEducation 	= 8 	if (sex_pop == 1 & educd_pop == 20);
replace HusbandEducation 	= 8 	if (sex_mom == 1 & educd_mom == 20);
replace WifeEducation 		= 8 	if (sex_pop == 2 & educd_pop == 20);
replace WifeEducation 		= 8 	if (sex_mom == 2 & educd_mom == 20);

replace HusbandEducation 	= 6 	if (sex_pop == 1 & educd_pop == 21);
replace HusbandEducation 	= 6 	if (sex_mom == 1 & educd_mom == 21);
replace WifeEducation 		= 6 	if (sex_pop == 2 & educd_pop == 21);
replace WifeEducation 		= 6 	if (sex_mom == 2 & educd_mom == 21);

replace HusbandEducation 	= 5 	if (sex_pop == 1 & educd_pop == 22);
replace HusbandEducation	= 5 	if (sex_mom == 1 & educd_mom == 22);
replace WifeEducation 		= 5 	if (sex_pop == 2 & educd_pop == 22);
replace WifeEducation 		= 5 	if (sex_mom == 2 & educd_mom == 22);

replace HusbandEducation 	= 6 	if (sex_pop == 1 & educd_pop == 23);
replace HusbandEducation 	= 6 	if (sex_mom == 1 & educd_mom == 23);
replace WifeEducation	 	= 6 	if (sex_pop == 2 & educd_pop == 23);
replace WifeEducation 		= 6 	if (sex_mom == 2 & educd_mom == 23);

replace HusbandEducation 	= 8 	if (sex_pop == 1 & educd_pop == 24);
replace HusbandEducation 	= 8 	if (sex_mom == 1 & educd_mom == 24);
replace WifeEducation 		= 8 	if (sex_pop == 2 & educd_pop == 24);
replace WifeEducation 		= 8 	if (sex_mom == 2 & educd_mom == 24);

replace HusbandEducation 	= 7 	if (sex_pop == 1 & educd_pop == 25);
replace HusbandEducation 	= 7 	if (sex_mom == 1 & educd_mom == 25);
replace WifeEducation 		= 7 	if (sex_pop == 2 & educd_pop == 25);
replace WifeEducation 		= 7 	if (sex_mom == 2 & educd_mom == 25);

replace HusbandEducation 	= 8 	if (sex_pop == 1 & educd_pop == 26);
replace HusbandEducation 	= 8 	if (sex_mom == 1 & educd_mom == 26);
replace WifeEducation 		= 8 	if (sex_pop == 2 & educd_pop == 26);
replace WifeEducation 		= 8 	if (sex_mom == 2 & educd_mom == 26);

replace HusbandEducation 	= 9 	if (sex_pop == 1 & educd_pop == 30);
replace HusbandEducation 	= 9 	if (sex_mom == 1 & educd_mom == 30);
replace WifeEducation 		= 9 	if (sex_pop == 2 & educd_pop == 30);
replace WifeEducation 		= 9 	if (sex_mom == 2 & educd_mom == 30);

replace HusbandEducation 	= 10 	if (sex_pop == 1 & educd_pop == 40);
replace HusbandEducation 	= 10 	if (sex_mom == 1 & educd_mom == 40);
replace WifeEducation 		= 10 	if (sex_pop == 2 & educd_pop == 40);
replace WifeEducation 		= 10 	if (sex_mom == 2 & educd_mom == 40);

replace HusbandEducation 	= 11 	if (sex_pop == 1 & educd_pop == 50);
replace HusbandEducation 	= 11 	if (sex_mom == 1 & educd_mom == 50);
replace WifeEducation 		= 11 	if (sex_pop == 2 & educd_pop == 50);
replace WifeEducation 		= 11 	if (sex_mom == 2 & educd_mom == 50);

replace HusbandEducation 	= 12 	if (sex_pop == 1 & educd_pop == 60);
replace HusbandEducation 	= 12 	if (sex_mom == 1 & educd_mom == 60);
replace WifeEducation 		= 12 	if (sex_pop == 2 & educd_pop == 60);
replace WifeEducation 		= 12 	if (sex_mom == 2 & educd_mom == 60);

replace HusbandEducation 	= 11 	if (sex_pop == 1 & educd_pop == 61);
replace HusbandEducation 	= 11 	if (sex_mom == 1 & educd_mom == 61);
replace WifeEducation 		= 11 	if (sex_pop == 2 & educd_pop == 61);
replace WifeEducation 		= 11 	if (sex_mom == 2 & educd_mom == 61);

replace HusbandEducation 	= 12 	if (sex_pop == 1 & educd_pop == 62);
replace HusbandEducation 	= 12 	if (sex_mom == 1 & educd_mom == 62);
replace WifeEducation 		= 12 	if (sex_pop == 2 & educd_pop == 62);
replace WifeEducation 		= 12 	if (sex_mom == 2 & educd_mom == 62);

replace HusbandEducation 	= 12 	if (sex_pop == 1 & educd_pop == 63);
replace HusbandEducation 	= 12 	if (sex_mom == 1 & educd_mom == 63);
replace WifeEducation 		= 12 	if (sex_pop == 2 & educd_pop == 63);
replace WifeEducation 		= 12 	if (sex_mom == 2 & educd_mom == 63);

replace HusbandEducation 	= 12 	if (sex_pop == 1 & educd_pop == 64);
replace HusbandEducation 	= 12 	if (sex_mom == 1 & educd_mom == 64);
replace WifeEducation 		= 12 	if (sex_pop == 2 & educd_pop == 64);
replace WifeEducation 		= 12 	if (sex_mom == 2 & educd_mom == 64);

replace HusbandEducation 	= 12 	if (sex_pop == 1 & educd_pop == 65);
replace HusbandEducation 	= 12 	if (sex_mom == 1 & educd_mom == 65);
replace WifeEducation 		= 12 	if (sex_pop == 2 & educd_pop == 65);
replace WifeEducation 		= 12 	if (sex_mom == 2 & educd_mom == 65);

replace HusbandEducation 	= 13 	if (sex_pop == 1 & educd_pop == 70);
replace HusbandEducation 	= 13 	if (sex_mom == 1 & educd_mom == 70);
replace WifeEducation 		= 13 	if (sex_pop == 2 & educd_pop == 70);
replace WifeEducation 		= 13 	if (sex_mom == 2 & educd_mom == 70);

replace HusbandEducation 	= 13 	if (sex_pop == 1 & educd_pop == 71);
replace HusbandEducation 	= 13 	if (sex_mom == 1 & educd_mom == 71);
replace WifeEducation 		= 13 	if (sex_pop == 2 & educd_pop == 71);
replace WifeEducation 		= 13 	if (sex_mom == 2 & educd_mom == 71);

replace HusbandEducation 	= 14 	if (sex_pop == 1 & educd_pop == 80);
replace HusbandEducation 	= 14 	if (sex_mom == 1 & educd_mom == 80);
replace WifeEducation 		= 14 	if (sex_pop == 2 & educd_pop == 80);
replace WifeEducation 		= 14 	if (sex_mom == 2 & educd_mom == 80);

replace HusbandEducation 	= 14 	if (sex_pop == 1 & educd_pop == 81);
replace HusbandEducation 	= 14 	if (sex_mom == 1 & educd_mom == 81);
replace WifeEducation 		= 14 	if (sex_pop == 2 & educd_pop == 81);
replace WifeEducation 		= 14 	if (sex_mom == 2 & educd_mom == 81);

replace HusbandEducation 	= 14 	if (sex_pop == 1 & educd_pop == 82);
replace HusbandEducation 	= 14 	if (sex_mom == 1 & educd_mom == 82);
replace WifeEducation 		= 14 	if (sex_pop == 2 & educd_pop == 82);
replace WifeEducation 		= 14 	if (sex_mom == 2 & educd_mom == 82);

replace HusbandEducation 	= 14 	if (sex_pop == 1 & educd_pop == 83);
replace HusbandEducation 	= 14 	if (sex_mom == 1 & educd_mom == 83);
replace WifeEducation 		= 14 	if (sex_pop == 2 & educd_pop == 83);
replace WifeEducation 		= 14 	if (sex_mom == 2 & educd_mom == 83);

replace HusbandEducation 	= 15 	if (sex_pop == 1 & educd_pop == 90);
replace HusbandEducation 	= 15 	if (sex_mom == 1 & educd_mom == 90);
replace WifeEducation 		= 15 	if (sex_pop == 2 & educd_pop == 90);
replace WifeEducation 		= 15 	if (sex_mom == 2 & educd_mom == 90);

replace HusbandEducation 	= 16 	if (sex_pop == 1 & educd_pop == 100);
replace HusbandEducation 	= 16 	if (sex_mom == 1 & educd_mom == 100);
replace WifeEducation 		= 16 	if (sex_pop == 2 & educd_pop == 100);
replace WifeEducation 		= 16 	if (sex_mom == 2 & educd_mom == 100);

replace HusbandEducation 	= 16 	if (sex_pop == 1 & educd_pop == 101);
replace HusbandEducation 	= 16 	if (sex_mom == 1 & educd_mom == 101);
replace WifeEducation 		= 16 	if (sex_pop == 2 & educd_pop == 101);
replace WifeEducation 		= 16 	if (sex_mom == 2 & educd_mom == 101);

replace HusbandEducation 	= 16 	if (sex_pop == 1 & educd_pop == 110);
replace HusbandEducation 	= 16 	if (sex_mom == 1 & educd_mom == 110);
replace WifeEducation 		= 16 	if (sex_pop == 2 & educd_pop == 110);
replace WifeEducation 		= 16 	if (sex_mom == 2 & educd_mom == 110);

replace HusbandEducation 	= 16 	if (sex_pop == 1 & educd_pop == 111);
replace HusbandEducation 	= 16 	if (sex_mom == 1 & educd_mom == 111);
replace WifeEducation 		= 16 	if (sex_pop == 2 & educd_pop == 111);
replace WifeEducation 		= 16 	if (sex_mom == 2 & educd_mom == 111);

replace HusbandEducation 	= 16 	if (sex_pop == 1 & educd_pop == 112);
replace HusbandEducation 	= 16 	if (sex_mom == 1 & educd_mom == 112);
replace WifeEducation 		= 16 	if (sex_pop == 2 & educd_pop == 112);
replace WifeEducation 		= 16 	if (sex_mom == 2 & educd_mom == 112);

replace HusbandEducation 	= 16 	if (sex_pop == 1 & educd_pop == 113);
replace HusbandEducation 	= 16 	if (sex_mom == 1 & educd_mom == 113);
replace WifeEducation 		= 16 	if (sex_pop == 2 & educd_pop == 113);
replace WifeEducation 		= 16 	if (sex_mom == 2 & educd_mom == 113);

replace HusbandEducation 	= 18 	if (sex_pop == 1 & educd_pop == 114);
replace HusbandEducation 	= 18 	if (sex_mom == 1 & educd_mom == 114);
replace WifeEducation 		= 18 	if (sex_pop == 2 & educd_pop == 114);
replace WifeEducation 		= 18 	if (sex_mom == 2 & educd_mom == 114);

replace HusbandEducation 	= 18 	if (sex_pop == 1 & educd_pop == 115);
replace HusbandEducation 	= 18 	if (sex_mom == 1 & educd_mom == 115);
replace WifeEducation 		= 18 	if (sex_pop == 2 & educd_pop == 115);
replace WifeEducation 		= 18 	if (sex_mom == 2 & educd_mom == 115);

replace HusbandEducation 	= 21 	if (sex_pop == 1 & educd_pop == 116);
replace HusbandEducation 	= 21 	if (sex_mom == 1 & educd_mom == 116);
replace WifeEducation 		= 21 	if (sex_pop == 2 & educd_pop == 116);
replace WifeEducation 		= 21 	if (sex_mom == 2 & educd_mom == 116);

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
/*
********************************************************************************
* Total family income
********************************************************************************
* ftotval in 1999's $:
*/
#delimit;
replace ftotinc_pop = . if ftotinc_pop >= 9999998;
replace ftotinc_mom = . if ftotinc_mom >= 9999998;

gen lnftotval_pop1999 = ln(cpi99 * ftotinc_pop);
gen lnftotval_mom1999 = ln(cpi99 * ftotinc_mom);


gen Husband_ftotval = .;
gen Wife_ftotval = .;

replace Husband_ftotval = lnftotval_pop1999 if sex_pop == 1 & ftotinc_pop < 9999998;
replace Husband_ftotval = lnftotval_mom1999 if sex_mom == 1 & ftotinc_mom < 9999998;

replace Wife_ftotval = lnftotval_pop1999 if sex_pop == 2 & ftotinc_pop < 9999998;
replace Wife_ftotval = lnftotval_mom1999 if sex_mom == 2 & ftotinc_mom < 9999998;
/*
********************************************************************************
* Total personal income
********************************************************************************
* inctot in 1999's $:
*/
#delimit;
replace inctot_pop =. if inctot_pop >= 9999998;
replace inctot_mom =. if inctot_mom >= 9999998;

gen lninctot_pop1999 = ln(cpi99 * inctot_pop);
gen lninctot_mom1999 = ln(cpi99 * inctot_mom);

gen Husband_inctot = .;
gen Wife_inctot = .;

replace Husband_inctot = lninctot_pop1999 if sex_pop == 1 & inctot_pop < 999998;
replace Husband_inctot = lninctot_mom1999 if sex_mom == 1 & inctot_mom < 999998;

replace Wife_inctot = lninctot_pop1999 if sex_pop == 2 & inctot_pop < 999998;
replace Wife_inctot = lninctot_mom1999 if sex_mom == 2 & inctot_mom < 999998;

/*
********************************************************************************
* Wage and Salary Income
********************************************************************************
* incwage in 1999's $:
*/
replace incwage_pop = . if incwage_pop >= 999998;
replace incwage_mom = . if incwage_mom >= 999998;

gen lnincwage_pop1999 = ln(cpi99 * incwage_pop);
gen lnincwage_mom1999 = ln(cpi99 * incwage_mom);

gen Husband_incwage = .;
gen Wife_incwage = .;

replace Husband_incwage = lnincwage_pop1999 if sex_pop == 1 & incwage_pop < 999998;
replace Husband_incwage = lnincwage_mom1999 if sex_mom == 1 & incwage_mom < 999998;

replace Wife_incwage = lnincwage_pop1999 if sex_pop == 2 & incwage_pop < 999998;
replace Wife_incwage = lnincwage_mom1999 if sex_mom == 2 & incwage_mom < 999998;

/*
********************************************************************************
* Age
********************************************************************************
*/
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
* Year of birth
********************************************************************************
*/
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
Husband_ftotval Wife_ftotval Husband_inctot Wife_inctot Husband_incwage 
Wife_incwage cpi99 region stateicp statefip countyicp countyfip urban metro city
HusbandAge WifeAge HusbandYOB WifeYOB LAHusband LAWife CoupleType Husband_ed_level 
Wife_ed_level Wife_fbpl Husband_fbpl Hispanic_Husband Hispanic_Wife age year YOB
bpl bpl_mom bpl_pop fbpl fbpl_mom fbpl_pop mbpl mbpl_mom mbpl_pop bpld bpld_mom bpld_pop;

/*
Save full parent's data
*/
save "ParentDataFull.dta", replace;

/*
Generate Couple types dummies
*/
*/
#delimit;
gen WW = 0;
gen WM = 0;
gen MW = 0;
gen MM = 0;

replace WW = 1 if CoupleType == "White-White";
replace WM = 1 if CoupleType == "White-Hispanic";
replace MW = 1 if CoupleType == "Hispanic-White";
replace MM = 1 if CoupleType == "Hispanic-Hispanic";

tab Wife_ed_level, gen(ed_level_dummy_w);
tab Husband_ed_level, gen(ed_level_dummy_h);
save "ParentDataFull.dta", replace;
