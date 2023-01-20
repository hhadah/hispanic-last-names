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

global wd 	"C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\datasets";

/*
Open dataset
*/
cd "$wd";
use "$wd/SyntheticParentsData.dta";

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

keep if year == 1960 | year == 1970 | year == 1980;


/*
keep 1930 to 1965 birth cohorts
*/
#delimit;
gen YOB = year - age;
keep if YOB>=1940 & YOB <=1965;

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
keep if marst 				== 1;
keep if pernum 				== 1;
keep if race_sp 			== 1 & race_head 			== 1;
/*
#delimit;
keep if (fbpl_sp 				== 200 | /* Mexico*/
		fbpl_sp 				== 210 | /* Central America*/
		fbpl_sp 				== 250 | /* Cuba*/
		fbpl_sp 				== 299 | /* Americas n.s. */
		fbpl_sp 				== 300 | /* South America*/
		fbpl_sp 				<= 99); /* American States */
#delimit;
keep if	(fbpl_head 				== 200 | /* Mexico*/
		fbpl_head 				== 210 | /* Central America*/
		fbpl_head 				== 250 | /* Cuba*/
		fbpl_head 				== 299 | /* Americas n.s. */
		fbpl_head 				== 300 | /* South America*/
		fbpl_head 				<= 99) ; /* American States */
#delimit;
keep if	(mbpl_sp 				== 200 | /* Mexico*/
		mbpl_sp 				== 210 | /* Central America*/
		mbpl_sp 				== 250 | /* Cuba*/
		mbpl_sp 				== 299 | /* Americas n.s. */
		mbpl_sp 				== 300 | /* South America*/
		mbpl_sp 				<= 99) ; /* American States */
#delimit;
keep if	(mbpl_head 				== 200 | /* Mexico*/
		mbpl_head 				== 210 | /* Central America*/
		mbpl_head 				== 250 | /* Cuba*/
		mbpl_head 				== 299 | /* Americas n.s. */
		mbpl_head 				== 300 | /* South America*/
		mbpl_head 				<= 99) ; /* American States */
#delimit;
drop if mbpl_sp == 0 & mbpl_head == 0 & fbpl_head == 0 & fbpl_sp == 0;
*/

/*
Keep peopel that were born
in the US or Spanish speaking
countries and drop missing values
*/
keep if (bpl_sp 				== 200 | /* Mexico*/
		bpl_sp 				== 210 | /* Central America*/
		bpl_sp 				== 250 | /* Cuba*/
		bpl_sp 				== 299 | /* Americas n.s. */
		bpl_sp 				== 300 | /* South America*/
		bpl_sp 				<= 99) &	 /* American States */
		(bpl_head 			== 200 | /* Mexico*/
		bpl_head 			== 210 | /* Central America*/
		bpl_head 			== 250 | /* Cuba*/
		bpl_head 			== 299 | /* Americas n.s. */
		bpl_head 			== 300 | /* South America*/
		bpl_head 			<= 99);	 /* American States */
drop if bpl_sp == 0 | bpl_head == 0;
/*
keep if (fbpl_sp 				== 200 | /* Mexico*/
		fbpl_sp 				== 210 | /* Central America*/
		fbpl_sp 				== 250 | /* Cuba*/
		fbpl_sp 				== 299 | /* Americas n.s. */
		fbpl_sp 				== 300 | /* South America*/
		fbpl_sp 				<= 99) &	 /* American States */
		(fbpl_head 			== 200 | /* Mexico*/
		fbpl_head 			== 210 | /* Central America*/
		fbpl_head 			== 250 | /* Cuba*/
		fbpl_head 			== 299 | /* Americas n.s. */
		fbpl_head 			== 300 | /* South America*/
		fbpl_head 			<= 99);	 /* American States */
drop if fbpl_sp == 0 | fbpl_head == 0;
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

replace 	LAHusband				= 1			if fbpl_sp 		> 99 	| mbpl_sp 		>  99	& 	sex_sp 		== 1;
replace 	LAHusband				= 1			if fbpl_head 	> 99 	| mbpl_head 	>  99	& 	sex_head 	== 1;

