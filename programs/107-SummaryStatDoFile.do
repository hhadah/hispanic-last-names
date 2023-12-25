/*
This do file is to produce
the summary statistics and
matrix for the marriage
market idea
*/
********************************************************************************
clear
cls
********************************************************************************
* Global directories
global wd "/Users/hhadah/Dropbox/HispanicDiscrimination/MainFile/CPS_DataOutput"
* set working dirrectory
cd "$wd"

* open data
use "CleanIndividualData"
********************************************************************************
/*
generate dummy variables
for different races and
ethnicities
*/
********************************************************************************
* father's and mother's POB
* sp and head of household
// tabulate mbpl_head, generate(mbpl_head)
// tabulate fbpl_head, generate(fbpl_head)
//
// tabulate mbpl_sp, generate(mbpl_sp)
// tabulate fbpl_sp, generate(fbpl_sp)
********************************************************************************
* generate dummy variables
* = 1 if mother or father
* were born in Latin America
gen LA_motherHead = 0
gen LA_fatherHead = 0
gen LA_motherSP = 0
gen LA_fatherSP = 0
label var LA_motherHead "Head's mother born in Latin America"
label var LA_fatherHead "Head's father born in Latin America"
label var LA_motherSP "SP's mother born in Latin America"
label var LA_fatherSP "SP's father born in Latin America"
********************************************************************************
* LA_motherHead
#delimit;
replace LA_motherHead = 1 if 	/* mbpl_head  ==  9900 	| USA */
								mbpl_head  ==  11000 	| /* Puerto Rico */
								mbpl_head  ==  20000 	| /* Mexico */
								mbpl_head  ==  30025 	| /* Colombia */
								mbpl_head  ==  54800 	| /* Spain */
								mbpl_head  ==  30005 	| /* Argentina */
								mbpl_head  ==  30050 	| /* Colombia */
								mbpl_head  ==  30065 	| /* Venzuela */
								mbpl_head  ==  30020 	| /* Chile */
								mbpl_head  ==  30030 	| /* Ecuador */
								mbpl_head  ==  21040 	| /* Guatemala */
								mbpl_head  ==  25000 	| /* Cuba */
								mbpl_head  ==  30010 	| /* Bolivia */
								mbpl_head  ==  26010 	| /* Dominican Republic */
								mbpl_head  ==  21050 	| /* Honduras */
								mbpl_head  ==  30070 	| /* Paraguay */
								mbpl_head  ==  21030 	| /* El Salvador */
								mbpl_head  ==  21060 	| /* Nicaragua */
								mbpl_head  ==  21020	| /* Costa Rica */
								mbpl_head  ==  21070	| /* Panama */
								mbpl_head  ==  30060	| /* Uruguay */
								mbpl_head  ==  30000	  /* South America */;
/*
********************************************************************************
* LA_motherSP
*/
replace LA_motherSP = 1 if 		/* mbpl_sp  ==  9900 		| USA */
								mbpl_sp  ==  11000 		| /* Puerto Rico */
								mbpl_sp  ==  20000 		| /* Mexico */
								mbpl_sp  ==  30025 		| /* Colombia */
								mbpl_sp  ==  54800 		| /* Spain */
								mbpl_sp  ==  30005 		| /* Argentina */
								mbpl_sp  ==  30050 		| /* Colombia */
								mbpl_sp  ==  30065 		| /* Venzuela */
								mbpl_sp  ==  30020 		| /* Chile */
								mbpl_sp  ==  30030 		| /* Ecuador */
								mbpl_sp  ==  21040 		| /* Guatemala */
								mbpl_sp  ==  25000 		| /* Cuba */
								mbpl_sp  ==  30010 		| /* Bolivia */
								mbpl_sp  ==  26010 		| /* Dominican Republic */
								mbpl_sp  ==  21050 		| /* Honduras */
								mbpl_sp  ==  30070 		| /* Paraguay */
								mbpl_sp  ==  21030 		| /* El Salvador */
								mbpl_sp  ==  21060 		| /* Nicaragua */
								mbpl_sp  ==  21020	 	| /* Costa Rica */
								mbpl_sp  ==  21070	 	| /* Panama */
								mbpl_sp  ==  30060	 	| /* Uruguay */
								mbpl_sp  ==  30000	 	  /* South America */;
/*
********************************************************************************
* LA_fatherHead
*/
replace LA_fatherHead = 1 if 	/* fbpl_head  ==  9900 	| USA */
								fbpl_head  ==  11000 	| /* Puerto Rico */
								fbpl_head  ==  20000 	| /* Mexico */
								fbpl_head  ==  30025 	| /* Colombia */
								fbpl_head  ==  54800 	| /* Spain */
								fbpl_head  ==  30005 	| /* Argentina */
								fbpl_head  ==  30050 	| /* Colombia */
								fbpl_head  ==  30065 	| /* Venzuela */
								fbpl_head  ==  30020 	| /* Chile */
								fbpl_head  ==  30030 	| /* Ecuador */
								fbpl_head  ==  21040 	| /* Guatemala */
								fbpl_head  ==  25000 	| /* Cuba */
								fbpl_head  ==  30010 	| /* Bolivia */
								fbpl_head  ==  26010 	| /* Dominican Republic */
								fbpl_head  ==  21050 	| /* Honduras */
								fbpl_head  ==  30070 	| /* Paraguay */
								fbpl_head  ==  21030 	| /* El Salvador */
								fbpl_head  ==  21060 	| /* Nicaragua */
								fbpl_head  ==  21020	| /* Costa Rica */
								fbpl_head  ==  21070	| /* Panama */
								fbpl_head  ==  30060	| /* Uruguay */
								fbpl_head  ==  30000	  /* South America */;
