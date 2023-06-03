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

global wd 	"/Users/hhadah/Dropbox/Research/My Research Data and Ideas/hispanic-last-names/data/raw/";


/*
Open dataset
*/
cd "$wd";
use "$wd/cps_00051.dta";

/*
Generate year of birth,
restrict age of mom and dad
keep 1984 to 1994 cohorts
*/
gen YOB = year - age;
keep if age_mom>=25 & age_mom <=40;
keep if age_pop>=25 & age_pop <=40;
keep if YOB >= 1984 & YOB <= 1994;

/*
********************************************************************************
* Keep parents that are White
********************************************************************************
*/

keep if race_mom 			== 100 & race_pop				== 100;

/*
********************************************************************************
* Keep fathers and mothers that are 
* born in Spanish speaking countries, 
* Puerto Rico and US
********************************************************************************
*/
keep if   (bpl_mom  <= 12092 | /* USA */
           bpl_mom  == 11000 | /* Puerto Rico */
           bpl_mom  == 30005 | /* Argentina */
           bpl_mom  == 30010 | /* Bolivia */
		   bpl_mom  == 30015 | /* Brazil */
           bpl_mom  == 30020 | /* Chile */
           bpl_mom  == 30025 | /* Colombia */
           bpl_mom  == 26010 | /* Dominican Republic */
           bpl_mom  == 30030 | /* Ecuador */
           bpl_mom  == 21020 | /* Costa Rica */
           bpl_mom  == 21030 | /* El Salvador */
           bpl_mom  == 21040 | /* Guatemala */
           bpl_mom  == 21050 | /* Honduras */
           bpl_mom  == 25000 | /* Cuba */
           bpl_mom  == 20000 | /* Mexico */
           bpl_mom  == 21060 | /* Nicaragua */
           bpl_mom  == 21070 | /* Panama */
           bpl_mom  == 30050 | /* Peru */
           bpl_mom  == 30060 | /* Uruguay */
           bpl_mom  == 30065 | /* Venezuela */
           bpl_mom  == 43800 | /* Spain */
           bpl_mom  == 29900 | /* Americas */
		   bpl_mom  == 21000 | /* Cental America */
           bpl_mom  == 30000) & /* South America */
          (bpl_pop  <= 12092 | /* USA */
           bpl_pop  == 11000 | /* Puerto Rico */
           bpl_pop  == 30005 | /* Argentina */
           bpl_pop  == 30010 | /* Bolivia */
		   bpl_pop  == 30015 | /*  Brazil */
           bpl_pop  == 30020 | /* Chile */
           bpl_pop  == 30025 | /* Colombia */
           bpl_pop  == 26010 | /* Dominican Republic */
           bpl_pop  == 30030 | /* Ecuador */
           bpl_pop  == 21020 | /* Costa Rica */
           bpl_pop  == 21030 | /* El Salvador */
           bpl_pop  == 21040 | /* Guatemala */
           bpl_pop  == 21050 | /* Honduras */
           bpl_pop  == 25000 | /* Cuba */
           bpl_pop  == 20000 | /* Mexico */
           bpl_pop  == 21060 | /* Nicaragua */
           bpl_pop  == 21070 | /* Panama */
           bpl_pop  == 30050 | /* Peru */
           bpl_pop  == 30060 | /* Uruguay */
           bpl_pop  == 30065 | /* Venezuela */
           bpl_pop  == 43800 | /* Spain */
           bpl_pop  == 29900 | /* Americas */
		   bpl_pop  == 21000 | /* Cental America */
           bpl_pop  == 30000);  /* South America */

drop if bpl_mom == 0 | bpl_pop == 0;

/*
********************************************************************************
* Create Latin American father and mother var
********************************************************************************
*/

gen 		LAHusband 				= .;
gen 		LAWife 					= .;
label var	LAHusband 				"=1 if husband's father was born in Latin America";
label var 	LAWife 					"=1 if Wife's father was born in Latin America";

replace 	LAHusband				= 1			if (bpl_mom 		> 12092 	| 	bpl_mom 			== 11000);
replace 	LAHusband				= 1			if (bpl_pop 		> 12092 	| 	bpl_pop 			== 11000);

