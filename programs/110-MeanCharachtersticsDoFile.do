/*
This is the do file
for average intervals
for sythetic parents
*/

/*
First created: Feb 27, 2021
*/

cls
clear all

#delimit;

global WorkingDirectory "C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\datasets";

cd "$WorkingDirectory";
/*
Open dataset
*/

use "ParentDataFull.dta";

est clear;

/*
drop if year > 2001;
levelsof year, local(levels);

foreach i of local levels{;
preserve;
keep if year == `i';

/*
sort 	CoupleType_Husband;
by 		CoupleType_Husband: 		sum 		HusbandEducation Husband_ftotval Husband_inctot 
												Husband_incwage HusbandAge [aw= Husband_wt];
sort 	CoupleType_Wife;						
by 		CoupleType_Wife: 			sum			WifeEducation Wife_ftotval Wife_inctot WifeAge Wife_incwage
												[aw= Wife_wt];
*/


sort year CoupleType;
collapse (mean) 		HusbandEducation WifeEducation Husband_ftotval 
						Wife_ftotval Husband_inctot Wife_inctot Husband_incwage 
						Wife_incwage HusbandAge WifeAge, by(year CoupleType);



save "`i'.dta", replace;
restore;
};

clear;
cls;

use "$WorkingDirectory/1950.dta";
local AppendLevels 1960 1970 1980 1990 2000 2001;
foreach i of local AppendLevels{;
append using "`i'.dta";
};
/*
Generate Couple types dummies
*/
/*
gen WW = 0;
gen WM = 0;
gen MW = 0;
gen MM = 0;

replace WW = 1 if CoupleType == "White-White";
replace WM = 1 if CoupleType == "White-Hispanic";
replace MW = 1 if CoupleType == "Hispanic-White";
replace MM = 1 if CoupleType == "Hispanic-Hispanic";
*/


tab Wife_ed_level, gen(ed_level_dummy_w);
tab Husband_ed_level, gen(ed_level_dummy_h);
save "ParentDataFull.dta", replace;

#delimit cr
*/
/*
// preserve;
// collapse (mean) AverageMotherEducation=WifeEducation AverageMotherIncome=Wife_incwage
// (mean) AverageFatherEducation=HusbandEducation AverageFatherIncome=Husband_incwage
// (sd) SD_MotherEducation=WifeEducation SD_MotherIncome=Wife_incwage
// (sd) SD_FatherEducation=HusbandEducation SD_FatherIncome=Husband_incwage [aw = hhwt]
// , by(year CoupleType);
// rename CoupleType Type;
// save "SyntheticParentsMerge.dta", replace;
// restore;
*/

/*
Regression for differences
*/
/*
#delimit;
sort year CoupleType;
by year CoupleType: sum HusbandEducation WifeEducation Husband_incwage Wife_incwage;
by year CoupleType: sum WifeEducation Wife_incwage [aw = Wife_wt];
by year CoupleType: sum HusbandEducation Husband_incwage[aw = Husband_wt];
by year CoupleType: sum ed_level_dummy_w* [aw = Wife_wt];
by year CoupleType: sum ed_level_dummy_h* [aw = Husband_wt];

by year CoupleType: sum HusbandAge WifeAge;
by year CoupleType: sum Husband_incwage Wife_incwage;
by year CoupleType: sum HusbandAge WifeAge;
*/
cls
clear all

#delimit;

global WorkingDirectory "/Users/hhadah/Dropbox/HispanicDiscrimination/MainFile/ACS_DataOutput";

cd "$WorkingDirectory";
/*
Open dataset
*/

use "ParentDataFull.dta";

est clear;
#delimit cr

label var WifeEducation "Wife's Education"
label var Wife_incwage "Wife's Income"
label var HusbandEducation "Husband's Education"
label var Husband_incwage "Husband's Income"

global sum_vars_parents WifeEducation Wife_incwage HusbandEducation Husband_incwage