replace 	LAHusband				= 0			if fbpl_sp 		<= 99 	& mbpl_sp 		<= 99 	&	sex_sp 		== 1;
replace 	LAHusband				= 0			if fbpl_head 	<= 99 	& mbpl_head 	<= 99	& 	sex_head 	== 1;

replace 	LAWife					= 1			if fbpl_sp 		> 99 	| mbpl_sp 		>  99	& 	sex_sp 		== 2;
replace 	LAWife					= 1			if fbpl_head 	> 99 	| mbpl_head 	>  99	& 	sex_head 	== 2;

replace 	LAWife					= 0			if fbpl_sp 		<= 99 	& mbpl_sp 		<= 99	& 	sex_sp 		== 2;
replace 	LAWife					= 0			if fbpl_head 	<= 99 	& mbpl_head 	<= 99	& 	sex_head 	== 2;

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

replace 	LAHusband				= 1			if fbpl_sp 		> 99 	& 	sex_sp 		== 1;
replace 	LAHusband				= 1			if fbpl_head 	> 99 	& 	sex_head 	== 1;

replace 	LAHusband				= 0			if fbpl_sp 		<= 99	&	sex_sp 		== 1;
replace 	LAHusband				= 0			if fbpl_head 	<= 99	& 	sex_head 	== 1;

replace 	LAWife					= 1			if fbpl_sp 		> 99	& 	sex_sp 		== 2;
replace 	LAWife					= 1			if fbpl_head 	> 99	& 	sex_head 	== 2;

replace 	LAWife					= 0			if fbpl_sp 		<= 99	& 	sex_sp 		== 2;
replace 	LAWife					= 0			if fbpl_head 	<= 99	& 	sex_head 	== 2;

drop if LAHusband == .;
drop if LAWife	  == .;

tab LAHusband LAWife;
*/

#delimit
gen 		LAHusband 				= .;
gen 		LAWife 					= .;
label var	LAHusband 				"=1 if husband's father was born in Latin America";
label var 	LAWife 					"=1 if Wife's father was born in Latin America";

replace 	LAHusband				= 1			if bpl_sp 		> 99 	& 	sex_sp 		== 1;
replace 	LAHusband				= 1			if bpl_head 	> 99 	& 	sex_head 	== 1;

replace 	LAHusband				= 0			if bpl_sp 		<= 99	&	sex_sp 		== 1;
replace 	LAHusband				= 0			if bpl_head 	<= 99	& 	sex_head 	== 1;

replace 	LAWife					= 1			if bpl_sp 		> 99	& 	sex_sp 		== 2;
replace 	LAWife					= 1			if bpl_head 	> 99	& 	sex_head 	== 2;

replace 	LAWife					= 0			if bpl_sp 		<= 99	& 	sex_sp 		== 2;
replace 	LAWife					= 0			if bpl_head 	<= 99	& 	sex_head 	== 2;

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

replace 	MexicanHusband	= 1			if bpl_sp 		== 200 	& 	sex_sp 		== 1;
replace 	MexicanHusband	= 1			if bpl_head 	== 200 	& 	sex_head 	== 1;


replace 	MexicanWife		= 1			if bpl_sp 		== 200 	& 	sex_sp 		== 2;
replace 	MexicanWife		= 1			if bpl_head 	== 200 	& 	sex_head 	== 2;
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

replace 	HH_Husband		= 1				if fbpl_sp 		== 200 	& 	mbpl_sp 		== 200 	& sex_sp 		== 1;
replace 	HH_Husband		= 1				if fbpl_head 	== 200 	& 	mbpl_head 		== 200 	& sex_head 		== 1;

replace 	HW_Husband		= 1				if fbpl_sp 		== 200 	& 	mbpl_sp 		!= 200 	& sex_sp 		== 1;
replace 	HW_Husband		= 1				if fbpl_head 	== 200 	& 	mbpl_head 		!= 200 	& sex_head 		== 1;

replace 	WH_Husband		= 1				if fbpl_sp 		!= 200 	& 	mbpl_sp 		== 200 	& sex_sp 		== 1;
replace 	WH_Husband		= 1				if fbpl_head 	!= 200 	& 	mbpl_head 		== 200 	& sex_head 		== 1;