/*
********************************************************************************
* LA_fatherSP
*/
replace LA_fatherSP = 1 if 		/* fbpl_sp  ==  9900 		| USA */
								fbpl_sp  ==  11000 		| /* Puerto Rico */
								fbpl_sp  ==  20000 		| /* Mexico */
								fbpl_sp  ==  30025 		| /* Colombia */
								fbpl_sp  ==  54800 		| /* Spain */
								fbpl_sp  ==  30005 		| /* Argentina */
								fbpl_sp  ==  30050 		| /* Colombia */
								fbpl_sp  ==  30065 		| /* Venzuela */
								fbpl_sp  ==  30020 		| /* Chile */
								fbpl_sp  ==  30030 		| /* Ecuador */
								fbpl_sp  ==  21040 		| /* Guatemala */
								fbpl_sp  ==  25000 		| /* Cuba */
								fbpl_sp  ==  30010 		| /* Bolivia */
								fbpl_sp  ==  26010 		| /* Dominican Republic */
								fbpl_sp  ==  21050 		| /* Honduras */
								fbpl_sp  ==  30070 		| /* Paraguay */
								fbpl_sp  ==  21030 		| /* El Salvador */
								fbpl_sp  ==  21060 		| /* Nicaragua */
								fbpl_sp  ==  21020	 	| /* Costa Rica */
								fbpl_sp  ==  21070	 	| /* Panama */
								fbpl_sp  ==  30060	 	| /* Uruguay */
								fbpl_sp  ==  30000	 	  /* South America */;
#delimit cr
********************************************************************************
* generate dummy variables
* = 1 if mother or father
* were born in Latin America
gen LA_mother = 0
gen LA_father = 0
label var LA_mother "mother born in Latin America"
label var LA_father "father born in Latin America"
********************************************************************************
* LA_motherHead
#delimit;
replace LA_mother = 1 if 	/* mbpl  ==  9900 	| USA */
								mbpl  ==  11000 	| /* Puerto Rico */
								mbpl  ==  20000 	| /* Mexico */
								mbpl  ==  30025 	| /* Colombia */
								mbpl  ==  54800 	| /* Spain */
								mbpl  ==  30005 	| /* Argentina */
								mbpl  ==  30050 	| /* Colombia */
								mbpl  ==  30065 	| /* Venzuela */
								mbpl  ==  30020 	| /* Chile */
								mbpl  ==  30030 	| /* Ecuador */
								mbpl  ==  21040 	| /* Guatemala */
								mbpl  ==  25000 	| /* Cuba */
								mbpl  ==  30010 	| /* Bolivia */
								mbpl  ==  26010 	| /* Dominican Republic */
								mbpl  ==  21050 	| /* Honduras */
								mbpl  ==  30070 	| /* Paraguay */
								mbpl  ==  21030 	| /* El Salvador */
								mbpl  ==  21060 	| /* Nicaragua */
								mbpl  ==  21020	| /* Costa Rica */
								mbpl  ==  21070	| /* Panama */
								mbpl  ==  30060	| /* Uruguay */
								mbpl  ==  30000	  /* South America */;
/*
********************************************************************************
* LA_fatherHead
*/
replace LA_father = 1 if 	/* fbpl  ==  9900 	| USA */
								fbpl  ==  11000 	| /* Puerto Rico */
								fbpl  ==  20000 	| /* Mexico */
								fbpl  ==  30025 	| /* Colombia */
								fbpl  ==  54800 	| /* Spain */
								fbpl  ==  30005 	| /* Argentina */
								fbpl  ==  30050 	| /* Colombia */
								fbpl  ==  30065 	| /* Venzuela */
								fbpl  ==  30020 	| /* Chile */
								fbpl  ==  30030 	| /* Ecuador */
								fbpl  ==  21040 	| /* Guatemala */
								fbpl  ==  25000 	| /* Cuba */
								fbpl  ==  30010 	| /* Bolivia */
								fbpl  ==  26010 	| /* Dominican Republic */
								fbpl  ==  21050 	| /* Honduras */
								fbpl  ==  30070 	| /* Paraguay */
								fbpl  ==  21030 	| /* El Salvador */
								fbpl  ==  21060 	| /* Nicaragua */
								fbpl  ==  21020	| /* Costa Rica */
								fbpl  ==  21070	| /* Panama */
								fbpl  ==  30060	| /* Uruguay */
								fbpl  ==  30000	  /* South America */;
#delimit cr


/*
Generate parent types of head and sp

WW = White Father White Mother
WH = White Father Hispanic Mother
HW = Hispanic Father White Mother
HH = Hispanic Father Hispanic Mother
*/

#delimit;
gen WW_head = 0;
gen WH_head = 0;
gen HW_head = 0;
gen HH_head = 0;

label var WW_head "head: White Father White Mother";
label var WH_head "head: White Father Hispanic Mother";
label var HW_head "head: Hispanic Father White Mother"; 
label var HH_head "head: Hispanic Father Hispanic Mother";

replace WW_head = 1 if  LA_fatherHead == 0 & LA_motherHead == 0;
replace WH_head = 1 if  LA_fatherHead == 0 & LA_motherHead == 1;
replace HW_head = 1 if  LA_fatherHead == 1 & LA_motherHead == 0;
replace HH_head = 1 if  LA_fatherHead == 1 & LA_motherHead == 1;

gen WW_sp = 0;
gen WH_sp = 0;
gen HW_sp = 0;
gen HH_sp = 0;

label var WW_sp "SP: White Father White Mother";
label var WH_sp "SP: White Father Hispanic Mother";
label var HW_sp "SP: Hispanic Father White Mother"; 
label var HH_sp "SP: Hispanic Father Hispanic Mother";

replace WW_sp = 1 if  LA_fatherSP == 0 & LA_motherSP == 0;
replace WH_sp = 1 if  LA_fatherSP == 0 & LA_motherSP == 1;
replace HW_sp = 1 if  LA_fatherSP == 1 & LA_motherSP == 0;
replace HH_sp = 1 if  LA_fatherSP == 1 & LA_motherSP == 1;
#delimit cr

save "$Output/WWWHHWHHData", replace
********************************************************************************
********************************************************************************
// * drop seperated couples
// drop if marst >= 2
//
// * limit to observations 1994<year<2019
// drop if year < 1994 | year > 2019
//
// * keep one person from each household
drop if pernum > 1

* Save
save "$Output/HusbandWifeData", replace
//
// * Keep US born citizens only
// keep if citizen == 1
//
// * drop missing values
// foreach i in age sex race marst hispan age_head age_sp sex_head sex_sp race_head race_sp hispan_head hispan_sp{
// drop if missing(`i')
// }
//
// save "$Output/CoupleRaceEth19942019Data", replace

********************************************************************************
* generate parent type for husbands and wives
********************************************************************************
gen WW_Husband = 0
gen WH_Husband = 0
gen HW_Husband = 0
gen HH_Husband = 0

gen WW_Wife = 0
gen WH_Wife = 0
gen HW_Wife = 0
gen HH_Wife = 0