replace 	LAHusband				= 0			if (bpl_mom 		<= 12092	& 	bpl_mom 			!= 11000);
replace 	LAHusband				= 0			if (bpl_pop 		<= 12092	& 	bpl_pop 			!= 11000);

replace 	LAWife					= 1			if (bpl_mom 		> 12092 	| 	bpl_mom 			== 11000);
replace 	LAWife					= 1			if (bpl_pop 		> 12092 	| 	bpl_pop 			== 11000);
                                                   
replace 	LAWife					= 0			if (bpl_mom 		<= 12092	& 	bpl_mom 			!= 11000);
replace 	LAWife					= 0			if (bpl_pop 		<= 12092	& 	bpl_mom 			!= 11000);

drop if LAHusband == .;
drop if LAWife	  == .;

tab LAHusband LAWife;

/*
********************************************************************************
* Create Latin American grandparents
********************************************************************************
*/

gen 		LAPatGrandDad 				= .;
gen 		LAPatGrandMom 				= .;
gen 		LAMatGrandDad 				= .;
gen 		LAMatGrandMom 				= .;

label var	LAPatGrandDad 					"=1 if paternal granddad was born in Latin America";
label var 	LAPatGrandMom 					"=1 if paternal grandmom was born in Latin America";
label var 	LAMatGrandDad 					"=1 if maternal granddad was born in Latin America";
label var 	LAMatGrandMom 					"=1 if maternal grandmom was born in Latin America";

replace 	LAPatGrandMom				= 1			if (mbpl_pop 		> 12092 	| 	mbpl_pop 			== 11000);
replace 	LAPatGrandDad				= 1			if (fbpl_pop 		> 12092 	| 	fbpl_pop 			== 11000);

replace 	LAPatGrandMom				= 0			if (mbpl_pop 		<= 12092	& 	mbpl_pop 			!= 11000);
replace 	LAPatGrandDad				= 0			if (fbpl_pop 		<= 12092	& 	fbpl_pop 			!= 11000);

replace 	LAMatGrandMom				= 1			if (mbpl_mom 		> 12092 	| 	mbpl_mom 			== 11000);
replace 	LAMatGrandDad				= 1			if (fbpl_mom 		> 12092 	| 	fbpl_mom 			== 11000);

replace 	LAMatGrandMom				= 0			if (mbpl_mom 		<= 12092	& 	mbpl_mom 			!= 11000);
replace 	LAMatGrandDad				= 0			if (fbpl_mom 		<= 12092	& 	fbpl_mom 			!= 11000);



drop if LAPatGrandDad == .;
drop if LAPatGrandMom == .;
drop if LAMatGrandDad == .;
drop if LAMatGrandMom == .;

tab LAHusband LAWife;
/*
********************************************************************************
* gen variable indicating parent's types
********************************************************************************
*/
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

drop if (sex_mom == 1 & sex_pop == 1) | (sex_mom == 2 & sex_pop == 2);

/*
********************************************************************************
* education: educ_pop educ_mom (all series)
********************************************************************************
*/

gen HusbandEducation 	= .;
gen WifeEducation 		= .;

replace HusbandEducation 	= . if (educ_pop == 0);
replace WifeEducation 	 	= . if (educ_mom == 0);

replace HusbandEducation 	= . if (educ_pop == 1);
replace WifeEducation 		= . if (educ_mom == 1);

replace HusbandEducation 	= 0 if (educ_pop == 2);
replace WifeEducation 		= 0 if (educ_mom == 2);

replace HusbandEducation 	= 4 if (educ_pop == 10);
replace WifeEducation 		= 4 if (educ_mom == 10);

replace HusbandEducation 	= 1 if (educ_pop == 11);
replace WifeEducation 		= 1 if (educ_mom == 11);

replace HusbandEducation 	= 2 if (educ_pop == 12);
replace WifeEducation 		= 2 if (educ_mom == 12);

replace HusbandEducation 	= 4 if (educ_pop == 13);
replace WifeEducation 		= 4 if (educ_mom == 13);

replace HusbandEducation 	= 1 if (educ_pop == 14);
replace WifeEducation 		= 1 if (educ_mom == 14);

replace HusbandEducation 	= 2 if (educ_pop == 15);
replace WifeEducation 		= 2 if (educ_mom == 15);