replace 	WW_Husband		= 1				if fbpl_sp 		!= 200 	& 	mbpl_sp 		!= 200 	& sex_sp 		== 1;
replace 	WW_Husband		= 1				if fbpl_head 	!= 200 	& 	mbpl_head 		!= 200 	& sex_head 		== 1;

replace 	HH_Wife			= 1				if fbpl_sp 		== 200 	& 	mbpl_sp 		== 200 	& sex_sp 		== 2;
replace 	HH_Wife			= 1				if fbpl_head 	== 200 	& 	mbpl_head 		== 200 	& sex_head 		== 2;

replace 	HW_Wife			= 1				if fbpl_sp 		== 200 	& 	mbpl_sp 		!= 200 	& sex_sp 		== 2;
replace 	HW_Wife			= 1				if fbpl_head 	== 200 	& 	mbpl_head 		!= 200	& sex_head 		== 2;

replace 	WH_Wife			= 1				if fbpl_sp 		!= 200 	& 	mbpl_sp 		== 200 	& sex_sp 		== 2;
replace 	WH_Wife			= 1				if fbpl_head 	!= 200 	& 	mbpl_head 		== 200 	& sex_head 		== 2;

replace 	WW_Wife			= 1				if fbpl_sp 		!= 200 	& 	mbpl_sp 		!= 200 	& sex_sp 		== 2;
replace 	WW_Wife			= 1				if fbpl_head 	!= 200 	& 	mbpl_head 		!= 200 	& sex_head 		== 2;

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
drop if (sex_sp == 1 & sex_head == 1) | (sex_sp == 2 & sex_head == 2);
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
* education: educ_head educ_sp (all series)
********************************************************************************
*/
gen HusbandEducation 	= .;
gen WifeEducation 		= .;

replace HusbandEducation 	= .		if (sex_head == 1 & educd_head == 0);
replace HusbandEducation 	= . 	if (sex_sp == 1 & educd_sp == 0);
replace WifeEducation 		= . 	if (sex_head == 2 & educd_head == 0);
replace WifeEducation 		= . 	if (sex_sp == 2 & educd_sp == 0);

replace HusbandEducation 	= . 	if (sex_head == 1 & educd_head == 1);
replace HusbandEducation 	= . 	if (sex_sp == 1 & educd_sp == 1);
replace WifeEducation 		= . 	if (sex_head == 2 & educd_head == 1);
replace WifeEducation 		= . 	if (sex_sp == 2 & educd_sp == 1);

replace HusbandEducation 	= 0 	if (sex_head == 1 & educd_head == 2);
replace HusbandEducation 	= 0 	if (sex_sp == 1 & educd_sp == 2);
replace WifeEducation 		= 0 	if (sex_head == 2 & educd_head == 2);
replace WifeEducation 		= 0 	if (sex_sp == 2 & educd_sp == 2);

replace HusbandEducation 	= 4 	if (sex_head == 1 & educd_head == 10);
replace HusbandEducation 	= 4 	if (sex_sp == 1 & educd_sp == 10);
replace WifeEducation 		= 4 	if (sex_head == 2 & educd_head == 10);
replace WifeEducation 		= 4 	if (sex_sp == 2 & educd_sp == 10);

replace HusbandEducation 	= 1 	if (sex_head == 1 & educd_head == 11);
replace HusbandEducation 	= 1 	if (sex_sp == 1 & educd_sp == 11);
replace WifeEducation 		= 1 	if (sex_head == 2 & educd_head == 11);
replace WifeEducation 		= 1 	if (sex_sp == 2 & educd_sp == 11);

replace HusbandEducation 	= 2 	if (sex_head == 1 & educd_head == 12);
replace HusbandEducation 	= 2 	if (sex_sp == 1 & educd_sp == 12);
replace WifeEducation 		= 2 	if (sex_head == 2 & educd_head == 12);
replace WifeEducation 		= 2 	if (sex_sp == 2 & educd_sp == 12);