replace WW_Husband = 1 if WW_head == 1 & sex_head == 1
replace WW_Husband = 1 if WW_sp == 1 & sex_sp == 1

replace WH_Husband = 1 if WH_head == 1 & sex_head == 1
replace WH_Husband = 1 if WH_sp == 1 & sex_sp == 1

replace HW_Husband = 1 if HW_head == 1 & sex_head == 1
replace HW_Husband = 1 if HW_sp == 1 & sex_sp == 1

replace HH_Husband = 1 if HH_head == 1 & sex_head == 1
replace HH_Husband = 1 if HH_sp == 1 & sex_sp == 1

replace WW_Wife = 1 if WW_head == 1 & sex_head == 2
replace WW_Wife = 1 if WW_sp == 1 & sex_sp == 2

replace WH_Wife = 1 if WH_head == 1 & sex_head == 2
replace WH_Wife = 1 if WH_sp == 1 & sex_sp == 2

replace HW_Wife = 1 if HW_head == 1 & sex_head == 2
replace HW_Wife = 1 if HW_sp == 1 & sex_sp == 2

replace HH_Wife = 1 if HH_head == 1 & sex_head == 2
replace HH_Wife = 1 if HH_sp == 1 & sex_sp == 2
********************************************************************************
* Generate Wife and Husband education, age, experience, employment 
* status, labor force status, hours usually worked, full or part time,
* real total family income
********************************************************************************
* Age: age_head age_sp (all series)
********************************************************************************
gen HusbandAge = .
gen WifeAge = .

replace HusbandAge = age_head if sex_head == 1
replace HusbandAge = age_sp if sex_sp == 1

replace WifeAge = age_head if sex_head == 2
replace WifeAge = age_sp if sex_sp == 2

********************************************************************************
* number of children: nchild_head nchild_sp (all series)
********************************************************************************
/*
Use nchild
*/

********************************************************************************
* employment status: empstat_head empstat_sp (all series)
********************************************************************************
gen HusbandEmployed = 0
gen WifeEmployed = 0

replace HusbandEmployed = 1 if (sex_head == 1 & empstat_head <= 12 & empstat_head > 0)
replace HusbandEmployed = 1 if (sex_sp == 1 & empstat_sp <= 12 & empstat_sp > 0)

replace WifeEmployed = 1 if (sex_head == 2 & empstat_head <= 12 & empstat_head > 0)
replace WifeEmployed = 1 if (sex_sp == 2 & empstat_sp <= 12 & empstat_sp > 0)
// ********************************************************************************
// * Labor force participatioin: labforce_head labforce_sp (all series)
// ********************************************************************************
// gen HusbandLaborForce = 0
// gen WifeLaborForce = 0
//
// replace HusbandLaborForce = 1 if (sex_head == 1 & labforce_head == 2)
// replace HusbandLaborForce = 1 if (sex_sp == 1 & labforce_sp == 2)
//
// replace WifeLaborForce = 1 if (sex_head == 2 & labforce_head == 2)
// replace WifeLaborForce = 1 if (sex_sp == 2 & labforce_sp == 2)
********************************************************************************
* part/full time work: wkstat_head wkstat_sp (all series)
********************************************************************************
gen HusbandFullTime = 0
gen WifeFullTime = 0

replace HusbandFullTime = 1 if (sex_head == 1 & wkstat_head <= 15)
replace HusbandFullTime = 1 if (sex_sp == 1 & wkstat_sp <= 15)

replace WifeFullTime = 1 if (sex_head == 2 & wkstat_head <= 15)
replace WifeFullTime = 1 if (sex_sp == 2 & wkstat_sp <= 15)

gen HusbandPartTime = 0
gen WifePartTime = 0

replace HusbandPartTime = 1 if (sex_head == 1 & wkstat_head <= 40 & wkstat_head >15)
replace WifePartTime = 1 if (sex_sp == 1 & wkstat_sp <= 40 & wkstat_head >15)

replace HusbandPartTime = 1 if (sex_head == 2 & wkstat_head <= 40 & wkstat_head >15)
replace WifePartTime = 1 if (sex_sp == 2 & wkstat_sp <= 40 & wkstat_head >15)
********************************************************************************
* education: educ_head educ_sp (all series)
********************************************************************************
gen HusbandEducation = .
gen WifeEducation = .

replace HusbandEducation = 0 if (sex_head == 1 & (educ_head == 1 | educ_head == 2))
replace HusbandEducation = 0 if (sex_sp == 1 &  (educ_sp == 1 | educ_sp == 2))
replace WifeEducation = 0 if (sex_head == 2 & (educ_head == 1 | educ_head == 2))
replace WifeEducation = 0 if (sex_sp == 2  & (educ_sp == 1 | educ_sp == 2))

replace HusbandEducation = 4 if (sex_head == 1 & educ_head == 10)
replace HusbandEducation = 4 if (sex_sp == 1 & educ_sp == 10)
replace WifeEducation = 4 if (sex_head == 2 & educ_head == 10)
replace WifeEducation = 4 if (sex_sp == 2 & educ_sp == 10)

replace HusbandEducation = 6 if (sex_head == 1 & educ_head == 20)
replace HusbandEducation = 6 if (sex_sp == 1 & educ_sp == 20)
replace WifeEducation = 6 if (sex_head == 2 & educ_head == 20)
replace WifeEducation = 6 if (sex_sp == 2 & educ_sp == 20)

replace HusbandEducation = 8 if (sex_head == 1 & educ_head == 30)
replace HusbandEducation = 8 if (sex_sp == 1 & educ_sp == 30)
replace WifeEducation = 8 if (sex_head == 2 & educ_head == 30)
replace WifeEducation = 8 if (sex_sp == 2 & educ_sp == 30)

replace HusbandEducation = 9 if (sex_head == 1 & educ_head == 40)
replace HusbandEducation = 9 if (sex_sp == 1 & educ_sp == 40)
replace WifeEducation = 9 if (sex_head == 2 & educ_head == 40)
replace WifeEducation = 9 if (sex_sp == 2 & educ_sp == 40)

replace HusbandEducation = 10 if (sex_head == 1 & educ_head == 50)
replace HusbandEducation = 10 if (sex_sp == 1 & educ_sp == 50)
replace WifeEducation = 10 if (sex_head == 2 & educ_head == 50)
replace WifeEducation = 10 if (sex_sp == 2 & educ_sp == 50)