// tabstat $sum_vars_parents, by(CoupleType) c(stat) stat(mean sd) nototal
// esttab using "sumstat_parents.tex", replace ///
//  cells("mean(fmt(%13.2fc)) sd(par fmt(%15.2fc))") nostar unstack nonumber ///
//   compress nonote noobs gap label booktabs f collabels("Mean" "Standard Deviation") ///
//   eqlabels("White-White" "White-Hispanic" "Hispanic-White" "Hispanic-Hispanic") 
/*
gen MM_WW = .
replace MM_WW = 1 if MM == 1
replace MM_WW = 0 if WW == 1

gen MW_WM = .
replace MW_WM = 1 if MW == 1
replace MW_WM = 0 if WM == 1

eststo ttest1: estpost ttest $sum_vars_parents, by(MM_WW) unequal
eststo ttest2: estpost ttest $sum_vars_parents, by(MW_WM) unequal

esttab ttest1 ttest2 using "sumstat_parents2.tex", replace ///
 cells("mu_1(fmt(3)) mu_2  b(star) se(par)") ///
  collabels("White-White" "Hispanic-Hispanic" "HH - WW" "S.E." "White-Hispanic" "Hispanic-White" "HW - WH" "S.E.") ///
  star(* 0.10 ** 0.05 *** 0.01) ///
  label booktabs nonum gaps f noobs compress
	


// estpost ttest $sum_vars_parents, by(MW_WM) unequal
// esttab using "sumstat_parents2.tex", append ///
// 	cells("mu_1(fmt(3)) mu_2  b(star) se(par)") ///
//   collabels("White-Hispanic" "Hispanic-White" "HW - WH" "S.E.") ///
//   star(* 0.10 ** 0.05 *** 0.01) ///
//   label booktabs nonum gaps f noobs compress

#delimit;
drop ed_level_dummy_w1;
sort CoupleType;
*/
/*
by CoupleType: sum WifeEducation Wife_incwage [aw = Wife_wt];
by CoupleType: sum HusbandEducation Husband_incwage[aw = Husband_wt];
by CoupleType: sum ed_level_dummy_h* [aw = Husband_wt];
by CoupleType: sum ed_level_dummy_w* [aw = Wife_wt];
*/
#delimit;
gen HH_education = WifeEducation + HusbandEducation;

#delimit;
preserve;

keep if YOB <= 1950 & YOB >= 1940 ;
sort CoupleType;
by CoupleType: sum WifeEducation [aw = Wife_wt];
by CoupleType: sum HusbandEducation [aw = Husband_wt];
by CoupleType: sum HH_education [aw=hhwt];
#delimit;

reg HusbandEducation 	MM MW WM [aw=  Husband_wt];
reg WifeEducation 		MM MW WM [aw=  Wife_wt];
reg HH_education 		MM MW WM [aw=hhwt];

reg HusbandEducation 	MW WW MM [aw=  Husband_wt];
reg WifeEducation 		MW WW MM [aw=  Wife_wt];
reg HH_education 		MW WW MM [aw=hhwt];
tab YOB;
restore;


#delimit;

preserve;

keep if YOB <= 1965 & YOB > 1950;
sort CoupleType;
by CoupleType: sum WifeEducation [aw = Wife_wt];
by CoupleType: sum HusbandEducation [aw = Husband_wt];
by CoupleType: sum HH_education [aw=hhwt];
#delimit;

reg HusbandEducation 	MM MW WM [aw=  Husband_wt];
reg WifeEducation 		MM MW WM [aw=  Wife_wt];
reg HH_education 		MM MW WM [aw=hhwt];

reg HusbandEducation 	MW WW MM [aw=  Husband_wt];
reg WifeEducation 		MW WW MM [aw=  Wife_wt];
reg HH_education 		MW WW MM [aw=hhwt];
tab YOB;
restore;

gen NumCoupleType = .;
replace NumCoupleType = 1 if WW == 1;
replace NumCoupleType = 2 if WM == 1;
replace NumCoupleType = 3 if MW == 1;
replace NumCoupleType = 4 if MM == 1;

reg HH_education NumCoupleType##year
margins NumCoupleType#year
marginsplot, xdimension(year)