replace HusbandEducation 	= 4 	if (sex_head == 1 & educd_head == 13);
replace HusbandEducation	= 4 	if (sex_sp == 1 & educd_sp == 13);
replace WifeEducation 		= 4 	if (sex_head == 2 & educd_head == 13);
replace WifeEducation 		= 4 	if (sex_sp == 2 & educd_sp == 13);

replace HusbandEducation 	= 1 	if (sex_head == 1 & educd_head == 14);
replace HusbandEducation 	= 1 	if (sex_sp == 1 & educd_sp == 14);
replace WifeEducation 		= 1 	if (sex_head == 2 & educd_head == 14);
replace WifeEducation 		= 1 	if (sex_sp == 2 & educd_sp == 14);

replace HusbandEducation 	= 2 	if (sex_head == 1 & educd_head == 15);
replace HusbandEducation 	= 2 	if (sex_sp == 1 & educd_sp == 15);
replace WifeEducation 		= 2 	if (sex_head == 2 & educd_head == 15);
replace WifeEducation 		= 2 	if (sex_sp == 2 & educd_sp == 15);

replace HusbandEducation 	= 3 	if (sex_head == 1 & educd_head == 16);
replace HusbandEducation 	= 3 	if (sex_sp == 1 & educd_sp == 16);
replace WifeEducation	 	= 3 	if (sex_head == 2 & educd_head == 16);
replace WifeEducation 		= 3 	if (sex_sp == 2 & educd_sp == 16);

replace HusbandEducation 	= 4 	if (sex_head == 1 & educd_head == 17);
replace HusbandEducation 	= 4 	if (sex_sp == 1 & educd_sp == 17);
replace WifeEducation 		= 4 	if (sex_head == 2 & educd_head == 17);
replace WifeEducation 		= 4 	if (sex_sp == 2 & educd_sp == 17);

replace HusbandEducation 	= 8 	if (sex_head == 1 & educd_head == 20);
replace HusbandEducation 	= 8 	if (sex_sp == 1 & educd_sp == 20);
replace WifeEducation 		= 8 	if (sex_head == 2 & educd_head == 20);
replace WifeEducation 		= 8 	if (sex_sp == 2 & educd_sp == 20);

replace HusbandEducation 	= 6 	if (sex_head == 1 & educd_head == 21);
replace HusbandEducation 	= 6 	if (sex_sp == 1 & educd_sp == 21);
replace WifeEducation 		= 6 	if (sex_head == 2 & educd_head == 21);
replace WifeEducation 		= 6 	if (sex_sp == 2 & educd_sp == 21);

replace HusbandEducation 	= 5 	if (sex_head == 1 & educd_head == 22);
replace HusbandEducation	= 5 	if (sex_sp == 1 & educd_sp == 22);
replace WifeEducation 		= 5 	if (sex_head == 2 & educd_head == 22);
replace WifeEducation 		= 5 	if (sex_sp == 2 & educd_sp == 22);

replace HusbandEducation 	= 6 	if (sex_head == 1 & educd_head == 23);
replace HusbandEducation 	= 6 	if (sex_sp == 1 & educd_sp == 23);
replace WifeEducation	 	= 6 	if (sex_head == 2 & educd_head == 23);
replace WifeEducation 		= 6 	if (sex_sp == 2 & educd_sp == 23);

replace HusbandEducation 	= 8 	if (sex_head == 1 & educd_head == 24);
replace HusbandEducation 	= 8 	if (sex_sp == 1 & educd_sp == 24);
replace WifeEducation 		= 8 	if (sex_head == 2 & educd_head == 24);
replace WifeEducation 		= 8 	if (sex_sp == 2 & educd_sp == 24);

replace HusbandEducation 	= 7 	if (sex_head == 1 & educd_head == 25);
replace HusbandEducation 	= 7 	if (sex_sp == 1 & educd_sp == 25);
replace WifeEducation 		= 7 	if (sex_head == 2 & educd_head == 25);
replace WifeEducation 		= 7 	if (sex_sp == 2 & educd_sp == 25);

