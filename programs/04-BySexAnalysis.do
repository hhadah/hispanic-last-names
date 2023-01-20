/*
This do file is to produce
the summary statistics and
matrix for the marriage
market idea.
Data here will be by sex not
husband and wife
*/
********************************************************************************
clear
cls
********************************************************************************
* Global directories
global wd "C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\datasets"

* set working dirrectory
cd "$wd"

* open data
use "CleanIndividualData"

********************************************************************************
* generate and clean important variables
********************************************************************************
* CPI for all years:
replace cpi99 = 1.153 if year == 1994
replace cpi99 = 1.124 if year == 1995
replace cpi99 = 1.093 if year == 1996
replace cpi99 = 1.062 if year == 1997
replace cpi99 = 1.038 if year == 1998
replace cpi99 = 1.022 if year == 1999
replace cpi99 = 1.000 if year == 2000
replace cpi99 = 0.967 if year == 2001
replace cpi99 = 0.941 if year == 2002
replace cpi99 = 0.926 if year == 2003
replace cpi99 = 0.905 if year == 2004
replace cpi99 = 0.882 if year == 2005
replace cpi99 = 0.853 if year == 2006
replace cpi99 = 0.826 if year == 2007
replace cpi99 = 0.804 if year == 2008
replace cpi99 = 0.774 if year == 2009
replace cpi99 = 0.777 if year == 2010
replace cpi99 = 0.764 if year == 2011
replace cpi99 = 0.741 if year == 2012
replace cpi99 = 0.726 if year == 2013
replace cpi99 = 0.715 if year == 2014
replace cpi99 = 0.704 if year == 2015
replace cpi99 = 0.703 if year == 2016
replace cpi99 = 0.694 if year == 2017
replace cpi99 = 0.680 if year == 2018
replace cpi99 = 0.663 if year == 2019
********************************************************************************
* employment status: empstat_head empstat_sp (all series)
********************************************************************************
gen Employed = .
replace Employed = 1 if (empstat<= 12 & empstat >= 10)
replace Employed = 0 if (empstat> 12 & empstat < 22)
********************************************************************************
* Labor force participation (all series)
********************************************************************************
gen InLaborForce = .
replace InLaborForce = 1 if labforce == 2
replace InLaborForce = 0 if labforce == 1
********************************************************************************
* Full Year Employment (ASEC)
********************************************************************************
gen FullYear = .
replace FullYear = 1 if wkswork1 ==52
replace FullYear = 0 if wkswork1 < 52 & wkswork1 >= 0
********************************************************************************
* part/full time work: wkstat_head wkstat_sp (all series)
********************************************************************************
gen FullTime = .
replace FullTime = 1 if (wkstat == 11)
replace FullTime = 0 if (wkstat != 11 & wkstat!= 99)

gen PartTime = .
replace PartTime = 1 - FullTime
********************************************************************************
* part/full time work: fullpart (ASEC)
********************************************************************************
gen FullTime_ASEC = .

replace FullTime_ASEC = 1 if (fullpart == 1)
replace FullTime_ASEC = 0 if (fullpart == 2)

gen PartTime_ASEC = .
replace PartTime_ASEC = 1-FullTime_ASEC
********************************************************************************
* Full Time Full Year Employment (FTFY): FTFY (ASEC)
********************************************************************************
gen FTFY = .

replace FTFY = 1 if FullTime_ASEC == 1 & FullYear == 1
replace FTFY = 0 if FullTime_ASEC == 0 | FullYear == 0
********************************************************************************
* Self Employed
********************************************************************************
gen NonSelfEmpl = 0
replace NonSelfEmpl = 1 if classwly < 29 & classwly > 20
********************************************************************************
* education: educ_head educ_sp (all series)
********************************************************************************
gen Education = .

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
replace ftotval = . if ftotval == 999999999
gen lnftotval_1999 = ln(cpi99 * ftotval)
********************************************************************************
* Total personal income: inctot_head inctot_sp (ASEC)
********************************************************************************
* inctot in 1999's $:
replace inctot = . if inctot >= 999999998
gen lninctot_1999 = ln(cpi99 * inctot)
********************************************************************************
* Hourly wage: hourwage_head hourwage_sp (all series)
********************************************************************************
* hourwage in 1999's $:
replace hourwage = . if hourwage == 999.99
replace earnweek = . if earnweek == 9999.99
replace uhrsworkorg = . if uhrsworkorg == 999 | uhrsworkorg == 998