replace HusbandEducation = 11 if (sex_head == 1 & educ_head == 60)
replace HusbandEducation = 11 if (sex_sp == 1 & educ_sp == 60)
replace WifeEducation = 11 if (sex_head == 2 & educ_head == 60)
replace WifeEducation = 11 if (sex_sp == 2 & educ_sp == 60)

replace HusbandEducation = 12 if (sex_head == 1 & educ_head == 73)
replace HusbandEducation = 12 if (sex_sp == 1 & educ_sp == 73)
replace WifeEducation = 12 if (sex_head == 2 & educ_head == 73)
replace WifeEducation = 12 if (sex_sp == 2 & educ_sp == 73)

replace HusbandEducation = 13 if (sex_head == 1 & educ_head == 81)
replace HusbandEducation = 13 if (sex_sp == 1 & educ_sp == 81)
replace WifeEducation = 13 if (sex_head == 2 & educ_head == 81)
replace WifeEducation = 13 if (sex_sp == 2 & educ_sp == 81)

replace HusbandEducation = 14 if (sex_head == 1 & (educ_head == 91 | educ_head == 92))
replace HusbandEducation = 14 if (sex_sp == 1 & (educ_sp == 91 | educ_sp == 92))
replace WifeEducation = 14 if (sex_head == 2 & (educ_head == 91 | educ_head == 92))
replace WifeEducation = 14 if (sex_sp == 2 & (educ_sp == 91 | educ_sp == 92))

replace HusbandEducation = 16 if (sex_head == 1 & educ_head == 111)
replace HusbandEducation = 16 if (sex_sp == 1 & educ_sp == 111)
replace WifeEducation = 16 if (sex_head == 2 & educ_head == 111)
replace WifeEducation = 16 if (sex_sp == 2 & educ_sp == 111)

replace HusbandEducation = 18 if (sex_head == 1 & educ_head == 123)
replace HusbandEducation = 18 if (sex_sp == 1 & educ_sp == 123)
replace WifeEducation = 18 if (sex_head == 2 & educ_head == 123)
replace WifeEducation = 18 if (sex_sp == 2 & educ_sp == 123)

replace HusbandEducation = 21 if (sex_head == 1 & (educ_head == 124 | educ_head == 125))
replace HusbandEducation = 21 if (sex_sp == 1 & (educ_sp == 124 | educ_sp == 125))
replace WifeEducation = 21 if (sex_head == 2 & (educ_head == 124 | educ_head == 125))
replace WifeEducation = 21 if (sex_sp == 2 & (educ_sp == 124 | educ_sp == 125))
********************************************************************************
* Total family income: ftotval_head ftotval_sp (ASEC)
********************************************************************************
* ftotval in 1999's $:
gen lnftotval_head1999 = ln(cpi99 * ftotval_head)
gen lnftotval_sp1999 = ln(cpi99 * ftotval_sp)

gen Husband_ftotval = .
gen Wife_ftotval = .

replace Husband_ftotval = lnftotval_head1999 if sex_head == 1
replace Husband_ftotval = lnftotval_sp1999 if sex_sp == 1

replace Wife_ftotval = lnftotval_head1999 if sex_head == 2
replace Wife_ftotval = lnftotval_sp1999 if sex_sp == 2
********************************************************************************
* Total personal income: inctot_head inctot_sp (ASEC)
********************************************************************************
* inctot in 1999's $:
gen lninctot_head1999 = ln(cpi99 * inctot_head)
gen lninctot_sp1999 = ln(cpi99 * inctot_sp)

gen Husband_inctot = .
gen Wife_inctot = .

replace Husband_inctot = lninctot_head1999 if sex_head == 1
replace Husband_inctot = lninctot_sp1999 if sex_sp == 1

replace Wife_inctot = lninctot_head1999 if sex_head == 2
replace Wife_inctot = lninctot_sp1999 if sex_sp == 2
// ********************************************************************************
// * Wage and salary income: incwage_head incwage_sp (ASEC)
// ********************************************************************************
// * incwage in 1999's $:
// gen lnincwage_head1999 = ln(cpi99 * incwage_head)
// gen lnincwage_sp1999 = ln(cpi99 * incwage_sp)
//
// gen Husband_incwage = .
// gen Wife_incwage = .
//
// replace Husband_incwage = lnincwage_head1999 if sex_head == 1
// replace Husband_incwage = lnincwage_sp1999 if sex_sp == 1
//
// replace Wife_incwage = lnincwage_head1999 if sex_head == 2
// replace Wife_incwage = lnincwage_sp1999 if sex_sp == 2
********************************************************************************
* Hourly wage: hourwage_head hourwage_sp (all series)
********************************************************************************
* hourwage in 1999's $:
gen lnhourwage_head1999 = ln(cpi99 * hourwage_head)
gen lnhourwage_sp1999 = ln(cpi99 * hourwage_sp)

gen Husband_hourwage = .
gen Wife_hourwage = .

replace Husband_hourwage = lnhourwage_head1999 if sex_head == 1
replace Husband_hourwage = lnhourwage_sp1999 if sex_sp == 1

replace Wife_hourwage = lnhourwage_head1999 if sex_head == 2
replace Wife_hourwage = lnhourwage_sp1999 if sex_sp == 2
// ********************************************************************************
// * Hours usually worked by week at all jobs: uhrsworkt_head  uhrsworkt_sp (all series)
// ********************************************************************************
// gen uhrsworkt_Husband = .
// gen uhrsworkt_Wife = .
//
// replace uhrsworkt_Husband = uhrsworkt_head if sex_head == 1
// replace uhrsworkt_Husband = uhrsworkt_sp if sex_sp == 1
//
// replace uhrsworkt_Wife = uhrsworkt_head if sex_head == 2
// replace uhrsworkt_Wife = uhrsworkt_sp if sex_sp == 2
// ********************************************************************************
// * Hours worked last week: ahrsworkt_head  ahrsworkt_sp (all series)
// ********************************************************************************
// gen ahrsworkt_Husband = .
// gen ahrsworkt_Wife = .
//
// replace ahrsworkt_Husband = ahrsworkt_head if sex_head == 1
// replace ahrsworkt_Husband = ahrsworkt_sp if sex_sp == 1
//
// replace ahrsworkt_Wife = ahrsworkt_head if sex_head == 2
// replace ahrsworkt_Wife = ahrsworkt_sp if sex_sp == 2
********************************************************************************
* Usual hours worked per week: uhrsworkly_head  uhrsworkly_sp (ASEC)
********************************************************************************
gen uhrsworkly_Husband = .
gen uhrsworkly_Wife = .