replace HusbandEducation 	= 3 if (educ_pop == 16);
replace WifeEducation 		= 3 if (educ_mom == 16);

replace HusbandEducation 	= 4 if (educ_pop == 17);
replace WifeEducation 		= 4 if (educ_mom == 17);

replace HusbandEducation 	= 8 if (educ_pop == 20);
replace WifeEducation 		= 8 if (educ_mom == 20);

replace HusbandEducation 	= 6 if (educ_pop == 21);
replace WifeEducation 		= 6 if (educ_mom == 21);

replace HusbandEducation 	= 5 if (educ_pop == 22);
replace WifeEducation 		= 5 if (educ_mom == 22);

replace HusbandEducation 	= 6 if (educ_pop == 23);
replace WifeEducation 		= 6 if (educ_mom == 23);

replace HusbandEducation 	= 8 if (educ_pop == 24);
replace WifeEducation 		= 8 if (educ_mom == 24);

replace HusbandEducation 	= 7 if (educ_pop == 25);
replace WifeEducation 		= 7 if (educ_mom == 25);

replace HusbandEducation 	= 8 if (educ_pop == 26);
replace WifeEducation 		= 8 if (educ_mom == 26);

replace HusbandEducation 	= 9 if (educ_pop == 30);
replace WifeEducation 		= 9 if (educ_mom == 30);

replace HusbandEducation 	= 10 if (educ_pop == 40);
replace WifeEducation 		= 10 if (educ_mom == 40);

replace HusbandEducation 	= 11 if (educ_pop == 50);
replace WifeEducation 		= 11 if (educ_mom == 50);

replace HusbandEducation 	= 12 if (educ_pop == 60);
replace WifeEducation 		= 12 if (educ_mom == 60);

replace HusbandEducation 	= 11 if (educ_pop == 61);
replace WifeEducation 		= 11 if (educ_mom == 61);

replace HusbandEducation 	= 12 if (educ_pop == 62);
replace WifeEducation 		= 12 if (educ_mom == 62);

replace HusbandEducation 	= 12 if (educ_pop == 63);
replace WifeEducation 		= 12 if (educ_mom == 63);

replace HusbandEducation 	= 12 if (educ_pop == 64);
replace WifeEducation 		= 12 if (educ_mom == 64);

replace HusbandEducation 	= 12 if (educ_pop == 65);
replace WifeEducation 		= 12 if (educ_mom == 65);

replace HusbandEducation 	= 13 if (educ_pop == 70);
replace WifeEducation 		= 13 if (educ_mom == 70);

replace HusbandEducation 	= 13 if (educ_pop == 71);
replace WifeEducation 		= 13 if (educ_mom == 71);

replace HusbandEducation 	= 14 if (educ_pop == 80);
replace WifeEducation 		= 14 if (educ_mom == 80);

replace HusbandEducation 	= 14 if (educ_pop == 81);
replace WifeEducation 		= 14 if (educ_mom == 81);

replace HusbandEducation 	= 14 if (educ_pop == 82);
replace WifeEducation 		= 14 if (educ_mom == 82);

replace HusbandEducation 	= 14 if (educ_pop == 83);
replace WifeEducation 		= 14 if (educ_mom == 83);

replace HusbandEducation 	= 15 if (educ_pop == 90);
replace WifeEducation 		= 15 if (educ_mom == 90);

replace HusbandEducation 	= 16 if (educ_pop == 100);
replace WifeEducation 		= 16 if (educ_mom == 100);

replace HusbandEducation 	= 16 if (educ_pop == 101);
replace WifeEducation 		= 16 if (educ_mom == 101);

replace HusbandEducation 	= 16 if (educ_pop == 110);
replace WifeEducation 		= 16 if (educ_mom == 110);

replace HusbandEducation 	= 16 if (educ_pop == 111);
replace WifeEducation 		= 16 if (educ_mom == 111);

replace HusbandEducation 	= 16 if (educ_pop == 112);
replace WifeEducation 		= 16 if (educ_mom == 112);

replace HusbandEducation 	= 16 if (educ_pop == 113);
replace WifeEducation 		= 16 if (educ_mom == 113);