/*
preserve
keep if WW == 1 | (MW == 1 & Hispanic_Husband == 1) | (WM == 1 & Hispanic_Wife == 1)  | (MM == 1 & Hispanic_Husband == 1 & Hispanic_Wife == 1)
sort CoupleType
* summary statistics by person type by sex
sort CoupleType
by CoupleType: sum WifeEducation  [aw = Wife_wt]
by CoupleType: sum HusbandEducation [aw = Husband_wt]

reg HusbandEducation MM MW WM [aw=  Husband_wt]
reg WifeEducation MM MW WM [aw=  Wife_wt]

reg HusbandEducation MW WW MM [aw=  Husband_wt]
reg WifeEducation MW WW MM [aw=  Wife_wt]
gen HH_education = WifeEducation + HusbandEducation
by CoupleType: sum HH_education [aw=hhwt]
reg 	HH_education MM MW WM [aw=hhwt]
reg 	HH_education MW WW MM [aw=hhwt]

restore
*/
/*
difference between HH and WW


egen County_Year = group(year countyfip);
egen County_YOB_Husband = group(year HusbandYOB);
egen County_YOB_Wife = group(year WifeYOB);

reg HusbandEducation MM MW WM [aw=  Husband_wt];
reg WifeEducation MM MW WM [aw=  Wife_wt];

reg HusbandEducation MW WW MM [aw=  Husband_wt];
reg WifeEducation MW WW MM [aw=  Wife_wt];

#delimit;
foreach i in ed_level_dummy_h1 ed_level_dummy_h2 ed_level_dummy_h3 ed_level_dummy_h4{;
reg `i' MM MW WM [aw=  Husband_wt];
reg `i' MW WW MM [aw=  Husband_wt];

};
#delimit;
foreach i in ed_level_dummy_w2 ed_level_dummy_w3 ed_level_dummy_w4 ed_level_dummy_w5{;
reg `i' MM MW WM [aw=  Wife_wt];
reg `i' MW WW MM [aw=  Wife_wt];
};
/*
** HH-WW
* males
*/
reghdfe  HusbandEducation MM MW WM    	[aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip)
reghdfe  HusbandEducation MM MW WM    	[aw=  Husband_wt], absorb(i.countyfip##HusbandYOB)
reg 	HH_education MM MW WM [aw=hhwt]
/*
* females
*/
reghdfe  WifeEducation MM MW WM    	[aw=  Wife_wt], absorb(i.WifeYOB i.countyfip)
reghdfe  WifeEducation MM MW WM    	[aw=  Wife_wt], absorb(i.countyfip##WifeYOB)
/*
** HW-WH
* males
*/
reghdfe  HusbandEducation MW WW MM    	[aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip)
reghdfe  HusbandEducation MW WW MM    	[aw=  Husband_wt], absorb(i.countyfip##HusbandYOB)
reg 	HH_education MW WW MM [aw=hhwt]

/*
* females
*/
reghdfe  WifeEducation MW WW MM    	[aw=  Wife_wt], absorb(i.WifeYOB i.countyfip)
reghdfe  WifeEducation MW WW MM    	[aw=  Wife_wt], absorb(i.countyfip##WifeYOB)

/*
** HH-WW
* males
*/
reghdfe  ed_level_dummy_h4 HH    HW    WH    	[aw=  Husband_wt], absorb(i.year i.countyfip);
reghdfe  ed_level_dummy_h4 HH    HW    WH    	[aw=  Husband_wt], absorb(i.countyfip##year);
/*
* females
*/
reghdfe  ed_level_dummy_w4 HH    HW    WH    	[aw=  Wife_wt], absorb(i.year i.countyfip);
reghdfe  ed_level_dummy_w4 HH    HW    WH    	[aw=  Wife_wt], absorb(i.countyfip##year);

reg Husband_incwage MM MW WM [aw=  Husband_wt];
reg Wife_incwage MM MW WM [aw=  Wife_wt];

reg Husband_incwage MW WW MM [aw=  Husband_wt];
reg Wife_incwage MW WW MM [aw=  Wife_wt];
/*
** HH-WW
* males
*/
reghdfe  Husband_incwage MM MW WM    	[aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip)
reghdfe  Husband_incwage MM MW WM    	[aw=  Husband_wt], absorb(i.countyfip##HusbandYOB)
/*
* females
*/
reghdfe  Wife_incwage MM MW WM    	[aw=  Wife_wt], absorb(i.WifeYOB i.countyfip)
reghdfe  Wife_incwage MM MW WM    	[aw=  Wife_wt], absorb(i.countyfip##WifeYOB)

/*
** HW-WH
* males
*/
reghdfe  Husband_incwage MW WW MM    	[aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip)
reghdfe  Husband_incwage MW WW MM    	[aw=  Husband_wt], absorb(i.countyfip##HusbandYOB)
/*
* females
*/
reghdfe  Wife_incwage MW WW MM    	[aw=  Wife_wt], absorb(i.WifeYOB i.countyfip)
reghdfe  Wife_incwage MW WW MM    	[aw=  Wife_wt], absorb(i.countyfip##WifeYOB)

#delimit;
foreach i in ed_level_dummy_h1 ed_level_dummy_h2 ed_level_dummy_h3 ed_level_dummy_h4{;
reghdfe `i' MM MW WM [aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip);
reghdfe `i' MW WW MM [aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip);

};
#delimit;
foreach i in ed_level_dummy_h1 ed_level_dummy_h2 ed_level_dummy_h3 ed_level_dummy_h4{;
reghdfe `i' MM MW WM [aw=  Husband_wt], absorb(i.countyfip##HusbandYOB);
reghdfe `i' MW WW MM [aw=  Husband_wt], absorb(i.countyfip##HusbandYOB);

};
#delimit;
foreach i in  ed_level_dummy_w2 ed_level_dummy_w3 ed_level_dummy_w4 ed_level_dummy_w5{;
reghdfe `i' MM MW WM [aw=  Wife_wt], absorb(i.WifeYOB i.countyfip);
reghdfe `i' MW WW MM [aw=  Wife_wt], absorb(i.WifeYOB i.countyfip);
reghdfe `i' MM MW WM [aw=  Wife_wt], absorb(i.countyfip##WifeYOB);
reghdfe `i' MW WW MM [aw=  Wife_wt], absorb(i.countyfip##WifeYOB);
};

/*
reg HusbandAge MM MW WM;
reg WifeAge MM MW WM;

reg Husband_ftotval MM MW WM;



/*
difference between MW and WM
*/

reg HusbandEducation MW WW MM;
reg WifeEducation MW WW MM;
** HH-WW
* males
reghdfe  HusbandEducation MW WW MM    	[aw=  Husband_wt], absorb(i.HusbandYOB i.countyfip);
reghdfe  HusbandEducation MW WW MM    	[aw=  Husband_wt], absorb(i.countyfip##HusbandYOB);
* females
reghdfe  WifeEducation MW WW MM    	[aw=  Wife_wt], absorb(i.WifeYOB i.countyfip);
reghdfe  WifeEducation MW WW MM    	[aw=  Wife_wt], absorb(i.countyfip##WifeYOB);

** HH-WW
* males
reghdfe  ed_level_dummy_h4 MW WW MM    	[aw=  Husband_wt], absorb(i.year i.countyfip);
reghdfe  ed_level_dummy_h4 MW WW MM    	[aw=  Husband_wt], absorb(i.countyfip##year);
* females
reghdfe  ed_level_dummy_w4 MW WW MM    	[aw=  Wife_wt], absorb(i.year i.countyfip);
reghdfe  ed_level_dummy_w4 MW WW MM    	[aw=  Wife_wt], absorb(i.countyfip##year);

reg Husband_incwage MW WW MM;
reg Wife_incwage MW WW MM;
** HH-WW
* males
reghdfe  Husband_incwage MW WW MM    	[aw=  Husband_wt], absorb(i.year i.countyfip);
reghdfe  Husband_incwage MW WW MM    	[aw=  Husband_wt], absorb(i.countyfip##year);
* females
reghdfe  Husband_incwage MW WW MM    	[aw=  Wife_wt], absorb(i.year i.countyfip);
reghdfe  Husband_incwage MW WW MM    	[aw=  Wife_wt], absorb(i.countyfip##year);


reg HusbandAge MW WW MM;
reg WifeAge MW WW MM;

reg Husband_ftotval MW WW MM;

#delimit;
xi: reg HusbandEducation MW WW MM i.HusbandYOB, cluster(HusbandYOB);
xi: reg WifeEducation MW WW MM i.WifeYOB, cluster(WifeYOB);

xi: reg Husband_incwage MW WW MM i.HusbandYOB, cluster(HusbandYOB);
xi: reg Wife_incwage MW WW MM i.WifeYOB, cluster(WifeYOB);

xi: reg HusbandEducation MW WW MM i.HusbandYOB, cluster(countyfip);
xi: reg WifeEducation MW WW MM i.WifeYOB, cluster(WifeYOB);

xi: reg Husband_incwage MW WW MM i.HusbandYOB, cluster(HusbandYOB);
xi: reg Wife_incwage MW WW MM i.WifeYOB, cluster(WifeYOB);

#delimit;
foreach i in ed_level_dummy_h1 ed_level_dummy_h2 ed_level_dummy_h3 ed_level_dummy_h4{;
reghdfe `i' MM MW WM, absorb(HusbandYOB region) cluster(Husband_fbpl region);
reghdfe `i' MW WW MM, absorb(HusbandYOB region) cluster(Husband_fbpl region);

};
#delimit;
foreach i in ed_level_dummy_w1 ed_level_dummy_w2 ed_level_dummy_w3 ed_level_dummy_w4{;
reghdfe `i' MM MW WM, absorb(WifeYOB region);
reghdfe `i' MW WW MM, absorb(WifeYOB region);
};

/*
The following regression's
differences are statistically insignificant
*/
reghdfe HusbandEducation MW WW MM, absorb(HusbandYOB region) cluster(Husband_fbpl region);
/*
Define an ordinal couple type var
*/
gen CoupleTypeOrd=cond(CoupleType == "LA LA",1,0);
replace CoupleTypeOrd=cond(CoupleType == "LA White", 2, CoupleTypeOrd);
replace CoupleTypeOrd=cond(CoupleType == "White LA",3,CoupleTypeOrd);
replace CoupleTypeOrd=cond(CoupleType == "White White", 4, CoupleTypeOrd);

label define CoupleTypeOrd_levell 	1 "LA LA" 
						2 "LA White" 
						3 "White LA" 
						4 "White White";
label values CoupleTypeOrd CoupleTypeOrd_levell;
#delimit
/*
Mrgin plot for husband's
education for the four groups
*/
reg HusbandEducation i.CoupleTypeOrd##year;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Husband's Education") xlabel(, angle(45));
graph export "HusbandEd.pdf", replace;
/*
Mrgin plot for wife's
education for the four groups
*/
reg WifeEducation i.CoupleTypeOrd##year;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Wife's Education") xlabel(, angle(45));
graph export "WifeEd.pdf", replace;

/*
Mrgin plot for husband's
income for the four groups
*/
reg Husband_incwage i.CoupleTypeOrd##year;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Husband's Income") xlabel(, angle(45));
graph export "HusbandIncome.pdf", replace;

/*
Mrgin plot for wife's
income for the four groups
*/
reg Wife_incwage i.CoupleTypeOrd##year;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Wife's Income") xlabel(, angle(45));
graph export "WifeIncome.pdf", replace;

/*
Mrgin plot for husband's
age for the four groups
*/
reg HusbandAge i.CoupleTypeOrd##year;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Husband's Age") xlabel(, angle(45));
graph export "HusbandAge.pdf", replace;

/*
Mrgin plot for wife's
age for the four groups
*/
reg WifeAge i.CoupleTypeOrd##year;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Wife's Age") xlabel(, angle(45));
graph export "WifeAge.pdf", replace;

/*
Mrgin plot total family income 
for the four groups
*/
reg Husband_ftotval i.CoupleTypeOrd##year if Husband_ftotval<9999998;
margins CoupleTypeOrd#year;
marginsplot, xdimension(year) title("Total Family Income") xlabel(, angle(45));
graph export "TotalFamIncome.pdf", replace;

/*
difference between MW and WM
*/
*save "Appended.dta", replace;

cls;
clear all;
*/
*/