replace uhrsworkly_Husband = uhrsworkly_head if sex_head == 1
replace uhrsworkly_Husband = uhrsworkly_sp if sex_sp == 1

replace uhrsworkly_Wife = uhrsworkly_head if sex_head == 2
replace uhrsworkly_Wife = uhrsworkly_sp if sex_sp == 2
********************************************************************************
* Weight: wtfinl_head wtfinl_sp  (all series)
********************************************************************************
gen Husbandwtfinl = .
gen Wifewtfinl = .

replace Husbandwtfinl = wtfinl_head if sex_head == 1
replace Husbandwtfinl = wtfinl_sp if sex_sp == 1

replace Wifewtfinl = wtfinl_head if sex_head == 2
replace Wifewtfinl = wtfinl_sp if sex_sp == 2
********************************************************************************
* ASEC Weight: asecwt_head asecwt_sp  (all series)
********************************************************************************
gen Husbandasecwt = .
gen Wifeasecwt = .

replace Husbandasecwt = asecwt_head if sex_head == 1
replace Husbandasecwt = asecwt_sp if sex_sp == 1

replace Wifeasecwt = asecwt_head if sex_head == 2
replace Wifeasecwt = asecwt_sp if sex_sp == 2
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
* Husband Type
gen strL Type_Husband = "none"
replace Type_Husband = "White-White" if WW_Husband == 1
replace Type_Husband = "White-Hispanic" if WH_Husband == 1
replace Type_Husband = "Hispanic-White" if HW_Husband == 1
replace Type_Husband = "Hispanic-Hispanic" if HH_Husband == 1

* Wife Type
gen strL Type_Wife = "none"
replace Type_Wife = "White-White" if WW_Wife == 1
replace Type_Wife = "White-Hispanic" if WH_Wife == 1
replace Type_Wife = "Hispanic-White" if HW_Wife == 1
replace Type_Wife = "Hispanic-Hispanic" if HH_Wife == 1

* Save
save "$FinalOutput/WifeHusband_FinalData", replace

* Husband summary stats by type

sort Type_Husband

by Type_Husband: sum HusbandEducation HusbandAge HusbandEmployed HusbandFullTime HusbandPartTime[aw= Husbandwtfinl]
by Type_Husband: sum Husband_ftotval if asecflag == 1 | asecflag == 2 [aw= Husbandasecwt]
by Type_Husband: sum Husband_inctot if asecflag == 1 | asecflag == 2 [aw= Husbandasecwt] //Husband_incwage
by Type_Husband: sum Husband_hourwage  if Husband_hourwage < 999.99 [aw= Husbandasecwt]
by Type_Husband: sum nchild [aw= Husbandasecwt]

* Wife summary stats by type

sort Type_Wife

by Type_Wife: sum WifeEducation WifeAge WifeEmployed WifeFullTime WifePartTime[aw= Wifewtfinl]
by Type_Wife: sum Wife_inctot if asecflag == 1 | asecflag == 2 [aw= Wifeasecwt] //Wife_incwage
by Type_Wife: sum Wife_hourwage if Wife_hourwage < 999.99 [aw= Wifeasecwt]

by Type_Wife: sum nchild [aw= Wifewtfinl]

// by CoupleType: sum uhrsworkt_Husband if uhrsworkt_Husband<85 [aw= Husbandwtfinl]
// by CoupleType: sum uhrsworkt_Wife if uhrsworkt_Wife<85 [aw= Wifewtfinl]
// by CoupleType: sum ahrsworkt_Husband if ahrsworkt_Husband<85 [aw= Husbandwtfinl]
// by CoupleType: sum ahrsworkt_Wife if ahrsworkt_Wife<85 [aw= Wifewtfinl]
// by CoupleType: sum uhrsworkly_Husband if (uhrsworkly_Husband<85 & (asecflag == 1 | asecflag == 2)) [aw= Husbandasecwt]
// by CoupleType: sum uhrsworkly_Wife if (uhrsworkly_Wife<85 & (asecflag == 1 | asecflag == 2)) [aw= Wifeasecwt]
********************************************************************************
* Differences
********************************************************************************
// tabulate CoupleType, generate(CouplesTypes)
// rename CouplesTypes1 HH
// rename CouplesTypes2 HW
// rename CouplesTypes3 WH
// rename CouplesTypes4 WW
********************************************************************************
*** Education
* HH-WW
reg HusbandEducation HH_Husband HW_Husband WH_Husband [aw= Husbandwtfinl]
reg WifeEducation HH_Wife HW_Wife WH_Wife [aw= Wifewtfinl]
* HW-WH
reg HusbandEducation HW_Husband WW_Husband HH_Husband  [aw= Husbandwtfinl]
reg WifeEducation HW_Wife WW_Wife HH_Wife  [aw= Wifewtfinl]
********************************************************************************
*** Age
* HH-WW
reg HusbandAge HH_Husband HW_Husband WH_Husband [aw= Husbandwtfinl]
reg WifeAge HH_Wife HW_Wife WH_Wife [aw= Wifewtfinl]
* HW-WH
reg HusbandAge  HW_Husband WW_Husband HH_Husband [aw= Husbandwtfinl]
reg WifeAge  HW_Wife WW_Wife HH_Wife [aw= Wifewtfinl]
********************************************************************************
*** Number of Children
* HH-WW
reg nchild HH_Husband HW_Husband WH_Husband [aw= Husbandwtfinl]
* HW-WH
reg nchild HW_Husband WW_Husband HH_Husband [aw= Husbandwtfinl]
* HH-WW
reg nchild HH_Wife HW_Wife WH_Wife [aw= Wifewtfinl]
* HW-WH
reg nchild HW_Wife WW_Wife HH_Wife [aw= Wifewtfinl]