gen lnhourwage_1999 = ln(cpi99 * hourwage) if paidhour == 2
replace lnhourwage_1999 = ln(cpi99*earnweek/uhrsworkorg) if paidhour == 1

********************************************************************************
* SelfEmployed: classwkr (all series) classwly  (ASEC)
********************************************************************************
* hourwage in 1999's $:
replace classwly = . if classwly == 0 | classwly == 99
replace classwkr = . if classwkr == 0 | classwkr == 99

gen Self_employed = 1 if classwkr <= 14 & classwkr >= 10
replace Self_employed = 0 if classwkr <= 28 & classwkr >= 20

gen Self_employed_ASEC = 1 if classwly <= 14 & classwly >= 10
replace Self_employed_ASEC = 0 if classwly <= 28 & classwly >= 20
/*
********************************************************************************
* Race Variable for Blacks, Hispanics and Whites
********************************************************************************
gen White = .
gen Black = .
gen Hispanic_WageGap = .

replace White = 1 if race == 100 & hispan == 0
replace White = 0 if (race > 100 & race < 999) | (hispan >= 100 & hispan<= 612)

replace Black = 1 if race == 200 & hispan == 0
replace Black = 0 if race == 100 |( race < 999 & race > 200) | (hispan >= 100 & hispan<= 612)

replace Hispanic_WageGap = 1 if race == 100 & hispan > 0 & hispan < 901
replace Hispanic_WageGap = 0 if (race > 100 & race < 999) | (hispan == 0)
*/
********************************************************************************
* some regressions
// ********************************************************************************
// gen experience = age - Education - 7
// gen experience_sq = experience^2
// /*
// Regression wage gaps
// */ 
//
// * log hourly earnings
// reg lnhourwage_1999 Black Hispanic_WageGap if sex == 1 & FTFY == 1
// reghdfe lnhourwage_1999 Black Hispanic_WageGap if sex == 1 & FTFY == 1, absorb(educ year)
// reg lninctot_1999  Black Hispanic_WageGap if sex == 1 & FTFY == 1
// reghdfe lninctot_1999 Black Hispanic_WageGap if sex == 1 & FTFY == 1, absorb(educ year)
// reghdfe Education Black Hispanic_WageGap if sex == 1 & FTFY == 1, absorb(year)
// reghdfe Employed Black Hispanic_WageGap if sex == 1, absorb(educ year)
// reghdfe InLaborForce Black Hispanic_WageGap if sex == 1, absorb(educ year)
// ********************************************************************************
// * Plot portion of Hispanics and 
// ********************************************************************************
//
// ********************************************************************************
// * save wage gaps between Whites and Black & Hispanics Data
// ********************************************************************************
// save "WhiBlaHis_gap.dta", replace
/*
********************************************************************************
* Wage gaps (Blacks, Hispanics and Whites)
********************************************************************************
clear
cls
********************************************************************************
* Global directories
global wd "/Users/hhadah/Dropbox/HispanicDiscrimination/MainFile/CPS_DataOutput"
global SyntheticParent "/Users/hhadah/Dropbox/HispanicDiscrimination/MainFile/ACS_DataOutput"

* set working dirrectory
cd "$wd"
use "WhiBlaHis_gap.dta"

* Generate Year Dummy Variables
tab year, gen(Year)
rename Year# Year#, renumber(1994) sort

* generate interaction term between
* year dummies and Hispanic Black dummies
foreach v of varlist Year1994-Year2019{
qui gen Black_`v' = `v' * Black
qui gen Hispanic_`v' = `v' * Hispanic_WageGap
qui gen White_`v' = `v' * White

}
qui rename Black_Year# Black#, renumber(1994) sort
qui rename Hispanic_Year# Hispanic#, renumber(1994) sort
qui rename White_Year# White#, renumber(1994) sort

* plot education gaps
global BlackVars Black1995-Black2019
global HispanicVars Hispanic1995-Hispanic2019
global Year_Dum Year1995-Year2019
reg Education $BlackVars $HispanicVars $Year_Dum Hispanic_WageGap Black
estimates store Education_Reg
coefplot (Education_Reg), vertical  drop($BlackVars) levels(95)  ciopts(recast(rarea) color(gs12) lwidth(vthin) lcolor(grey) lpattern(dash)) recast(connected) coeflabel(Black1994="1994" Black1995="1995" Black1996="1996" Black1997="1997" Black1998="1998" Black1999="1999") msymbol(smcircle) yline(0,lwidth(thin) lcolor(red)) xtitle(Year) ytitle(Estimates)  plotregion(fcolor(white)) graphregion(fcolor(white))  legend(order(1 "95% confidence interval" 2 "Estimates"))
graph export estimates_education.png, replace
*/