replace HusbandEducation 	= 8 	if (sex_head == 1 & educd_head == 26);
replace HusbandEducation 	= 8 	if (sex_sp == 1 & educd_sp == 26);
replace WifeEducation 		= 8 	if (sex_head == 2 & educd_head == 26);
replace WifeEducation 		= 8 	if (sex_sp == 2 & educd_sp == 26);

replace HusbandEducation 	= 9 	if (sex_head == 1 & educd_head == 30);
replace HusbandEducation 	= 9 	if (sex_sp == 1 & educd_sp == 30);
replace WifeEducation 		= 9 	if (sex_head == 2 & educd_head == 30);
replace WifeEducation 		= 9 	if (sex_sp == 2 & educd_sp == 30);

replace HusbandEducation 	= 10 	if (sex_head == 1 & educd_head == 40);
replace HusbandEducation 	= 10 	if (sex_sp == 1 & educd_sp == 40);
replace WifeEducation 		= 10 	if (sex_head == 2 & educd_head == 40);
replace WifeEducation 		= 10 	if (sex_sp == 2 & educd_sp == 40);

replace HusbandEducation 	= 11 	if (sex_head == 1 & educd_head == 50);
replace HusbandEducation 	= 11 	if (sex_sp == 1 & educd_sp == 50);
replace WifeEducation 		= 11 	if (sex_head == 2 & educd_head == 50);
replace WifeEducation 		= 11 	if (sex_sp == 2 & educd_sp == 50);

replace HusbandEducation 	= 12 	if (sex_head == 1 & educd_head == 60);
replace HusbandEducation 	= 12 	if (sex_sp == 1 & educd_sp == 60);
replace WifeEducation 		= 12 	if (sex_head == 2 & educd_head == 60);
replace WifeEducation 		= 12 	if (sex_sp == 2 & educd_sp == 60);

replace HusbandEducation 	= 11 	if (sex_head == 1 & educd_head == 61);
replace HusbandEducation 	= 11 	if (sex_sp == 1 & educd_sp == 61);
replace WifeEducation 		= 11 	if (sex_head == 2 & educd_head == 61);
replace WifeEducation 		= 11 	if (sex_sp == 2 & educd_sp == 61);

replace HusbandEducation 	= 12 	if (sex_head == 1 & educd_head == 62);
replace HusbandEducation 	= 12 	if (sex_sp == 1 & educd_sp == 62);
replace WifeEducation 		= 12 	if (sex_head == 2 & educd_head == 62);
replace WifeEducation 		= 12 	if (sex_sp == 2 & educd_sp == 62);

replace HusbandEducation 	= 12 	if (sex_head == 1 & educd_head == 63);
replace HusbandEducation 	= 12 	if (sex_sp == 1 & educd_sp == 63);
replace WifeEducation 		= 12 	if (sex_head == 2 & educd_head == 63);
replace WifeEducation 		= 12 	if (sex_sp == 2 & educd_sp == 63);

replace HusbandEducation 	= 12 	if (sex_head == 1 & educd_head == 64);
replace HusbandEducation 	= 12 	if (sex_sp == 1 & educd_sp == 64);
replace WifeEducation 		= 12 	if (sex_head == 2 & educd_head == 64);
replace WifeEducation 		= 12 	if (sex_sp == 2 & educd_sp == 64);

replace HusbandEducation 	= 12 	if (sex_head == 1 & educd_head == 65);
replace HusbandEducation 	= 12 	if (sex_sp == 1 & educd_sp == 65);
replace WifeEducation 		= 12 	if (sex_head == 2 & educd_head == 65);
replace WifeEducation 		= 12 	if (sex_sp == 2 & educd_sp == 65);

replace HusbandEducation 	= 13 	if (sex_head == 1 & educd_head == 70);
replace HusbandEducation 	= 13 	if (sex_sp == 1 & educd_sp == 70);
replace WifeEducation 		= 13 	if (sex_head == 2 & educd_head == 70);
replace WifeEducation 		= 13 	if (sex_sp == 2 & educd_sp == 70);