********************************************************************************
*** Employment rate
* HH-WW
reg HusbandEmployed HH_Husband HW_Husband WH_Husband [aw= Husbandwtfinl]
reg WifeEmployed HH_Wife HW_Wife WH_Wife [aw= Wifewtfinl]
* HW-WH
reg HusbandEmployed  HW_Husband WW_Husband HH_Husband [aw= Husbandwtfinl]
reg WifeEmployed  HW_Wife WW_Wife HH_Wife [aw= Wifewtfinl]
// ********************************************************************************
// *** Labor Force Participation
// * HH-WW
// reg HusbandLaborForce HH HW WH
// reg WifeLaborForce HH HW WH
// * HW-WH
// reg HusbandLaborForce  HW WW HH
// reg WifeLaborForce  HW WW HH
********************************************************************************
*** Full time proportions
* HH-WW
reg HusbandFullTime HH_Husband HW_Husband WH_Husband [aw= Husbandwtfinl]
reg WifeFullTime HH_Wife HW_Wife WH_Wife [aw= Wifewtfinl]
* HW-WH
reg HusbandFullTime  HW_Husband WW_Husband HH_Husband [aw= Husbandwtfinl]
reg WifeFullTime  HW_Wife WW_Wife HH_Wife [aw= Wifewtfinl]
********************************************************************************
*** part time proportions
* HH-WW
reg HusbandPartTime HH_Husband HW_Husband WH_Husband [aw= Husbandwtfinl]
reg WifePartTime HH_Wife HW_Wife WH_Wife [aw= Wifewtfinl]
* HW-WH
reg HusbandPartTime  HW_Husband WW_Husband HH_Husband [aw= Husbandwtfinl]
reg WifePartTime  HW_Wife WW_Wife HH_Wife [aw= Wifewtfinl]
// ********************************************************************************
// *** Hours usually wokred
// * HH-WW
// reg uhrsworkt_Husband HH HW WH if uhrsworkt_Husband<85
// reg uhrsworkt_Wife HH HW WH if uhrsworkt_Wife<85
// * HW-WH
// reg uhrsworkt_Husband  HW WW HH if uhrsworkt_Husband<85
// reg uhrsworkt_Wife  HW WW HH if uhrsworkt_Wife<85
// ********************************************************************************
// *** Hours wokred last week
// * HH-WW
// reg ahrsworkt_Husband HH HW WH if ahrsworkt_Husband<85
// reg ahrsworkt_Wife HH HW WH if ahrsworkt_Wife<85
// * HW-WH
// reg ahrsworkt_Husband  HW WW HH if ahrsworkt_Husband<85
// reg ahrsworkt_Wife  HW WW HH if ahrsworkt_Wife<85
********************************************************************************
*** Hours usually wokred per week
* HH-WW
reg uhrsworkly_Husband HH HW WH if (uhrsworkly_Husband<85 & (asecflag == 1 | asecflag == 2) & HusbandEmployed == 1) [aw= Husbandasecwt]
reg uhrsworkly_Wife HH HW WH if (uhrsworkly_Wife<85 & (asecflag == 1 | asecflag == 2)) [aw= Wifeasecwt]
* HW-WH
reg uhrsworkly_Husband  HW WW HH if (uhrsworkly_Husband<85 & (asecflag == 1 | asecflag == 2) & HusbandEmployed == 1) [aw= Husbandasecwt]
reg uhrsworkly_Wife  HW WW HH if (uhrsworkly_Wife<85 & (asecflag == 1 | asecflag == 2) & WifeEmployed == 1) [aw= Wifeasecwt]
********************************************************************************
*** Log total family income
* HH-WW
reg Husband_ftotval HH HW WH if (asecflag == 1 | asecflag == 2) [aw= asecwt]
* HW-WH
reg Husband_ftotval  HW WW HH if ((asecflag == 1 | asecflag == 2) & HusbandEmployed == 1 & WifeEmployed == 1) [aw= asecwt]
********************************************************************************
*** Log total personal income
* HH-WW
reg Husband_inctot HH_Husband HW_Husband WH_Husband if (asecflag == 1 | asecflag == 2) [aw= Husbandasecwt]
reg Wife_inctot HH_Wife HW_Wife WH_Wife if (asecflag == 1 | asecflag == 2) [aw= Wifeasecwt]
* HW-WH
reg Husband_inctot  HW_Husband WW_Husband HH_Husband if (asecflag == 1 | asecflag == 2) & HusbandEmployed == 1 [aw= Husbandasecwt]
reg Wife_inctot  HW_Wife WW_Wife HH_Wife if (asecflag == 1 | asecflag == 2) & WifeEmployed == 1 [aw= Wifeasecwt]
// ********************************************************************************
// *** Log wage and salary income
// * HH-WW
// reg Husband_incwage HH HW WH if (asecflag == 1 | asecflag == 2) [aw= Husbandasecwt]
// reg Wife_incwage HH HW WH if (asecflag == 1 | asecflag == 2) [aw= Wifeasecwt]
// * HW-WH
// reg Husband_incwage  HW WW HH if (asecflag == 1 | asecflag == 2) [aw= Husbandasecwt]
// reg Wife_incwage  HW WW HH if (asecflag == 1 | asecflag == 2) [aw= Wifeasecwt]
********************************************************************************
*** Log hourly wage
* HH-WW
reg Husband_hourwage HH_Husband HW_Husband WH_Husband if Husband_hourwage < 999.99 [aw= Husbandasecwt]
reg Wife_hourwage HH_Wife HW_Wife WH_Wife if Wife_hourwage < 999.99 [aw= Wifeasecwt]
* HW-WH
reg Husband_hourwage  HW_Husband WW_Husband HH_Husband if Husband_hourwage < 999.99 & HusbandEmployed == 1 [aw= Husbandasecwt]
reg Wife_hourwage  HW_Wife WW_Wife HH_Wife if Wife_hourwage < 999.99 & WifeEmployed == 1 [aw= Wifeasecwt]
********************************************************************************
********************************************************************************
********************************************************************************
* Summary Statisitcs withiout husband wife specification
clear
cls

* Global directories
global Output "/Users/hhadah/Dropbox/HispanicDiscrimination/SyntheticParentsCencus/CPS/EthnicityThroughParentPOB/UsingParentPOB"
global wd "/Users/hhadah/Dropbox/HispanicDiscrimination/SyntheticParentsCencus/CPS/EthnicityThroughParentPOB"
* set working dirrectory
cd "$wd"

* Open Data Set
use "$Output/CoupleRaceEth19942019Data"
********************************************************************************
********************************************************************************
********************************************************************************

********************************************************************************
* employment status: empstat_head empstat_sp (all series)
********************************************************************************
gen Employed = 0

replace Employed = 1 if (empstat<= 12 & empstat > 0)
********************************************************************************
* part/full time work: wkstat_head wkstat_sp (all series)
********************************************************************************
gen FullTime = 0