********************************************************************************
* Generate the different kind of children
* WW = White Father White Mother
* WH = White Father Hispanic Mother
* HW = Hispanic Father White Mother
* HH = Hispanic Father Hispanic Mother
********************************************************************************
* keep native born and whites only
* Keep US born citizens only
keep if citizen == 1

* Keep Whites
keep if race == 100

* keep relevent parents' place of birth
#delimit;
keep if 						(mbpl  ==  9900 		| /*USA */
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
								mbpl  ==  21020		| /* Costa Rica */
								mbpl  ==  21070		| /* Panama */
								mbpl  ==  30060		| /* Uruguay */
								mbpl  ==  30000)	& /* South America */
								(fbpl  ==  9900 	| /*USA */
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
								fbpl  ==  21020		| /* Costa Rica */
								fbpl  ==  21070		| /* Panama */
								fbpl  ==  30060		| /* Uruguay */
								fbpl  ==  30000)	  /* South America */;
					
#delimit cr
/*
********************************************************************************
keep if 						fbpl  ==  9900 		| /*USA */
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
								fbpl  ==  21020		| /* Costa Rica */
								fbpl  ==  21070		| /* Panama */
								fbpl  ==  30060		| /* Uruguay */
								fbpl  ==  30000	  	  /* South America */;
*/

********************************************************************************
* generate dummy variables
* = 1 if mother or father
* were born in Latin America
gen LA_mother = 0
gen LA_father = 0
label var LA_mother "mother born in Latin America"
label var LA_father "father born in Latin America"
********************************************************************************
* LA_mother
#delimit;
replace LA_mother = 1 			if					  /* fbpl  ==  9900 	| USA */
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
								mbpl  ==  21020		| /* Costa Rica */
								mbpl  ==  21070		| /* Panama */
								mbpl  ==  30060		| /* Uruguay */
								mbpl  ==  30000	  	  /* South America */;
/*
********************************************************************************
* LA_father
*/
replace LA_father = 1 			if 					  /* fbpl  ==  9900 	| USA */
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
Generate parent types

WW = White Father White Mother
WH = White Father Hispanic Mother
HW = Hispanic Father White Mother
HH = Hispanic Father Hispanic Mother
*/

#delimit;
gen WW = 0;
gen WH = 0;
gen HW = 0;
gen HH = 0;

label var WW "White Father White Mother";
label var WH "White Father Hispanic Mother";
label var HW "Hispanic Father White Mother"; 
label var HH "Hispanic Father Hispanic Mother";

replace WW = 1 if  LA_father == 0 & LA_mother == 0;
replace WH = 1 if  LA_father == 0 & LA_mother == 1;
replace HW = 1 if  LA_father == 1 & LA_mother == 0;
replace HH = 1 if  LA_father == 1 & LA_mother == 1;
#delimit cr

********************************************************************************
* Generate person's type
********************************************************************************
gen str Type 	= "none"
replace Type 	= "White-White" 		if WW == 1
replace Type	= "White-Hispanic" 		if WH == 1
replace Type 	= "Hispanic-White" 		if HW == 1
replace Type 	= "Hispanic-Hispanic" 	if HH == 1
/*
generate Hispanic variable
through identification
*/

gen Hispanic_ID = 0