replace HusbandEducation 	= 18 if (educ_pop == 114);
replace WifeEducation 		= 18 if (educ_mom == 114);

replace HusbandEducation 	= 18 if (educ_pop == 115);
replace WifeEducation 		= 18 if (educ_mom == 115);

replace HusbandEducation 	= 21 if (educ_pop == 116);
replace WifeEducation 		= 21 if (educ_mom == 116);

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

replace ftotval_pop = . if ftotval_pop >= 9999998;
replace ftotval_mom = . if ftotval_mom >= 9999998;

gen lnftotval_pop1999 = ln(cpi99 * ftotval_pop);
gen lnftotval_mom1999 = ln(cpi99 * ftotval_mom);


gen Husband_ftotval = .;
gen Wife_ftotval = .;

replace Husband_ftotval = lnftotval_pop1999 if sex_pop == 1 & ftotval_pop < 9999998;
replace Husband_ftotval = lnftotval_mom1999 if sex_mom == 1 & ftotval_mom < 9999998;

replace Wife_ftotval = lnftotval_pop1999 if sex_pop == 2 & ftotval_pop < 9999998;
replace Wife_ftotval = lnftotval_mom1999 if sex_mom == 2 & ftotval_mom < 9999998;
/*
********************************************************************************
* Total personal income
********************************************************************************
* inctot in 1999's $:
*/

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

replace Wife_incwage = lnincwage_pop1999 if sex_pop == 2 & incwage_pop < 999998;

/*
********************************************************************************
* Age
********************************************************************************
*/

gen HusbandAge = .;
gen WifeAge = .;

replace HusbandAge = age_pop;

replace WifeAge = age_pop;

keep if WifeAge >= 25 & WifeAge<=40;
keep if HusbandAge >= 25 & HusbandAge<=40;
/*
********************************************************************************
* Year of birth
********************************************************************************
*/

gen HusbandYOB = .;
gen WifeYOB = .;

replace HusbandYOB = year - age_pop;

replace WifeYOB = year - age_pop;

/*
********************************************************************************
* fbpl:  fmbpl (all series)
********************************************************************************
*/

gen Husband_fbpl = .;
gen Wife_fbpl = .;

replace Husband_fbpl = bpl_pop;

replace Wife_fbpl 	 = bpl_mom;

/*
********************************************************************************
* hispan: hispan_pop hispan_mom  (all series)
********************************************************************************
*/
gen Hispanic_Husband =.;
gen Hispanic_Wife =.;

replace Hispanic_Husband = 1 if hispan_pop == 1;

replace Hispanic_Husband = 1 if hispan_pop == 2;

replace Hispanic_Husband = 1 if hispan_pop == 3;

replace Hispanic_Husband = 1 if hispan_pop == 4;

replace Hispanic_Husband = 0 if hispan_pop == 0;


replace Hispanic_Wife = 1 if hispan_mom == 1;

replace Hispanic_Wife = 1 if hispan_mom == 2;

replace Hispanic_Wife = 1 if hispan_mom == 3;

replace Hispanic_Wife = 1 if hispan_mom == 4;

replace Hispanic_Wife = 0 if hispan_mom == 0;

tab Hispanic_Wife Hispanic_Husband;

/*
********************************************************************************
* chborn_mom : fertility  (all series)
********************************************************************************
*/
gen Fertility =.;

replace Fertility = nchild_mom if nchild_mom >= 1;
replace Fertility =. if nchild_mom >= 14;

keep year hwtfinl asecwth HusbandEducation WifeEducation Fertility
Husband_ftotval Wife_ftotval Husband_inctot Wife_inctot Husband_incwage 
Wife_incwage cpi99 region statefip LAMatGrandDad LAMatGrandMom LAPatGrandDad LAPatGrandMom
HusbandAge WifeAge HusbandYOB WifeYOB LAHusband LAWife CoupleType Husband_ed_level 
Wife_ed_level Wife_fbpl Husband_fbpl Hispanic_Husband Hispanic_Wife age year YOB
bpl mbpl fbpl bpl_mom bpl_pop fbpl_mom fbpl_pop mbpl_mom mbpl_pop;


/*
Generate Couple types dummies
*/


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

/*
save
*/
save "SynthGrands.dta", replace;