replace FullTime = 1 if (wkstat <= 15)

gen PartTime = 0

replace PartTime = 1 if (wkstat <= 40 & wkstat >15)

********************************************************************************
* education: educ_head educ_sp (all series)
********************************************************************************
gen Education = .

replace Education = 0 if (educ == 1 | educ == 2)


replace Education = 4 if ( educ  == 10)

replace Education = 6 if ( educ  == 20)

replace Education = 8 if ( educ  == 30)

replace Education = 9 if ( educ  == 40)

replace Education = 10 if ( educ  == 50)

replace Education = 11 if ( educ  == 60)

replace Education = 12 if ( educ  == 73)


replace Education = 13 if ( educ  == 81)


replace Education = 14 if (educ  == 91 | educ  == 92)

replace Education = 16 if (educ  == 111)


replace Education = 18 if (educ  == 123)


replace Education = 21 if (educ  == 124 | educ  == 125)

********************************************************************************
* Total family income: ftotval_head ftotval_sp (ASEC)
********************************************************************************
* ftotval in 1999's $:
gen lnftotval_1999 = ln(cpi99 * ftotval)
********************************************************************************
* Total personal income: inctot_head inctot_sp (ASEC)
********************************************************************************
* inctot in 1999's $:
gen lninctot_1999 = ln(cpi99 * inctot)
********************************************************************************
* Hourly wage: hourwage_head hourwage_sp (all series)
********************************************************************************
* hourwage in 1999's $:
gen lnhourwage_1999 = ln(cpi99 * hourwage)

********************************************************************************
* Generate person's type
********************************************************************************
gen strL Type 	= "none"
replace Type 	= "White-White" 		if WW == 1
replace Type	= "White-Hispanic" 		if WH == 1
replace Type 	= "Hispanic-White" 		if HW == 1
replace Type 	= "Hispanic-Hispanic" 	if HH == 1

sort Type sex

by Type sex: sum Education age Employed FullTime PartTime[aw= wtfinl]
by Type sex: sum lnftotval_1999 if asecflag == 1 | asecflag == 2 [aw= asecwt]
by Type sex: sum lninctot_1999 if asecflag == 1 | asecflag == 2 [aw= asecwt] //Husband_incwage
by Type sex: sum nchild [aw= wtfinl]


********************************************************************************
* Differences
********************************************************************************
sort sex
********************************************************************************
*** Education
* HH-WW
by sex: reg  Education HH    HW    WH    [aw=  wtfinl]
* HW-WH
by sex: reg  Education HW    WW    HH     [aw=  wtfinl]
********************************************************************************
*** Age
* HH-WW
by sex: reg  age HH    HW    WH    [aw=  wtfinl]
* HW-WH
by sex: reg  age  HW    WW    HH    [aw=  wtfinl]
********************************************************************************
*** Number of Children
* HH-WW
by sex: reg nchild HH    HW    WH    [aw=  wtfinl]
* HW-WH
by sex: reg nchild HW      WW      HH      [aw=    wtfinl]

********************************************************************************
*** Employment rate
* HH-WW
by sex: reg  Employed HH    HW    WH    [aw=  wtfinl]
* HW-WH
by sex: reg  Employed  HW    WW    HH    [aw=  wtfinl]

********************************************************************************
*** Full time proportions
* HH-WW
by sex: reg  FullTime HH    HW    WH    [aw=  wtfinl]
* HW-WH
by sex: reg  FullTime  HW    WW    HH    [aw=  wtfinl]
********************************************************************************
*** part time proportions
* HH-WW
by sex: reg  PartTime HH    HW    WH    [aw=  wtfinl]
* HW-WH
by sex: reg  PartTime  HW    WW    HH    [aw=  wtfinl]
// ********************************************************************************
// *** Log total family income
// * HH-WW
// by sex: reg    ftotval HH HW WH if (asecflag == 1 | asecflag == 2) [aw= asecwt]
// * HW-WH
// by sex: reg    ftotval  HW WW HH if ((asecflag == 1 | asecflag == 2) &  Employed == 1 &    Employed == 1) [aw= asecwt]
********************************************************************************
*** Log total personal income
* HH-WW
by sex: reg    lninctot_1999 HH    HW    WH    if asecflag == 1 | asecflag == 2 [aw= asecwt]
* HW-WH
by sex: reg    lninctot_1999  HW    WW    HH    if asecflag == 1 | asecflag == 2 [aw= asecwt]

// ********************************************************************************
// *** Log hourly wage
// * HH-WW
// by sex: reg    hourwage HH    HW    WH    if    hourwage < 999.99 [aw=  wtfinl]
// * HW-WH
// by sex: reg    hourwage  HW    WW    HH    if    hourwage < 999.99 &  Employed == 1 [aw=  wtfinl]