replace Hispanic_ID = 1 if (hispan != 0 & hispan  != 901 & hispan != 902)
/*
generate Hispanic variable
through parent's POB
*/
gen Hispanic = 0
replace Hispanic = 1 if HW == 1 | HH == 1
gen Hispanic_Father = 0
replace Hispanic_Father = 1 if HW == 1
* Global variables for analysis
#delimit;
global BySexVars 	"year serial month hwtfinl cpsid asecflag hflag asecwth asecwth04 
					cpi99 region statefip county statecensus metfips individcc 
					hhincome faminc pernum wtfinl cpsidp asecwt age sex race 
					marst nchild bpl yrimmig citizen mbpl fbpl nativity hispan 
					empstat wkstat educ asecwt04 earnwt uhrsworkly ftotval 
					inctot hourwage LA_mother LA_father WW WH HW HH Employed 
					FullTime PartTime Education lnftotval_1999 lninctot_1999 
					lnhourwage_1999 Type Hispanic_ID Hispanic Hispanic_Father 
					cohort Employed InLaborForce FullYear FullTime PartTime 
					FullTime_ASEC PartTime_ASEC FTFY Education NonSelfEmpl
					earnweek uhrsworkorg paidhour classwly classwkr 
					Self_employed Self_employed_ASEC";
keep $BySexVars;
#delimit cr
* generate control variables
gen agesquared = age^2
gen experience = age - Education
gen experience_squared = experience^2

* sort
gen YOB = year - age
// egen County_Time = group(year county)
// egen County_YOB = group(year YOB)
* save
save "BySexAnalysisData", replace
********************************************************************************
* Summary statistics
********************************************************************************
clear all
cls

* global wd
global wd "C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\datasets"
* set working dirrectory
cd "$wd"

use "BySexAnalysisData"
tab Type
* pie chart
graph pie, over(Type)
// eststo ttest1: estpost ttest $sum_vars_parents, by(MM_WW) unequal
// eststo ttest2: estpost ttest $sum_vars_parents, by(MW_WM) unequal
//
// esttab ttest1 ttest2 using "sumstat_parents2.tex", replace ///
//  cells("mu_1(fmt(3)) mu_2  b(star) se(par)") ///
//   collabels("White-White" "Hispanic-Hispanic" "HH - WW" "S.E." "White-Hispanic" "Hispanic-White" "HW - WH" "S.E.") ///
//   star(* 0.10 ** 0.05 *** 0.01) ///
//   label booktabs nonum gaps f noobs compress

preserve
keep if cohort >= 1970 & cohort <=1980
sort Type sex
by Type sex: 		sum 	Education [aw= wtfinl]
sort sex
*** Education
*keep if age >= 30 & age <=55
** HH-WW
by sex: reg  Education HH    HW    WH    [aw=  wtfinl]
** HW-WH
by sex: reg  Education HW    WW    HH     [aw=  wtfinl]
restore

preserve
keep if cohort > 1980 & cohort <=1990
sort Type sex
by Type sex: 		sum 	Education [aw= wtfinl]
sort sex
*** Education
*keep if age >= 30 & age <=55
** HH-WW
by sex: reg  Education HH    HW    WH    [aw=  wtfinl]
** HW-WH
by sex: reg  Education HW    WW    HH     [aw=  wtfinl]
restore

sort Type sex
* summary statistics by person type by sex
by Type sex: 		sum 	Education [aw= wtfinl]
by Type sex: 		sum 	age [aw= wtfinl]
by Type sex: 		sum 	nchild [aw= wtfinl]
by Type sex: 		sum 	Employed [aw= wtfinl]
by Type sex: 		sum 	lnhourwage_1999 if    	hourwage < 999.99 & Employed == 1 [aw= earnwt] //Husband_incwage
by Type sex: 		sum 	Hispanic_ID [aw= wtfinl]
by Type sex: 		sum 	lninctot_1999 [aw= asecwth] if FTFY == 1
by Type sex: 		sum 	InLaborForce [aw= asecwth]


///estpost tabstat Education age nchild Employed Hispanic_ID, by(Type sex) c(stat) stat(mean sd) nototal
sort Hispanic_ID sex
* summary statistics by person type by sex
by Hispanic_ID sex: 		sum 	Education [aw= wtfinl]
by Hispanic_ID sex: 		sum 	age [aw= wtfinl]
by Hispanic_ID sex: 		sum 	nchild [aw= wtfinl]
by Hispanic_ID sex: 		sum 	Employed [aw= wtfinl]
sort sex
by sex: reg  Education Hispanic_ID    [aw=  wtfinl]
by sex: reg  age Hispanic_ID    [aw=  wtfinl]
by sex: reg  nchild Hispanic_ID    [aw=  wtfinl]
by sex: reg  Employed Hispanic_ID    [aw=  wtfinl]