replace HusbandEducation 	= 13 	if (sex_head == 1 & educd_head == 71);
replace HusbandEducation 	= 13 	if (sex_sp == 1 & educd_sp == 71);
replace WifeEducation 		= 13 	if (sex_head == 2 & educd_head == 71);
replace WifeEducation 		= 13 	if (sex_sp == 2 & educd_sp == 71);

replace HusbandEducation 	= 14 	if (sex_head == 1 & educd_head == 80);
replace HusbandEducation 	= 14 	if (sex_sp == 1 & educd_sp == 80);
replace WifeEducation 		= 14 	if (sex_head == 2 & educd_head == 80);
replace WifeEducation 		= 14 	if (sex_sp == 2 & educd_sp == 80);

replace HusbandEducation 	= 14 	if (sex_head == 1 & educd_head == 81);
replace HusbandEducation 	= 14 	if (sex_sp == 1 & educd_sp == 81);
replace WifeEducation 		= 14 	if (sex_head == 2 & educd_head == 81);
replace WifeEducation 		= 14 	if (sex_sp == 2 & educd_sp == 81);

replace HusbandEducation 	= 14 	if (sex_head == 1 & educd_head == 82);
replace HusbandEducation 	= 14 	if (sex_sp == 1 & educd_sp == 82);
replace WifeEducation 		= 14 	if (sex_head == 2 & educd_head == 82);
replace WifeEducation 		= 14 	if (sex_sp == 2 & educd_sp == 82);

replace HusbandEducation 	= 14 	if (sex_head == 1 & educd_head == 83);
replace HusbandEducation 	= 14 	if (sex_sp == 1 & educd_sp == 83);
replace WifeEducation 		= 14 	if (sex_head == 2 & educd_head == 83);
replace WifeEducation 		= 14 	if (sex_sp == 2 & educd_sp == 83);

replace HusbandEducation 	= 15 	if (sex_head == 1 & educd_head == 90);
replace HusbandEducation 	= 15 	if (sex_sp == 1 & educd_sp == 90);
replace WifeEducation 		= 15 	if (sex_head == 2 & educd_head == 90);
replace WifeEducation 		= 15 	if (sex_sp == 2 & educd_sp == 90);

replace HusbandEducation 	= 16 	if (sex_head == 1 & educd_head == 100);
replace HusbandEducation 	= 16 	if (sex_sp == 1 & educd_sp == 100);
replace WifeEducation 		= 16 	if (sex_head == 2 & educd_head == 100);
replace WifeEducation 		= 16 	if (sex_sp == 2 & educd_sp == 100);

replace HusbandEducation 	= 16 	if (sex_head == 1 & educd_head == 101);
replace HusbandEducation 	= 16 	if (sex_sp == 1 & educd_sp == 101);
replace WifeEducation 		= 16 	if (sex_head == 2 & educd_head == 101);
replace WifeEducation 		= 16 	if (sex_sp == 2 & educd_sp == 101);

replace HusbandEducation 	= 16 	if (sex_head == 1 & educd_head == 110);
replace HusbandEducation 	= 16 	if (sex_sp == 1 & educd_sp == 110);
replace WifeEducation 		= 16 	if (sex_head == 2 & educd_head == 110);
replace WifeEducation 		= 16 	if (sex_sp == 2 & educd_sp == 110);

replace HusbandEducation 	= 16 	if (sex_head == 1 & educd_head == 111);
replace HusbandEducation 	= 16 	if (sex_sp == 1 & educd_sp == 111);
replace WifeEducation 		= 16 	if (sex_head == 2 & educd_head == 111);
replace WifeEducation 		= 16 	if (sex_sp == 2 & educd_sp == 111);

replace HusbandEducation 	= 16 	if (sex_head == 1 & educd_head == 112);
replace HusbandEducation 	= 16 	if (sex_sp == 1 & educd_sp == 112);
replace WifeEducation 		= 16 	if (sex_head == 2 & educd_head == 112);
replace WifeEducation 		= 16 	if (sex_sp == 2 & educd_sp == 112);