save "$Output/AnalysisData.dta", replace
gen Hispanic_Sample = 0
save "/Users/hhadah/Documents/GiT/HispanicDiscrimination/SummaryStat/DD-DD/POB.dta", replace
// ********************************************************************************
// ********************************************************************************
// ********************************************************************************
// foreach i in W B A H O{
// foreach j in W B A H O{
// gen `i'`j' = 0
// }
// }
// replace WW = 1 if (MaleHead == 1 & MaleSP == 0 & WhiteHead == 1 & WhiteSP == 1) | (MaleHead == 0 & MaleSP == 1 & WhiteHead == 1 & WhiteSP == 1)
// replace WH = 1 if (MaleHead == 1 & MaleSP == 0 & WhiteHead == 1 & HispanicSP == 1) | (MaleHead == 0 & MaleSP == 1 & HispanicHead == 1 & WhiteSP == 1)
// replace WB = 1 if (MaleHead == 1 & MaleSP == 0 & WhiteHead == 1 & BlackSP == 1) | (MaleHead == 0 & MaleSP == 1 & BlackHead == 1 & WhiteSP == 1)
// replace WA = 1 if (MaleHead == 1 & MaleSP == 0 & WhiteHead == 1 & AsianSP == 1) | (MaleHead == 0 & MaleSP == 1 & AsianHead == 1 & WhiteSP == 1)
// replace WO = 1 if (MaleHead == 1 & MaleSP == 0 & WhiteHead == 1 & OtherRaceSP == 1) | (MaleHead == 0 & MaleSP == 1 & OtherRaceHead == 1 & WhiteSP == 1)
//
// replace BB = 1 if (MaleHead == 1 & MaleSP == 0 & BlackHead == 1 & BlackSP == 1) | (MaleHead == 0 & MaleSP == 1 & BlackHead == 1 & BlackSP == 1)
// replace BW = 1 if (MaleHead == 1 & MaleSP == 0 & BlackHead == 1 & WhiteSP == 1) | (MaleHead == 0 & MaleSP == 1 & WhiteHead == 1 & BlackSP == 1)
// replace BH = 1 if (MaleHead == 1 & MaleSP == 0 & BlackHead == 1 & HispanicSP == 1) | (MaleHead == 0 & MaleSP == 1 & HispanicHead == 1 & BlackSP == 1)
// replace BA = 1 if (MaleHead == 1 & MaleSP == 0 & BlackHead == 1 & AsianSP == 1) | (MaleHead == 0 & MaleSP == 1 & AsianHead == 1 & BlackSP == 1)
// replace BO = 1 if (MaleHead == 1 & MaleSP == 0 & BlackHead == 1 & OtherRaceSP == 1) | (MaleHead == 0 & MaleSP == 1 & OtherRaceHead == 1 & BlackSP == 1)
//
// replace HH = 1 if (MaleHead == 1 & MaleSP == 0 & HispanicHead == 1 & HispanicSP == 1) | (MaleHead == 0 & MaleSP == 1 & HispanicHead == 1 & HispanicSP == 1)
// replace HW = 1 if (MaleHead == 1 & MaleSP == 0 & HispanicHead == 1 & WhiteSP == 1) | (MaleHead == 0 & MaleSP == 1 & WhiteHead == 1 & HispanicSP == 1)
// replace HB = 1 if (MaleHead == 1 & MaleSP == 0 & HispanicHead == 1 & BlackSP == 1) | (MaleHead == 0 & MaleSP == 1 & BlackHead == 1 & HispanicSP == 1)
// replace HA = 1 if (MaleHead == 1 & MaleSP == 0 & HispanicHead == 1 & AsianSP == 1) | (MaleHead == 0 & MaleSP == 1 & AsianHead == 1 & HispanicSP == 1)
// replace HO = 1 if (MaleHead == 1 & MaleSP == 0 & HispanicHead == 1 & OtherRaceSP == 1) | (MaleHead == 0 & MaleSP == 1 & OtherRaceHead == 1 & HispanicSP == 1)
//
// replace AA = 1 if (MaleHead == 1 & MaleSP == 0 & AsianHead == 1 & AsianSP == 1) | (MaleHead == 0 & MaleSP == 1 & AsianHead == 1 & AsianSP == 1)
// replace AW = 1 if (MaleHead == 1 & MaleSP == 0 & AsianHead == 1 & WhiteSP == 1) | (MaleHead == 0 & MaleSP == 1 & WhiteHead == 1 & AsianSP == 1)
// replace AB = 1 if (MaleHead == 1 & MaleSP == 0 & AsianHead == 1 & BlackSP == 1) | (MaleHead == 0 & MaleSP == 1 & BlackHead == 1 & AsianSP == 1)
// replace AH = 1 if (MaleHead == 1 & MaleSP == 0 & AsianHead == 1 & HispanicSP == 1) | (MaleHead == 0 & MaleSP == 1 & HispanicHead == 1 & AsianSP == 1)
// replace AO = 1 if (MaleHead == 1 & MaleSP == 0 & AsianHead == 1 & OtherRaceSP == 1) | (MaleHead == 0 & MaleSP == 1 & OtherRaceHead == 1 & AsianSP == 1)
//
// replace OO = 1 if (MaleHead == 1 & MaleSP == 0 & OtherRaceHead == 1 & OtherRaceSP == 1) | (MaleHead == 0 & MaleSP == 1 & OtherRaceHead == 1 & OtherRaceSP == 1)
// replace OW = 1 if (MaleHead == 1 & MaleSP == 0 & OtherRaceHead == 1 & WhiteSP == 1) | (MaleHead == 0 & MaleSP == 1 & WhiteHead == 1 & OtherRaceSP == 1)
// replace OB = 1 if (MaleHead == 1 & MaleSP == 0 & OtherRaceHead == 1 & BlackSP == 1) | (MaleHead == 0 & MaleSP == 1 & BlackHead == 1 & OtherRaceSP == 1)
// replace OH = 1 if (MaleHead == 1 & MaleSP == 0 & OtherRaceHead == 1 & HispanicSP == 1) | (MaleHead == 0 & MaleSP == 1 & HispanicHead == 1 & OtherRaceSP == 1)
// replace OA = 1 if (MaleHead == 1 & MaleSP == 0 & OtherRaceHead == 1 & AsianSP == 1) | (MaleHead == 0 & MaleSP == 1 & AsianHead == 1 & OtherRaceSP == 1)
//
//
//
//
// foreach i in WhiteHead HispanicHead BlackHead AsianHead OtherRaceHead{
// foreach j in WhiteSP HispanicSP BlackSP AsianSP OtherRaceSP{
// tab `i' `j' if (MaleHead == 1 & MaleSP == 0 & `i' == 1 `j' == 1) | (MaleHead == 0 & MaleSP == 1 & `i' == 1 `j' == 1), cell
// }
// }
//
//
// foreach i in WW WB WA WH WO BW BB BA BH BO AW AB AA AH AO HW HB HA HH HO OW OB OA OH OO{
// egen mean`i' = mean(`i')
// }
//
// egen sum_ratios = rowtotal(meanWW meanWB meanWA meanWH meanWO meanBW meanBB meanBA meanBH meanBO meanAW meanAB meanAA meanAH meanAO meanHW meanHB meanHA meanHH meanHO meanOW meanOB meanOA meanOH meanOO)


/*
sort CoupleType year
by CoupleType year: egen meantotalincome = mean(ftotval* cpi99)
gen lnmeantotalincome = ln(meantotalincome)
twoway (line lnmeantotalincome year if CoupleType == "White-White") || (line lnmeantotalincome year if CoupleType == "White-Hispanic") || (line lnmeantotalincome year if CoupleType == "Hispanic-White") || (line lnmeantotalincome year if CoupleType == "Hispanic-Hispanic"), legend(label(1 "White-White") label( 2 "White-Hispanic") label( 3 "Hispanic-White") label( 4 "Hispanic-Hispanic"))
*/