*by Type sex: 		sum 	FullTime [aw= wtfinl]
*by Type sex: 		sum 	PartTime[aw= wtfinl]

by Type sex: 		sum 	lnftotval_1999 	if 		asecflag == 1 | asecflag == 2 [aw= asecwt]
by Type sex: 		sum 	lninctot_1999 	if 		asecflag == 1 | asecflag == 2 [aw= asecwt] //Husband_incwage
by Type sex: 		sum 	lnhourwage_1999 if    	hourwage < 999.99 &  Employed == 1 [aw= earnwt] //Husband_incwage


statplot Education, over(Type) over(sex) blabel(name, pos(base) color(white))  leg(off)


********************************************************************************
* Differences
********************************************************************************
sort sex
********************************************************************************
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.year i.county)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.year i.county i.County_Time)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.County_Time)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.county##c.year)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.county##year)
*** Education
*keep if age >= 30 & age <=55
** HH-WW
by sex: reg  Education HH    HW    WH    [aw=  wtfinl]
** HW-WH
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
*** Log hourly wage
* HH-WW
by sex: reg    lnhourwage_1999 HH    HW    WH    if    hourwage < 999.99 &  Employed == 1 [aw=  earnwt]
* HW-WH
by sex: reg    lnhourwage_1999  HW    WW    HH    if    hourwage < 999.99 &  Employed == 1 [aw=  earnwt]

********************************************************************************
*** Log annual earnings
* HH-WW
by sex: reg    lninctot_1999 HH    HW    WH [aw=  asecwth]
* HW-WH
by sex: reg    lninctot_1999  HW    WW    HH  [aw=  asecwth]
********************************************************************************
********************************************************************************
********************************************************************************
********************************************************************************
/*
For people that identify as Hispanic
*/
preserve
keep if WW == 1 | (HW == 1 & Hispanic_ID == 1) | (WH == 1 & Hispanic_ID == 1)  | (HH == 1 & Hispanic_ID == 1)
sort Type sex
* summary statistics by person type by sex
by Type sex: 		sum 	Education [aw= wtfinl]
*by Type sex: 		sum 	age [aw= wtfinl]
*by Type sex: 		sum 	nchild [aw= wtfinl]
by Type sex: 		sum 	Employed [aw= wtfinl]
by Type sex: 		sum 	lnhourwage_1999 if    	hourwage < 999.99 &  Employed == 1 [aw= earnwt] //Husband_incwage
by Type sex: 		sum 	lninctot_1999 [aw= asecwth] if FTFY == 1

********************************************************************************
* Differences
********************************************************************************
sort sex
********************************************************************************
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.year i.county)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.year i.county i.County_Time)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.County_Time)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.county##c.year)
// reghdfe  Education HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.county##year)
*** Education
*keep if age >= 30 & age <=55
** HH-WW
by sex: reg  Education HH    HW    WH    [aw=  wtfinl]

** HW-WH
by sex: reg  Education HW    WW    HH     [aw=  wtfinl]

// ********************************************************************************
// *** Age
// * HH-WW
// by sex: reg  age HH    HW    WH    [aw=  wtfinl]
//
// * HW-WH
// by sex: reg  age  HW    WW    HH    [aw=  wtfinl]
//
// ********************************************************************************
// *** Number of Children
// * HH-WW
// by sex: reg nchild HH    HW    WH    [aw=  wtfinl]
//
// * HW-WH
// by sex: reg nchild HW      WW      HH      [aw=    wtfinl]

********************************************************************************
*** Employment rate
* HH-WW
by sex: reg  Employed HH    HW    WH    [aw=  wtfinl]