replace HusbandEducation 	= 16 	if (sex_head == 1 & educd_head == 113);
replace HusbandEducation 	= 16 	if (sex_sp == 1 & educd_sp == 113);
replace WifeEducation 		= 16 	if (sex_head == 2 & educd_head == 113);
replace WifeEducation 		= 16 	if (sex_sp == 2 & educd_sp == 113);

replace HusbandEducation 	= 18 	if (sex_head == 1 & educd_head == 114);
replace HusbandEducation 	= 18 	if (sex_sp == 1 & educd_sp == 114);
replace WifeEducation 		= 18 	if (sex_head == 2 & educd_head == 114);
replace WifeEducation 		= 18 	if (sex_sp == 2 & educd_sp == 114);

replace HusbandEducation 	= 18 	if (sex_head == 1 & educd_head == 115);
replace HusbandEducation 	= 18 	if (sex_sp == 1 & educd_sp == 115);
replace WifeEducation 		= 18 	if (sex_head == 2 & educd_head == 115);
replace WifeEducation 		= 18 	if (sex_sp == 2 & educd_sp == 115);

replace HusbandEducation 	= 21 	if (sex_head == 1 & educd_head == 116);
replace HusbandEducation 	= 21 	if (sex_sp == 1 & educd_sp == 116);
replace WifeEducation 		= 21 	if (sex_head == 2 & educd_head == 116);
replace WifeEducation 		= 21 	if (sex_sp == 2 & educd_sp == 116);

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
replace ftotinc_head = . if ftotinc_head >= 9999998;
replace ftotinc_sp = . if ftotinc_sp >= 9999998;

gen lnftotval_head1999 = ln(cpi99 * ftotinc_head);
gen lnftotval_sp1999 = ln(cpi99 * ftotinc_sp);


gen Husband_ftotval = .;
gen Wife_ftotval = .;

replace Husband_ftotval = lnftotval_head1999 if sex_head == 1 & ftotinc_head < 9999998;
replace Husband_ftotval = lnftotval_sp1999 if sex_sp == 1 & ftotinc_sp < 9999998;

replace Wife_ftotval = lnftotval_head1999 if sex_head == 2 & ftotinc_head < 9999998;
replace Wife_ftotval = lnftotval_sp1999 if sex_sp == 2 & ftotinc_sp < 9999998;
/*
********************************************************************************
* Total personal income
********************************************************************************
* inctot in 1999's $:
*/
replace inctot_head =. if inctot_head >= 9999998;
replace inctot_sp =. if inctot_sp >= 9999998;

gen lninctot_head1999 = ln(cpi99 * inctot_head);
gen lninctot_sp1999 = ln(cpi99 * inctot_sp);

gen Husband_inctot = .;
gen Wife_inctot = .;

replace Husband_inctot = lninctot_head1999 if sex_head == 1 & inctot_head < 999998;
replace Husband_inctot = lninctot_sp1999 if sex_sp == 1 & inctot_sp < 999998;

replace Wife_inctot = lninctot_head1999 if sex_head == 2 & inctot_head < 999998;
replace Wife_inctot = lninctot_sp1999 if sex_sp == 2 & inctot_sp < 999998;

/*
********************************************************************************
* Wage and Salary Income
********************************************************************************
* incwage in 1999's $:
*/
replace incwage_head = . if incwage_head >= 999998;
replace incwage_sp = . if incwage_sp >= 999998;

gen lnincwage_head1999 = ln(cpi99 * incwage_head);
gen lnincwage_sp1999 = ln(cpi99 * incwage_sp);

gen Husband_incwage = .;
gen Wife_incwage = .;

replace Husband_incwage = lnincwage_head1999 if sex_head == 1 & incwage_head < 999998;
replace Husband_incwage = lnincwage_sp1999 if sex_sp == 1 & incwage_sp < 999998;

replace Wife_incwage = lnincwage_head1999 if sex_head == 2 & incwage_head < 999998;
replace Wife_incwage = lnincwage_sp1999 if sex_sp == 2 & incwage_sp < 999998;

/*
********************************************************************************
* Age
********************************************************************************
*/
gen HusbandAge = .;
gen WifeAge = .;

replace HusbandAge = age_head if sex_head == 1;
replace HusbandAge = age_sp if sex_sp == 1;