* HW-WH
by sex: reg  Employed  HW    WW    HH    [aw=  wtfinl]
********************************************************************************
*** Log hourly wage
* HH-WW
by sex: reg    lnhourwage_1999 HH    HW    WH    if    hourwage < 999.99 &  Employed == 1 [aw=  earnwt]
* HW-WH
by sex: reg    lnhourwage_1999  HW    WW    HH    if    hourwage < 999.99 &  Employed == 1 [aw=  earnwt]

********************************************************************************
*** Log annual earnings
* HH-WW
by sex: reg    lninctot_1999 HH    HW    WH [aw=  asecwth] if FTFY == 1
* HW-WH
by sex: reg    lninctot_1999  HW    WW    HH  [aw=  asecwth] if FTFY == 1

restore

// ********************************************************************************
// *** Full time proportions
// * HH-WW
// by sex: reg  FullTime HH    HW    WH    [aw=  wtfinl]
// * HW-WH
// by sex: reg  FullTime  HW    WW    HH    [aw=  wtfinl]
// ********************************************************************************
// *** part time proportions
// * HH-WW
// by sex: reg  PartTime HH    HW    WH    [aw=  wtfinl]
// * HW-WH
// by sex: reg  PartTime  HW    WW    HH    [aw=  wtfinl]
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
********************************************************************************
*** Log hourly wage
* HH-WW
by sex: reg    lnhourwage_1999 HH    HW    WH    if    hourwage < 999.99 &  Employed == 1 [aw=  earnwt]
* HW-WH
by sex: reg    lnhourwage_1999  HW    WW    HH    if    hourwage < 999.99 &  Employed == 1 [aw=  earnwt]
********************************************************************************
* Global variables for analysis
#delimit;
gen ed_level=cond(educ<73,1,0);
replace ed_level=cond(educ == 73, 2, ed_level);
replace ed_level=cond(educ > 73 & educ <111,3,ed_level);
replace ed_level=cond(educ > 110, 4, ed_level);

label define ed_levell 	1 "High school dropout" 
						2 "High school" 
						3 "Some college" 
						4 "4 or more years of college";
label values ed_level ed_level;
#delimit cr

tab ed_level, gen(EdLevelDummy)
* males
reghdfe  EdLevelDummy4 		HW    WW    HH 	 	if sex == 1 [aw=  wtfinl], absorb(i.YOB i.county)
* females
reghdfe  EdLevelDummy4 	   	HW    WW    HH    	if sex == 1 [aw=  wtfinl], absorb(i.county##YOB)
/*
Histogram of distibutions on
educatiob by the different groups
*/
#delimit;
hist ed_level if sex == 1 & (Type == "Hispanic-White" | Type == "White-Hispanic"), 
						   discrete percent by(Type) xlabel( 1 "High school dropout"  
															 2 "High school" 
															 3 "Some college" 
															 4 "4 or more years of college", angle(45));
#delimit;
hist ed_level if sex == 2 & (Type == "Hispanic-White" | Type == "White-Hispanic"), 
						   discrete percent by(Type) xlabel( 1 "High school dropout"  
															 2 "High school" 
															 3 "Some college" 
															 4 "4 or more years of college", angle(45));
 
/*
IV Regression: instrument
Hispanic ID by father's POB

ivreg2 		lnhourwage_1999 	WW    HH											   (Hispanic_ID = HW)

ivreg2 		lnhourwage_1999 	WW    HH experience experience_squared  sex  Education (Hispanic_ID = HW)

ivreghdfe 	lnhourwage_1999 	WW    HH experience experience_squared  sex  Education (Hispanic_ID = HW), 				absorb(i.year i.county)

ivreghdfe 	lnhourwage_1999 	WW    HH experience experience_squared  sex  Education (Hispanic_ID = HW), 				absorb(i.county##year)
*/

/*
ivreg2 Employed age sex agesquared (Hispanic_ID = Hispanic);
ivreg2 Education age sex agesquared (Hispanic_ID = Hispanic);
ivreg2 lninctot_1999 age sex agesquared Employed Education (Hispanic_ID = Hispanic);


// rename year survey_year
// rename YOB year
// merge m:1 year Type using "$SyntheticParent/SyntheticParentsMerge.dta"
keep if Type == "Hispanic-White" | Type == "White-Hispanic"
// keep if _merge == 3
// drop _merge* 
// save "Children_Parents_Merged.dta", replace
// quietly estadd local fixedcounty 	"No", replace
// quietly estadd local fixedyear 		"No", replace
// quietly estadd local countytrent 	"No", replace
eststo model1: ivreg2 		lnhourwage_1999 	age sex agesquared Education (Hispanic_ID = Hispanic_Father)
ivreg2 		lnhourwage_1999 	age sex agesquared Education experience (Hispanic_ID = Hispanic_Father)
ivreg2 		lnhourwage_1999 	age 	agesquared Education (Hispanic_ID = Hispanic_Father) if sex == 1
ivreg2 		lnhourwage_1999 	age 	agesquared Education (Hispanic_ID = Hispanic_Father) if sex == 2

ivreghdfe 	lnhourwage_1999 	age sex agesquared Education (Hispanic_ID = Hispanic_Father), 				absorb(i.year i.county)
ivreghdfe 	lnhourwage_1999 	age 	agesquared Education (Hispanic_ID = Hispanic_Father) if sex == 1, 	absorb(i.year i.county)
ivreghdfe 	lnhourwage_1999 	age 	agesquared Education (Hispanic_ID = Hispanic_Father) if sex == 2, 	absorb(i.year i.county)

ivreghdfe 	lnhourwage_1999 	age sex agesquared Education (Hispanic_ID = Hispanic_Father), 				absorb(i.county##year)
ivreghdfe 	lnhourwage_1999 	age 	agesquared Education (Hispanic_ID = Hispanic_Father) if sex == 1, 	absorb(i.county##year)
ivreghdfe 	lnhourwage_1999 	age 	agesquared Education (Hispanic_ID = Hispanic_Father) if sex == 2, 	absorb(i.county##year)


ivreghdfe 	Employed 			age sex agesquared Education (Hispanic_ID = Hispanic), 				absorb(i.year i.county)
ivreghdfe 	Employed 			age 	agesquared Education (Hispanic_ID = Hispanic) if sex == 1, 	absorb(i.year i.county)
ivreghdfe 	Employed 			age 	agesquared Education (Hispanic_ID = Hispanic) if sex == 2, 	absorb(i.year i.county)

ivreg2 		Employed 			age sex agesquared Education (Hispanic_ID = Hispanic), 				absorb(i.county##year)
ivreg2 		Employed 			age 	agesquared Education (Hispanic_ID = Hispanic) if sex == 1, 	absorb(i.county##year)
ivreg2 		Employed 			age 	agesquared Education (Hispanic_ID = Hispanic) if sex == 2, 	absorb(i.county##year)


ivreg2 		lnhourwage_1999 	 											  (Hispanic_ID = Hispanic_Father)

ivreg2 		lnhourwage_1999 	experience experience_squared  sex  Education (Hispanic_ID = Hispanic_Father)

ivreghdfe 	lnhourwage_1999 	experience experience_squared  sex  Education (Hispanic_ID = Hispanic_Father), 				absorb(i.year i.county)

ivreghdfe 	lnhourwage_1999 	experience experience_squared  sex  Education (Hispanic_ID = Hispanic_Father), 				absorb(i.county##year)
*/

/*
Regression between 4 groups
using parent's POB only
*/ 
reg 		lnhourwage_1999 	HW WW HH
reg 		lnhourwage_1999 	HW WW HH experience experience_squared  sex  Education
reghdfe 	lnhourwage_1999 	HW WW HH experience experience_squared  sex  Education, 				absorb(i.year i.county)
reghdfe 	lnhourwage_1999 	HW WH HH experience experience_squared  sex  Education, 				absorb(i.county##year)

reg 		Education 	HW WW HH 
reg 		Education 	HW WW HH age agesquared  sex 
reghdfe 	Education 	HW WW HH age agesquared  sex , 				absorb(i.year i.county)
reghdfe 	Education 	HW WH HH age agesquared  sex , 				absorb(i.county##year)

reg 		FullTime 	HW WW HH 
reg 		FullTime 	HW WW HH experience experience_squared  sex 
reghdfe 	FullTime  	HW WW HH experience experience_squared  sex , 				absorb(i.year i.county)
reghdfe 	FullTime  	HW WH HH experience experience_squared  sex , 				absorb(i.county##year)

reg 		PartTime 	HW WW HH 
reg 		PartTime 	HW WW HH experience experience_squared  sex 
reghdfe 	PartTime  	HW WW HH experience experience_squared  sex , 				absorb(i.year i.county)
reghdfe 	PartTime  	HW WH HH experience experience_squared  sex , 				absorb(i.county##year)


/*
Regression between 4 groups
using parent's POB only and
Hispanic self identification
*/ 
preserve
keep if WW == 1 | (HW == 1 & Hispanic_ID == 1) | (WH == 1 & Hispanic_ID == 1)  | (HH == 1 & Hispanic_ID == 1)
// reg 		lnhourwage_1999 	HW WW HH
// reg 		lnhourwage_1999 	HW WW HH experience experience_squared  sex  Education
// reghdfe 	lnhourwage_1999 	HW WW HH experience experience_squared  sex  Education, 				absorb(i.year i.county)
reghdfe 	lnhourwage_1999 	HW WW HH experience experience_squared  sex  Education, 				absorb(i.county##year)

// reg 		Education 	HW WW HH 
// reg 		Education 	HW WW HH age agesquared  sex 
// reghdfe 	Education 	HW WW HH age agesquared  sex , 				absorb(i.year i.county)
reghdfe 	Education 	HW WW HH age agesquared  sex , 				absorb(i.county##year)

// reg 		FullTime 	HW WW HH 
// reg 		FullTime 	HW WW HH experience experience_squared  sex 
// reghdfe 	FullTime  	HW WW HH experience experience_squared  sex , 				absorb(i.year i.county)
reghdfe 	FullTime  	HW WW HH experience experience_squared  sex , 				absorb(i.county##year)

// reg 		PartTime 	HW WW HH 
// reg 		PartTime 	HW WW HH experience experience_squared  sex 
// reghdfe 	PartTime  	HW WW HH experience experience_squared  sex , 				absorb(i.year i.county)
reghdfe 	PartTime  	HW WW HH experience experience_squared  sex , 				absorb(i.county##year)
restore

/*
Identity cost regressions
*/ 

gen HW_HispanicID = HW * Hispanic_ID
gen WH_HispanicID = WH * Hispanic_ID
gen WW_HispanicID = WW * Hispanic_ID
gen HH_HispanicID = HH * Hispanic_ID

label var HW_HispanicID "Hispanic-White x Hispanic ID"
label var Hispanic_ID "Hispanic ID"

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



/*
// eststo did_ct`var': xi: reg `var' coethnic urban female i.cowcode*i.birth_year  i.age i.age5year , cluster(birth_year) noomit  
// quietly estadd local fixedcountry "Yes", replace
// quietly estadd local fixedyear "Yes", replace
// quietly estadd local fixedcountry_year "Yes", replace
// quietly estadd local regionFE "No", replace
// quietly estadd local EthnicFE "No", replace
// quietly estadd local clusterSE "Yes", replace
// quietly estadd local Controls "Yes", replace
 #delimit ;
 esttab did_ethfav_ethFE  did_eth_Inf did_ethfav_ethFE_w did_ethElectrification did_ethAccessToWater using "ethnic_fav_tab_ethFE.tex", 
 	replace se star(* 0.10 ** 0.05 *** 0.01) label
	addnotes("In this table, I am reporting the estimates of equation \ref{eqFR1}. I present the results of the effect of ethnic favoritism on primary school completions in column 1, infant survival in column 2, wealth quintile in column 3, electrification in column 4 and access to clean drinking water in column 4. Primary school completion is a dummy variable that is equal to one if a person completed primary school and zero otherwise. Infant survival is a dummy variable that is equal to one if an infant survived the first 12 months of life. Electrification is a dummy variable that is equal to one if a household has electricity. Finally, access to clean drinking water is an ordinal variable that has values from 1, worst water source, to 4."
     "Standard errors are clustered on ethnic groups. All results include ethnic group, time and age fixed effects.")
	s(N,
 	label("Observations"))
	title("Ethnic faovirtism results.")
	keep(coethnic)
	booktabs alignment(D{.}{.}{-1})
	f b(3) se(3)
	coeflabels(coethnic Coethnic);
 #delimit cr
 
*/