replace WifeAge = age_head if sex_head == 2;
replace WifeAge = age_sp if sex_sp == 2;

keep if WifeAge >= 25 & WifeAge<=40;
keep if HusbandAge >= 25 & HusbandAge<=40;
/*
********************************************************************************
* Year of birth
********************************************************************************
*/
gen HusbandYOB = .;
gen WifeYOB = .;

replace HusbandYOB = birthyr_head if sex_head == 1;
replace HusbandYOB = birthyr_sp if sex_sp == 1;

replace WifeYOB = birthyr_head if sex_head == 2;
replace WifeYOB = birthyr_sp if sex_sp == 2;
/*
********************************************************************************
* person weight: perwt
********************************************************************************
*/
gen Husband_wt = .;
gen Wife_wt = .;

replace Husband_wt = perwt if sex_head == 1;
replace Husband_wt = perwt if sex_sp == 1;

replace Wife_wt = perwt if sex_head == 2;
replace Wife_wt = perwt if sex_sp == 2;

/*
********************************************************************************
* fbpl: fbpl_head fbpl_sp (all series)
********************************************************************************
*/

gen Husband_fbpl = .;
gen Wife_fbpl = .;

replace Husband_fbpl = fbpl_head if sex_head == 1;
replace Husband_fbpl = fbpl_sp if sex_sp == 1;

replace Wife_fbpl = fbpl_head if sex_head == 2;
replace Wife_fbpl = fbpl_sp if sex_sp == 2;

/*
********************************************************************************
* hispan: hispan_head hispan_sp  (all series)
********************************************************************************
*/
gen Hispanic_Husband =.;
gen Hispanic_Wife =.;

replace Hispanic_Husband = 1 if hispan_head == 1 & sex_head == 1;
replace Hispanic_Husband = 1 if hispan_sp == 1 & sex_sp == 1;

replace Hispanic_Husband = 1 if hispan_head == 2 & sex_head == 1;
replace Hispanic_Husband = 1 if hispan_sp == 2 & sex_sp == 1;

replace Hispanic_Husband = 1 if hispan_head == 3 & sex_head == 1;
replace Hispanic_Husband = 1 if hispan_sp == 3 & sex_sp == 1;

replace Hispanic_Husband = 1 if hispan_head == 4 & sex_head == 1;
replace Hispanic_Husband = 1 if hispan_sp == 4 & sex_sp == 1;

replace Hispanic_Husband = 0 if hispan_head == 0 & sex_head == 1;
replace Hispanic_Husband = 0 if hispan_sp == 0 & sex_sp == 1;


replace Hispanic_Wife = 1 if hispan_head == 1 & sex_head == 2;
replace Hispanic_Wife = 1 if hispan_sp == 1 & sex_sp == 2;

replace Hispanic_Wife = 1 if hispan_head == 2 & sex_head == 2;
replace Hispanic_Wife = 1 if hispan_sp == 2 & sex_sp == 2;

replace Hispanic_Wife = 1 if hispan_head == 3 & sex_head == 2;
replace Hispanic_Wife = 1 if hispan_sp == 3 & sex_sp == 2;

replace Hispanic_Wife = 1 if hispan_head == 4 & sex_head == 2;
replace Hispanic_Wife = 1 if hispan_sp == 4 & sex_sp == 2;

replace Hispanic_Wife = 0 if hispan_head == 0 & sex_head == 2;
replace Hispanic_Wife = 0 if hispan_sp == 0 & sex_sp == 2;

tab Hispanic_Wife Hispanic_Husband;
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
keep year hhwt HusbandEducation WifeEducation Husband_wt Wife_wt
Husband_ftotval Wife_ftotval Husband_inctot Wife_inctot Husband_incwage 
Wife_incwage cpi99 region stateicp statefip countyicp countyfip urban metro city
HusbandAge WifeAge HusbandYOB WifeYOB LAHusband LAWife CoupleType Husband_ed_level 
Wife_ed_level Wife_fbpl Husband_fbpl Hispanic_Husband Hispanic_Wife age year YOB;

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
