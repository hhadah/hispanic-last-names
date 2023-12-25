* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

cd "/Users/hhadah/Dropbox/Research/My Research Data and Ideas/hispanic-last-names/data/raw"

* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                       ///
  int     year             1-4      ///
  long    serial           5-9      ///
  byte    month            10-11    ///
  double  hwtfinl          12-21    ///
  double  cpsid            22-35    ///
  byte    asecflag         36-36    ///
  byte    hflag            37-37    ///
  double  asecwth          38-47    ///
  double  asecwth04        48-55    ///
  double  cpi99            56-59    ///
  byte    region           60-61    ///
  byte    statefip         62-63    ///
  long    county           64-68    ///
  byte    statecensus      69-70    ///
  long    metfips          71-75    ///
  byte    individcc        76-76    ///
  double  hhincome         77-84    ///
  int     faminc           85-87    ///
  byte    pernum           88-89    ///
  double  wtfinl           90-103   ///
  double  cpsidp           104-117  ///
  double  asecwt           118-127  ///
  byte    age              128-129  ///
  byte    sex              130-130  ///
  int     race             131-133  ///
  byte    marst            134-134  ///
  byte    nchild           135-135  ///
  long    bpl              136-140  ///
  int     yrimmig          141-144  ///
  byte    citizen          145-145  ///
  long    mbpl             146-150  ///
  long    fbpl             151-155  ///
  byte    nativity         156-156  ///
  int     hispan           157-159  ///
  byte    empstat          160-161  ///
  byte    labforce         162-162  ///
  int     occ              163-166  ///
  int     ind1990          167-169  ///
  int     ind1950          170-172  ///
  byte    classwkr         173-174  ///
  int     uhrsworkt        175-177  ///
  int     ahrsworkt        178-180  ///
  byte    wkstat           181-182  ///
  int     educ             183-185  ///
  double  asecwt04         186-193  ///
  double  earnwt           194-203  ///
  int     occly            204-207  ///
  int     indly            208-211  ///
  byte    classwly         212-213  ///
  byte    workly           214-215  ///
  byte    wkswork1         216-217  ///
  byte    wkswork2         218-218  ///
  int     uhrsworkly       219-221  ///
  byte    fullpart         222-222  ///
  double  ftotval          223-232  ///
  double  inctot           233-241  ///
  double  incwage          242-249  ///
  double  hourwage         250-254  ///
  byte    paidhour         255-255  ///
  double  earnweek         256-263  ///
  int     uhrsworkorg      264-266  ///
  byte    age_head         267-268  ///
  byte    age_sp           269-270  ///
  byte    sex_head         271-271  ///
  byte    sex_sp           272-272  ///
  int     race_head        273-275  ///
  int     race_sp          276-278  ///
  byte    marst_head       279-279  ///
  byte    marst_sp         280-280  ///
  byte    nchild_head      281-281  ///
  byte    nchild_sp        282-282  ///
  long    bpl_head         283-287  ///
  long    bpl_sp           288-292  ///
  byte    citizen_head     293-293  ///
  byte    citizen_sp       294-294  ///
  long    mbpl_head        295-299  ///
  long    mbpl_sp          300-304  ///
  long    fbpl_head        305-309  ///
  long    fbpl_sp          310-314  ///
  byte    nativity_head    315-315  ///
  byte    nativity_sp      316-316  ///
  int     hispan_head      317-319  ///
  int     hispan_sp        320-322  ///
  byte    empstat_head     323-324  ///
  byte    empstat_sp       325-326  ///
  byte    labforce_head    327-327  ///
  byte    labforce_sp      328-328  ///
  int     occ_head         329-332  ///
  int     occ_sp           333-336  ///
  int     ind1990_head     337-339  ///
  int     ind1990_sp       340-342  ///
  int     ind1950_head     343-345  ///
  int     ind1950_sp       346-348  ///
  byte    classwkr_head    349-350  ///
  byte    classwkr_sp      351-352  ///
  int     uhrsworkt_head   353-355  ///
  int     uhrsworkt_sp     356-358  ///
  int     ahrsworkt_head   359-361  ///
  int     ahrsworkt_sp     362-364  ///
  byte    wkstat_head      365-366  ///
  byte    wkstat_sp        367-368  ///
  int     educ_head        369-371  ///
  int     educ_sp          372-374  ///
  double  asecwt04_head    375-382  ///
  double  asecwt04_sp      383-390  ///
  double  earnwt_head      391-400  ///
  double  earnwt_sp        401-410  ///
  int     occly_head       411-414  ///
  int     occly_sp         415-418  ///
  int     indly_head       419-422  ///
  int     indly_sp         423-426  ///
  byte    workly_head      427-428  ///
  byte    workly_sp        429-430  ///
  byte    wkswork1_head    431-432  ///
  byte    wkswork1_sp      433-434  ///
  byte    wkswork2_head    435-435  ///
  byte    wkswork2_sp      436-436  ///
  int     uhrsworkly_head  437-439  ///
  int     uhrsworkly_sp    440-442  ///
  byte    fullpart_head    443-443  ///
  byte    fullpart_sp      444-444  ///
  double  ftotval_head     445-454  ///
  double  ftotval_sp       455-464  ///
  double  inctot_head      465-473  ///
  double  inctot_sp        474-482  ///
  double  incwage_head     483-490  ///
  double  incwage_sp       491-498  ///
  double  hourwage_head    499-503  ///
  double  hourwage_sp      504-508  ///
  using `"cps_00024.dat"'

replace hwtfinl         = hwtfinl         / 10000
replace asecwth         = asecwth         / 10000
replace asecwth04       = asecwth04       / 100
replace cpi99           = cpi99           / 1000
replace wtfinl          = wtfinl          / 10000
replace asecwt          = asecwt          / 10000
replace asecwt04        = asecwt04        / 100
replace earnwt          = earnwt          / 10000
replace hourwage        = hourwage        / 100
replace earnweek        = earnweek        / 100
replace asecwt04_head   = asecwt04_head   / 100
replace asecwt04_sp     = asecwt04_sp     / 100
replace earnwt_head     = earnwt_head     / 10000
replace earnwt_sp       = earnwt_sp       / 10000
replace hourwage_head   = hourwage_head   / 100
replace hourwage_sp     = hourwage_sp     / 100

format hwtfinl         %10.4f
format cpsid           %14.0g
format asecwth         %10.4f
format asecwth04       %8.2f
format cpi99           %4.3f
format hhincome        %8.0g
format wtfinl          %14.4f
format cpsidp          %14.0g
format asecwt          %10.4f
format asecwt04        %8.2f
format earnwt          %10.4f
format ftotval         %10.0g
format inctot          %9.0g
format incwage         %8.0g
format hourwage        %5.2f
format earnweek        %8.2f
format asecwt04_head   %8.2f
format asecwt04_sp     %8.2f
format earnwt_head     %10.4f
format earnwt_sp       %10.4f
format ftotval_head    %10.0g
format ftotval_sp      %10.0g
format inctot_head     %9.0g
format inctot_sp       %9.0g
format incwage_head    %8.0g
format incwage_sp      %8.0g
format hourwage_head   %5.2f
format hourwage_sp     %5.2f

label var year            `"Survey year"'
label var serial          `"Household serial number"'
label var month           `"Month"'
label var hwtfinl         `"Household weight, Basic Monthly"'
label var cpsid           `"CPSID, household record"'
label var asecflag        `"Flag for ASEC"'
label var hflag           `"Flag for the 3/8 file 2014"'
label var asecwth         `"Annual Social and Economic Supplement Household weight"'
label var asecwth04       `"Household weight 2004"'
label var cpi99           `"CPI-U adjustment factor to 1999 dollars"'
label var region          `"Region and division"'
label var statefip        `"State (FIPS code)"'
label var county          `"FIPS county code"'
label var statecensus     `"State (Census code)"'
label var metfips         `"Metropolitan area FIPS code"'
label var individcc       `"Individual principal city"'
label var hhincome        `"Total household income"'
label var faminc          `"Family income of householder"'
label var pernum          `"Person number in sample unit"'
label var wtfinl          `"Final Basic Weight"'
label var cpsidp          `"CPSID, person record"'
label var asecwt          `"Annual Social and Economic Supplement Weight"'
label var age             `"Age"'
label var sex             `"Sex"'
label var race            `"Race"'
label var marst           `"Marital status"'
label var nchild          `"Number of own children in household"'
label var bpl             `"Birthplace"'
label var yrimmig         `"Year of immigration"'
label var citizen         `"Citizenship status"'
label var mbpl            `"Mother's birthplace"'
label var fbpl            `"Father's birthplace"'
label var nativity        `"Foreign birthplace or parentage"'
label var hispan          `"Hispanic origin"'
label var empstat         `"Employment status"'
label var labforce        `"Labor force status"'
label var occ             `"Occupation"'
label var ind1990         `"Industry, 1990 basis"'
label var ind1950         `"Industry, 1950 basis"'
label var classwkr        `"Class of worker"'
label var uhrsworkt       `"Hours usually worked per week at all jobs"'
label var ahrsworkt       `"Hours worked last week"'
label var wkstat          `"Full or part time status"'
label var educ            `"Educational attainment recode"'
label var asecwt04        `"Person weight 2004"'
label var earnwt          `"Earnings weight"'
label var occly           `"Occupation last year"'
label var indly           `"Industry last year"'
label var classwly        `"Class of worker last year"'
label var workly          `"Worked last year"'
label var wkswork1        `"Weeks worked last year"'
label var wkswork2        `"Weeks worked last year, intervalled"'
label var uhrsworkly      `"Usual hours worked per week (last yr)"'
label var fullpart        `"Worked full or part time last year"'
label var ftotval         `"Total family income"'
label var inctot          `"Total personal income"'
label var incwage         `"Wage and salary income"'
label var hourwage        `"Hourly wage"'
label var paidhour        `"Paid by the hour"'
label var earnweek        `"Weekly earnings"'
label var uhrsworkorg     `"Usual hours worked per week, outgoing rotation groups"'
label var age_head        `"Age [of Location of householder]"'
label var age_sp          `"Age [of Person number of spouse (from programming)]"'
label var sex_head        `"Sex [of Location of householder]"'
label var sex_sp          `"Sex [of Person number of spouse (from programming)]"'
label var race_head       `"Race [of Location of householder]"'
label var race_sp         `"Race [of Person number of spouse (from programming)]"'
label var marst_head      `"Marital status [of Location of householder]"'
label var marst_sp        `"Marital status [of Person number of spouse (from programming)]"'
label var nchild_head     `"Number of own children in household [of Location of householder]"'
label var nchild_sp       `"Number of own children in household [of Person number of spouse (from programmin"'
label var bpl_head        `"Birthplace [of Location of householder]"'
label var bpl_sp          `"Birthplace [of Person number of spouse (from programming)]"'
label var citizen_head    `"Citizenship status [of Location of householder]"'
label var citizen_sp      `"Citizenship status [of Person number of spouse (from programming)]"'
label var mbpl_head       `"Mother's birthplace [of Location of householder]"'
label var mbpl_sp         `"Mother's birthplace [of Person number of spouse (from programming)]"'
label var fbpl_head       `"Father's birthplace [of Location of householder]"'
label var fbpl_sp         `"Father's birthplace [of Person number of spouse (from programming)]"'
label var nativity_head   `"Foreign birthplace or parentage [of Location of householder]"'
label var nativity_sp     `"Foreign birthplace or parentage [of Person number of spouse (from programming)]"'
label var hispan_head     `"Hispanic origin [of Location of householder]"'
label var hispan_sp       `"Hispanic origin [of Person number of spouse (from programming)]"'
label var empstat_head    `"Employment status [of Location of householder]"'
label var empstat_sp      `"Employment status [of Person number of spouse (from programming)]"'
label var labforce_head   `"Labor force status [of Location of householder]"'
label var labforce_sp     `"Labor force status [of Person number of spouse (from programming)]"'
label var occ_head        `"Occupation [of Location of householder]"'
label var occ_sp          `"Occupation [of Person number of spouse (from programming)]"'
label var ind1990_head    `"Industry, 1990 basis [of Location of householder]"'
label var ind1990_sp      `"Industry, 1990 basis [of Person number of spouse (from programming)]"'
label var ind1950_head    `"Industry, 1950 basis [of Location of householder]"'
label var ind1950_sp      `"Industry, 1950 basis [of Person number of spouse (from programming)]"'
label var classwkr_head   `"Class of worker [of Location of householder]"'
label var classwkr_sp     `"Class of worker [of Person number of spouse (from programming)]"'
label var uhrsworkt_head  `"Hours usually worked per week at all jobs [of Location of householder]"'
label var uhrsworkt_sp    `"Hours usually worked per week at all jobs [of Person number of spouse (from prog"'
label var ahrsworkt_head  `"Hours worked last week [of Location of householder]"'
label var ahrsworkt_sp    `"Hours worked last week [of Person number of spouse (from programming)]"'
label var wkstat_head     `"Full or part time status [of Location of householder]"'
label var wkstat_sp       `"Full or part time status [of Person number of spouse (from programming)]"'
label var educ_head       `"Educational attainment recode [of Location of householder]"'
label var educ_sp         `"Educational attainment recode [of Person number of spouse (from programming)]"'
label var asecwt04_head   `"Person weight 2004 [of Location of householder]"'
label var asecwt04_sp     `"Person weight 2004 [of Person number of spouse (from programming)]"'
label var earnwt_head     `"Earnings weight [of Location of householder]"'
label var earnwt_sp       `"Earnings weight [of Person number of spouse (from programming)]"'
label var occly_head      `"Occupation last year [of Location of householder]"'
label var occly_sp        `"Occupation last year [of Person number of spouse (from programming)]"'
label var indly_head      `"Industry last year [of Location of householder]"'
label var indly_sp        `"Industry last year [of Person number of spouse (from programming)]"'
label var workly_head     `"Worked last year [of Location of householder]"'
label var workly_sp       `"Worked last year [of Person number of spouse (from programming)]"'
label var wkswork1_head   `"Weeks worked last year [of Location of householder]"'
label var wkswork1_sp     `"Weeks worked last year [of Person number of spouse (from programming)]"'
label var wkswork2_head   `"Weeks worked last year, intervalled [of Location of householder]"'
label var wkswork2_sp     `"Weeks worked last year, intervalled [of Person number of spouse (from programmin"'
label var uhrsworkly_head `"Usual hours worked per week (last yr) [of Location of householder]"'
label var uhrsworkly_sp   `"Usual hours worked per week (last yr) [of Person number of spouse (from programm"'
label var fullpart_head   `"Worked full or part time last year [of Location of householder]"'
label var fullpart_sp     `"Worked full or part time last year [of Person number of spouse (from programming"'
label var ftotval_head    `"Total family income [of Location of householder]"'
label var ftotval_sp      `"Total family income [of Person number of spouse (from programming)]"'
label var inctot_head     `"Total personal income [of Location of householder]"'
label var inctot_sp       `"Total personal income [of Person number of spouse (from programming)]"'
label var incwage_head    `"Wage and salary income [of Location of householder]"'
label var incwage_sp      `"Wage and salary income [of Person number of spouse (from programming)]"'
label var hourwage_head   `"Hourly wage [of Location of householder]"'
label var hourwage_sp     `"Hourly wage [of Person number of spouse (from programming)]"'

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define asecflag_lbl 1 `"ASEC"'
label define asecflag_lbl 2 `"March Basic"', add
label values asecflag asecflag_lbl

label define hflag_lbl 0 `"5/8 file"'
label define hflag_lbl 1 `"3/8 file"', add
label values hflag hflag_lbl

label define region_lbl 11 `"New England Division"'
label define region_lbl 12 `"Middle Atlantic Division"', add
label define region_lbl 21 `"East North Central Division"', add
label define region_lbl 22 `"West North Central Division"', add
label define region_lbl 31 `"South Atlantic Division"', add
label define region_lbl 32 `"East South Central Division"', add
label define region_lbl 33 `"West South Central Division"', add
label define region_lbl 41 `"Mountain Division"', add
label define region_lbl 42 `"Pacific Division"', add
label define region_lbl 97 `"State not identified"', add
label values region region_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 69 `"Nebraska-North Dakota-South Dakota"', add
label define statefip_lbl 70 `"Maine-Massachusetts-New Hampshire-Rhode Island-Vermont"', add
label define statefip_lbl 71 `"Michigan-Wisconsin"', add
label define statefip_lbl 72 `"Minnesota-Iowa"', add
label define statefip_lbl 73 `"Nebraska-North Dakota-South Dakota-Kansas"', add
label define statefip_lbl 74 `"Delaware-Virginia"', add
label define statefip_lbl 75 `"North Carolina-South Carolina"', add
label define statefip_lbl 76 `"Alabama-Mississippi"', add
label define statefip_lbl 77 `"Arkansas-Oklahoma"', add
label define statefip_lbl 78 `"Arizona-New Mexico-Colorado"', add
label define statefip_lbl 79 `"Idaho-Wyoming-Utah-Montana-Nevada"', add
label define statefip_lbl 80 `"Alaska-Washington-Hawaii"', add
label define statefip_lbl 81 `"New Hampshire-Maine-Vermont-Rhode Island"', add
label define statefip_lbl 83 `"South Carolina-Georgia"', add
label define statefip_lbl 84 `"Kentucky-Tennessee"', add
label define statefip_lbl 85 `"Arkansas-Louisiana-Oklahoma"', add
label define statefip_lbl 87 `"Iowa-N Dakota-S Dakota-Nebraska-Kansas-Minnesota-Missouri"', add
label define statefip_lbl 88 `"Washington-Oregon-Alaska-Hawaii"', add
label define statefip_lbl 89 `"Montana-Wyoming-Colorado-New Mexico-Utah-Nevada-Arizona"', add
label define statefip_lbl 90 `"Delaware-Maryland-Virginia-West Virginia"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define statecensus_lbl 00 `"Unknown"'
label define statecensus_lbl 11 `"Maine"', add
label define statecensus_lbl 12 `"New Hampshire"', add
label define statecensus_lbl 13 `"Vermont"', add
label define statecensus_lbl 14 `"Massachusetts"', add
label define statecensus_lbl 15 `"Rhode Island"', add
label define statecensus_lbl 16 `"Connecticut"', add
label define statecensus_lbl 19 `"Maine, New Hampshire, Vermont, Rhode Island"', add
label define statecensus_lbl 21 `"New York"', add
label define statecensus_lbl 22 `"New Jersey"', add
label define statecensus_lbl 23 `"Pennsylvania"', add
label define statecensus_lbl 31 `"Ohio"', add
label define statecensus_lbl 32 `"Indiana"', add
label define statecensus_lbl 33 `"Illinois"', add
label define statecensus_lbl 34 `"Michigan"', add
label define statecensus_lbl 35 `"Wisconsin"', add
label define statecensus_lbl 39 `"Michigan, Wisconsin"', add
label define statecensus_lbl 41 `"Minnesota"', add
label define statecensus_lbl 42 `"Iowa"', add
label define statecensus_lbl 43 `"Missouri"', add
label define statecensus_lbl 44 `"North Dakota"', add
label define statecensus_lbl 45 `"South Dakota"', add
label define statecensus_lbl 46 `"Nebraska"', add
label define statecensus_lbl 47 `"Kansas"', add
label define statecensus_lbl 49 `"Minnesota, Iowa, Missouri, North Dakota, South Dakota, Nebraska, Kansas"', add
label define statecensus_lbl 50 `"Delaware, Maryland, Virginia, West Virginia"', add
label define statecensus_lbl 51 `"Delaware"', add
label define statecensus_lbl 52 `"Maryland"', add
label define statecensus_lbl 53 `"District of Columbia"', add
label define statecensus_lbl 54 `"Virginia"', add
label define statecensus_lbl 55 `"West Virginia"', add
label define statecensus_lbl 56 `"North Carolina"', add
label define statecensus_lbl 57 `"South Carolina"', add
label define statecensus_lbl 58 `"Georgia"', add
label define statecensus_lbl 59 `"Florida"', add
label define statecensus_lbl 60 `"South Carolina, Georgia"', add
label define statecensus_lbl 61 `"Kentucky"', add
label define statecensus_lbl 62 `"Tennessee"', add
label define statecensus_lbl 63 `"Alabama"', add
label define statecensus_lbl 64 `"Mississippi"', add
label define statecensus_lbl 67 `"Kentucky, Tennessee"', add
label define statecensus_lbl 69 `"Alabama, Mississippi"', add
label define statecensus_lbl 71 `"Arkansas"', add
label define statecensus_lbl 72 `"Louisiana"', add
label define statecensus_lbl 73 `"Oklahoma"', add
label define statecensus_lbl 74 `"Texas"', add
label define statecensus_lbl 79 `"Arkansas, Louisiana, Oklahoma"', add
label define statecensus_lbl 81 `"Montana"', add
label define statecensus_lbl 82 `"Idaho"', add
label define statecensus_lbl 83 `"Wyoming"', add
label define statecensus_lbl 84 `"Colorado"', add
label define statecensus_lbl 85 `"New Mexico"', add
label define statecensus_lbl 86 `"Arizona"', add
label define statecensus_lbl 87 `"Utah"', add
label define statecensus_lbl 88 `"Nevada"', add
label define statecensus_lbl 89 `"Montana, Idaho, Wyoming, Colorado, New Mexico, Arizona, Utah, Nevada"', add
label define statecensus_lbl 91 `"Washington"', add
label define statecensus_lbl 92 `"Oregon"', add
label define statecensus_lbl 93 `"California"', add
label define statecensus_lbl 94 `"Alaska"', add
label define statecensus_lbl 95 `"Hawaii"', add
label define statecensus_lbl 99 `"Washington, Oregon, Alaska, Hawaii"', add
label values statecensus statecensus_lbl

label define faminc_lbl 100 `"Under $5,000"'
label define faminc_lbl 110 `"Under $1,000"', add
label define faminc_lbl 111 `"Under $500"', add
label define faminc_lbl 112 `"$500 - 999"', add
label define faminc_lbl 120 `"$1,000 - 1,999"', add
label define faminc_lbl 121 `"$1,000 - 1,499"', add
label define faminc_lbl 122 `"$1,500-1,999"', add
label define faminc_lbl 130 `"$2,000 - 2,999"', add
label define faminc_lbl 131 `"$2,000 - 2,499"', add
label define faminc_lbl 132 `"$2,500 - 2,999"', add
label define faminc_lbl 140 `"$3,000 - 3,999"', add
label define faminc_lbl 141 `"$3,000 - 3,499"', add
label define faminc_lbl 142 `"$3,500 - 3,999"', add
label define faminc_lbl 150 `"$4,000 - 4,999"', add
label define faminc_lbl 200 `"$5,000 - 7,999"', add
label define faminc_lbl 210 `"$5,000 - 7,499"', add
label define faminc_lbl 220 `"$5,000 - 5,999"', add
label define faminc_lbl 230 `"$6,000 - 7,999"', add
label define faminc_lbl 231 `"$6,000 - 7,499"', add
label define faminc_lbl 232 `"$6,000 - 6,999"', add
label define faminc_lbl 233 `"$7,000 - 7,499"', add
label define faminc_lbl 234 `"$7,000 - 7,999"', add
label define faminc_lbl 300 `"$7,500 - 9,999"', add
label define faminc_lbl 310 `"$7,500 - 7,999"', add
label define faminc_lbl 320 `"$8,000 - 8,499"', add
label define faminc_lbl 330 `"$8,500 - 8,999"', add
label define faminc_lbl 340 `"$8,000 - 8,999"', add
label define faminc_lbl 350 `"$9,000 - 9,999"', add
label define faminc_lbl 400 `"$10,000 - 14,999"', add
label define faminc_lbl 410 `"$10,000 - 10,999"', add
label define faminc_lbl 420 `"$11,000 - 11,999"', add
label define faminc_lbl 430 `"$10,000 - 12,499"', add
label define faminc_lbl 440 `"$10,000 - 11,999"', add
label define faminc_lbl 450 `"$12,000 - 12,999"', add
label define faminc_lbl 460 `"$12,000 - 14,999"', add
label define faminc_lbl 470 `"$12,500 - 14,999"', add
label define faminc_lbl 480 `"$13,000 - 13,999"', add
label define faminc_lbl 490 `"$14,000 - 14,999"', add
label define faminc_lbl 500 `"$15,000 - 19,999"', add
label define faminc_lbl 510 `"$15,000 - 15,999"', add
label define faminc_lbl 520 `"$16,000 - 16,999"', add
label define faminc_lbl 530 `"$17,000 - 17,999"', add
label define faminc_lbl 540 `"$15,000 - 17,499"', add
label define faminc_lbl 550 `"$17,500 - 19,999"', add
label define faminc_lbl 560 `"$18,000 - 19,999"', add
label define faminc_lbl 600 `"$20,000 - 24,999"', add
label define faminc_lbl 700 `"$25,000 - 49,999"', add
label define faminc_lbl 710 `"$25,000 - 29,999"', add
label define faminc_lbl 720 `"$30,000 - 34,999"', add
label define faminc_lbl 730 `"$35,000 - 39,999"', add
label define faminc_lbl 740 `"$40,000 - 49,999"', add
label define faminc_lbl 800 `"$50,000 and over"', add
label define faminc_lbl 810 `"$50,000 - 74,999"', add
label define faminc_lbl 820 `"$50,000 - 59,999"', add
label define faminc_lbl 830 `"$60,000 - 74,999"', add
label define faminc_lbl 840 `"$75,000 and over"', add
label define faminc_lbl 841 `"$75,000 - 99,999"', add
label define faminc_lbl 842 `"$100,000 - 149,999"', add
label define faminc_lbl 843 `"$150,000 and over"', add
label define faminc_lbl 995 `"Missing"', add
label define faminc_lbl 996 `"Refused"', add
label define faminc_lbl 997 `"Don't know"', add
label define faminc_lbl 999 `"Blank"', add
label values faminc faminc_lbl

label define age_lbl 00 `"Under 1 year"'
label define age_lbl 01 `"1"', add
label define age_lbl 02 `"2"', add
label define age_lbl 03 `"3"', add
label define age_lbl 04 `"4"', add
label define age_lbl 05 `"5"', add
label define age_lbl 06 `"6"', add
label define age_lbl 07 `"7"', add
label define age_lbl 08 `"8"', add
label define age_lbl 09 `"9"', add
label define age_lbl 10 `"10"', add
label define age_lbl 11 `"11"', add
label define age_lbl 12 `"12"', add
label define age_lbl 13 `"13"', add
label define age_lbl 14 `"14"', add
label define age_lbl 15 `"15"', add
label define age_lbl 16 `"16"', add
label define age_lbl 17 `"17"', add
label define age_lbl 18 `"18"', add
label define age_lbl 19 `"19"', add
label define age_lbl 20 `"20"', add
label define age_lbl 21 `"21"', add
label define age_lbl 22 `"22"', add
label define age_lbl 23 `"23"', add
label define age_lbl 24 `"24"', add
label define age_lbl 25 `"25"', add
label define age_lbl 26 `"26"', add
label define age_lbl 27 `"27"', add
label define age_lbl 28 `"28"', add
label define age_lbl 29 `"29"', add
label define age_lbl 30 `"30"', add
label define age_lbl 31 `"31"', add
label define age_lbl 32 `"32"', add
label define age_lbl 33 `"33"', add
label define age_lbl 34 `"34"', add
label define age_lbl 35 `"35"', add
label define age_lbl 36 `"36"', add
label define age_lbl 37 `"37"', add
label define age_lbl 38 `"38"', add
label define age_lbl 39 `"39"', add
label define age_lbl 40 `"40"', add
label define age_lbl 41 `"41"', add
label define age_lbl 42 `"42"', add
label define age_lbl 43 `"43"', add
label define age_lbl 44 `"44"', add
label define age_lbl 45 `"45"', add
label define age_lbl 46 `"46"', add
label define age_lbl 47 `"47"', add
label define age_lbl 48 `"48"', add
label define age_lbl 49 `"49"', add
label define age_lbl 50 `"50"', add
label define age_lbl 51 `"51"', add
label define age_lbl 52 `"52"', add
label define age_lbl 53 `"53"', add
label define age_lbl 54 `"54"', add
label define age_lbl 55 `"55"', add
label define age_lbl 56 `"56"', add
label define age_lbl 57 `"57"', add
label define age_lbl 58 `"58"', add
label define age_lbl 59 `"59"', add
label define age_lbl 60 `"60"', add
label define age_lbl 61 `"61"', add
label define age_lbl 62 `"62"', add
label define age_lbl 63 `"63"', add
label define age_lbl 64 `"64"', add
label define age_lbl 65 `"65"', add
label define age_lbl 66 `"66"', add
label define age_lbl 67 `"67"', add
label define age_lbl 68 `"68"', add
label define age_lbl 69 `"69"', add
label define age_lbl 70 `"70"', add
label define age_lbl 71 `"71"', add
label define age_lbl 72 `"72"', add
label define age_lbl 73 `"73"', add
label define age_lbl 74 `"74"', add
label define age_lbl 75 `"75"', add
label define age_lbl 76 `"76"', add
label define age_lbl 77 `"77"', add
label define age_lbl 78 `"78"', add
label define age_lbl 79 `"79"', add
label define age_lbl 80 `"80"', add
label define age_lbl 81 `"81"', add
label define age_lbl 82 `"82"', add
label define age_lbl 83 `"83"', add
label define age_lbl 84 `"84"', add
label define age_lbl 85 `"85"', add
label define age_lbl 86 `"86"', add
label define age_lbl 87 `"87"', add
label define age_lbl 88 `"88"', add
label define age_lbl 89 `"89"', add
label define age_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_lbl 91 `"91"', add
label define age_lbl 92 `"92"', add
label define age_lbl 93 `"93"', add
label define age_lbl 94 `"94"', add
label define age_lbl 95 `"95"', add
label define age_lbl 96 `"96"', add
label define age_lbl 97 `"97"', add
label define age_lbl 98 `"98"', add
label define age_lbl 99 `"99+"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"NIU"', add
label values sex sex_lbl

label define race_lbl 100 `"White"'
label define race_lbl 200 `"Black/Negro"', add
label define race_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_lbl 650 `"Asian or Pacific Islander"', add
label define race_lbl 651 `"Asian only"', add
label define race_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_lbl 700 `"Other (single) race, n.e.c."', add
label define race_lbl 801 `"White-Black"', add
label define race_lbl 802 `"White-American Indian"', add
label define race_lbl 803 `"White-Asian"', add
label define race_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_lbl 805 `"Black-American Indian"', add
label define race_lbl 806 `"Black-Asian"', add
label define race_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_lbl 808 `"American Indian-Asian"', add
label define race_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 810 `"White-Black-American Indian"', add
label define race_lbl 811 `"White-Black-Asian"', add
label define race_lbl 812 `"White-American Indian-Asian"', add
label define race_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_lbl 815 `"American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 816 `"White-Black--Hawaiian/Pacific Islander"', add
label define race_lbl 817 `"White-American Indian-Hawaiian/Pacific Islander"', add
label define race_lbl 818 `"Black-American Indian-Asian"', add
label define race_lbl 819 `"White-American Indian-Asian-Hawaiian/Pacific Islander"', add
label define race_lbl 820 `"Two or three races, unspecified"', add
label define race_lbl 830 `"Four or five races, unspecified"', add
label define race_lbl 999 `"Blank"', add
label values race race_lbl

label define marst_lbl 1 `"Married, spouse present"'
label define marst_lbl 2 `"Married, spouse absent"', add
label define marst_lbl 3 `"Separated"', add
label define marst_lbl 4 `"Divorced"', add
label define marst_lbl 5 `"Widowed"', add
label define marst_lbl 6 `"Never married/single"', add
label define marst_lbl 7 `"Widowed or Divorced"', add
label define marst_lbl 9 `"NIU"', add
label values marst marst_lbl

label define nchild_lbl 0 `"0 children present"'
label define nchild_lbl 1 `"1 child present"', add
label define nchild_lbl 2 `"2"', add
label define nchild_lbl 3 `"3"', add
label define nchild_lbl 4 `"4"', add
label define nchild_lbl 5 `"5"', add
label define nchild_lbl 6 `"6"', add
label define nchild_lbl 7 `"7"', add
label define nchild_lbl 8 `"8"', add
label define nchild_lbl 9 `"9+"', add
label values nchild nchild_lbl

label define bpl_lbl 09900 `"United States, n.s."'
label define bpl_lbl 10000 `"American Samoa"', add
label define bpl_lbl 10500 `"Guam"', add
label define bpl_lbl 10750 `"Northern Mariana Islands"', add
label define bpl_lbl 11000 `"Puerto Rico"', add
label define bpl_lbl 11500 `"U.S. Virgin Islands"', add
label define bpl_lbl 12090 `"U.S. outlying areas, n.s."', add
label define bpl_lbl 15000 `"Canada"', add
label define bpl_lbl 16010 `"Bermuda"', add
label define bpl_lbl 19900 `"North America, n.s."', add
label define bpl_lbl 20000 `"Mexico"', add
label define bpl_lbl 21010 `"Belize/British Honduras"', add
label define bpl_lbl 21020 `"Costa Rica"', add
label define bpl_lbl 21030 `"El Salvador"', add
label define bpl_lbl 21040 `"Guatemala"', add
label define bpl_lbl 21050 `"Honduras"', add
label define bpl_lbl 21060 `"Nicaragua"', add
label define bpl_lbl 21070 `"Panama"', add
label define bpl_lbl 21090 `"Central America, n.s."', add
label define bpl_lbl 25000 `"Cuba"', add
label define bpl_lbl 26010 `"Dominican Republic"', add
label define bpl_lbl 26020 `"Haiti"', add
label define bpl_lbl 26030 `"Jamaica"', add
label define bpl_lbl 26043 `"Bahamas"', add
label define bpl_lbl 26044 `"Barbados"', add
label define bpl_lbl 26054 `"Dominica"', add
label define bpl_lbl 26055 `"Grenada"', add
label define bpl_lbl 26060 `"Trinidad and Tobago"', add
label define bpl_lbl 26065 `"Antigua and Barbuda"', add
label define bpl_lbl 26070 `"St. Kitts--Nevis"', add
label define bpl_lbl 26075 `"St. Lucia"', add
label define bpl_lbl 26080 `"St. Vincent and the Grenadi"', add
label define bpl_lbl 26091 `"Caribbean, n.s."', add
label define bpl_lbl 30005 `"Argentina"', add
label define bpl_lbl 30010 `"Bolivia"', add
label define bpl_lbl 30015 `"Brazil"', add
label define bpl_lbl 30020 `"Chile"', add
label define bpl_lbl 30025 `"Colombia"', add
label define bpl_lbl 30030 `"Ecuador"', add
label define bpl_lbl 30040 `"Guyana/British Guiana"', add
label define bpl_lbl 30050 `"Peru"', add
label define bpl_lbl 30060 `"Uruguay"', add
label define bpl_lbl 30065 `"Venezuela"', add
label define bpl_lbl 30070 `"Paraguay"', add
label define bpl_lbl 30090 `"South America, n.s."', add
label define bpl_lbl 31000 `"Americas, n.s."', add
label define bpl_lbl 40000 `"Denmark"', add
label define bpl_lbl 40100 `"Finland"', add
label define bpl_lbl 40200 `"Iceland"', add
label define bpl_lbl 40400 `"Norway"', add
label define bpl_lbl 40500 `"Sweden"', add
label define bpl_lbl 41000 `"England"', add
label define bpl_lbl 41100 `"Scotland"', add
label define bpl_lbl 41200 `"Wales"', add
label define bpl_lbl 41300 `"United Kingdom, n.s."', add
label define bpl_lbl 41400 `"Ireland"', add
label define bpl_lbl 41410 `"Northern Ireland"', add
label define bpl_lbl 42000 `"Belgium"', add
label define bpl_lbl 42100 `"France"', add
label define bpl_lbl 42500 `"Netherlands"', add
label define bpl_lbl 42600 `"Switzerland"', add
label define bpl_lbl 43300 `"Greece"', add
label define bpl_lbl 43400 `"Italy"', add
label define bpl_lbl 43600 `"Portugal"', add
label define bpl_lbl 43610 `"Azores"', add
label define bpl_lbl 43800 `"Spain"', add
label define bpl_lbl 45000 `"Austria"', add
label define bpl_lbl 45200 `"Czechoslavakia"', add
label define bpl_lbl 45212 `"Slovakia"', add
label define bpl_lbl 45213 `"Czech Republic"', add
label define bpl_lbl 45300 `"Germany"', add
label define bpl_lbl 45400 `"Hungary"', add
label define bpl_lbl 45500 `"Poland"', add
label define bpl_lbl 45600 `"Romania"', add
label define bpl_lbl 45650 `"Bulgaria"', add
label define bpl_lbl 45675 `"Albania"', add
label define bpl_lbl 45700 `"Yugoslavia"', add
label define bpl_lbl 45720 `"Bosnia and Herzegovina"', add
label define bpl_lbl 45730 `"Croatia"', add
label define bpl_lbl 45740 `"Macedonia"', add
label define bpl_lbl 45750 `"Serbia"', add
label define bpl_lbl 45760 `"Kosovo"', add
label define bpl_lbl 45770 `"Montenego"', add
label define bpl_lbl 46100 `"Estonia"', add
label define bpl_lbl 46200 `"Latvia"', add
label define bpl_lbl 46300 `"Lithuania"', add
label define bpl_lbl 46500 `"Other USSR/Russia"', add
label define bpl_lbl 46530 `"Ukraine"', add
label define bpl_lbl 46535 `"Belarus"', add
label define bpl_lbl 46540 `"Moldova"', add
label define bpl_lbl 46590 `"USSR, n.s."', add
label define bpl_lbl 49900 `"Europe, n.s."', add
label define bpl_lbl 50000 `"China"', add
label define bpl_lbl 50010 `"Hong Kong"', add
label define bpl_lbl 50040 `"Taiwan"', add
label define bpl_lbl 50100 `"Japan"', add
label define bpl_lbl 50200 `"Korea"', add
label define bpl_lbl 50220 `"South Korea"', add
label define bpl_lbl 50300 `"Mongolia"', add
label define bpl_lbl 51100 `"Cambodia"', add
label define bpl_lbl 51200 `"Indonesia"', add
label define bpl_lbl 51300 `"Laos"', add
label define bpl_lbl 51400 `"Malaysia"', add
label define bpl_lbl 51500 `"Philippines"', add
label define bpl_lbl 51600 `"Singapore"', add
label define bpl_lbl 51700 `"Thailand"', add
label define bpl_lbl 51800 `"Vietnam"', add
label define bpl_lbl 52000 `"Afghanistan"', add
label define bpl_lbl 52100 `"India"', add
label define bpl_lbl 52110 `"Bangladesh"', add
label define bpl_lbl 52120 `"Bhutan"', add
label define bpl_lbl 52130 `"Burma"', add
label define bpl_lbl 52140 `"Pakistan"', add
label define bpl_lbl 52150 `"Sri Lanka"', add
label define bpl_lbl 52200 `"Nepal"', add
label define bpl_lbl 55100 `"Armenia"', add
label define bpl_lbl 55200 `"Azerbaijan"', add
label define bpl_lbl 55300 `"Georgia"', add
label define bpl_lbl 55400 `"Uzbekistan"', add
label define bpl_lbl 55500 `"Kazakhstan"', add
label define bpl_lbl 53000 `"Iran"', add
label define bpl_lbl 53200 `"Iraq"', add
label define bpl_lbl 53400 `"Israel"', add
label define bpl_lbl 53420 `"Palestine"', add
label define bpl_lbl 53500 `"Jordan"', add
label define bpl_lbl 53700 `"Lebanon"', add
label define bpl_lbl 54000 `"Saudi Arabia"', add
label define bpl_lbl 54100 `"Syria"', add
label define bpl_lbl 54200 `"Turkey"', add
label define bpl_lbl 54300 `"Cyprus"', add
label define bpl_lbl 54350 `"Kuwait"', add
label define bpl_lbl 54400 `"Yemen"', add
label define bpl_lbl 54500 `"United Arab Emirates"', add
label define bpl_lbl 54700 `"Middle East, n.s."', add
label define bpl_lbl 59900 `"Asia, n.e.c./n.s."', add
label define bpl_lbl 60010 `"Northern Africa"', add
label define bpl_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpl_lbl 60014 `"Morocco"', add
label define bpl_lbl 60016 `"Algeria"', add
label define bpl_lbl 60018 `"Sudan"', add
label define bpl_lbl 60019 `"Libya"', add
label define bpl_lbl 60023 `"Ghana"', add
label define bpl_lbl 60031 `"Nigeria"', add
label define bpl_lbl 60032 `"Cameroon"', add
label define bpl_lbl 60033 `"Cape Verde"', add
label define bpl_lbl 60034 `"Liberia"', add
label define bpl_lbl 60035 `"Senegal"', add
label define bpl_lbl 60036 `"Sierra Leone"', add
label define bpl_lbl 60037 `"Guinea"', add
label define bpl_lbl 60038 `"Ivory Coast"', add
label define bpl_lbl 60039 `"Togo"', add
label define bpl_lbl 60040 `"Eritrea"', add
label define bpl_lbl 60044 `"Ethiopia"', add
label define bpl_lbl 60045 `"Kenya"', add
label define bpl_lbl 60050 `"Somalia"', add
label define bpl_lbl 60060 `"Tanzania"', add
label define bpl_lbl 60065 `"Uganda"', add
label define bpl_lbl 60070 `"Zimbabwe"', add
label define bpl_lbl 60094 `"South Africa (Union of)"', add
label define bpl_lbl 60095 `"Zaire"', add
label define bpl_lbl 60096 `"Congo"', add
label define bpl_lbl 60097 `"Zambia"', add
label define bpl_lbl 60099 `"Africa, n.s./n.e.c."', add
label define bpl_lbl 70010 `"Australia"', add
label define bpl_lbl 70020 `"New Zealand"', add
label define bpl_lbl 71000 `"Pacific Islands"', add
label define bpl_lbl 71021 `"Fiji"', add
label define bpl_lbl 71022 `"Tonga"', add
label define bpl_lbl 71023 `"Samoa"', add
label define bpl_lbl 71024 `"Marshall Islands"', add
label define bpl_lbl 72000 `"Micronesia"', add
label define bpl_lbl 96000 `"Other, n.e.c. and unknown"', add
label define bpl_lbl 99999 `"NIU"', add
label values bpl bpl_lbl

label define yrimmig_lbl 0000 `"NIU"'
label define yrimmig_lbl 1949 `"1949 or earlier"', add
label define yrimmig_lbl 1959 `"1950-1959"', add
label define yrimmig_lbl 1964 `"1960-1964"', add
label define yrimmig_lbl 1969 `"1965-1969"', add
label define yrimmig_lbl 1974 `"1970-1974"', add
label define yrimmig_lbl 1979 `"1975-1979"', add
label define yrimmig_lbl 1981 `"1980-1981"', add
label define yrimmig_lbl 1983 `"1982-1983"', add
label define yrimmig_lbl 1985 `"1984-1985"', add
label define yrimmig_lbl 1987 `"1986-1987"', add
label define yrimmig_lbl 1989 `"1988-1989"', add
label define yrimmig_lbl 1991 `"1990-1991"', add
label define yrimmig_lbl 1993 `"1992-1993"', add
label define yrimmig_lbl 1994 `"1992-1994"', add
label define yrimmig_lbl 1995 `"1994-1995"', add
label define yrimmig_lbl 1996 `"1994-1996"', add
label define yrimmig_lbl 1997 `"1996-1997"', add
label define yrimmig_lbl 1998 `"1996-1998 (2000 CPS: 1998)"', add
label define yrimmig_lbl 1999 `"1998-1999 (1999 CPS: 1996-1999)"', add
label define yrimmig_lbl 2000 `"1998-2000"', add
label define yrimmig_lbl 2001 `"2000-2001 (2001 CPS: 1998-2001)"', add
label define yrimmig_lbl 2002 `"2000-2002"', add
label define yrimmig_lbl 2003 `"2002-2003 (2003 CPS: 2000-2003)"', add
label define yrimmig_lbl 2004 `"2002-2004"', add
label define yrimmig_lbl 2005 `"2004-2005 (2005 CPS: 2002-2005)"', add
label define yrimmig_lbl 2006 `"2004-2006"', add
label define yrimmig_lbl 2007 `"2004-2007"', add
label define yrimmig_lbl 2008 `"2006-2008 (2006-2007 CPS: 2004-2008)"', add
label define yrimmig_lbl 2009 `"2006-2009 (2012 CPS forward: 2008-2009)"', add
label define yrimmig_lbl 2010 `"2008-2010"', add
label define yrimmig_lbl 2011 `"2008-2011 (2014 CPS forward: 2010-2011)"', add
label define yrimmig_lbl 2012 `"2010-2012"', add
label define yrimmig_lbl 2013 `"2010-2013 (2016 CPS forward: 2012-2013)"', add
label define yrimmig_lbl 2014 `"2012-2014"', add
label define yrimmig_lbl 2015 `"2012-2015 (2018 CPS forward: 2014-2015)"', add
label define yrimmig_lbl 2016 `"2014-2016"', add
label define yrimmig_lbl 2017 `"2014-2017 (2019 CPS forward: 2016-2017)"', add
label define yrimmig_lbl 2018 `"2016-2018"', add
label define yrimmig_lbl 2019 `"2016-2019"', add
label define yrimmig_lbl 2020 `"2018-2020"', add
label define yrimmig_lbl 2021 `"2018-2021"', add
label values yrimmig yrimmig_lbl

label define citizen_lbl 1 `"Born in U.S"'
label define citizen_lbl 2 `"Born in U.S. outlying"', add
label define citizen_lbl 3 `"Born abroad of American parents"', add
label define citizen_lbl 4 `"Naturalized citizen"', add
label define citizen_lbl 5 `"Not a citizen"', add
label define citizen_lbl 9 `"NIU"', add
label values citizen citizen_lbl

label define mbpl_lbl 09900 `"U.S., n.s."'
label define mbpl_lbl 10000 `"American Samoa"', add
label define mbpl_lbl 10500 `"Guam"', add
label define mbpl_lbl 11000 `"Puerto Rico"', add
label define mbpl_lbl 11500 `"U.S. Virgin Islands"', add
label define mbpl_lbl 12090 `"U.S. outlying areas, n.s."', add
label define mbpl_lbl 15000 `"Canada"', add
label define mbpl_lbl 16010 `"Bermuda"', add
label define mbpl_lbl 10750 `"Northern Mariana Islands"', add
label define mbpl_lbl 19900 `"North America, n.s."', add
label define mbpl_lbl 20000 `"Mexico"', add
label define mbpl_lbl 21010 `"Belize/British Honduras"', add
label define mbpl_lbl 21020 `"Costa Rica"', add
label define mbpl_lbl 21030 `"El Salvador"', add
label define mbpl_lbl 21040 `"Guatemala"', add
label define mbpl_lbl 21050 `"Honduras"', add
label define mbpl_lbl 21060 `"Nicaragua"', add
label define mbpl_lbl 21070 `"Panama"', add
label define mbpl_lbl 21090 `"Central America, n.s."', add
label define mbpl_lbl 25000 `"Cuba"', add
label define mbpl_lbl 26000 `"West Indies"', add
label define mbpl_lbl 26010 `"Dominican Republic"', add
label define mbpl_lbl 26020 `"Haiti"', add
label define mbpl_lbl 26030 `"Jamaica"', add
label define mbpl_lbl 26043 `"Bahamas"', add
label define mbpl_lbl 26044 `"Barbados"', add
label define mbpl_lbl 26054 `"Dominica"', add
label define mbpl_lbl 26055 `"Grenada"', add
label define mbpl_lbl 26060 `"Trinidad and Tobago"', add
label define mbpl_lbl 26065 `"Antigua and Barbuda"', add
label define mbpl_lbl 26070 `"St. Kitts--Nevis"', add
label define mbpl_lbl 26075 `"St. Lucia"', add
label define mbpl_lbl 26080 `"St. Vincent and the Grenadi"', add
label define mbpl_lbl 30000 `"South America"', add
label define mbpl_lbl 30005 `"Argentina"', add
label define mbpl_lbl 30010 `"Bolivia"', add
label define mbpl_lbl 30015 `"Brazil"', add
label define mbpl_lbl 30020 `"Chile"', add
label define mbpl_lbl 30025 `"Colombia"', add
label define mbpl_lbl 30030 `"Ecuador"', add
label define mbpl_lbl 30040 `"Guyana/British Guiana"', add
label define mbpl_lbl 30050 `"Peru"', add
label define mbpl_lbl 30060 `"Uruguay"', add
label define mbpl_lbl 30065 `"Venezuala"', add
label define mbpl_lbl 30070 `"Paraguay"', add
label define mbpl_lbl 31000 `"Americas, n.s."', add
label define mbpl_lbl 40000 `"Denmark"', add
label define mbpl_lbl 40100 `"Finland"', add
label define mbpl_lbl 40200 `"Iceland"', add
label define mbpl_lbl 40400 `"Norway"', add
label define mbpl_lbl 40500 `"Sweden"', add
label define mbpl_lbl 41000 `"England"', add
label define mbpl_lbl 41100 `"Scotland"', add
label define mbpl_lbl 41200 `"Wales"', add
label define mbpl_lbl 41300 `"United Kingdom, n.s."', add
label define mbpl_lbl 41400 `"Ireland"', add
label define mbpl_lbl 41410 `"Northern Ireland"', add
label define mbpl_lbl 42000 `"Belgium"', add
label define mbpl_lbl 42100 `"France"', add
label define mbpl_lbl 42500 `"Netherlands"', add
label define mbpl_lbl 42600 `"Switzerland"', add
label define mbpl_lbl 43300 `"Greece"', add
label define mbpl_lbl 43400 `"Italy"', add
label define mbpl_lbl 43600 `"Portugal"', add
label define mbpl_lbl 43610 `"Azores"', add
label define mbpl_lbl 43800 `"Spain"', add
label define mbpl_lbl 45000 `"Austria"', add
label define mbpl_lbl 45200 `"Czechoslavakia"', add
label define mbpl_lbl 45212 `"Slovakia"', add
label define mbpl_lbl 45213 `"Czech Republic"', add
label define mbpl_lbl 45300 `"Germany"', add
label define mbpl_lbl 45400 `"Hungary"', add
label define mbpl_lbl 45500 `"Poland"', add
label define mbpl_lbl 45600 `"Romania"', add
label define mbpl_lbl 45650 `"Bulgaria"', add
label define mbpl_lbl 45675 `"Albania"', add
label define mbpl_lbl 45700 `"Yugoslavia"', add
label define mbpl_lbl 45720 `"Bosnia and Herzegovina"', add
label define mbpl_lbl 45730 `"Croatia"', add
label define mbpl_lbl 45740 `"Macedonia"', add
label define mbpl_lbl 45750 `"Serbia"', add
label define mbpl_lbl 45760 `"Kosovo"', add
label define mbpl_lbl 45770 `"Montenego"', add
label define mbpl_lbl 46100 `"Estonia"', add
label define mbpl_lbl 46200 `"Latvia"', add
label define mbpl_lbl 46300 `"Lithuania"', add
label define mbpl_lbl 46500 `"Other USSR/Russia"', add
label define mbpl_lbl 46530 `"Ukraine"', add
label define mbpl_lbl 46535 `"Belarus"', add
label define mbpl_lbl 46540 `"Moldova"', add
label define mbpl_lbl 46590 `"USSR, n.s."', add
label define mbpl_lbl 49900 `"Europe, n.s."', add
label define mbpl_lbl 50000 `"China"', add
label define mbpl_lbl 50010 `"Hong Kong"', add
label define mbpl_lbl 50040 `"Taiwan"', add
label define mbpl_lbl 50100 `"Japan"', add
label define mbpl_lbl 50200 `"Korea"', add
label define mbpl_lbl 50220 `"South Korea"', add
label define mbpl_lbl 50300 `"Mongolia"', add
label define mbpl_lbl 51100 `"Cambodia"', add
label define mbpl_lbl 51200 `"Indonesia"', add
label define mbpl_lbl 51300 `"Laos"', add
label define mbpl_lbl 51400 `"Malaysia"', add
label define mbpl_lbl 51500 `"Philippines"', add
label define mbpl_lbl 51600 `"Singapore"', add
label define mbpl_lbl 51700 `"Thailand"', add
label define mbpl_lbl 51800 `"Vietnam"', add
label define mbpl_lbl 52000 `"Afghanistan"', add
label define mbpl_lbl 52100 `"India"', add
label define mbpl_lbl 52110 `"Bangladesh"', add
label define mbpl_lbl 52120 `"Bhutan"', add
label define mbpl_lbl 52130 `"Burma (Myanmar)"', add
label define mbpl_lbl 52140 `"Pakistan"', add
label define mbpl_lbl 52150 `"Sri Lanka"', add
label define mbpl_lbl 52200 `"Nepal"', add
label define mbpl_lbl 55100 `"Armenia"', add
label define mbpl_lbl 55200 `"Azerbaijan"', add
label define mbpl_lbl 55300 `"Georgia"', add
label define mbpl_lbl 55400 `"Uzbekistan"', add
label define mbpl_lbl 55500 `"Kazakhstan"', add
label define mbpl_lbl 53000 `"Iran"', add
label define mbpl_lbl 53200 `"Iraq"', add
label define mbpl_lbl 53400 `"Israel"', add
label define mbpl_lbl 53420 `"Palestine"', add
label define mbpl_lbl 53500 `"Jordan"', add
label define mbpl_lbl 53700 `"Lebanon"', add
label define mbpl_lbl 54000 `"Saudi Arabia"', add
label define mbpl_lbl 54100 `"Syria"', add
label define mbpl_lbl 54200 `"Turkey"', add
label define mbpl_lbl 54300 `"Cyprus"', add
label define mbpl_lbl 54350 `"Kuwait"', add
label define mbpl_lbl 54400 `"Yemen"', add
label define mbpl_lbl 54500 `"United Arab Emirates"', add
label define mbpl_lbl 54700 `"Middle East, n.s."', add
label define mbpl_lbl 59900 `"Asia, n.e.c, /n.s."', add
label define mbpl_lbl 60000 `"Africa"', add
label define mbpl_lbl 60010 `"Northern Africa"', add
label define mbpl_lbl 60012 `"Egypt/United Arab Rep."', add
label define mbpl_lbl 60014 `"Morocco"', add
label define mbpl_lbl 60016 `"Algeria"', add
label define mbpl_lbl 60018 `"Sudan"', add
label define mbpl_lbl 60019 `"Libya"', add
label define mbpl_lbl 60023 `"Ghana"', add
label define mbpl_lbl 60031 `"Nigeria"', add
label define mbpl_lbl 60032 `"Cameroon"', add
label define mbpl_lbl 60033 `"Cape Verde"', add
label define mbpl_lbl 60034 `"Liberia"', add
label define mbpl_lbl 60035 `"Sengal"', add
label define mbpl_lbl 60036 `"Sierra Leone"', add
label define mbpl_lbl 60037 `"Guinea"', add
label define mbpl_lbl 60038 `"Ivory Coast"', add
label define mbpl_lbl 60039 `"Togo"', add
label define mbpl_lbl 60040 `"Eritrea"', add
label define mbpl_lbl 60044 `"Ethiopia"', add
label define mbpl_lbl 60045 `"Kenya"', add
label define mbpl_lbl 60050 `"Somalia"', add
label define mbpl_lbl 60060 `"Tanzania"', add
label define mbpl_lbl 60065 `"Uganda"', add
label define mbpl_lbl 60070 `"Zimbabwe"', add
label define mbpl_lbl 60095 `"Zaire"', add
label define mbpl_lbl 60096 `"Congo"', add
label define mbpl_lbl 60097 `"Zambia"', add
label define mbpl_lbl 60094 `"South Africa (Union of)"', add
label define mbpl_lbl 70010 `"Australia"', add
label define mbpl_lbl 70020 `"New Zealand"', add
label define mbpl_lbl 71000 `"Pacific Islands"', add
label define mbpl_lbl 71021 `"Fiji"', add
label define mbpl_lbl 71022 `"Tonga"', add
label define mbpl_lbl 71023 `"Samoa"', add
label define mbpl_lbl 71024 `"Marshall Islands"', add
label define mbpl_lbl 72000 `"Micronesia"', add
label define mbpl_lbl 96000 `"Other, n.e.c. and unknown"', add
label define mbpl_lbl 99999 `"NIU"', add
label values mbpl mbpl_lbl

label define fbpl_lbl 09900 `"U.S., n.s."'
label define fbpl_lbl 10000 `"American Samoa"', add
label define fbpl_lbl 10500 `"Guam"', add
label define fbpl_lbl 10750 `"Northern Mariana Islands"', add
label define fbpl_lbl 11000 `"Puerto Rico"', add
label define fbpl_lbl 11500 `"U.S. Virgin Islands"', add
label define fbpl_lbl 12090 `"U.S. outlying areas, n.s."', add
label define fbpl_lbl 15000 `"Canada"', add
label define fbpl_lbl 16010 `"Bermuda"', add
label define fbpl_lbl 19900 `"North America, n.s."', add
label define fbpl_lbl 20000 `"Mexico"', add
label define fbpl_lbl 21010 `"Belize/British Honduras"', add
label define fbpl_lbl 21020 `"Costa Rica"', add
label define fbpl_lbl 21030 `"El Salvador"', add
label define fbpl_lbl 21040 `"Guatemala"', add
label define fbpl_lbl 21050 `"Honduras"', add
label define fbpl_lbl 21060 `"Nicaragua"', add
label define fbpl_lbl 21070 `"Panama"', add
label define fbpl_lbl 21090 `"Central America, n.s."', add
label define fbpl_lbl 25000 `"Cuba"', add
label define fbpl_lbl 26000 `"West Indies"', add
label define fbpl_lbl 26010 `"Dominican Republic"', add
label define fbpl_lbl 26020 `"Haiti"', add
label define fbpl_lbl 26030 `"Jamaica"', add
label define fbpl_lbl 26043 `"Bahamas"', add
label define fbpl_lbl 26044 `"Barbados"', add
label define fbpl_lbl 26054 `"Dominica"', add
label define fbpl_lbl 26055 `"Grenada"', add
label define fbpl_lbl 26060 `"Trinidad and Tobago"', add
label define fbpl_lbl 26065 `"Antigua and Barbuda"', add
label define fbpl_lbl 26070 `"St. Kitts--Nevis"', add
label define fbpl_lbl 26075 `"St. Lucia"', add
label define fbpl_lbl 26080 `"St. Vincent and the Grenadi"', add
label define fbpl_lbl 26091 `"Caribbean, n.s."', add
label define fbpl_lbl 30000 `"South America"', add
label define fbpl_lbl 30005 `"Argentina"', add
label define fbpl_lbl 30010 `"Bolivia"', add
label define fbpl_lbl 30015 `"Brazil"', add
label define fbpl_lbl 30020 `"Chile"', add
label define fbpl_lbl 30025 `"Colombia"', add
label define fbpl_lbl 30030 `"Ecuador"', add
label define fbpl_lbl 30040 `"Guyana/British Guiana"', add
label define fbpl_lbl 30050 `"Peru"', add
label define fbpl_lbl 30060 `"Uruguay"', add
label define fbpl_lbl 30065 `"Venezuala"', add
label define fbpl_lbl 30070 `"Paraguay"', add
label define fbpl_lbl 31000 `"Americas, n.s."', add
label define fbpl_lbl 40000 `"Denmark"', add
label define fbpl_lbl 40100 `"Finland"', add
label define fbpl_lbl 40200 `"Iceland"', add
label define fbpl_lbl 40400 `"Norway"', add
label define fbpl_lbl 40500 `"Sweden"', add
label define fbpl_lbl 41000 `"England"', add
label define fbpl_lbl 41100 `"Scotland"', add
label define fbpl_lbl 41200 `"Wales"', add
label define fbpl_lbl 41300 `"United Kingdom, n.s."', add
label define fbpl_lbl 41400 `"Ireland"', add
label define fbpl_lbl 41410 `"Northern Ireland"', add
label define fbpl_lbl 42000 `"Belgium"', add
label define fbpl_lbl 42100 `"France"', add
label define fbpl_lbl 42500 `"Netherlands"', add
label define fbpl_lbl 42600 `"Switzerland"', add
label define fbpl_lbl 43300 `"Greece"', add
label define fbpl_lbl 43400 `"Italy"', add
label define fbpl_lbl 43600 `"Portugal"', add
label define fbpl_lbl 43610 `"Azores"', add
label define fbpl_lbl 43800 `"Spain"', add
label define fbpl_lbl 45000 `"Austria"', add
label define fbpl_lbl 45200 `"Czechoslavakia"', add
label define fbpl_lbl 45212 `"Slovakia"', add
label define fbpl_lbl 45213 `"Czech Republic"', add
label define fbpl_lbl 45300 `"Germany"', add
label define fbpl_lbl 45400 `"Hungary"', add
label define fbpl_lbl 45500 `"Poland"', add
label define fbpl_lbl 45600 `"Romania"', add
label define fbpl_lbl 45650 `"Bulgaria"', add
label define fbpl_lbl 45675 `"Albania"', add
label define fbpl_lbl 45700 `"Yugoslavia"', add
label define fbpl_lbl 45720 `"Bosnia and Herzegovina"', add
label define fbpl_lbl 45730 `"Croatia"', add
label define fbpl_lbl 45740 `"Macedonia"', add
label define fbpl_lbl 45750 `"Serbia"', add
label define fbpl_lbl 45760 `"Kosovo"', add
label define fbpl_lbl 45770 `"Montenegro"', add
label define fbpl_lbl 46100 `"Estonia"', add
label define fbpl_lbl 46200 `"Latvia"', add
label define fbpl_lbl 46300 `"Lithuania"', add
label define fbpl_lbl 46500 `"Other USSR/Russia"', add
label define fbpl_lbl 46530 `"Ukraine"', add
label define fbpl_lbl 46535 `"Belarus"', add
label define fbpl_lbl 46540 `"Moldova"', add
label define fbpl_lbl 46590 `"USSR, n.s."', add
label define fbpl_lbl 49900 `"Europe, n.s."', add
label define fbpl_lbl 50000 `"China"', add
label define fbpl_lbl 50010 `"Hong Kong"', add
label define fbpl_lbl 50040 `"Taiwan"', add
label define fbpl_lbl 50100 `"Japan"', add
label define fbpl_lbl 50200 `"Korea"', add
label define fbpl_lbl 50220 `"South Korea"', add
label define fbpl_lbl 50300 `"Mongolia"', add
label define fbpl_lbl 51100 `"Cambodia"', add
label define fbpl_lbl 51200 `"Indonesia"', add
label define fbpl_lbl 51300 `"Laos"', add
label define fbpl_lbl 51400 `"Malaysia"', add
label define fbpl_lbl 51500 `"Philippines"', add
label define fbpl_lbl 51600 `"Singapore"', add
label define fbpl_lbl 51700 `"Thailand"', add
label define fbpl_lbl 51800 `"Vietnam"', add
label define fbpl_lbl 52000 `"Afghanistan"', add
label define fbpl_lbl 52100 `"India"', add
label define fbpl_lbl 52110 `"Bangladesh"', add
label define fbpl_lbl 52120 `"Bhutan"', add
label define fbpl_lbl 52130 `"Burma (Myanmar)"', add
label define fbpl_lbl 52140 `"Pakistan"', add
label define fbpl_lbl 52150 `"Sri Lanka"', add
label define fbpl_lbl 52200 `"Nepal"', add
label define fbpl_lbl 55100 `"Armenia"', add
label define fbpl_lbl 55200 `"Azerbaijan"', add
label define fbpl_lbl 55300 `"Georgia"', add
label define fbpl_lbl 55400 `"Uzbekistan"', add
label define fbpl_lbl 55500 `"Kazakhstan"', add
label define fbpl_lbl 53000 `"Iran"', add
label define fbpl_lbl 53200 `"Iraq"', add
label define fbpl_lbl 53400 `"Israel"', add
label define fbpl_lbl 53420 `"Palestine"', add
label define fbpl_lbl 53500 `"Jordan"', add
label define fbpl_lbl 53700 `"Lebanon"', add
label define fbpl_lbl 54000 `"Saudi Arabia"', add
label define fbpl_lbl 54100 `"Syria"', add
label define fbpl_lbl 54200 `"Turkey"', add
label define fbpl_lbl 54300 `"Cyprus"', add
label define fbpl_lbl 54350 `"Kuwait"', add
label define fbpl_lbl 54400 `"Yemen"', add
label define fbpl_lbl 54500 `"United Arab Emirates"', add
label define fbpl_lbl 54700 `"Middle East, n.s."', add
label define fbpl_lbl 59900 `"Asia, n.e.c, /n.s."', add
label define fbpl_lbl 60000 `"Africa"', add
label define fbpl_lbl 60010 `"Northern Africa"', add
label define fbpl_lbl 60012 `"Egypt/United Arab Rep."', add
label define fbpl_lbl 60014 `"Morocco"', add
label define fbpl_lbl 60016 `"Algeria"', add
label define fbpl_lbl 60018 `"Sudan"', add
label define fbpl_lbl 60019 `"Libya"', add
label define fbpl_lbl 60023 `"Ghana"', add
label define fbpl_lbl 60031 `"Nigeria"', add
label define fbpl_lbl 60032 `"Cameroon"', add
label define fbpl_lbl 60033 `"Cape Verde"', add
label define fbpl_lbl 60034 `"Liberia"', add
label define fbpl_lbl 60035 `"Sengal"', add
label define fbpl_lbl 60036 `"Sierra Leone"', add
label define fbpl_lbl 60037 `"Guinea"', add
label define fbpl_lbl 60038 `"Ivory Coast"', add
label define fbpl_lbl 60039 `"Togo"', add
label define fbpl_lbl 60040 `"Eritrea"', add
label define fbpl_lbl 60044 `"Ethiopia"', add
label define fbpl_lbl 60045 `"Kenya"', add
label define fbpl_lbl 60050 `"Somalia"', add
label define fbpl_lbl 60060 `"Tanzania"', add
label define fbpl_lbl 60065 `"Uganda"', add
label define fbpl_lbl 60070 `"Zimbabwe"', add
label define fbpl_lbl 60094 `"South Africa (Union of)"', add
label define fbpl_lbl 60095 `"Zaire"', add
label define fbpl_lbl 60096 `"Congo"', add
label define fbpl_lbl 60097 `"Zambia"', add
label define fbpl_lbl 60099 `"Africa, n.s./n.e.c."', add
label define fbpl_lbl 70010 `"Australia"', add
label define fbpl_lbl 70020 `"New Zealand"', add
label define fbpl_lbl 71000 `"Pacific Islands"', add
label define fbpl_lbl 71021 `"Fiji"', add
label define fbpl_lbl 71022 `"Tonga"', add
label define fbpl_lbl 71023 `"Samoa"', add
label define fbpl_lbl 71024 `"Marshall Islands"', add
label define fbpl_lbl 72000 `"Micronesia"', add
label define fbpl_lbl 96000 `"Other, n.e.c. and unknown"', add
label define fbpl_lbl 99999 `"NIU"', add
label values fbpl fbpl_lbl

label define nativity_lbl 0 `"Unknown"'
label define nativity_lbl 1 `"Both parents native-born"', add
label define nativity_lbl 2 `"Father foreign, mother native"', add
label define nativity_lbl 3 `"Mother foreign, father native"', add
label define nativity_lbl 4 `"Both parents foreign"', add
label define nativity_lbl 5 `"Foreign born"', add
label values nativity nativity_lbl

label define hispan_lbl 000 `"Not Hispanic"'
label define hispan_lbl 100 `"Mexican"', add
label define hispan_lbl 102 `"Mexican American"', add
label define hispan_lbl 103 `"Mexicano/Mexicana"', add
label define hispan_lbl 104 `"Chicano/Chicana"', add
label define hispan_lbl 108 `"Mexican (Mexicano)"', add
label define hispan_lbl 109 `"Mexicano/Chicano"', add
label define hispan_lbl 200 `"Puerto Rican"', add
label define hispan_lbl 300 `"Cuban"', add
label define hispan_lbl 400 `"Dominican"', add
label define hispan_lbl 500 `"Salvadoran"', add
label define hispan_lbl 600 `"Other Hispanic"', add
label define hispan_lbl 610 `"Central/South American"', add
label define hispan_lbl 611 `"Central American, (excluding Salvadoran)"', add
label define hispan_lbl 612 `"South American"', add
label define hispan_lbl 901 `"Do not know"', add
label define hispan_lbl 902 `"N/A (and no response 1985-87)"', add
label values hispan hispan_lbl

label define empstat_lbl 00 `"NIU"'
label define empstat_lbl 01 `"Armed Forces"', add
label define empstat_lbl 10 `"At work"', add
label define empstat_lbl 12 `"Has job, not at work last week"', add
label define empstat_lbl 20 `"Unemployed"', add
label define empstat_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_lbl 22 `"Unemployed, new worker"', add
label define empstat_lbl 30 `"Not in labor force"', add
label define empstat_lbl 31 `"NILF, housework"', add
label define empstat_lbl 32 `"NILF, unable to work"', add
label define empstat_lbl 33 `"NILF, school"', add
label define empstat_lbl 34 `"NILF, other"', add
label define empstat_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label define empstat_lbl 36 `"NILF, retired"', add
label values empstat empstat_lbl

label define labforce_lbl 0 `"NIU"'
label define labforce_lbl 1 `"No, not in the labor force"', add
label define labforce_lbl 2 `"Yes, in the labor force"', add
label values labforce labforce_lbl

label define ind1990_lbl 000 `"NIU"'
label define ind1990_lbl 010 `"Agricultural production, crops"', add
label define ind1990_lbl 011 `"Agricultural production, livestock"', add
label define ind1990_lbl 012 `"Veterinary services"', add
label define ind1990_lbl 020 `"Landscape and horticultural services"', add
label define ind1990_lbl 030 `"Agricultural services, n.e.c."', add
label define ind1990_lbl 031 `"Forestry"', add
label define ind1990_lbl 032 `"Fishing, hunting, and trapping"', add
label define ind1990_lbl 040 `"Metal mining"', add
label define ind1990_lbl 041 `"Coal mining"', add
label define ind1990_lbl 042 `"Oil and gas extraction"', add
label define ind1990_lbl 050 `"Nonmetallic mining and quarrying, except fuels"', add
label define ind1990_lbl 060 `"All construction"', add
label define ind1990_lbl 100 `"Meat products"', add
label define ind1990_lbl 101 `"Dairy products"', add
label define ind1990_lbl 102 `"Canned, frozen, and preserved fruits and vegetables"', add
label define ind1990_lbl 110 `"Grain mill products"', add
label define ind1990_lbl 111 `"Bakery products"', add
label define ind1990_lbl 112 `"Sugar and confectionery products"', add
label define ind1990_lbl 120 `"Beverage industries"', add
label define ind1990_lbl 121 `"Misc. food preparations and kindred products"', add
label define ind1990_lbl 122 `"Food industries, n.s."', add
label define ind1990_lbl 130 `"Tobacco manufactures"', add
label define ind1990_lbl 132 `"Knitting mills"', add
label define ind1990_lbl 140 `"Dyeing and finishing textiles, except wool and knit goods"', add
label define ind1990_lbl 141 `"Carpets and rugs"', add
label define ind1990_lbl 142 `"Yarn, thread, and fabric mills"', add
label define ind1990_lbl 150 `"Miscellaneous textile mill products"', add
label define ind1990_lbl 151 `"Apparel and accessories, except knit"', add
label define ind1990_lbl 152 `"Miscellaneous fabricated textile products"', add
label define ind1990_lbl 160 `"Pulp, paper, and paperboard mills"', add
label define ind1990_lbl 161 `"Miscellaneous paper and pulp products"', add
label define ind1990_lbl 162 `"Paperboard containers and boxes"', add
label define ind1990_lbl 171 `"Newspaper publishing and printing"', add
label define ind1990_lbl 172 `"Printing, publishing, and allied industries, except newspapers"', add
label define ind1990_lbl 180 `"Plastics, synthetics, and resins"', add
label define ind1990_lbl 181 `"Drugs"', add
label define ind1990_lbl 182 `"Soaps and cosmetics"', add
label define ind1990_lbl 190 `"Paints, varnishes, and related products"', add
label define ind1990_lbl 191 `"Agricultural chemicals"', add
label define ind1990_lbl 192 `"Industrial and miscellaneous chemicals"', add
label define ind1990_lbl 200 `"Petroleum refining"', add
label define ind1990_lbl 201 `"Miscellaneous petroleum and coal products"', add
label define ind1990_lbl 210 `"Tires and inner tubes"', add
label define ind1990_lbl 211 `"Other rubber products, and plastics footwear and belting"', add
label define ind1990_lbl 212 `"Miscellaneous plastics products"', add
label define ind1990_lbl 220 `"Leather tanning and finishing"', add
label define ind1990_lbl 221 `"Footwear, except rubber and plastic"', add
label define ind1990_lbl 222 `"Leather products, except footwear"', add
label define ind1990_lbl 229 `"Manufacturing, non-durable - allocated"', add
label define ind1990_lbl 230 `"Logging"', add
label define ind1990_lbl 231 `"Sawmills, planing mills, and millwork"', add
label define ind1990_lbl 232 `"Wood buildings and mobile homes"', add
label define ind1990_lbl 241 `"Miscellaneous wood products"', add
label define ind1990_lbl 242 `"Furniture and fixtures"', add
label define ind1990_lbl 250 `"Glass and glass products"', add
label define ind1990_lbl 251 `"Cement, concrete, gypsum, and plaster products"', add
label define ind1990_lbl 252 `"Structural clay products"', add
label define ind1990_lbl 261 `"Pottery and related products"', add
label define ind1990_lbl 262 `"Misc. nonmetallic mineral and stone products"', add
label define ind1990_lbl 270 `"Blast furnaces, steelworks, rolling and finishing mills"', add
label define ind1990_lbl 271 `"Iron and steel foundries"', add
label define ind1990_lbl 272 `"Primary aluminum industries"', add
label define ind1990_lbl 280 `"Other primary metal industries"', add
label define ind1990_lbl 281 `"Cutlery, handtools, and general hardware"', add
label define ind1990_lbl 282 `"Fabricated structural metal products"', add
label define ind1990_lbl 290 `"Screw machine products"', add
label define ind1990_lbl 291 `"Metal forgings and stampings"', add
label define ind1990_lbl 292 `"Ordnance"', add
label define ind1990_lbl 300 `"Miscellaneous fabricated metal products"', add
label define ind1990_lbl 301 `"Metal industries, n.s."', add
label define ind1990_lbl 310 `"Engines and turbines"', add
label define ind1990_lbl 311 `"Farm machinery and equipment"', add
label define ind1990_lbl 312 `"Construction and material handling machines"', add
label define ind1990_lbl 320 `"Metalworking machinery"', add
label define ind1990_lbl 321 `"Office and accounting machines"', add
label define ind1990_lbl 322 `"Computers and related equipment"', add
label define ind1990_lbl 331 `"Machinery, except electrical, n.e.c."', add
label define ind1990_lbl 332 `"Machinery, n.s."', add
label define ind1990_lbl 340 `"Household appliances"', add
label define ind1990_lbl 341 `"Radio, TV, and communication equipment"', add
label define ind1990_lbl 342 `"Electrical machinery, equipment, and supplies, n.e.c."', add
label define ind1990_lbl 350 `"Electrical machinery, equipment, and supplies, n.s."', add
label define ind1990_lbl 351 `"Motor vehicles and motor vehicle equipment"', add
label define ind1990_lbl 352 `"Aircraft and parts"', add
label define ind1990_lbl 360 `"Ship and boat building and repairing"', add
label define ind1990_lbl 361 `"Railroad locomotives and equipment"', add
label define ind1990_lbl 362 `"Guided missiles, space vehicles, and parts"', add
label define ind1990_lbl 370 `"Cycles and miscellaneous transportation equipment"', add
label define ind1990_lbl 371 `"Scientific and controlling instruments"', add
label define ind1990_lbl 372 `"Medical, dental, and optical instruments and supplies"', add
label define ind1990_lbl 380 `"Photographic equipment and supplies"', add
label define ind1990_lbl 381 `"Watches, clocks, and clockwork operated devices"', add
label define ind1990_lbl 390 `"Toys, amusement, and sporting goods"', add
label define ind1990_lbl 391 `"Miscellaneous manufacturing industries"', add
label define ind1990_lbl 392 `"Manufacturing industries, n.s."', add
label define ind1990_lbl 400 `"Railroads"', add
label define ind1990_lbl 401 `"Bus service and urban transit"', add
label define ind1990_lbl 402 `"Taxicab service"', add
label define ind1990_lbl 410 `"Trucking service"', add
label define ind1990_lbl 411 `"Warehousing and storage"', add
label define ind1990_lbl 412 `"U.S. Postal Service"', add
label define ind1990_lbl 420 `"Water transportation"', add
label define ind1990_lbl 421 `"Air transportation"', add
label define ind1990_lbl 422 `"Pipe lines, except natural gas"', add
label define ind1990_lbl 432 `"Services incidental to transportation"', add
label define ind1990_lbl 440 `"Radio and television broadcasting and cable"', add
label define ind1990_lbl 441 `"Wired communications"', add
label define ind1990_lbl 442 `"Telegraph and miscellaneous communications services"', add
label define ind1990_lbl 450 `"Electric light and power"', add
label define ind1990_lbl 451 `"Gas and steam supply systems"', add
label define ind1990_lbl 452 `"Electric and gas, and other combinations"', add
label define ind1990_lbl 470 `"Water supply and irrigation"', add
label define ind1990_lbl 471 `"Sanitary services"', add
label define ind1990_lbl 472 `"Utilities, n.s."', add
label define ind1990_lbl 500 `"Motor vehicles and equipment"', add
label define ind1990_lbl 501 `"Furniture and home furnishings"', add
label define ind1990_lbl 502 `"Lumber and construction materials"', add
label define ind1990_lbl 510 `"Professional and commercial equipment and supplies"', add
label define ind1990_lbl 511 `"Metals and minerals, except petroleum"', add
label define ind1990_lbl 512 `"Electrical goods"', add
label define ind1990_lbl 521 `"Hardware, plumbing and heating supplies"', add
label define ind1990_lbl 530 `"Machinery, equipment, and supplies"', add
label define ind1990_lbl 531 `"Scrap and waste materials"', add
label define ind1990_lbl 532 `"Miscellaneous wholesale, durable goods"', add
label define ind1990_lbl 540 `"Paper and paper products"', add
label define ind1990_lbl 541 `"Drugs, chemicals, and allied products"', add
label define ind1990_lbl 542 `"Apparel, fabrics, and notions"', add
label define ind1990_lbl 550 `"Groceries and related products"', add
label define ind1990_lbl 551 `"Farm-product raw materials"', add
label define ind1990_lbl 552 `"Petroleum products"', add
label define ind1990_lbl 560 `"Alcoholic beverages"', add
label define ind1990_lbl 561 `"Farm supplies"', add
label define ind1990_lbl 562 `"Miscellaneous wholesale, nondurable goods"', add
label define ind1990_lbl 571 `"Wholesale trade, n.s."', add
label define ind1990_lbl 580 `"Lumber and building material retailing"', add
label define ind1990_lbl 581 `"Hardware stores"', add
label define ind1990_lbl 582 `"Retail nurseries and garden stores"', add
label define ind1990_lbl 590 `"Mobile home dealers"', add
label define ind1990_lbl 591 `"Department stores"', add
label define ind1990_lbl 592 `"Variety stores"', add
label define ind1990_lbl 600 `"Miscellaneous general merchandise stores"', add
label define ind1990_lbl 601 `"Grocery stores"', add
label define ind1990_lbl 602 `"Dairy products stores"', add
label define ind1990_lbl 610 `"Retail bakeries"', add
label define ind1990_lbl 611 `"Food stores, n.e.c."', add
label define ind1990_lbl 612 `"Motor vehicle dealers"', add
label define ind1990_lbl 620 `"Auto and home supply stores"', add
label define ind1990_lbl 621 `"Gasoline service stations"', add
label define ind1990_lbl 622 `"Miscellaneous vehicle dealers"', add
label define ind1990_lbl 623 `"Apparel and accessory stores, except shoe"', add
label define ind1990_lbl 630 `"Shoe stores"', add
label define ind1990_lbl 631 `"Furniture and home furnishings stores"', add
label define ind1990_lbl 632 `"Household appliance stores"', add
label define ind1990_lbl 633 `"Radio, TV, and computer stores"', add
label define ind1990_lbl 640 `"Music stores"', add
label define ind1990_lbl 641 `"Eating and drinking places"', add
label define ind1990_lbl 642 `"Drug stores"', add
label define ind1990_lbl 650 `"Liquor stores"', add
label define ind1990_lbl 651 `"Sporting goods, bicycles, and hobby stores"', add
label define ind1990_lbl 652 `"Book and stationery stores"', add
label define ind1990_lbl 660 `"Jewelry stores"', add
label define ind1990_lbl 661 `"Gift, novelty, and souvenir shops"', add
label define ind1990_lbl 662 `"Sewing, needlework, and piece goods stores"', add
label define ind1990_lbl 663 `"Catalog and mail order houses"', add
label define ind1990_lbl 670 `"Vending machine operators"', add
label define ind1990_lbl 671 `"Direct selling establishments"', add
label define ind1990_lbl 672 `"Fuel dealers"', add
label define ind1990_lbl 681 `"Retail florists"', add
label define ind1990_lbl 682 `"Miscellaneous retail stores"', add
label define ind1990_lbl 691 `"Retail trade, n.s."', add
label define ind1990_lbl 700 `"Banking"', add
label define ind1990_lbl 701 `"Savings institutions, including credit unions"', add
label define ind1990_lbl 702 `"Credit agencies, n.e.c."', add
label define ind1990_lbl 710 `"Security, commodity brokerage, and investment companies"', add
label define ind1990_lbl 711 `"Insurance"', add
label define ind1990_lbl 712 `"Real estate, including real estate-insurance offices"', add
label define ind1990_lbl 721 `"Advertising"', add
label define ind1990_lbl 722 `"Services to dwellings and other buildings"', add
label define ind1990_lbl 731 `"Personnel supply services"', add
label define ind1990_lbl 732 `"Computer and data processing services"', add
label define ind1990_lbl 740 `"Detective and protective services"', add
label define ind1990_lbl 741 `"Business services, n.e.c."', add
label define ind1990_lbl 742 `"Automotive rental and leasing, without drivers"', add
label define ind1990_lbl 750 `"Automobile parking and carwashes"', add
label define ind1990_lbl 751 `"Automotive repair and related services"', add
label define ind1990_lbl 752 `"Electrical repair shops"', add
label define ind1990_lbl 760 `"Miscellaneous repair services"', add
label define ind1990_lbl 761 `"Private households"', add
label define ind1990_lbl 762 `"Hotels and motels"', add
label define ind1990_lbl 770 `"Lodging places, except hotels and motels"', add
label define ind1990_lbl 771 `"Laundry, cleaning, and garment services"', add
label define ind1990_lbl 772 `"Beauty shops"', add
label define ind1990_lbl 780 `"Barber shops"', add
label define ind1990_lbl 781 `"Funeral service and crematories"', add
label define ind1990_lbl 782 `"Shoe repair shops"', add
label define ind1990_lbl 790 `"Dressmaking shops"', add
label define ind1990_lbl 791 `"Miscellaneous personal services"', add
label define ind1990_lbl 800 `"Theaters and motion pictures"', add
label define ind1990_lbl 801 `"Video tape rental"', add
label define ind1990_lbl 802 `"Bowling centers"', add
label define ind1990_lbl 810 `"Miscellaneous entertainment and recreation services"', add
label define ind1990_lbl 812 `"Offices and clinics of physicians"', add
label define ind1990_lbl 820 `"Offices and clinics of dentists"', add
label define ind1990_lbl 821 `"Offices and clinics of chiropractors"', add
label define ind1990_lbl 822 `"Offices and clinics of optometrists"', add
label define ind1990_lbl 830 `"Offices and clinics of health practitioners, n.e.c."', add
label define ind1990_lbl 831 `"Hospitals"', add
label define ind1990_lbl 832 `"Nursing and personal care facilities"', add
label define ind1990_lbl 840 `"Health services, n.e.c."', add
label define ind1990_lbl 841 `"Legal services"', add
label define ind1990_lbl 842 `"Elementary and secondary schools"', add
label define ind1990_lbl 850 `"Colleges and universities"', add
label define ind1990_lbl 851 `"Vocational schools"', add
label define ind1990_lbl 852 `"Libraries"', add
label define ind1990_lbl 860 `"Educational services, n.e.c."', add
label define ind1990_lbl 861 `"Job training and vocational rehabilitation services"', add
label define ind1990_lbl 862 `"Child day care services"', add
label define ind1990_lbl 863 `"Family child care homes"', add
label define ind1990_lbl 870 `"Residential care facilities, without nursing"', add
label define ind1990_lbl 871 `"Social services, n.e.c."', add
label define ind1990_lbl 872 `"Museums, art galleries, and zoos"', add
label define ind1990_lbl 873 `"Labor unions"', add
label define ind1990_lbl 880 `"Religious organizations"', add
label define ind1990_lbl 881 `"Membership organizations, n.e.c."', add
label define ind1990_lbl 882 `"Engineering, architectural, and surveying services"', add
label define ind1990_lbl 890 `"Accounting, auditing, and bookkeeping services"', add
label define ind1990_lbl 891 `"Research, development, and testing services"', add
label define ind1990_lbl 892 `"Management and public relations services"', add
label define ind1990_lbl 893 `"Miscellaneous professional and related services"', add
label define ind1990_lbl 900 `"Executive and legislative offices"', add
label define ind1990_lbl 901 `"General government, n.e.c."', add
label define ind1990_lbl 910 `"Justice, public order, and safety"', add
label define ind1990_lbl 921 `"Public finance, taxation, and monetary policy"', add
label define ind1990_lbl 922 `"Administration of human resources programs"', add
label define ind1990_lbl 930 `"Administration of environmental quality and housing programs"', add
label define ind1990_lbl 931 `"Administration of economic programs"', add
label define ind1990_lbl 932 `"National security and international affairs"', add
label define ind1990_lbl 940 `"Army"', add
label define ind1990_lbl 941 `"Air Force"', add
label define ind1990_lbl 942 `"Navy"', add
label define ind1990_lbl 950 `"Marines"', add
label define ind1990_lbl 951 `"Coast Guard"', add
label define ind1990_lbl 952 `"Armed Forces, branch not specified"', add
label define ind1990_lbl 960 `"Military Reserves or National Guard"', add
label define ind1990_lbl 998 `"Unknown"', add
label values ind1990 ind1990_lbl

label define ind1950_lbl 000 `"NIU"'
label define ind1950_lbl 105 `"Agriculture"', add
label define ind1950_lbl 116 `"Forestry"', add
label define ind1950_lbl 126 `"Fisheries"', add
label define ind1950_lbl 206 `"Metal mining"', add
label define ind1950_lbl 216 `"Coal mining"', add
label define ind1950_lbl 226 `"Crude petroleum and natural gas extraction"', add
label define ind1950_lbl 236 `"Nonmetallic mining and quarrying, except fuel"', add
label define ind1950_lbl 246 `"Construction"', add
label define ind1950_lbl 306 `"Logging"', add
label define ind1950_lbl 307 `"Sawmills, planing mills, and millwork"', add
label define ind1950_lbl 308 `"Misc wood products"', add
label define ind1950_lbl 309 `"Furniture and fixtures"', add
label define ind1950_lbl 316 `"Glass and glass products"', add
label define ind1950_lbl 317 `"Cement, concrete, gypsum and plaster products"', add
label define ind1950_lbl 318 `"Structural clay products"', add
label define ind1950_lbl 319 `"Pottery and related products"', add
label define ind1950_lbl 326 `"Miscellaneous nonmetallic mineral and stone products"', add
label define ind1950_lbl 336 `"Blast furnaces, steel works, and rolling mills"', add
label define ind1950_lbl 337 `"Other primary iron and steel industries"', add
label define ind1950_lbl 338 `"Primary nonferrous industries"', add
label define ind1950_lbl 346 `"Fabricated steel products"', add
label define ind1950_lbl 347 `"Fabricated nonferrous metal products"', add
label define ind1950_lbl 348 `"Not specified metal industries"', add
label define ind1950_lbl 356 `"Agricultural machinery and tractors"', add
label define ind1950_lbl 357 `"Office and store machines and devices"', add
label define ind1950_lbl 358 `"Miscellaneous machinery"', add
label define ind1950_lbl 367 `"Electrical machinery, equipment, and supplies"', add
label define ind1950_lbl 376 `"Motor vehicles and motor vehicle equipment"', add
label define ind1950_lbl 377 `"Aircraft and parts"', add
label define ind1950_lbl 378 `"Ship and boat building and repairing"', add
label define ind1950_lbl 379 `"Railroad and miscellaneous transportation equipment"', add
label define ind1950_lbl 386 `"Professional equipment and supplies"', add
label define ind1950_lbl 387 `"Photographic equipment and supplies"', add
label define ind1950_lbl 388 `"Watches, clocks, and clockwork-operated devices"', add
label define ind1950_lbl 399 `"Miscellaneous manufacturing industries"', add
label define ind1950_lbl 406 `"Meat products"', add
label define ind1950_lbl 407 `"Dairy products"', add
label define ind1950_lbl 408 `"Canning and preserving fruits, vegetables, and seafoods"', add
label define ind1950_lbl 409 `"Grain-mill products"', add
label define ind1950_lbl 416 `"Bakery products"', add
label define ind1950_lbl 417 `"Confectionery and related products"', add
label define ind1950_lbl 418 `"Beverage industries"', add
label define ind1950_lbl 419 `"Miscellaneous food preparations and kindred products"', add
label define ind1950_lbl 426 `"Not specified food industries"', add
label define ind1950_lbl 429 `"Tobacco manufactures"', add
label define ind1950_lbl 436 `"Knitting mills"', add
label define ind1950_lbl 437 `"Dyeing and finishing textiles, except knit goods"', add
label define ind1950_lbl 438 `"Carpets, rugs, and other floor coverings"', add
label define ind1950_lbl 439 `"Yarn, thread, and fabric mills"', add
label define ind1950_lbl 446 `"Miscellaneous textile mill products"', add
label define ind1950_lbl 448 `"Apparel and accessories"', add
label define ind1950_lbl 449 `"Miscellaneous fabricated textile products"', add
label define ind1950_lbl 456 `"Pulp, paper, and paperboard mills"', add
label define ind1950_lbl 457 `"Paperboard containers and boxes"', add
label define ind1950_lbl 458 `"Miscellaneous paper and pulp products"', add
label define ind1950_lbl 459 `"Printing, publishing, and allied industries"', add
label define ind1950_lbl 466 `"Synthetic fibers"', add
label define ind1950_lbl 467 `"Drugs and medicines"', add
label define ind1950_lbl 468 `"Paints, varnishes, and related products"', add
label define ind1950_lbl 469 `"Miscellaneous chemicals and allied products"', add
label define ind1950_lbl 476 `"Petroleum refining"', add
label define ind1950_lbl 477 `"Miscellaneous petroleum and coal products"', add
label define ind1950_lbl 478 `"Rubber products"', add
label define ind1950_lbl 487 `"Leather: tanned, curried, and finished"', add
label define ind1950_lbl 488 `"Footwear, except rubber"', add
label define ind1950_lbl 489 `"Leather products, except footwear"', add
label define ind1950_lbl 499 `"Not specified manufacturing industries"', add
label define ind1950_lbl 506 `"Railroads and railway express service"', add
label define ind1950_lbl 516 `"Street railways and bus lines"', add
label define ind1950_lbl 526 `"Trucking service"', add
label define ind1950_lbl 527 `"Warehousing and storage"', add
label define ind1950_lbl 536 `"Taxicab service"', add
label define ind1950_lbl 546 `"Water transportation"', add
label define ind1950_lbl 556 `"Air transportation"', add
label define ind1950_lbl 567 `"Petroleum and gasoline pipe lines"', add
label define ind1950_lbl 568 `"Services incidental to transportation"', add
label define ind1950_lbl 578 `"Telephone"', add
label define ind1950_lbl 579 `"Telegraph"', add
label define ind1950_lbl 586 `"Electric light and power"', add
label define ind1950_lbl 587 `"Gas and steam supply systems"', add
label define ind1950_lbl 588 `"Electric-gas utilities"', add
label define ind1950_lbl 596 `"Water supply"', add
label define ind1950_lbl 597 `"Sanitary services"', add
label define ind1950_lbl 598 `"Other and not specified utilities"', add
label define ind1950_lbl 606 `"Motor vehicles and equipment"', add
label define ind1950_lbl 607 `"Drugs, chemicals, and allied products"', add
label define ind1950_lbl 608 `"Dry goods apparel"', add
label define ind1950_lbl 609 `"Food and related products"', add
label define ind1950_lbl 616 `"Electrical goods, hardware, and plumbing equipment"', add
label define ind1950_lbl 617 `"Machinery, equipment, and supplies"', add
label define ind1950_lbl 618 `"Petroleum products"', add
label define ind1950_lbl 619 `"Farm products--raw materials"', add
label define ind1950_lbl 626 `"Miscellaneous wholesale trade"', add
label define ind1950_lbl 627 `"Not specified wholesale trade"', add
label define ind1950_lbl 636 `"Food stores, except dairy products"', add
label define ind1950_lbl 637 `"Dairy products stores and milk retailing"', add
label define ind1950_lbl 646 `"General merchandise stores"', add
label define ind1950_lbl 647 `"Five and ten cent stores"', add
label define ind1950_lbl 656 `"Apparel and accessories stores, except shoe"', add
label define ind1950_lbl 657 `"Shoe stores"', add
label define ind1950_lbl 658 `"Furniture and house furnishing stores"', add
label define ind1950_lbl 659 `"Household appliance and radio stores"', add
label define ind1950_lbl 667 `"Motor vehicles and accessories retailing"', add
label define ind1950_lbl 668 `"Gasoline service stations"', add
label define ind1950_lbl 669 `"Drug stores"', add
label define ind1950_lbl 679 `"Eating and drinking places"', add
label define ind1950_lbl 686 `"Hardware and farm implement stores"', add
label define ind1950_lbl 687 `"Lumber and building material retailing"', add
label define ind1950_lbl 688 `"Liquor stores"', add
label define ind1950_lbl 689 `"Retail florists"', add
label define ind1950_lbl 696 `"Jewelry stores"', add
label define ind1950_lbl 697 `"Fuel and ice retailing"', add
label define ind1950_lbl 698 `"Miscellaneous retail stores"', add
label define ind1950_lbl 699 `"Not specified retail trade"', add
label define ind1950_lbl 716 `"Banking and credit agencies"', add
label define ind1950_lbl 726 `"Security and commodity brokerage and investment companies"', add
label define ind1950_lbl 736 `"Insurance"', add
label define ind1950_lbl 746 `"Real estate"', add
label define ind1950_lbl 806 `"Advertising"', add
label define ind1950_lbl 807 `"Accounting, auditing, and bookkeeping services"', add
label define ind1950_lbl 808 `"Miscellaneous business services"', add
label define ind1950_lbl 816 `"Auto repair services and garages"', add
label define ind1950_lbl 817 `"Miscellaneous repair services"', add
label define ind1950_lbl 826 `"Private households"', add
label define ind1950_lbl 836 `"Hotels and lodging places"', add
label define ind1950_lbl 846 `"Laundering, cleaning, and dyeing services"', add
label define ind1950_lbl 847 `"Dressmaking shops"', add
label define ind1950_lbl 848 `"Shoe repair shops"', add
label define ind1950_lbl 849 `"Miscellaneous personal services"', add
label define ind1950_lbl 856 `"Radio broadcasting and television"', add
label define ind1950_lbl 857 `"Theaters and motion pictures"', add
label define ind1950_lbl 858 `"Bowling alleys, and billiard and pool parlors"', add
label define ind1950_lbl 859 `"Miscellaneous entertainment and recreation services"', add
label define ind1950_lbl 868 `"Medical and other health services, except hospitals"', add
label define ind1950_lbl 869 `"Hospitals"', add
label define ind1950_lbl 879 `"Legal services"', add
label define ind1950_lbl 888 `"Educational services"', add
label define ind1950_lbl 896 `"Welfare and religious services"', add
label define ind1950_lbl 897 `"Nonprofit membership organizations"', add
label define ind1950_lbl 898 `"Engineering and architectural services"', add
label define ind1950_lbl 899 `"Miscellaneous professional and related services"', add
label define ind1950_lbl 906 `"Postal service"', add
label define ind1950_lbl 916 `"Federal public administration"', add
label define ind1950_lbl 926 `"State public administration"', add
label define ind1950_lbl 936 `"Local public administration"', add
label define ind1950_lbl 997 `"Nonclassifiable"', add
label define ind1950_lbl 998 `"Industry not reported"', add
label values ind1950 ind1950_lbl

label define classwkr_lbl 00 `"NIU"'
label define classwkr_lbl 10 `"Self-employed"', add
label define classwkr_lbl 13 `"Self-employed, not incorporated"', add
label define classwkr_lbl 14 `"Self-employed, incorporated"', add
label define classwkr_lbl 20 `"Works for wages or salary"', add
label define classwkr_lbl 21 `"Wage/salary, private"', add
label define classwkr_lbl 22 `"Private, for profit"', add
label define classwkr_lbl 23 `"Private, nonprofit"', add
label define classwkr_lbl 24 `"Wage/salary, government"', add
label define classwkr_lbl 25 `"Federal government employee"', add
label define classwkr_lbl 26 `"Armed forces"', add
label define classwkr_lbl 27 `"State government employee"', add
label define classwkr_lbl 28 `"Local government employee"', add
label define classwkr_lbl 29 `"Unpaid family worker"', add
label define classwkr_lbl 99 `"Missing/Unknown"', add
label values classwkr classwkr_lbl

label define uhrsworkt_lbl 997 `"Hours vary"'
label define uhrsworkt_lbl 999 `"NIU"', add
label values uhrsworkt uhrsworkt_lbl

label define wkstat_lbl 10 `"Full-time schedules"'
label define wkstat_lbl 11 `"Full-time hours (35+), usually full-time"', add
label define wkstat_lbl 12 `"Part-time for non-economic reasons, usually full-time"', add
label define wkstat_lbl 13 `"Not at work, usually full-time"', add
label define wkstat_lbl 14 `"Full-time hours, usually part-time for economic reasons"', add
label define wkstat_lbl 15 `"Full-time hours, usually part-time for non-economic reasons"', add
label define wkstat_lbl 20 `"Part-time for economic reasons"', add
label define wkstat_lbl 21 `"Part-time for economic reasons, usually full-time"', add
label define wkstat_lbl 22 `"Part-time hours, usually part-time for economic reasons"', add
label define wkstat_lbl 40 `"Part-time for non-economic reasons, usually part-time"', add
label define wkstat_lbl 41 `"Part-time hours, usually part-time for non-economic reasons"', add
label define wkstat_lbl 42 `"Not at work, usually part-time"', add
label define wkstat_lbl 50 `"Unemployed, seeking full-time work"', add
label define wkstat_lbl 60 `"Unemployed, seeking part-time work"', add
label define wkstat_lbl 99 `"NIU, blank, or not in labor force"', add
label values wkstat wkstat_lbl

label define educ_lbl 000 `"NIU or no schooling"'
label define educ_lbl 001 `"NIU or blank"', add
label define educ_lbl 002 `"None or preschool"', add
label define educ_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_lbl 011 `"Grade 1"', add
label define educ_lbl 012 `"Grade 2"', add
label define educ_lbl 013 `"Grade 3"', add
label define educ_lbl 014 `"Grade 4"', add
label define educ_lbl 020 `"Grades 5 or 6"', add
label define educ_lbl 021 `"Grade 5"', add
label define educ_lbl 022 `"Grade 6"', add
label define educ_lbl 030 `"Grades 7 or 8"', add
label define educ_lbl 031 `"Grade 7"', add
label define educ_lbl 032 `"Grade 8"', add
label define educ_lbl 040 `"Grade 9"', add
label define educ_lbl 050 `"Grade 10"', add
label define educ_lbl 060 `"Grade 11"', add
label define educ_lbl 070 `"Grade 12"', add
label define educ_lbl 071 `"12th grade, no diploma"', add
label define educ_lbl 072 `"12th grade, diploma unclear"', add
label define educ_lbl 073 `"High school diploma or equivalent"', add
label define educ_lbl 080 `"1 year of college"', add
label define educ_lbl 081 `"Some college but no degree"', add
label define educ_lbl 090 `"2 years of college"', add
label define educ_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_lbl 092 `"Associate's degree, academic program"', add
label define educ_lbl 100 `"3 years of college"', add
label define educ_lbl 110 `"4 years of college"', add
label define educ_lbl 111 `"Bachelor's degree"', add
label define educ_lbl 120 `"5+ years of college"', add
label define educ_lbl 121 `"5 years of college"', add
label define educ_lbl 122 `"6+ years of college"', add
label define educ_lbl 123 `"Master's degree"', add
label define educ_lbl 124 `"Professional school degree"', add
label define educ_lbl 125 `"Doctorate degree"', add
label define educ_lbl 999 `"Missing/Unknown"', add
label values educ educ_lbl

label define classwly_lbl 00 `"NIU"'
label define classwly_lbl 10 `"Self-employed"', add
label define classwly_lbl 13 `"Self-employed, not incorporated"', add
label define classwly_lbl 14 `"Self-employed, incorporated"', add
label define classwly_lbl 20 `"Works for wages or salary"', add
label define classwly_lbl 22 `"Wage/salary, private"', add
label define classwly_lbl 24 `"Wage/salary, government"', add
label define classwly_lbl 25 `"Federal government employee"', add
label define classwly_lbl 27 `"State government employee"', add
label define classwly_lbl 28 `"Local government employee"', add
label define classwly_lbl 29 `"Unpaid family worker"', add
label define classwly_lbl 99 `"Missing/Unknown"', add
label values classwly classwly_lbl

label define workly_lbl 00 `"NIU"'
label define workly_lbl 01 `"No"', add
label define workly_lbl 02 `"Yes"', add
label values workly workly_lbl

label define wkswork2_lbl 0 `"NIU"'
label define wkswork2_lbl 1 `"1-13 weeks"', add
label define wkswork2_lbl 2 `"14-26 weeks"', add
label define wkswork2_lbl 3 `"27-39 weeks"', add
label define wkswork2_lbl 4 `"40-47 weeks"', add
label define wkswork2_lbl 5 `"48-49 weeks"', add
label define wkswork2_lbl 6 `"50-52 weeks"', add
label define wkswork2_lbl 9 `"Missing data"', add
label values wkswork2 wkswork2_lbl

label define fullpart_lbl 0 `"NIU"'
label define fullpart_lbl 1 `"Full-time"', add
label define fullpart_lbl 2 `"Part-time"', add
label define fullpart_lbl 9 `"Unknown"', add
label values fullpart fullpart_lbl

label define paidhour_lbl 0 `"NIU"'
label define paidhour_lbl 1 `"No"', add
label define paidhour_lbl 2 `"Yes"', add
label define paidhour_lbl 6 `"Refused"', add
label define paidhour_lbl 7 `"Don't Know"', add
label values paidhour paidhour_lbl

label define age_head_lbl 00 `"Under 1 year"'
label define age_head_lbl 01 `"1"', add
label define age_head_lbl 02 `"2"', add
label define age_head_lbl 03 `"3"', add
label define age_head_lbl 04 `"4"', add
label define age_head_lbl 05 `"5"', add
label define age_head_lbl 06 `"6"', add
label define age_head_lbl 07 `"7"', add
label define age_head_lbl 08 `"8"', add
label define age_head_lbl 09 `"9"', add
label define age_head_lbl 10 `"10"', add
label define age_head_lbl 11 `"11"', add
label define age_head_lbl 12 `"12"', add
label define age_head_lbl 13 `"13"', add
label define age_head_lbl 14 `"14"', add
label define age_head_lbl 15 `"15"', add
label define age_head_lbl 16 `"16"', add
label define age_head_lbl 17 `"17"', add
label define age_head_lbl 18 `"18"', add
label define age_head_lbl 19 `"19"', add
label define age_head_lbl 20 `"20"', add
label define age_head_lbl 21 `"21"', add
label define age_head_lbl 22 `"22"', add
label define age_head_lbl 23 `"23"', add
label define age_head_lbl 24 `"24"', add
label define age_head_lbl 25 `"25"', add
label define age_head_lbl 26 `"26"', add
label define age_head_lbl 27 `"27"', add
label define age_head_lbl 28 `"28"', add
label define age_head_lbl 29 `"29"', add
label define age_head_lbl 30 `"30"', add
label define age_head_lbl 31 `"31"', add
label define age_head_lbl 32 `"32"', add
label define age_head_lbl 33 `"33"', add
label define age_head_lbl 34 `"34"', add
label define age_head_lbl 35 `"35"', add
label define age_head_lbl 36 `"36"', add
label define age_head_lbl 37 `"37"', add
label define age_head_lbl 38 `"38"', add
label define age_head_lbl 39 `"39"', add
label define age_head_lbl 40 `"40"', add
label define age_head_lbl 41 `"41"', add
label define age_head_lbl 42 `"42"', add
label define age_head_lbl 43 `"43"', add
label define age_head_lbl 44 `"44"', add
label define age_head_lbl 45 `"45"', add
label define age_head_lbl 46 `"46"', add
label define age_head_lbl 47 `"47"', add
label define age_head_lbl 48 `"48"', add
label define age_head_lbl 49 `"49"', add
label define age_head_lbl 50 `"50"', add
label define age_head_lbl 51 `"51"', add
label define age_head_lbl 52 `"52"', add
label define age_head_lbl 53 `"53"', add
label define age_head_lbl 54 `"54"', add
label define age_head_lbl 55 `"55"', add
label define age_head_lbl 56 `"56"', add
label define age_head_lbl 57 `"57"', add
label define age_head_lbl 58 `"58"', add
label define age_head_lbl 59 `"59"', add
label define age_head_lbl 60 `"60"', add
label define age_head_lbl 61 `"61"', add
label define age_head_lbl 62 `"62"', add
label define age_head_lbl 63 `"63"', add
label define age_head_lbl 64 `"64"', add
label define age_head_lbl 65 `"65"', add
label define age_head_lbl 66 `"66"', add
label define age_head_lbl 67 `"67"', add
label define age_head_lbl 68 `"68"', add
label define age_head_lbl 69 `"69"', add
label define age_head_lbl 70 `"70"', add
label define age_head_lbl 71 `"71"', add
label define age_head_lbl 72 `"72"', add
label define age_head_lbl 73 `"73"', add
label define age_head_lbl 74 `"74"', add
label define age_head_lbl 75 `"75"', add
label define age_head_lbl 76 `"76"', add
label define age_head_lbl 77 `"77"', add
label define age_head_lbl 78 `"78"', add
label define age_head_lbl 79 `"79"', add
label define age_head_lbl 80 `"80"', add
label define age_head_lbl 81 `"81"', add
label define age_head_lbl 82 `"82"', add
label define age_head_lbl 83 `"83"', add
label define age_head_lbl 84 `"84"', add
label define age_head_lbl 85 `"85"', add
label define age_head_lbl 86 `"86"', add
label define age_head_lbl 87 `"87"', add
label define age_head_lbl 88 `"88"', add
label define age_head_lbl 89 `"89"', add
label define age_head_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_head_lbl 91 `"91"', add
label define age_head_lbl 92 `"92"', add
label define age_head_lbl 93 `"93"', add
label define age_head_lbl 94 `"94"', add
label define age_head_lbl 95 `"95"', add
label define age_head_lbl 96 `"96"', add
label define age_head_lbl 97 `"97"', add
label define age_head_lbl 98 `"98"', add
label define age_head_lbl 99 `"99+"', add
label values age_head age_head_lbl

label define age_sp_lbl 00 `"Under 1 year"'
label define age_sp_lbl 01 `"1"', add
label define age_sp_lbl 02 `"2"', add
label define age_sp_lbl 03 `"3"', add
label define age_sp_lbl 04 `"4"', add
label define age_sp_lbl 05 `"5"', add
label define age_sp_lbl 06 `"6"', add
label define age_sp_lbl 07 `"7"', add
label define age_sp_lbl 08 `"8"', add
label define age_sp_lbl 09 `"9"', add
label define age_sp_lbl 10 `"10"', add
label define age_sp_lbl 11 `"11"', add
label define age_sp_lbl 12 `"12"', add
label define age_sp_lbl 13 `"13"', add
label define age_sp_lbl 14 `"14"', add
label define age_sp_lbl 15 `"15"', add
label define age_sp_lbl 16 `"16"', add
label define age_sp_lbl 17 `"17"', add
label define age_sp_lbl 18 `"18"', add
label define age_sp_lbl 19 `"19"', add
label define age_sp_lbl 20 `"20"', add
label define age_sp_lbl 21 `"21"', add
label define age_sp_lbl 22 `"22"', add
label define age_sp_lbl 23 `"23"', add
label define age_sp_lbl 24 `"24"', add
label define age_sp_lbl 25 `"25"', add
label define age_sp_lbl 26 `"26"', add
label define age_sp_lbl 27 `"27"', add
label define age_sp_lbl 28 `"28"', add
label define age_sp_lbl 29 `"29"', add
label define age_sp_lbl 30 `"30"', add
label define age_sp_lbl 31 `"31"', add
label define age_sp_lbl 32 `"32"', add
label define age_sp_lbl 33 `"33"', add
label define age_sp_lbl 34 `"34"', add
label define age_sp_lbl 35 `"35"', add
label define age_sp_lbl 36 `"36"', add
label define age_sp_lbl 37 `"37"', add
label define age_sp_lbl 38 `"38"', add
label define age_sp_lbl 39 `"39"', add
label define age_sp_lbl 40 `"40"', add
label define age_sp_lbl 41 `"41"', add
label define age_sp_lbl 42 `"42"', add
label define age_sp_lbl 43 `"43"', add
label define age_sp_lbl 44 `"44"', add
label define age_sp_lbl 45 `"45"', add
label define age_sp_lbl 46 `"46"', add
label define age_sp_lbl 47 `"47"', add
label define age_sp_lbl 48 `"48"', add
label define age_sp_lbl 49 `"49"', add
label define age_sp_lbl 50 `"50"', add
label define age_sp_lbl 51 `"51"', add
label define age_sp_lbl 52 `"52"', add
label define age_sp_lbl 53 `"53"', add
label define age_sp_lbl 54 `"54"', add
label define age_sp_lbl 55 `"55"', add
label define age_sp_lbl 56 `"56"', add
label define age_sp_lbl 57 `"57"', add
label define age_sp_lbl 58 `"58"', add
label define age_sp_lbl 59 `"59"', add
label define age_sp_lbl 60 `"60"', add
label define age_sp_lbl 61 `"61"', add
label define age_sp_lbl 62 `"62"', add
label define age_sp_lbl 63 `"63"', add
label define age_sp_lbl 64 `"64"', add
label define age_sp_lbl 65 `"65"', add
label define age_sp_lbl 66 `"66"', add
label define age_sp_lbl 67 `"67"', add
label define age_sp_lbl 68 `"68"', add
label define age_sp_lbl 69 `"69"', add
label define age_sp_lbl 70 `"70"', add
label define age_sp_lbl 71 `"71"', add
label define age_sp_lbl 72 `"72"', add
label define age_sp_lbl 73 `"73"', add
label define age_sp_lbl 74 `"74"', add
label define age_sp_lbl 75 `"75"', add
label define age_sp_lbl 76 `"76"', add
label define age_sp_lbl 77 `"77"', add
label define age_sp_lbl 78 `"78"', add
label define age_sp_lbl 79 `"79"', add
label define age_sp_lbl 80 `"80"', add
label define age_sp_lbl 81 `"81"', add
label define age_sp_lbl 82 `"82"', add
label define age_sp_lbl 83 `"83"', add
label define age_sp_lbl 84 `"84"', add
label define age_sp_lbl 85 `"85"', add
label define age_sp_lbl 86 `"86"', add
label define age_sp_lbl 87 `"87"', add
label define age_sp_lbl 88 `"88"', add
label define age_sp_lbl 89 `"89"', add
label define age_sp_lbl 90 `"90 (90+, 1988-2002)"', add
label define age_sp_lbl 91 `"91"', add
label define age_sp_lbl 92 `"92"', add
label define age_sp_lbl 93 `"93"', add
label define age_sp_lbl 94 `"94"', add
label define age_sp_lbl 95 `"95"', add
label define age_sp_lbl 96 `"96"', add
label define age_sp_lbl 97 `"97"', add
label define age_sp_lbl 98 `"98"', add
label define age_sp_lbl 99 `"99+"', add
label values age_sp age_sp_lbl

label define sex_head_lbl 1 `"Male"'
label define sex_head_lbl 2 `"Female"', add
label define sex_head_lbl 9 `"NIU"', add
label values sex_head sex_head_lbl

label define sex_sp_lbl 1 `"Male"'
label define sex_sp_lbl 2 `"Female"', add
label define sex_sp_lbl 9 `"NIU"', add
label values sex_sp sex_sp_lbl

label define race_head_lbl 100 `"White"'
label define race_head_lbl 200 `"Black/Negro"', add
label define race_head_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_head_lbl 650 `"Asian or Pacific Islander"', add
label define race_head_lbl 651 `"Asian only"', add
label define race_head_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_head_lbl 700 `"Other (single) race, n.e.c."', add
label define race_head_lbl 801 `"White-Black"', add
label define race_head_lbl 802 `"White-American Indian"', add
label define race_head_lbl 803 `"White-Asian"', add
label define race_head_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_head_lbl 805 `"Black-American Indian"', add
label define race_head_lbl 806 `"Black-Asian"', add
label define race_head_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_head_lbl 808 `"American Indian-Asian"', add
label define race_head_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_head_lbl 810 `"White-Black-American Indian"', add
label define race_head_lbl 811 `"White-Black-Asian"', add
label define race_head_lbl 812 `"White-American Indian-Asian"', add
label define race_head_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_head_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_head_lbl 815 `"American Indian-Hawaiian/Pacific Islander"', add
label define race_head_lbl 816 `"White-Black--Hawaiian/Pacific Islander"', add
label define race_head_lbl 817 `"White-American Indian-Hawaiian/Pacific Islander"', add
label define race_head_lbl 818 `"Black-American Indian-Asian"', add
label define race_head_lbl 819 `"White-American Indian-Asian-Hawaiian/Pacific Islander"', add
label define race_head_lbl 820 `"Two or three races, unspecified"', add
label define race_head_lbl 830 `"Four or five races, unspecified"', add
label define race_head_lbl 999 `"Blank"', add
label values race_head race_head_lbl

label define race_sp_lbl 100 `"White"'
label define race_sp_lbl 200 `"Black/Negro"', add
label define race_sp_lbl 300 `"American Indian/Aleut/Eskimo"', add
label define race_sp_lbl 650 `"Asian or Pacific Islander"', add
label define race_sp_lbl 651 `"Asian only"', add
label define race_sp_lbl 652 `"Hawaiian/Pacific Islander only"', add
label define race_sp_lbl 700 `"Other (single) race, n.e.c."', add
label define race_sp_lbl 801 `"White-Black"', add
label define race_sp_lbl 802 `"White-American Indian"', add
label define race_sp_lbl 803 `"White-Asian"', add
label define race_sp_lbl 804 `"White-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 805 `"Black-American Indian"', add
label define race_sp_lbl 806 `"Black-Asian"', add
label define race_sp_lbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 808 `"American Indian-Asian"', add
label define race_sp_lbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 810 `"White-Black-American Indian"', add
label define race_sp_lbl 811 `"White-Black-Asian"', add
label define race_sp_lbl 812 `"White-American Indian-Asian"', add
label define race_sp_lbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 814 `"White-Black-American Indian-Asian"', add
label define race_sp_lbl 815 `"American Indian-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 816 `"White-Black--Hawaiian/Pacific Islander"', add
label define race_sp_lbl 817 `"White-American Indian-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 818 `"Black-American Indian-Asian"', add
label define race_sp_lbl 819 `"White-American Indian-Asian-Hawaiian/Pacific Islander"', add
label define race_sp_lbl 820 `"Two or three races, unspecified"', add
label define race_sp_lbl 830 `"Four or five races, unspecified"', add
label define race_sp_lbl 999 `"Blank"', add
label values race_sp race_sp_lbl

label define marst_head_lbl 1 `"Married, spouse present"'
label define marst_head_lbl 2 `"Married, spouse absent"', add
label define marst_head_lbl 3 `"Separated"', add
label define marst_head_lbl 4 `"Divorced"', add
label define marst_head_lbl 5 `"Widowed"', add
label define marst_head_lbl 6 `"Never married/single"', add
label define marst_head_lbl 7 `"Widowed or Divorced"', add
label define marst_head_lbl 9 `"NIU"', add
label values marst_head marst_head_lbl

label define marst_sp_lbl 1 `"Married, spouse present"'
label define marst_sp_lbl 2 `"Married, spouse absent"', add
label define marst_sp_lbl 3 `"Separated"', add
label define marst_sp_lbl 4 `"Divorced"', add
label define marst_sp_lbl 5 `"Widowed"', add
label define marst_sp_lbl 6 `"Never married/single"', add
label define marst_sp_lbl 7 `"Widowed or Divorced"', add
label define marst_sp_lbl 9 `"NIU"', add
label values marst_sp marst_sp_lbl

label define nchild_head_lbl 0 `"0 children present"'
label define nchild_head_lbl 1 `"1 child present"', add
label define nchild_head_lbl 2 `"2"', add
label define nchild_head_lbl 3 `"3"', add
label define nchild_head_lbl 4 `"4"', add
label define nchild_head_lbl 5 `"5"', add
label define nchild_head_lbl 6 `"6"', add
label define nchild_head_lbl 7 `"7"', add
label define nchild_head_lbl 8 `"8"', add
label define nchild_head_lbl 9 `"9+"', add
label values nchild_head nchild_head_lbl

label define nchild_sp_lbl 0 `"0 children present"'
label define nchild_sp_lbl 1 `"1 child present"', add
label define nchild_sp_lbl 2 `"2"', add
label define nchild_sp_lbl 3 `"3"', add
label define nchild_sp_lbl 4 `"4"', add
label define nchild_sp_lbl 5 `"5"', add
label define nchild_sp_lbl 6 `"6"', add
label define nchild_sp_lbl 7 `"7"', add
label define nchild_sp_lbl 8 `"8"', add
label define nchild_sp_lbl 9 `"9+"', add
label values nchild_sp nchild_sp_lbl

label define bpl_head_lbl 09900 `"United States, n.s."'
label define bpl_head_lbl 10000 `"American Samoa"', add
label define bpl_head_lbl 10500 `"Guam"', add
label define bpl_head_lbl 10750 `"Northern Mariana Islands"', add
label define bpl_head_lbl 11000 `"Puerto Rico"', add
label define bpl_head_lbl 11500 `"U.S. Virgin Islands"', add
label define bpl_head_lbl 12090 `"U.S. outlying areas, n.s."', add
label define bpl_head_lbl 15000 `"Canada"', add
label define bpl_head_lbl 16010 `"Bermuda"', add
label define bpl_head_lbl 19900 `"North America, n.s."', add
label define bpl_head_lbl 20000 `"Mexico"', add
label define bpl_head_lbl 21010 `"Belize/British Honduras"', add
label define bpl_head_lbl 21020 `"Costa Rica"', add
label define bpl_head_lbl 21030 `"El Salvador"', add
label define bpl_head_lbl 21040 `"Guatemala"', add
label define bpl_head_lbl 21050 `"Honduras"', add
label define bpl_head_lbl 21060 `"Nicaragua"', add
label define bpl_head_lbl 21070 `"Panama"', add
label define bpl_head_lbl 21090 `"Central America, n.s."', add
label define bpl_head_lbl 25000 `"Cuba"', add
label define bpl_head_lbl 26010 `"Dominican Republic"', add
label define bpl_head_lbl 26020 `"Haiti"', add
label define bpl_head_lbl 26030 `"Jamaica"', add
label define bpl_head_lbl 26043 `"Bahamas"', add
label define bpl_head_lbl 26044 `"Barbados"', add
label define bpl_head_lbl 26054 `"Dominica"', add
label define bpl_head_lbl 26055 `"Grenada"', add
label define bpl_head_lbl 26060 `"Trinidad and Tobago"', add
label define bpl_head_lbl 26065 `"Antigua and Barbuda"', add
label define bpl_head_lbl 26070 `"St. Kitts--Nevis"', add
label define bpl_head_lbl 26075 `"St. Lucia"', add
label define bpl_head_lbl 26080 `"St. Vincent and the Grenadi"', add
label define bpl_head_lbl 26091 `"Caribbean, n.s."', add
label define bpl_head_lbl 30005 `"Argentina"', add
label define bpl_head_lbl 30010 `"Bolivia"', add
label define bpl_head_lbl 30015 `"Brazil"', add
label define bpl_head_lbl 30020 `"Chile"', add
label define bpl_head_lbl 30025 `"Colombia"', add
label define bpl_head_lbl 30030 `"Ecuador"', add
label define bpl_head_lbl 30040 `"Guyana/British Guiana"', add
label define bpl_head_lbl 30050 `"Peru"', add
label define bpl_head_lbl 30060 `"Uruguay"', add
label define bpl_head_lbl 30065 `"Venezuela"', add
label define bpl_head_lbl 30070 `"Paraguay"', add
label define bpl_head_lbl 30090 `"South America, n.s."', add
label define bpl_head_lbl 31000 `"Americas, n.s."', add
label define bpl_head_lbl 40000 `"Denmark"', add
label define bpl_head_lbl 40100 `"Finland"', add
label define bpl_head_lbl 40200 `"Iceland"', add
label define bpl_head_lbl 40400 `"Norway"', add
label define bpl_head_lbl 40500 `"Sweden"', add
label define bpl_head_lbl 41000 `"England"', add
label define bpl_head_lbl 41100 `"Scotland"', add
label define bpl_head_lbl 41200 `"Wales"', add
label define bpl_head_lbl 41300 `"United Kingdom, n.s."', add
label define bpl_head_lbl 41400 `"Ireland"', add
label define bpl_head_lbl 41410 `"Northern Ireland"', add
label define bpl_head_lbl 42000 `"Belgium"', add
label define bpl_head_lbl 42100 `"France"', add
label define bpl_head_lbl 42500 `"Netherlands"', add
label define bpl_head_lbl 42600 `"Switzerland"', add
label define bpl_head_lbl 43300 `"Greece"', add
label define bpl_head_lbl 43400 `"Italy"', add
label define bpl_head_lbl 43600 `"Portugal"', add
label define bpl_head_lbl 43610 `"Azores"', add
label define bpl_head_lbl 43800 `"Spain"', add
label define bpl_head_lbl 45000 `"Austria"', add
label define bpl_head_lbl 45200 `"Czechoslavakia"', add
label define bpl_head_lbl 45212 `"Slovakia"', add
label define bpl_head_lbl 45213 `"Czech Republic"', add
label define bpl_head_lbl 45300 `"Germany"', add
label define bpl_head_lbl 45400 `"Hungary"', add
label define bpl_head_lbl 45500 `"Poland"', add
label define bpl_head_lbl 45600 `"Romania"', add
label define bpl_head_lbl 45650 `"Bulgaria"', add
label define bpl_head_lbl 45675 `"Albania"', add
label define bpl_head_lbl 45700 `"Yugoslavia"', add
label define bpl_head_lbl 45720 `"Bosnia and Herzegovina"', add
label define bpl_head_lbl 45730 `"Croatia"', add
label define bpl_head_lbl 45740 `"Macedonia"', add
label define bpl_head_lbl 45750 `"Serbia"', add
label define bpl_head_lbl 45760 `"Kosovo"', add
label define bpl_head_lbl 45770 `"Montenego"', add
label define bpl_head_lbl 46100 `"Estonia"', add
label define bpl_head_lbl 46200 `"Latvia"', add
label define bpl_head_lbl 46300 `"Lithuania"', add
label define bpl_head_lbl 46500 `"Other USSR/Russia"', add
label define bpl_head_lbl 46530 `"Ukraine"', add
label define bpl_head_lbl 46535 `"Belarus"', add
label define bpl_head_lbl 46540 `"Moldova"', add
label define bpl_head_lbl 46590 `"USSR, n.s."', add
label define bpl_head_lbl 49900 `"Europe, n.s."', add
label define bpl_head_lbl 50000 `"China"', add
label define bpl_head_lbl 50010 `"Hong Kong"', add
label define bpl_head_lbl 50040 `"Taiwan"', add
label define bpl_head_lbl 50100 `"Japan"', add
label define bpl_head_lbl 50200 `"Korea"', add
label define bpl_head_lbl 50220 `"South Korea"', add
label define bpl_head_lbl 50300 `"Mongolia"', add
label define bpl_head_lbl 51100 `"Cambodia"', add
label define bpl_head_lbl 51200 `"Indonesia"', add
label define bpl_head_lbl 51300 `"Laos"', add
label define bpl_head_lbl 51400 `"Malaysia"', add
label define bpl_head_lbl 51500 `"Philippines"', add
label define bpl_head_lbl 51600 `"Singapore"', add
label define bpl_head_lbl 51700 `"Thailand"', add
label define bpl_head_lbl 51800 `"Vietnam"', add
label define bpl_head_lbl 52000 `"Afghanistan"', add
label define bpl_head_lbl 52100 `"India"', add
label define bpl_head_lbl 52110 `"Bangladesh"', add
label define bpl_head_lbl 52120 `"Bhutan"', add
label define bpl_head_lbl 52130 `"Burma"', add
label define bpl_head_lbl 52140 `"Pakistan"', add
label define bpl_head_lbl 52150 `"Sri Lanka"', add
label define bpl_head_lbl 52200 `"Nepal"', add
label define bpl_head_lbl 55100 `"Armenia"', add
label define bpl_head_lbl 55200 `"Azerbaijan"', add
label define bpl_head_lbl 55300 `"Georgia"', add
label define bpl_head_lbl 55400 `"Uzbekistan"', add
label define bpl_head_lbl 55500 `"Kazakhstan"', add
label define bpl_head_lbl 53000 `"Iran"', add
label define bpl_head_lbl 53200 `"Iraq"', add
label define bpl_head_lbl 53400 `"Israel"', add
label define bpl_head_lbl 53420 `"Palestine"', add
label define bpl_head_lbl 53500 `"Jordan"', add
label define bpl_head_lbl 53700 `"Lebanon"', add
label define bpl_head_lbl 54000 `"Saudi Arabia"', add
label define bpl_head_lbl 54100 `"Syria"', add
label define bpl_head_lbl 54200 `"Turkey"', add
label define bpl_head_lbl 54300 `"Cyprus"', add
label define bpl_head_lbl 54350 `"Kuwait"', add
label define bpl_head_lbl 54400 `"Yemen"', add
label define bpl_head_lbl 54500 `"United Arab Emirates"', add
label define bpl_head_lbl 54700 `"Middle East, n.s."', add
label define bpl_head_lbl 59900 `"Asia, n.e.c./n.s."', add
label define bpl_head_lbl 60010 `"Northern Africa"', add
label define bpl_head_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpl_head_lbl 60014 `"Morocco"', add
label define bpl_head_lbl 60016 `"Algeria"', add
label define bpl_head_lbl 60018 `"Sudan"', add
label define bpl_head_lbl 60019 `"Libya"', add
label define bpl_head_lbl 60023 `"Ghana"', add
label define bpl_head_lbl 60031 `"Nigeria"', add
label define bpl_head_lbl 60032 `"Cameroon"', add
label define bpl_head_lbl 60033 `"Cape Verde"', add
label define bpl_head_lbl 60034 `"Liberia"', add
label define bpl_head_lbl 60035 `"Senegal"', add
label define bpl_head_lbl 60036 `"Sierra Leone"', add
label define bpl_head_lbl 60037 `"Guinea"', add
label define bpl_head_lbl 60038 `"Ivory Coast"', add
label define bpl_head_lbl 60039 `"Togo"', add
label define bpl_head_lbl 60040 `"Eritrea"', add
label define bpl_head_lbl 60044 `"Ethiopia"', add
label define bpl_head_lbl 60045 `"Kenya"', add
label define bpl_head_lbl 60050 `"Somalia"', add
label define bpl_head_lbl 60060 `"Tanzania"', add
label define bpl_head_lbl 60065 `"Uganda"', add
label define bpl_head_lbl 60070 `"Zimbabwe"', add
label define bpl_head_lbl 60094 `"South Africa (Union of)"', add
label define bpl_head_lbl 60095 `"Zaire"', add
label define bpl_head_lbl 60096 `"Congo"', add
label define bpl_head_lbl 60097 `"Zambia"', add
label define bpl_head_lbl 60099 `"Africa, n.s./n.e.c."', add
label define bpl_head_lbl 70010 `"Australia"', add
label define bpl_head_lbl 70020 `"New Zealand"', add
label define bpl_head_lbl 71000 `"Pacific Islands"', add
label define bpl_head_lbl 71021 `"Fiji"', add
label define bpl_head_lbl 71022 `"Tonga"', add
label define bpl_head_lbl 71023 `"Samoa"', add
label define bpl_head_lbl 71024 `"Marshall Islands"', add
label define bpl_head_lbl 72000 `"Micronesia"', add
label define bpl_head_lbl 96000 `"Other, n.e.c. and unknown"', add
label define bpl_head_lbl 99999 `"NIU"', add
label values bpl_head bpl_head_lbl

label define bpl_sp_lbl 09900 `"United States, n.s."'
label define bpl_sp_lbl 10000 `"American Samoa"', add
label define bpl_sp_lbl 10500 `"Guam"', add
label define bpl_sp_lbl 10750 `"Northern Mariana Islands"', add
label define bpl_sp_lbl 11000 `"Puerto Rico"', add
label define bpl_sp_lbl 11500 `"U.S. Virgin Islands"', add
label define bpl_sp_lbl 12090 `"U.S. outlying areas, n.s."', add
label define bpl_sp_lbl 15000 `"Canada"', add
label define bpl_sp_lbl 16010 `"Bermuda"', add
label define bpl_sp_lbl 19900 `"North America, n.s."', add
label define bpl_sp_lbl 20000 `"Mexico"', add
label define bpl_sp_lbl 21010 `"Belize/British Honduras"', add
label define bpl_sp_lbl 21020 `"Costa Rica"', add
label define bpl_sp_lbl 21030 `"El Salvador"', add
label define bpl_sp_lbl 21040 `"Guatemala"', add
label define bpl_sp_lbl 21050 `"Honduras"', add
label define bpl_sp_lbl 21060 `"Nicaragua"', add
label define bpl_sp_lbl 21070 `"Panama"', add
label define bpl_sp_lbl 21090 `"Central America, n.s."', add
label define bpl_sp_lbl 25000 `"Cuba"', add
label define bpl_sp_lbl 26010 `"Dominican Republic"', add
label define bpl_sp_lbl 26020 `"Haiti"', add
label define bpl_sp_lbl 26030 `"Jamaica"', add
label define bpl_sp_lbl 26043 `"Bahamas"', add
label define bpl_sp_lbl 26044 `"Barbados"', add
label define bpl_sp_lbl 26054 `"Dominica"', add
label define bpl_sp_lbl 26055 `"Grenada"', add
label define bpl_sp_lbl 26060 `"Trinidad and Tobago"', add
label define bpl_sp_lbl 26065 `"Antigua and Barbuda"', add
label define bpl_sp_lbl 26070 `"St. Kitts--Nevis"', add
label define bpl_sp_lbl 26075 `"St. Lucia"', add
label define bpl_sp_lbl 26080 `"St. Vincent and the Grenadi"', add
label define bpl_sp_lbl 26091 `"Caribbean, n.s."', add
label define bpl_sp_lbl 30005 `"Argentina"', add
label define bpl_sp_lbl 30010 `"Bolivia"', add
label define bpl_sp_lbl 30015 `"Brazil"', add
label define bpl_sp_lbl 30020 `"Chile"', add
label define bpl_sp_lbl 30025 `"Colombia"', add
label define bpl_sp_lbl 30030 `"Ecuador"', add
label define bpl_sp_lbl 30040 `"Guyana/British Guiana"', add
label define bpl_sp_lbl 30050 `"Peru"', add
label define bpl_sp_lbl 30060 `"Uruguay"', add
label define bpl_sp_lbl 30065 `"Venezuela"', add
label define bpl_sp_lbl 30070 `"Paraguay"', add
label define bpl_sp_lbl 30090 `"South America, n.s."', add
label define bpl_sp_lbl 31000 `"Americas, n.s."', add
label define bpl_sp_lbl 40000 `"Denmark"', add
label define bpl_sp_lbl 40100 `"Finland"', add
label define bpl_sp_lbl 40200 `"Iceland"', add
label define bpl_sp_lbl 40400 `"Norway"', add
label define bpl_sp_lbl 40500 `"Sweden"', add
label define bpl_sp_lbl 41000 `"England"', add
label define bpl_sp_lbl 41100 `"Scotland"', add
label define bpl_sp_lbl 41200 `"Wales"', add
label define bpl_sp_lbl 41300 `"United Kingdom, n.s."', add
label define bpl_sp_lbl 41400 `"Ireland"', add
label define bpl_sp_lbl 41410 `"Northern Ireland"', add
label define bpl_sp_lbl 42000 `"Belgium"', add
label define bpl_sp_lbl 42100 `"France"', add
label define bpl_sp_lbl 42500 `"Netherlands"', add
label define bpl_sp_lbl 42600 `"Switzerland"', add
label define bpl_sp_lbl 43300 `"Greece"', add
label define bpl_sp_lbl 43400 `"Italy"', add
label define bpl_sp_lbl 43600 `"Portugal"', add
label define bpl_sp_lbl 43610 `"Azores"', add
label define bpl_sp_lbl 43800 `"Spain"', add
label define bpl_sp_lbl 45000 `"Austria"', add
label define bpl_sp_lbl 45200 `"Czechoslavakia"', add
label define bpl_sp_lbl 45212 `"Slovakia"', add
label define bpl_sp_lbl 45213 `"Czech Republic"', add
label define bpl_sp_lbl 45300 `"Germany"', add
label define bpl_sp_lbl 45400 `"Hungary"', add
label define bpl_sp_lbl 45500 `"Poland"', add
label define bpl_sp_lbl 45600 `"Romania"', add
label define bpl_sp_lbl 45650 `"Bulgaria"', add
label define bpl_sp_lbl 45675 `"Albania"', add
label define bpl_sp_lbl 45700 `"Yugoslavia"', add
label define bpl_sp_lbl 45720 `"Bosnia and Herzegovina"', add
label define bpl_sp_lbl 45730 `"Croatia"', add
label define bpl_sp_lbl 45740 `"Macedonia"', add
label define bpl_sp_lbl 45750 `"Serbia"', add
label define bpl_sp_lbl 45760 `"Kosovo"', add
label define bpl_sp_lbl 45770 `"Montenego"', add
label define bpl_sp_lbl 46100 `"Estonia"', add
label define bpl_sp_lbl 46200 `"Latvia"', add
label define bpl_sp_lbl 46300 `"Lithuania"', add
label define bpl_sp_lbl 46500 `"Other USSR/Russia"', add
label define bpl_sp_lbl 46530 `"Ukraine"', add
label define bpl_sp_lbl 46535 `"Belarus"', add
label define bpl_sp_lbl 46540 `"Moldova"', add
label define bpl_sp_lbl 46590 `"USSR, n.s."', add
label define bpl_sp_lbl 49900 `"Europe, n.s."', add
label define bpl_sp_lbl 50000 `"China"', add
label define bpl_sp_lbl 50010 `"Hong Kong"', add
label define bpl_sp_lbl 50040 `"Taiwan"', add
label define bpl_sp_lbl 50100 `"Japan"', add
label define bpl_sp_lbl 50200 `"Korea"', add
label define bpl_sp_lbl 50220 `"South Korea"', add
label define bpl_sp_lbl 50300 `"Mongolia"', add
label define bpl_sp_lbl 51100 `"Cambodia"', add
label define bpl_sp_lbl 51200 `"Indonesia"', add
label define bpl_sp_lbl 51300 `"Laos"', add
label define bpl_sp_lbl 51400 `"Malaysia"', add
label define bpl_sp_lbl 51500 `"Philippines"', add
label define bpl_sp_lbl 51600 `"Singapore"', add
label define bpl_sp_lbl 51700 `"Thailand"', add
label define bpl_sp_lbl 51800 `"Vietnam"', add
label define bpl_sp_lbl 52000 `"Afghanistan"', add
label define bpl_sp_lbl 52100 `"India"', add
label define bpl_sp_lbl 52110 `"Bangladesh"', add
label define bpl_sp_lbl 52120 `"Bhutan"', add
label define bpl_sp_lbl 52130 `"Burma"', add
label define bpl_sp_lbl 52140 `"Pakistan"', add
label define bpl_sp_lbl 52150 `"Sri Lanka"', add
label define bpl_sp_lbl 52200 `"Nepal"', add
label define bpl_sp_lbl 55100 `"Armenia"', add
label define bpl_sp_lbl 55200 `"Azerbaijan"', add
label define bpl_sp_lbl 55300 `"Georgia"', add
label define bpl_sp_lbl 55400 `"Uzbekistan"', add
label define bpl_sp_lbl 55500 `"Kazakhstan"', add
label define bpl_sp_lbl 53000 `"Iran"', add
label define bpl_sp_lbl 53200 `"Iraq"', add
label define bpl_sp_lbl 53400 `"Israel"', add
label define bpl_sp_lbl 53420 `"Palestine"', add
label define bpl_sp_lbl 53500 `"Jordan"', add
label define bpl_sp_lbl 53700 `"Lebanon"', add
label define bpl_sp_lbl 54000 `"Saudi Arabia"', add
label define bpl_sp_lbl 54100 `"Syria"', add
label define bpl_sp_lbl 54200 `"Turkey"', add
label define bpl_sp_lbl 54300 `"Cyprus"', add
label define bpl_sp_lbl 54350 `"Kuwait"', add
label define bpl_sp_lbl 54400 `"Yemen"', add
label define bpl_sp_lbl 54500 `"United Arab Emirates"', add
label define bpl_sp_lbl 54700 `"Middle East, n.s."', add
label define bpl_sp_lbl 59900 `"Asia, n.e.c./n.s."', add
label define bpl_sp_lbl 60010 `"Northern Africa"', add
label define bpl_sp_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpl_sp_lbl 60014 `"Morocco"', add
label define bpl_sp_lbl 60016 `"Algeria"', add
label define bpl_sp_lbl 60018 `"Sudan"', add
label define bpl_sp_lbl 60019 `"Libya"', add
label define bpl_sp_lbl 60023 `"Ghana"', add
label define bpl_sp_lbl 60031 `"Nigeria"', add
label define bpl_sp_lbl 60032 `"Cameroon"', add
label define bpl_sp_lbl 60033 `"Cape Verde"', add
label define bpl_sp_lbl 60034 `"Liberia"', add
label define bpl_sp_lbl 60035 `"Senegal"', add
label define bpl_sp_lbl 60036 `"Sierra Leone"', add
label define bpl_sp_lbl 60037 `"Guinea"', add
label define bpl_sp_lbl 60038 `"Ivory Coast"', add
label define bpl_sp_lbl 60039 `"Togo"', add
label define bpl_sp_lbl 60040 `"Eritrea"', add
label define bpl_sp_lbl 60044 `"Ethiopia"', add
label define bpl_sp_lbl 60045 `"Kenya"', add
label define bpl_sp_lbl 60050 `"Somalia"', add
label define bpl_sp_lbl 60060 `"Tanzania"', add
label define bpl_sp_lbl 60065 `"Uganda"', add
label define bpl_sp_lbl 60070 `"Zimbabwe"', add
label define bpl_sp_lbl 60094 `"South Africa (Union of)"', add
label define bpl_sp_lbl 60095 `"Zaire"', add
label define bpl_sp_lbl 60096 `"Congo"', add
label define bpl_sp_lbl 60097 `"Zambia"', add
label define bpl_sp_lbl 60099 `"Africa, n.s./n.e.c."', add
label define bpl_sp_lbl 70010 `"Australia"', add
label define bpl_sp_lbl 70020 `"New Zealand"', add
label define bpl_sp_lbl 71000 `"Pacific Islands"', add
label define bpl_sp_lbl 71021 `"Fiji"', add
label define bpl_sp_lbl 71022 `"Tonga"', add
label define bpl_sp_lbl 71023 `"Samoa"', add
label define bpl_sp_lbl 71024 `"Marshall Islands"', add
label define bpl_sp_lbl 72000 `"Micronesia"', add
label define bpl_sp_lbl 96000 `"Other, n.e.c. and unknown"', add
label define bpl_sp_lbl 99999 `"NIU"', add
label values bpl_sp bpl_sp_lbl

label define citizen_head_lbl 1 `"Born in U.S"'
label define citizen_head_lbl 2 `"Born in U.S. outlying"', add
label define citizen_head_lbl 3 `"Born abroad of American parents"', add
label define citizen_head_lbl 4 `"Naturalized citizen"', add
label define citizen_head_lbl 5 `"Not a citizen"', add
label define citizen_head_lbl 9 `"NIU"', add
label values citizen_head citizen_head_lbl

label define citizen_sp_lbl 1 `"Born in U.S"'
label define citizen_sp_lbl 2 `"Born in U.S. outlying"', add
label define citizen_sp_lbl 3 `"Born abroad of American parents"', add
label define citizen_sp_lbl 4 `"Naturalized citizen"', add
label define citizen_sp_lbl 5 `"Not a citizen"', add
label define citizen_sp_lbl 9 `"NIU"', add
label values citizen_sp citizen_sp_lbl

label define mbpl_head_lbl 09900 `"U.S., n.s."'
label define mbpl_head_lbl 10000 `"American Samoa"', add
label define mbpl_head_lbl 10500 `"Guam"', add
label define mbpl_head_lbl 11000 `"Puerto Rico"', add
label define mbpl_head_lbl 11500 `"U.S. Virgin Islands"', add
label define mbpl_head_lbl 12090 `"U.S. outlying areas, n.s."', add
label define mbpl_head_lbl 15000 `"Canada"', add
label define mbpl_head_lbl 16010 `"Bermuda"', add
label define mbpl_head_lbl 10750 `"Northern Mariana Islands"', add
label define mbpl_head_lbl 19900 `"North America, n.s."', add
label define mbpl_head_lbl 20000 `"Mexico"', add
label define mbpl_head_lbl 21010 `"Belize/British Honduras"', add
label define mbpl_head_lbl 21020 `"Costa Rica"', add
label define mbpl_head_lbl 21030 `"El Salvador"', add
label define mbpl_head_lbl 21040 `"Guatemala"', add
label define mbpl_head_lbl 21050 `"Honduras"', add
label define mbpl_head_lbl 21060 `"Nicaragua"', add
label define mbpl_head_lbl 21070 `"Panama"', add
label define mbpl_head_lbl 21090 `"Central America, n.s."', add
label define mbpl_head_lbl 25000 `"Cuba"', add
label define mbpl_head_lbl 26000 `"West Indies"', add
label define mbpl_head_lbl 26010 `"Dominican Republic"', add
label define mbpl_head_lbl 26020 `"Haiti"', add
label define mbpl_head_lbl 26030 `"Jamaica"', add
label define mbpl_head_lbl 26043 `"Bahamas"', add
label define mbpl_head_lbl 26044 `"Barbados"', add
label define mbpl_head_lbl 26054 `"Dominica"', add
label define mbpl_head_lbl 26055 `"Grenada"', add
label define mbpl_head_lbl 26060 `"Trinidad and Tobago"', add
label define mbpl_head_lbl 26065 `"Antigua and Barbuda"', add
label define mbpl_head_lbl 26070 `"St. Kitts--Nevis"', add
label define mbpl_head_lbl 26075 `"St. Lucia"', add
label define mbpl_head_lbl 26080 `"St. Vincent and the Grenadi"', add
label define mbpl_head_lbl 30000 `"South America"', add
label define mbpl_head_lbl 30005 `"Argentina"', add
label define mbpl_head_lbl 30010 `"Bolivia"', add
label define mbpl_head_lbl 30015 `"Brazil"', add
label define mbpl_head_lbl 30020 `"Chile"', add
label define mbpl_head_lbl 30025 `"Colombia"', add
label define mbpl_head_lbl 30030 `"Ecuador"', add
label define mbpl_head_lbl 30040 `"Guyana/British Guiana"', add
label define mbpl_head_lbl 30050 `"Peru"', add
label define mbpl_head_lbl 30060 `"Uruguay"', add
label define mbpl_head_lbl 30065 `"Venezuala"', add
label define mbpl_head_lbl 30070 `"Paraguay"', add
label define mbpl_head_lbl 31000 `"Americas, n.s."', add
label define mbpl_head_lbl 40000 `"Denmark"', add
label define mbpl_head_lbl 40100 `"Finland"', add
label define mbpl_head_lbl 40200 `"Iceland"', add
label define mbpl_head_lbl 40400 `"Norway"', add
label define mbpl_head_lbl 40500 `"Sweden"', add
label define mbpl_head_lbl 41000 `"England"', add
label define mbpl_head_lbl 41100 `"Scotland"', add
label define mbpl_head_lbl 41200 `"Wales"', add
label define mbpl_head_lbl 41300 `"United Kingdom, n.s."', add
label define mbpl_head_lbl 41400 `"Ireland"', add
label define mbpl_head_lbl 41410 `"Northern Ireland"', add
label define mbpl_head_lbl 42000 `"Belgium"', add
label define mbpl_head_lbl 42100 `"France"', add
label define mbpl_head_lbl 42500 `"Netherlands"', add
label define mbpl_head_lbl 42600 `"Switzerland"', add
label define mbpl_head_lbl 43300 `"Greece"', add
label define mbpl_head_lbl 43400 `"Italy"', add
label define mbpl_head_lbl 43600 `"Portugal"', add
label define mbpl_head_lbl 43610 `"Azores"', add
label define mbpl_head_lbl 43800 `"Spain"', add
label define mbpl_head_lbl 45000 `"Austria"', add
label define mbpl_head_lbl 45200 `"Czechoslavakia"', add
label define mbpl_head_lbl 45212 `"Slovakia"', add
label define mbpl_head_lbl 45213 `"Czech Republic"', add
label define mbpl_head_lbl 45300 `"Germany"', add
label define mbpl_head_lbl 45400 `"Hungary"', add
label define mbpl_head_lbl 45500 `"Poland"', add
label define mbpl_head_lbl 45600 `"Romania"', add
label define mbpl_head_lbl 45650 `"Bulgaria"', add
label define mbpl_head_lbl 45675 `"Albania"', add
label define mbpl_head_lbl 45700 `"Yugoslavia"', add
label define mbpl_head_lbl 45720 `"Bosnia and Herzegovina"', add
label define mbpl_head_lbl 45730 `"Croatia"', add
label define mbpl_head_lbl 45740 `"Macedonia"', add
label define mbpl_head_lbl 45750 `"Serbia"', add
label define mbpl_head_lbl 45760 `"Kosovo"', add
label define mbpl_head_lbl 45770 `"Montenego"', add
label define mbpl_head_lbl 46100 `"Estonia"', add
label define mbpl_head_lbl 46200 `"Latvia"', add
label define mbpl_head_lbl 46300 `"Lithuania"', add
label define mbpl_head_lbl 46500 `"Other USSR/Russia"', add
label define mbpl_head_lbl 46530 `"Ukraine"', add
label define mbpl_head_lbl 46535 `"Belarus"', add
label define mbpl_head_lbl 46540 `"Moldova"', add
label define mbpl_head_lbl 46590 `"USSR, n.s."', add
label define mbpl_head_lbl 49900 `"Europe, n.s."', add
label define mbpl_head_lbl 50000 `"China"', add
label define mbpl_head_lbl 50010 `"Hong Kong"', add
label define mbpl_head_lbl 50040 `"Taiwan"', add
label define mbpl_head_lbl 50100 `"Japan"', add
label define mbpl_head_lbl 50200 `"Korea"', add
label define mbpl_head_lbl 50220 `"South Korea"', add
label define mbpl_head_lbl 50300 `"Mongolia"', add
label define mbpl_head_lbl 51100 `"Cambodia"', add
label define mbpl_head_lbl 51200 `"Indonesia"', add
label define mbpl_head_lbl 51300 `"Laos"', add
label define mbpl_head_lbl 51400 `"Malaysia"', add
label define mbpl_head_lbl 51500 `"Philippines"', add
label define mbpl_head_lbl 51600 `"Singapore"', add
label define mbpl_head_lbl 51700 `"Thailand"', add
label define mbpl_head_lbl 51800 `"Vietnam"', add
label define mbpl_head_lbl 52000 `"Afghanistan"', add
label define mbpl_head_lbl 52100 `"India"', add
label define mbpl_head_lbl 52110 `"Bangladesh"', add
label define mbpl_head_lbl 52120 `"Bhutan"', add
label define mbpl_head_lbl 52130 `"Burma (Myanmar)"', add
label define mbpl_head_lbl 52140 `"Pakistan"', add
label define mbpl_head_lbl 52150 `"Sri Lanka"', add
label define mbpl_head_lbl 52200 `"Nepal"', add
label define mbpl_head_lbl 55100 `"Armenia"', add
label define mbpl_head_lbl 55200 `"Azerbaijan"', add
label define mbpl_head_lbl 55300 `"Georgia"', add
label define mbpl_head_lbl 55400 `"Uzbekistan"', add
label define mbpl_head_lbl 55500 `"Kazakhstan"', add
label define mbpl_head_lbl 53000 `"Iran"', add
label define mbpl_head_lbl 53200 `"Iraq"', add
label define mbpl_head_lbl 53400 `"Israel"', add
label define mbpl_head_lbl 53420 `"Palestine"', add
label define mbpl_head_lbl 53500 `"Jordan"', add
label define mbpl_head_lbl 53700 `"Lebanon"', add
label define mbpl_head_lbl 54000 `"Saudi Arabia"', add
label define mbpl_head_lbl 54100 `"Syria"', add
label define mbpl_head_lbl 54200 `"Turkey"', add
label define mbpl_head_lbl 54300 `"Cyprus"', add
label define mbpl_head_lbl 54350 `"Kuwait"', add
label define mbpl_head_lbl 54400 `"Yemen"', add
label define mbpl_head_lbl 54500 `"United Arab Emirates"', add
label define mbpl_head_lbl 54700 `"Middle East, n.s."', add
label define mbpl_head_lbl 59900 `"Asia, n.e.c, /n.s."', add
label define mbpl_head_lbl 60000 `"Africa"', add
label define mbpl_head_lbl 60010 `"Northern Africa"', add
label define mbpl_head_lbl 60012 `"Egypt/United Arab Rep."', add
label define mbpl_head_lbl 60014 `"Morocco"', add
label define mbpl_head_lbl 60016 `"Algeria"', add
label define mbpl_head_lbl 60018 `"Sudan"', add
label define mbpl_head_lbl 60019 `"Libya"', add
label define mbpl_head_lbl 60023 `"Ghana"', add
label define mbpl_head_lbl 60031 `"Nigeria"', add
label define mbpl_head_lbl 60032 `"Cameroon"', add
label define mbpl_head_lbl 60033 `"Cape Verde"', add
label define mbpl_head_lbl 60034 `"Liberia"', add
label define mbpl_head_lbl 60035 `"Sengal"', add
label define mbpl_head_lbl 60036 `"Sierra Leone"', add
label define mbpl_head_lbl 60037 `"Guinea"', add
label define mbpl_head_lbl 60038 `"Ivory Coast"', add
label define mbpl_head_lbl 60039 `"Togo"', add
label define mbpl_head_lbl 60040 `"Eritrea"', add
label define mbpl_head_lbl 60044 `"Ethiopia"', add
label define mbpl_head_lbl 60045 `"Kenya"', add
label define mbpl_head_lbl 60050 `"Somalia"', add
label define mbpl_head_lbl 60060 `"Tanzania"', add
label define mbpl_head_lbl 60065 `"Uganda"', add
label define mbpl_head_lbl 60070 `"Zimbabwe"', add
label define mbpl_head_lbl 60095 `"Zaire"', add
label define mbpl_head_lbl 60096 `"Congo"', add
label define mbpl_head_lbl 60097 `"Zambia"', add
label define mbpl_head_lbl 60094 `"South Africa (Union of)"', add
label define mbpl_head_lbl 70010 `"Australia"', add
label define mbpl_head_lbl 70020 `"New Zealand"', add
label define mbpl_head_lbl 71000 `"Pacific Islands"', add
label define mbpl_head_lbl 71021 `"Fiji"', add
label define mbpl_head_lbl 71022 `"Tonga"', add
label define mbpl_head_lbl 71023 `"Samoa"', add
label define mbpl_head_lbl 71024 `"Marshall Islands"', add
label define mbpl_head_lbl 72000 `"Micronesia"', add
label define mbpl_head_lbl 96000 `"Other, n.e.c. and unknown"', add
label define mbpl_head_lbl 99999 `"NIU"', add
label values mbpl_head mbpl_head_lbl

label define mbpl_sp_lbl 09900 `"U.S., n.s."'
label define mbpl_sp_lbl 10000 `"American Samoa"', add
label define mbpl_sp_lbl 10500 `"Guam"', add
label define mbpl_sp_lbl 11000 `"Puerto Rico"', add
label define mbpl_sp_lbl 11500 `"U.S. Virgin Islands"', add
label define mbpl_sp_lbl 12090 `"U.S. outlying areas, n.s."', add
label define mbpl_sp_lbl 15000 `"Canada"', add
label define mbpl_sp_lbl 16010 `"Bermuda"', add
label define mbpl_sp_lbl 10750 `"Northern Mariana Islands"', add
label define mbpl_sp_lbl 19900 `"North America, n.s."', add
label define mbpl_sp_lbl 20000 `"Mexico"', add
label define mbpl_sp_lbl 21010 `"Belize/British Honduras"', add
label define mbpl_sp_lbl 21020 `"Costa Rica"', add
label define mbpl_sp_lbl 21030 `"El Salvador"', add
label define mbpl_sp_lbl 21040 `"Guatemala"', add
label define mbpl_sp_lbl 21050 `"Honduras"', add
label define mbpl_sp_lbl 21060 `"Nicaragua"', add
label define mbpl_sp_lbl 21070 `"Panama"', add
label define mbpl_sp_lbl 21090 `"Central America, n.s."', add
label define mbpl_sp_lbl 25000 `"Cuba"', add
label define mbpl_sp_lbl 26000 `"West Indies"', add
label define mbpl_sp_lbl 26010 `"Dominican Republic"', add
label define mbpl_sp_lbl 26020 `"Haiti"', add
label define mbpl_sp_lbl 26030 `"Jamaica"', add
label define mbpl_sp_lbl 26043 `"Bahamas"', add
label define mbpl_sp_lbl 26044 `"Barbados"', add
label define mbpl_sp_lbl 26054 `"Dominica"', add
label define mbpl_sp_lbl 26055 `"Grenada"', add
label define mbpl_sp_lbl 26060 `"Trinidad and Tobago"', add
label define mbpl_sp_lbl 26065 `"Antigua and Barbuda"', add
label define mbpl_sp_lbl 26070 `"St. Kitts--Nevis"', add
label define mbpl_sp_lbl 26075 `"St. Lucia"', add
label define mbpl_sp_lbl 26080 `"St. Vincent and the Grenadi"', add
label define mbpl_sp_lbl 30000 `"South America"', add
label define mbpl_sp_lbl 30005 `"Argentina"', add
label define mbpl_sp_lbl 30010 `"Bolivia"', add
label define mbpl_sp_lbl 30015 `"Brazil"', add
label define mbpl_sp_lbl 30020 `"Chile"', add
label define mbpl_sp_lbl 30025 `"Colombia"', add
label define mbpl_sp_lbl 30030 `"Ecuador"', add
label define mbpl_sp_lbl 30040 `"Guyana/British Guiana"', add
label define mbpl_sp_lbl 30050 `"Peru"', add
label define mbpl_sp_lbl 30060 `"Uruguay"', add
label define mbpl_sp_lbl 30065 `"Venezuala"', add
label define mbpl_sp_lbl 30070 `"Paraguay"', add
label define mbpl_sp_lbl 31000 `"Americas, n.s."', add
label define mbpl_sp_lbl 40000 `"Denmark"', add
label define mbpl_sp_lbl 40100 `"Finland"', add
label define mbpl_sp_lbl 40200 `"Iceland"', add
label define mbpl_sp_lbl 40400 `"Norway"', add
label define mbpl_sp_lbl 40500 `"Sweden"', add
label define mbpl_sp_lbl 41000 `"England"', add
label define mbpl_sp_lbl 41100 `"Scotland"', add
label define mbpl_sp_lbl 41200 `"Wales"', add
label define mbpl_sp_lbl 41300 `"United Kingdom, n.s."', add
label define mbpl_sp_lbl 41400 `"Ireland"', add
label define mbpl_sp_lbl 41410 `"Northern Ireland"', add
label define mbpl_sp_lbl 42000 `"Belgium"', add
label define mbpl_sp_lbl 42100 `"France"', add
label define mbpl_sp_lbl 42500 `"Netherlands"', add
label define mbpl_sp_lbl 42600 `"Switzerland"', add
label define mbpl_sp_lbl 43300 `"Greece"', add
label define mbpl_sp_lbl 43400 `"Italy"', add
label define mbpl_sp_lbl 43600 `"Portugal"', add
label define mbpl_sp_lbl 43610 `"Azores"', add
label define mbpl_sp_lbl 43800 `"Spain"', add
label define mbpl_sp_lbl 45000 `"Austria"', add
label define mbpl_sp_lbl 45200 `"Czechoslavakia"', add
label define mbpl_sp_lbl 45212 `"Slovakia"', add
label define mbpl_sp_lbl 45213 `"Czech Republic"', add
label define mbpl_sp_lbl 45300 `"Germany"', add
label define mbpl_sp_lbl 45400 `"Hungary"', add
label define mbpl_sp_lbl 45500 `"Poland"', add
label define mbpl_sp_lbl 45600 `"Romania"', add
label define mbpl_sp_lbl 45650 `"Bulgaria"', add
label define mbpl_sp_lbl 45675 `"Albania"', add
label define mbpl_sp_lbl 45700 `"Yugoslavia"', add
label define mbpl_sp_lbl 45720 `"Bosnia and Herzegovina"', add
label define mbpl_sp_lbl 45730 `"Croatia"', add
label define mbpl_sp_lbl 45740 `"Macedonia"', add
label define mbpl_sp_lbl 45750 `"Serbia"', add
label define mbpl_sp_lbl 45760 `"Kosovo"', add
label define mbpl_sp_lbl 45770 `"Montenego"', add
label define mbpl_sp_lbl 46100 `"Estonia"', add
label define mbpl_sp_lbl 46200 `"Latvia"', add
label define mbpl_sp_lbl 46300 `"Lithuania"', add
label define mbpl_sp_lbl 46500 `"Other USSR/Russia"', add
label define mbpl_sp_lbl 46530 `"Ukraine"', add
label define mbpl_sp_lbl 46535 `"Belarus"', add
label define mbpl_sp_lbl 46540 `"Moldova"', add
label define mbpl_sp_lbl 46590 `"USSR, n.s."', add
label define mbpl_sp_lbl 49900 `"Europe, n.s."', add
label define mbpl_sp_lbl 50000 `"China"', add
label define mbpl_sp_lbl 50010 `"Hong Kong"', add
label define mbpl_sp_lbl 50040 `"Taiwan"', add
label define mbpl_sp_lbl 50100 `"Japan"', add
label define mbpl_sp_lbl 50200 `"Korea"', add
label define mbpl_sp_lbl 50220 `"South Korea"', add
label define mbpl_sp_lbl 50300 `"Mongolia"', add
label define mbpl_sp_lbl 51100 `"Cambodia"', add
label define mbpl_sp_lbl 51200 `"Indonesia"', add
label define mbpl_sp_lbl 51300 `"Laos"', add
label define mbpl_sp_lbl 51400 `"Malaysia"', add
label define mbpl_sp_lbl 51500 `"Philippines"', add
label define mbpl_sp_lbl 51600 `"Singapore"', add
label define mbpl_sp_lbl 51700 `"Thailand"', add
label define mbpl_sp_lbl 51800 `"Vietnam"', add
label define mbpl_sp_lbl 52000 `"Afghanistan"', add
label define mbpl_sp_lbl 52100 `"India"', add
label define mbpl_sp_lbl 52110 `"Bangladesh"', add
label define mbpl_sp_lbl 52120 `"Bhutan"', add
label define mbpl_sp_lbl 52130 `"Burma (Myanmar)"', add
label define mbpl_sp_lbl 52140 `"Pakistan"', add
label define mbpl_sp_lbl 52150 `"Sri Lanka"', add
label define mbpl_sp_lbl 52200 `"Nepal"', add
label define mbpl_sp_lbl 55100 `"Armenia"', add
label define mbpl_sp_lbl 55200 `"Azerbaijan"', add
label define mbpl_sp_lbl 55300 `"Georgia"', add
label define mbpl_sp_lbl 55400 `"Uzbekistan"', add
label define mbpl_sp_lbl 55500 `"Kazakhstan"', add
label define mbpl_sp_lbl 53000 `"Iran"', add
label define mbpl_sp_lbl 53200 `"Iraq"', add
label define mbpl_sp_lbl 53400 `"Israel"', add
label define mbpl_sp_lbl 53420 `"Palestine"', add
label define mbpl_sp_lbl 53500 `"Jordan"', add
label define mbpl_sp_lbl 53700 `"Lebanon"', add
label define mbpl_sp_lbl 54000 `"Saudi Arabia"', add
label define mbpl_sp_lbl 54100 `"Syria"', add
label define mbpl_sp_lbl 54200 `"Turkey"', add
label define mbpl_sp_lbl 54300 `"Cyprus"', add
label define mbpl_sp_lbl 54350 `"Kuwait"', add
label define mbpl_sp_lbl 54400 `"Yemen"', add
label define mbpl_sp_lbl 54500 `"United Arab Emirates"', add
label define mbpl_sp_lbl 54700 `"Middle East, n.s."', add
label define mbpl_sp_lbl 59900 `"Asia, n.e.c, /n.s."', add
label define mbpl_sp_lbl 60000 `"Africa"', add
label define mbpl_sp_lbl 60010 `"Northern Africa"', add
label define mbpl_sp_lbl 60012 `"Egypt/United Arab Rep."', add
label define mbpl_sp_lbl 60014 `"Morocco"', add
label define mbpl_sp_lbl 60016 `"Algeria"', add
label define mbpl_sp_lbl 60018 `"Sudan"', add
label define mbpl_sp_lbl 60019 `"Libya"', add
label define mbpl_sp_lbl 60023 `"Ghana"', add
label define mbpl_sp_lbl 60031 `"Nigeria"', add
label define mbpl_sp_lbl 60032 `"Cameroon"', add
label define mbpl_sp_lbl 60033 `"Cape Verde"', add
label define mbpl_sp_lbl 60034 `"Liberia"', add
label define mbpl_sp_lbl 60035 `"Sengal"', add
label define mbpl_sp_lbl 60036 `"Sierra Leone"', add
label define mbpl_sp_lbl 60037 `"Guinea"', add
label define mbpl_sp_lbl 60038 `"Ivory Coast"', add
label define mbpl_sp_lbl 60039 `"Togo"', add
label define mbpl_sp_lbl 60040 `"Eritrea"', add
label define mbpl_sp_lbl 60044 `"Ethiopia"', add
label define mbpl_sp_lbl 60045 `"Kenya"', add
label define mbpl_sp_lbl 60050 `"Somalia"', add
label define mbpl_sp_lbl 60060 `"Tanzania"', add
label define mbpl_sp_lbl 60065 `"Uganda"', add
label define mbpl_sp_lbl 60070 `"Zimbabwe"', add
label define mbpl_sp_lbl 60095 `"Zaire"', add
label define mbpl_sp_lbl 60096 `"Congo"', add
label define mbpl_sp_lbl 60097 `"Zambia"', add
label define mbpl_sp_lbl 60094 `"South Africa (Union of)"', add
label define mbpl_sp_lbl 70010 `"Australia"', add
label define mbpl_sp_lbl 70020 `"New Zealand"', add
label define mbpl_sp_lbl 71000 `"Pacific Islands"', add
label define mbpl_sp_lbl 71021 `"Fiji"', add
label define mbpl_sp_lbl 71022 `"Tonga"', add
label define mbpl_sp_lbl 71023 `"Samoa"', add
label define mbpl_sp_lbl 71024 `"Marshall Islands"', add
label define mbpl_sp_lbl 72000 `"Micronesia"', add
label define mbpl_sp_lbl 96000 `"Other, n.e.c. and unknown"', add
label define mbpl_sp_lbl 99999 `"NIU"', add
label values mbpl_sp mbpl_sp_lbl

label define fbpl_head_lbl 09900 `"U.S., n.s."'
label define fbpl_head_lbl 10000 `"American Samoa"', add
label define fbpl_head_lbl 10500 `"Guam"', add
label define fbpl_head_lbl 10750 `"Northern Mariana Islands"', add
label define fbpl_head_lbl 11000 `"Puerto Rico"', add
label define fbpl_head_lbl 11500 `"U.S. Virgin Islands"', add
label define fbpl_head_lbl 12090 `"U.S. outlying areas, n.s."', add
label define fbpl_head_lbl 15000 `"Canada"', add
label define fbpl_head_lbl 16010 `"Bermuda"', add
label define fbpl_head_lbl 19900 `"North America, n.s."', add
label define fbpl_head_lbl 20000 `"Mexico"', add
label define fbpl_head_lbl 21010 `"Belize/British Honduras"', add
label define fbpl_head_lbl 21020 `"Costa Rica"', add
label define fbpl_head_lbl 21030 `"El Salvador"', add
label define fbpl_head_lbl 21040 `"Guatemala"', add
label define fbpl_head_lbl 21050 `"Honduras"', add
label define fbpl_head_lbl 21060 `"Nicaragua"', add
label define fbpl_head_lbl 21070 `"Panama"', add
label define fbpl_head_lbl 21090 `"Central America, n.s."', add
label define fbpl_head_lbl 25000 `"Cuba"', add
label define fbpl_head_lbl 26000 `"West Indies"', add
label define fbpl_head_lbl 26010 `"Dominican Republic"', add
label define fbpl_head_lbl 26020 `"Haiti"', add
label define fbpl_head_lbl 26030 `"Jamaica"', add
label define fbpl_head_lbl 26043 `"Bahamas"', add
label define fbpl_head_lbl 26044 `"Barbados"', add
label define fbpl_head_lbl 26054 `"Dominica"', add
label define fbpl_head_lbl 26055 `"Grenada"', add
label define fbpl_head_lbl 26060 `"Trinidad and Tobago"', add
label define fbpl_head_lbl 26065 `"Antigua and Barbuda"', add
label define fbpl_head_lbl 26070 `"St. Kitts--Nevis"', add
label define fbpl_head_lbl 26075 `"St. Lucia"', add
label define fbpl_head_lbl 26080 `"St. Vincent and the Grenadi"', add
label define fbpl_head_lbl 26091 `"Caribbean, n.s."', add
label define fbpl_head_lbl 30000 `"South America"', add
label define fbpl_head_lbl 30005 `"Argentina"', add
label define fbpl_head_lbl 30010 `"Bolivia"', add
label define fbpl_head_lbl 30015 `"Brazil"', add
label define fbpl_head_lbl 30020 `"Chile"', add
label define fbpl_head_lbl 30025 `"Colombia"', add
label define fbpl_head_lbl 30030 `"Ecuador"', add
label define fbpl_head_lbl 30040 `"Guyana/British Guiana"', add
label define fbpl_head_lbl 30050 `"Peru"', add
label define fbpl_head_lbl 30060 `"Uruguay"', add
label define fbpl_head_lbl 30065 `"Venezuala"', add
label define fbpl_head_lbl 30070 `"Paraguay"', add
label define fbpl_head_lbl 31000 `"Americas, n.s."', add
label define fbpl_head_lbl 40000 `"Denmark"', add
label define fbpl_head_lbl 40100 `"Finland"', add
label define fbpl_head_lbl 40200 `"Iceland"', add
label define fbpl_head_lbl 40400 `"Norway"', add
label define fbpl_head_lbl 40500 `"Sweden"', add
label define fbpl_head_lbl 41000 `"England"', add
label define fbpl_head_lbl 41100 `"Scotland"', add
label define fbpl_head_lbl 41200 `"Wales"', add
label define fbpl_head_lbl 41300 `"United Kingdom, n.s."', add
label define fbpl_head_lbl 41400 `"Ireland"', add
label define fbpl_head_lbl 41410 `"Northern Ireland"', add
label define fbpl_head_lbl 42000 `"Belgium"', add
label define fbpl_head_lbl 42100 `"France"', add
label define fbpl_head_lbl 42500 `"Netherlands"', add
label define fbpl_head_lbl 42600 `"Switzerland"', add
label define fbpl_head_lbl 43300 `"Greece"', add
label define fbpl_head_lbl 43400 `"Italy"', add
label define fbpl_head_lbl 43600 `"Portugal"', add
label define fbpl_head_lbl 43610 `"Azores"', add
label define fbpl_head_lbl 43800 `"Spain"', add
label define fbpl_head_lbl 45000 `"Austria"', add
label define fbpl_head_lbl 45200 `"Czechoslavakia"', add
label define fbpl_head_lbl 45212 `"Slovakia"', add
label define fbpl_head_lbl 45213 `"Czech Republic"', add
label define fbpl_head_lbl 45300 `"Germany"', add
label define fbpl_head_lbl 45400 `"Hungary"', add
label define fbpl_head_lbl 45500 `"Poland"', add
label define fbpl_head_lbl 45600 `"Romania"', add
label define fbpl_head_lbl 45650 `"Bulgaria"', add
label define fbpl_head_lbl 45675 `"Albania"', add
label define fbpl_head_lbl 45700 `"Yugoslavia"', add
label define fbpl_head_lbl 45720 `"Bosnia and Herzegovina"', add
label define fbpl_head_lbl 45730 `"Croatia"', add
label define fbpl_head_lbl 45740 `"Macedonia"', add
label define fbpl_head_lbl 45750 `"Serbia"', add
label define fbpl_head_lbl 45760 `"Kosovo"', add
label define fbpl_head_lbl 45770 `"Montenegro"', add
label define fbpl_head_lbl 46100 `"Estonia"', add
label define fbpl_head_lbl 46200 `"Latvia"', add
label define fbpl_head_lbl 46300 `"Lithuania"', add
label define fbpl_head_lbl 46500 `"Other USSR/Russia"', add
label define fbpl_head_lbl 46530 `"Ukraine"', add
label define fbpl_head_lbl 46535 `"Belarus"', add
label define fbpl_head_lbl 46540 `"Moldova"', add
label define fbpl_head_lbl 46590 `"USSR, n.s."', add
label define fbpl_head_lbl 49900 `"Europe, n.s."', add
label define fbpl_head_lbl 50000 `"China"', add
label define fbpl_head_lbl 50010 `"Hong Kong"', add
label define fbpl_head_lbl 50040 `"Taiwan"', add
label define fbpl_head_lbl 50100 `"Japan"', add
label define fbpl_head_lbl 50200 `"Korea"', add
label define fbpl_head_lbl 50220 `"South Korea"', add
label define fbpl_head_lbl 50300 `"Mongolia"', add
label define fbpl_head_lbl 51100 `"Cambodia"', add
label define fbpl_head_lbl 51200 `"Indonesia"', add
label define fbpl_head_lbl 51300 `"Laos"', add
label define fbpl_head_lbl 51400 `"Malaysia"', add
label define fbpl_head_lbl 51500 `"Philippines"', add
label define fbpl_head_lbl 51600 `"Singapore"', add
label define fbpl_head_lbl 51700 `"Thailand"', add
label define fbpl_head_lbl 51800 `"Vietnam"', add
label define fbpl_head_lbl 52000 `"Afghanistan"', add
label define fbpl_head_lbl 52100 `"India"', add
label define fbpl_head_lbl 52110 `"Bangladesh"', add
label define fbpl_head_lbl 52120 `"Bhutan"', add
label define fbpl_head_lbl 52130 `"Burma (Myanmar)"', add
label define fbpl_head_lbl 52140 `"Pakistan"', add
label define fbpl_head_lbl 52150 `"Sri Lanka"', add
label define fbpl_head_lbl 52200 `"Nepal"', add
label define fbpl_head_lbl 55100 `"Armenia"', add
label define fbpl_head_lbl 55200 `"Azerbaijan"', add
label define fbpl_head_lbl 55300 `"Georgia"', add
label define fbpl_head_lbl 55400 `"Uzbekistan"', add
label define fbpl_head_lbl 55500 `"Kazakhstan"', add
label define fbpl_head_lbl 53000 `"Iran"', add
label define fbpl_head_lbl 53200 `"Iraq"', add
label define fbpl_head_lbl 53400 `"Israel"', add
label define fbpl_head_lbl 53420 `"Palestine"', add
label define fbpl_head_lbl 53500 `"Jordan"', add
label define fbpl_head_lbl 53700 `"Lebanon"', add
label define fbpl_head_lbl 54000 `"Saudi Arabia"', add
label define fbpl_head_lbl 54100 `"Syria"', add
label define fbpl_head_lbl 54200 `"Turkey"', add
label define fbpl_head_lbl 54300 `"Cyprus"', add
label define fbpl_head_lbl 54350 `"Kuwait"', add
label define fbpl_head_lbl 54400 `"Yemen"', add
label define fbpl_head_lbl 54500 `"United Arab Emirates"', add
label define fbpl_head_lbl 54700 `"Middle East, n.s."', add
label define fbpl_head_lbl 59900 `"Asia, n.e.c, /n.s."', add
label define fbpl_head_lbl 60000 `"Africa"', add
label define fbpl_head_lbl 60010 `"Northern Africa"', add
label define fbpl_head_lbl 60012 `"Egypt/United Arab Rep."', add
label define fbpl_head_lbl 60014 `"Morocco"', add
label define fbpl_head_lbl 60016 `"Algeria"', add
label define fbpl_head_lbl 60018 `"Sudan"', add
label define fbpl_head_lbl 60019 `"Libya"', add
label define fbpl_head_lbl 60023 `"Ghana"', add
label define fbpl_head_lbl 60031 `"Nigeria"', add
label define fbpl_head_lbl 60032 `"Cameroon"', add
label define fbpl_head_lbl 60033 `"Cape Verde"', add
label define fbpl_head_lbl 60034 `"Liberia"', add
label define fbpl_head_lbl 60035 `"Sengal"', add
label define fbpl_head_lbl 60036 `"Sierra Leone"', add
label define fbpl_head_lbl 60037 `"Guinea"', add
label define fbpl_head_lbl 60038 `"Ivory Coast"', add
label define fbpl_head_lbl 60039 `"Togo"', add
label define fbpl_head_lbl 60040 `"Eritrea"', add
label define fbpl_head_lbl 60044 `"Ethiopia"', add
label define fbpl_head_lbl 60045 `"Kenya"', add
label define fbpl_head_lbl 60050 `"Somalia"', add
label define fbpl_head_lbl 60060 `"Tanzania"', add
label define fbpl_head_lbl 60065 `"Uganda"', add
label define fbpl_head_lbl 60070 `"Zimbabwe"', add
label define fbpl_head_lbl 60094 `"South Africa (Union of)"', add
label define fbpl_head_lbl 60095 `"Zaire"', add
label define fbpl_head_lbl 60096 `"Congo"', add
label define fbpl_head_lbl 60097 `"Zambia"', add
label define fbpl_head_lbl 60099 `"Africa, n.s./n.e.c."', add
label define fbpl_head_lbl 70010 `"Australia"', add
label define fbpl_head_lbl 70020 `"New Zealand"', add
label define fbpl_head_lbl 71000 `"Pacific Islands"', add
label define fbpl_head_lbl 71021 `"Fiji"', add
label define fbpl_head_lbl 71022 `"Tonga"', add
label define fbpl_head_lbl 71023 `"Samoa"', add
label define fbpl_head_lbl 71024 `"Marshall Islands"', add
label define fbpl_head_lbl 72000 `"Micronesia"', add
label define fbpl_head_lbl 96000 `"Other, n.e.c. and unknown"', add
label define fbpl_head_lbl 99999 `"NIU"', add
label values fbpl_head fbpl_head_lbl

label define fbpl_sp_lbl 09900 `"U.S., n.s."'
label define fbpl_sp_lbl 10000 `"American Samoa"', add
label define fbpl_sp_lbl 10500 `"Guam"', add
label define fbpl_sp_lbl 10750 `"Northern Mariana Islands"', add
label define fbpl_sp_lbl 11000 `"Puerto Rico"', add
label define fbpl_sp_lbl 11500 `"U.S. Virgin Islands"', add
label define fbpl_sp_lbl 12090 `"U.S. outlying areas, n.s."', add
label define fbpl_sp_lbl 15000 `"Canada"', add
label define fbpl_sp_lbl 16010 `"Bermuda"', add
label define fbpl_sp_lbl 19900 `"North America, n.s."', add
label define fbpl_sp_lbl 20000 `"Mexico"', add
label define fbpl_sp_lbl 21010 `"Belize/British Honduras"', add
label define fbpl_sp_lbl 21020 `"Costa Rica"', add
label define fbpl_sp_lbl 21030 `"El Salvador"', add
label define fbpl_sp_lbl 21040 `"Guatemala"', add
label define fbpl_sp_lbl 21050 `"Honduras"', add
label define fbpl_sp_lbl 21060 `"Nicaragua"', add
label define fbpl_sp_lbl 21070 `"Panama"', add
label define fbpl_sp_lbl 21090 `"Central America, n.s."', add
label define fbpl_sp_lbl 25000 `"Cuba"', add
label define fbpl_sp_lbl 26000 `"West Indies"', add
label define fbpl_sp_lbl 26010 `"Dominican Republic"', add
label define fbpl_sp_lbl 26020 `"Haiti"', add
label define fbpl_sp_lbl 26030 `"Jamaica"', add
label define fbpl_sp_lbl 26043 `"Bahamas"', add
label define fbpl_sp_lbl 26044 `"Barbados"', add
label define fbpl_sp_lbl 26054 `"Dominica"', add
label define fbpl_sp_lbl 26055 `"Grenada"', add
label define fbpl_sp_lbl 26060 `"Trinidad and Tobago"', add
label define fbpl_sp_lbl 26065 `"Antigua and Barbuda"', add
label define fbpl_sp_lbl 26070 `"St. Kitts--Nevis"', add
label define fbpl_sp_lbl 26075 `"St. Lucia"', add
label define fbpl_sp_lbl 26080 `"St. Vincent and the Grenadi"', add
label define fbpl_sp_lbl 26091 `"Caribbean, n.s."', add
label define fbpl_sp_lbl 30000 `"South America"', add
label define fbpl_sp_lbl 30005 `"Argentina"', add
label define fbpl_sp_lbl 30010 `"Bolivia"', add
label define fbpl_sp_lbl 30015 `"Brazil"', add
label define fbpl_sp_lbl 30020 `"Chile"', add
label define fbpl_sp_lbl 30025 `"Colombia"', add
label define fbpl_sp_lbl 30030 `"Ecuador"', add
label define fbpl_sp_lbl 30040 `"Guyana/British Guiana"', add
label define fbpl_sp_lbl 30050 `"Peru"', add
label define fbpl_sp_lbl 30060 `"Uruguay"', add
label define fbpl_sp_lbl 30065 `"Venezuala"', add
label define fbpl_sp_lbl 30070 `"Paraguay"', add
label define fbpl_sp_lbl 31000 `"Americas, n.s."', add
label define fbpl_sp_lbl 40000 `"Denmark"', add
label define fbpl_sp_lbl 40100 `"Finland"', add
label define fbpl_sp_lbl 40200 `"Iceland"', add
label define fbpl_sp_lbl 40400 `"Norway"', add
label define fbpl_sp_lbl 40500 `"Sweden"', add
label define fbpl_sp_lbl 41000 `"England"', add
label define fbpl_sp_lbl 41100 `"Scotland"', add
label define fbpl_sp_lbl 41200 `"Wales"', add
label define fbpl_sp_lbl 41300 `"United Kingdom, n.s."', add
label define fbpl_sp_lbl 41400 `"Ireland"', add
label define fbpl_sp_lbl 41410 `"Northern Ireland"', add
label define fbpl_sp_lbl 42000 `"Belgium"', add
label define fbpl_sp_lbl 42100 `"France"', add
label define fbpl_sp_lbl 42500 `"Netherlands"', add
label define fbpl_sp_lbl 42600 `"Switzerland"', add
label define fbpl_sp_lbl 43300 `"Greece"', add
label define fbpl_sp_lbl 43400 `"Italy"', add
label define fbpl_sp_lbl 43600 `"Portugal"', add
label define fbpl_sp_lbl 43610 `"Azores"', add
label define fbpl_sp_lbl 43800 `"Spain"', add
label define fbpl_sp_lbl 45000 `"Austria"', add
label define fbpl_sp_lbl 45200 `"Czechoslavakia"', add
label define fbpl_sp_lbl 45212 `"Slovakia"', add
label define fbpl_sp_lbl 45213 `"Czech Republic"', add
label define fbpl_sp_lbl 45300 `"Germany"', add
label define fbpl_sp_lbl 45400 `"Hungary"', add
label define fbpl_sp_lbl 45500 `"Poland"', add
label define fbpl_sp_lbl 45600 `"Romania"', add
label define fbpl_sp_lbl 45650 `"Bulgaria"', add
label define fbpl_sp_lbl 45675 `"Albania"', add
label define fbpl_sp_lbl 45700 `"Yugoslavia"', add
label define fbpl_sp_lbl 45720 `"Bosnia and Herzegovina"', add
label define fbpl_sp_lbl 45730 `"Croatia"', add
label define fbpl_sp_lbl 45740 `"Macedonia"', add
label define fbpl_sp_lbl 45750 `"Serbia"', add
label define fbpl_sp_lbl 45760 `"Kosovo"', add
label define fbpl_sp_lbl 45770 `"Montenegro"', add
label define fbpl_sp_lbl 46100 `"Estonia"', add
label define fbpl_sp_lbl 46200 `"Latvia"', add
label define fbpl_sp_lbl 46300 `"Lithuania"', add
label define fbpl_sp_lbl 46500 `"Other USSR/Russia"', add
label define fbpl_sp_lbl 46530 `"Ukraine"', add
label define fbpl_sp_lbl 46535 `"Belarus"', add
label define fbpl_sp_lbl 46540 `"Moldova"', add
label define fbpl_sp_lbl 46590 `"USSR, n.s."', add
label define fbpl_sp_lbl 49900 `"Europe, n.s."', add
label define fbpl_sp_lbl 50000 `"China"', add
label define fbpl_sp_lbl 50010 `"Hong Kong"', add
label define fbpl_sp_lbl 50040 `"Taiwan"', add
label define fbpl_sp_lbl 50100 `"Japan"', add
label define fbpl_sp_lbl 50200 `"Korea"', add
label define fbpl_sp_lbl 50220 `"South Korea"', add
label define fbpl_sp_lbl 50300 `"Mongolia"', add
label define fbpl_sp_lbl 51100 `"Cambodia"', add
label define fbpl_sp_lbl 51200 `"Indonesia"', add
label define fbpl_sp_lbl 51300 `"Laos"', add
label define fbpl_sp_lbl 51400 `"Malaysia"', add
label define fbpl_sp_lbl 51500 `"Philippines"', add
label define fbpl_sp_lbl 51600 `"Singapore"', add
label define fbpl_sp_lbl 51700 `"Thailand"', add
label define fbpl_sp_lbl 51800 `"Vietnam"', add
label define fbpl_sp_lbl 52000 `"Afghanistan"', add
label define fbpl_sp_lbl 52100 `"India"', add
label define fbpl_sp_lbl 52110 `"Bangladesh"', add
label define fbpl_sp_lbl 52120 `"Bhutan"', add
label define fbpl_sp_lbl 52130 `"Burma (Myanmar)"', add
label define fbpl_sp_lbl 52140 `"Pakistan"', add
label define fbpl_sp_lbl 52150 `"Sri Lanka"', add
label define fbpl_sp_lbl 52200 `"Nepal"', add
label define fbpl_sp_lbl 55100 `"Armenia"', add
label define fbpl_sp_lbl 55200 `"Azerbaijan"', add
label define fbpl_sp_lbl 55300 `"Georgia"', add
label define fbpl_sp_lbl 55400 `"Uzbekistan"', add
label define fbpl_sp_lbl 55500 `"Kazakhstan"', add
label define fbpl_sp_lbl 53000 `"Iran"', add
label define fbpl_sp_lbl 53200 `"Iraq"', add
label define fbpl_sp_lbl 53400 `"Israel"', add
label define fbpl_sp_lbl 53420 `"Palestine"', add
label define fbpl_sp_lbl 53500 `"Jordan"', add
label define fbpl_sp_lbl 53700 `"Lebanon"', add
label define fbpl_sp_lbl 54000 `"Saudi Arabia"', add
label define fbpl_sp_lbl 54100 `"Syria"', add
label define fbpl_sp_lbl 54200 `"Turkey"', add
label define fbpl_sp_lbl 54300 `"Cyprus"', add
label define fbpl_sp_lbl 54350 `"Kuwait"', add
label define fbpl_sp_lbl 54400 `"Yemen"', add
label define fbpl_sp_lbl 54500 `"United Arab Emirates"', add
label define fbpl_sp_lbl 54700 `"Middle East, n.s."', add
label define fbpl_sp_lbl 59900 `"Asia, n.e.c, /n.s."', add
label define fbpl_sp_lbl 60000 `"Africa"', add
label define fbpl_sp_lbl 60010 `"Northern Africa"', add
label define fbpl_sp_lbl 60012 `"Egypt/United Arab Rep."', add
label define fbpl_sp_lbl 60014 `"Morocco"', add
label define fbpl_sp_lbl 60016 `"Algeria"', add
label define fbpl_sp_lbl 60018 `"Sudan"', add
label define fbpl_sp_lbl 60019 `"Libya"', add
label define fbpl_sp_lbl 60023 `"Ghana"', add
label define fbpl_sp_lbl 60031 `"Nigeria"', add
label define fbpl_sp_lbl 60032 `"Cameroon"', add
label define fbpl_sp_lbl 60033 `"Cape Verde"', add
label define fbpl_sp_lbl 60034 `"Liberia"', add
label define fbpl_sp_lbl 60035 `"Sengal"', add
label define fbpl_sp_lbl 60036 `"Sierra Leone"', add
label define fbpl_sp_lbl 60037 `"Guinea"', add
label define fbpl_sp_lbl 60038 `"Ivory Coast"', add
label define fbpl_sp_lbl 60039 `"Togo"', add
label define fbpl_sp_lbl 60040 `"Eritrea"', add
label define fbpl_sp_lbl 60044 `"Ethiopia"', add
label define fbpl_sp_lbl 60045 `"Kenya"', add
label define fbpl_sp_lbl 60050 `"Somalia"', add
label define fbpl_sp_lbl 60060 `"Tanzania"', add
label define fbpl_sp_lbl 60065 `"Uganda"', add
label define fbpl_sp_lbl 60070 `"Zimbabwe"', add
label define fbpl_sp_lbl 60094 `"South Africa (Union of)"', add
label define fbpl_sp_lbl 60095 `"Zaire"', add
label define fbpl_sp_lbl 60096 `"Congo"', add
label define fbpl_sp_lbl 60097 `"Zambia"', add
label define fbpl_sp_lbl 60099 `"Africa, n.s./n.e.c."', add
label define fbpl_sp_lbl 70010 `"Australia"', add
label define fbpl_sp_lbl 70020 `"New Zealand"', add
label define fbpl_sp_lbl 71000 `"Pacific Islands"', add
label define fbpl_sp_lbl 71021 `"Fiji"', add
label define fbpl_sp_lbl 71022 `"Tonga"', add
label define fbpl_sp_lbl 71023 `"Samoa"', add
label define fbpl_sp_lbl 71024 `"Marshall Islands"', add
label define fbpl_sp_lbl 72000 `"Micronesia"', add
label define fbpl_sp_lbl 96000 `"Other, n.e.c. and unknown"', add
label define fbpl_sp_lbl 99999 `"NIU"', add
label values fbpl_sp fbpl_sp_lbl

label define nativity_head_lbl 0 `"Unknown"'
label define nativity_head_lbl 1 `"Both parents native-born"', add
label define nativity_head_lbl 2 `"Father foreign, mother native"', add
label define nativity_head_lbl 3 `"Mother foreign, father native"', add
label define nativity_head_lbl 4 `"Both parents foreign"', add
label define nativity_head_lbl 5 `"Foreign born"', add
label values nativity_head nativity_head_lbl

label define nativity_sp_lbl 0 `"Unknown"'
label define nativity_sp_lbl 1 `"Both parents native-born"', add
label define nativity_sp_lbl 2 `"Father foreign, mother native"', add
label define nativity_sp_lbl 3 `"Mother foreign, father native"', add
label define nativity_sp_lbl 4 `"Both parents foreign"', add
label define nativity_sp_lbl 5 `"Foreign born"', add
label values nativity_sp nativity_sp_lbl

label define hispan_head_lbl 000 `"Not Hispanic"'
label define hispan_head_lbl 100 `"Mexican"', add
label define hispan_head_lbl 102 `"Mexican American"', add
label define hispan_head_lbl 103 `"Mexicano/Mexicana"', add
label define hispan_head_lbl 104 `"Chicano/Chicana"', add
label define hispan_head_lbl 108 `"Mexican (Mexicano)"', add
label define hispan_head_lbl 109 `"Mexicano/Chicano"', add
label define hispan_head_lbl 200 `"Puerto Rican"', add
label define hispan_head_lbl 300 `"Cuban"', add
label define hispan_head_lbl 400 `"Dominican"', add
label define hispan_head_lbl 500 `"Salvadoran"', add
label define hispan_head_lbl 600 `"Other Hispanic"', add
label define hispan_head_lbl 610 `"Central/South American"', add
label define hispan_head_lbl 611 `"Central American, (excluding Salvadoran)"', add
label define hispan_head_lbl 612 `"South American"', add
label define hispan_head_lbl 901 `"Do not know"', add
label define hispan_head_lbl 902 `"N/A (and no response 1985-87)"', add
label values hispan_head hispan_head_lbl

label define hispan_sp_lbl 000 `"Not Hispanic"'
label define hispan_sp_lbl 100 `"Mexican"', add
label define hispan_sp_lbl 102 `"Mexican American"', add
label define hispan_sp_lbl 103 `"Mexicano/Mexicana"', add
label define hispan_sp_lbl 104 `"Chicano/Chicana"', add
label define hispan_sp_lbl 108 `"Mexican (Mexicano)"', add
label define hispan_sp_lbl 109 `"Mexicano/Chicano"', add
label define hispan_sp_lbl 200 `"Puerto Rican"', add
label define hispan_sp_lbl 300 `"Cuban"', add
label define hispan_sp_lbl 400 `"Dominican"', add
label define hispan_sp_lbl 500 `"Salvadoran"', add
label define hispan_sp_lbl 600 `"Other Hispanic"', add
label define hispan_sp_lbl 610 `"Central/South American"', add
label define hispan_sp_lbl 611 `"Central American, (excluding Salvadoran)"', add
label define hispan_sp_lbl 612 `"South American"', add
label define hispan_sp_lbl 901 `"Do not know"', add
label define hispan_sp_lbl 902 `"N/A (and no response 1985-87)"', add
label values hispan_sp hispan_sp_lbl

label define empstat_head_lbl 00 `"NIU"'
label define empstat_head_lbl 01 `"Armed Forces"', add
label define empstat_head_lbl 10 `"At work"', add
label define empstat_head_lbl 12 `"Has job, not at work last week"', add
label define empstat_head_lbl 20 `"Unemployed"', add
label define empstat_head_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_head_lbl 22 `"Unemployed, new worker"', add
label define empstat_head_lbl 30 `"Not in labor force"', add
label define empstat_head_lbl 31 `"NILF, housework"', add
label define empstat_head_lbl 32 `"NILF, unable to work"', add
label define empstat_head_lbl 33 `"NILF, school"', add
label define empstat_head_lbl 34 `"NILF, other"', add
label define empstat_head_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label define empstat_head_lbl 36 `"NILF, retired"', add
label values empstat_head empstat_head_lbl

label define empstat_sp_lbl 00 `"NIU"'
label define empstat_sp_lbl 01 `"Armed Forces"', add
label define empstat_sp_lbl 10 `"At work"', add
label define empstat_sp_lbl 12 `"Has job, not at work last week"', add
label define empstat_sp_lbl 20 `"Unemployed"', add
label define empstat_sp_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_sp_lbl 22 `"Unemployed, new worker"', add
label define empstat_sp_lbl 30 `"Not in labor force"', add
label define empstat_sp_lbl 31 `"NILF, housework"', add
label define empstat_sp_lbl 32 `"NILF, unable to work"', add
label define empstat_sp_lbl 33 `"NILF, school"', add
label define empstat_sp_lbl 34 `"NILF, other"', add
label define empstat_sp_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label define empstat_sp_lbl 36 `"NILF, retired"', add
label values empstat_sp empstat_sp_lbl

label define labforce_head_lbl 0 `"NIU"'
label define labforce_head_lbl 1 `"No, not in the labor force"', add
label define labforce_head_lbl 2 `"Yes, in the labor force"', add
label values labforce_head labforce_head_lbl

label define labforce_sp_lbl 0 `"NIU"'
label define labforce_sp_lbl 1 `"No, not in the labor force"', add
label define labforce_sp_lbl 2 `"Yes, in the labor force"', add
label values labforce_sp labforce_sp_lbl

label define ind1990_head_lbl 000 `"NIU"'
label define ind1990_head_lbl 010 `"Agricultural production, crops"', add
label define ind1990_head_lbl 011 `"Agricultural production, livestock"', add
label define ind1990_head_lbl 012 `"Veterinary services"', add
label define ind1990_head_lbl 020 `"Landscape and horticultural services"', add
label define ind1990_head_lbl 030 `"Agricultural services, n.e.c."', add
label define ind1990_head_lbl 031 `"Forestry"', add
label define ind1990_head_lbl 032 `"Fishing, hunting, and trapping"', add
label define ind1990_head_lbl 040 `"Metal mining"', add
label define ind1990_head_lbl 041 `"Coal mining"', add
label define ind1990_head_lbl 042 `"Oil and gas extraction"', add
label define ind1990_head_lbl 050 `"Nonmetallic mining and quarrying, except fuels"', add
label define ind1990_head_lbl 060 `"All construction"', add
label define ind1990_head_lbl 100 `"Meat products"', add
label define ind1990_head_lbl 101 `"Dairy products"', add
label define ind1990_head_lbl 102 `"Canned, frozen, and preserved fruits and vegetables"', add
label define ind1990_head_lbl 110 `"Grain mill products"', add
label define ind1990_head_lbl 111 `"Bakery products"', add
label define ind1990_head_lbl 112 `"Sugar and confectionery products"', add
label define ind1990_head_lbl 120 `"Beverage industries"', add
label define ind1990_head_lbl 121 `"Misc. food preparations and kindred products"', add
label define ind1990_head_lbl 122 `"Food industries, n.s."', add
label define ind1990_head_lbl 130 `"Tobacco manufactures"', add
label define ind1990_head_lbl 132 `"Knitting mills"', add
label define ind1990_head_lbl 140 `"Dyeing and finishing textiles, except wool and knit goods"', add
label define ind1990_head_lbl 141 `"Carpets and rugs"', add
label define ind1990_head_lbl 142 `"Yarn, thread, and fabric mills"', add
label define ind1990_head_lbl 150 `"Miscellaneous textile mill products"', add
label define ind1990_head_lbl 151 `"Apparel and accessories, except knit"', add
label define ind1990_head_lbl 152 `"Miscellaneous fabricated textile products"', add
label define ind1990_head_lbl 160 `"Pulp, paper, and paperboard mills"', add
label define ind1990_head_lbl 161 `"Miscellaneous paper and pulp products"', add
label define ind1990_head_lbl 162 `"Paperboard containers and boxes"', add
label define ind1990_head_lbl 171 `"Newspaper publishing and printing"', add
label define ind1990_head_lbl 172 `"Printing, publishing, and allied industries, except newspapers"', add
label define ind1990_head_lbl 180 `"Plastics, synthetics, and resins"', add
label define ind1990_head_lbl 181 `"Drugs"', add
label define ind1990_head_lbl 182 `"Soaps and cosmetics"', add
label define ind1990_head_lbl 190 `"Paints, varnishes, and related products"', add
label define ind1990_head_lbl 191 `"Agricultural chemicals"', add
label define ind1990_head_lbl 192 `"Industrial and miscellaneous chemicals"', add
label define ind1990_head_lbl 200 `"Petroleum refining"', add
label define ind1990_head_lbl 201 `"Miscellaneous petroleum and coal products"', add
label define ind1990_head_lbl 210 `"Tires and inner tubes"', add
label define ind1990_head_lbl 211 `"Other rubber products, and plastics footwear and belting"', add
label define ind1990_head_lbl 212 `"Miscellaneous plastics products"', add
label define ind1990_head_lbl 220 `"Leather tanning and finishing"', add
label define ind1990_head_lbl 221 `"Footwear, except rubber and plastic"', add
label define ind1990_head_lbl 222 `"Leather products, except footwear"', add
label define ind1990_head_lbl 229 `"Manufacturing, non-durable - allocated"', add
label define ind1990_head_lbl 230 `"Logging"', add
label define ind1990_head_lbl 231 `"Sawmills, planing mills, and millwork"', add
label define ind1990_head_lbl 232 `"Wood buildings and mobile homes"', add
label define ind1990_head_lbl 241 `"Miscellaneous wood products"', add
label define ind1990_head_lbl 242 `"Furniture and fixtures"', add
label define ind1990_head_lbl 250 `"Glass and glass products"', add
label define ind1990_head_lbl 251 `"Cement, concrete, gypsum, and plaster products"', add
label define ind1990_head_lbl 252 `"Structural clay products"', add
label define ind1990_head_lbl 261 `"Pottery and related products"', add
label define ind1990_head_lbl 262 `"Misc. nonmetallic mineral and stone products"', add
label define ind1990_head_lbl 270 `"Blast furnaces, steelworks, rolling and finishing mills"', add
label define ind1990_head_lbl 271 `"Iron and steel foundries"', add
label define ind1990_head_lbl 272 `"Primary aluminum industries"', add
label define ind1990_head_lbl 280 `"Other primary metal industries"', add
label define ind1990_head_lbl 281 `"Cutlery, handtools, and general hardware"', add
label define ind1990_head_lbl 282 `"Fabricated structural metal products"', add
label define ind1990_head_lbl 290 `"Screw machine products"', add
label define ind1990_head_lbl 291 `"Metal forgings and stampings"', add
label define ind1990_head_lbl 292 `"Ordnance"', add
label define ind1990_head_lbl 300 `"Miscellaneous fabricated metal products"', add
label define ind1990_head_lbl 301 `"Metal industries, n.s."', add
label define ind1990_head_lbl 310 `"Engines and turbines"', add
label define ind1990_head_lbl 311 `"Farm machinery and equipment"', add
label define ind1990_head_lbl 312 `"Construction and material handling machines"', add
label define ind1990_head_lbl 320 `"Metalworking machinery"', add
label define ind1990_head_lbl 321 `"Office and accounting machines"', add
label define ind1990_head_lbl 322 `"Computers and related equipment"', add
label define ind1990_head_lbl 331 `"Machinery, except electrical, n.e.c."', add
label define ind1990_head_lbl 332 `"Machinery, n.s."', add
label define ind1990_head_lbl 340 `"Household appliances"', add
label define ind1990_head_lbl 341 `"Radio, TV, and communication equipment"', add
label define ind1990_head_lbl 342 `"Electrical machinery, equipment, and supplies, n.e.c."', add
label define ind1990_head_lbl 350 `"Electrical machinery, equipment, and supplies, n.s."', add
label define ind1990_head_lbl 351 `"Motor vehicles and motor vehicle equipment"', add
label define ind1990_head_lbl 352 `"Aircraft and parts"', add
label define ind1990_head_lbl 360 `"Ship and boat building and repairing"', add
label define ind1990_head_lbl 361 `"Railroad locomotives and equipment"', add
label define ind1990_head_lbl 362 `"Guided missiles, space vehicles, and parts"', add
label define ind1990_head_lbl 370 `"Cycles and miscellaneous transportation equipment"', add
label define ind1990_head_lbl 371 `"Scientific and controlling instruments"', add
label define ind1990_head_lbl 372 `"Medical, dental, and optical instruments and supplies"', add
label define ind1990_head_lbl 380 `"Photographic equipment and supplies"', add
label define ind1990_head_lbl 381 `"Watches, clocks, and clockwork operated devices"', add
label define ind1990_head_lbl 390 `"Toys, amusement, and sporting goods"', add
label define ind1990_head_lbl 391 `"Miscellaneous manufacturing industries"', add
label define ind1990_head_lbl 392 `"Manufacturing industries, n.s."', add
label define ind1990_head_lbl 400 `"Railroads"', add
label define ind1990_head_lbl 401 `"Bus service and urban transit"', add
label define ind1990_head_lbl 402 `"Taxicab service"', add
label define ind1990_head_lbl 410 `"Trucking service"', add
label define ind1990_head_lbl 411 `"Warehousing and storage"', add
label define ind1990_head_lbl 412 `"U.S. Postal Service"', add
label define ind1990_head_lbl 420 `"Water transportation"', add
label define ind1990_head_lbl 421 `"Air transportation"', add
label define ind1990_head_lbl 422 `"Pipe lines, except natural gas"', add
label define ind1990_head_lbl 432 `"Services incidental to transportation"', add
label define ind1990_head_lbl 440 `"Radio and television broadcasting and cable"', add
label define ind1990_head_lbl 441 `"Wired communications"', add
label define ind1990_head_lbl 442 `"Telegraph and miscellaneous communications services"', add
label define ind1990_head_lbl 450 `"Electric light and power"', add
label define ind1990_head_lbl 451 `"Gas and steam supply systems"', add
label define ind1990_head_lbl 452 `"Electric and gas, and other combinations"', add
label define ind1990_head_lbl 470 `"Water supply and irrigation"', add
label define ind1990_head_lbl 471 `"Sanitary services"', add
label define ind1990_head_lbl 472 `"Utilities, n.s."', add
label define ind1990_head_lbl 500 `"Motor vehicles and equipment"', add
label define ind1990_head_lbl 501 `"Furniture and home furnishings"', add
label define ind1990_head_lbl 502 `"Lumber and construction materials"', add
label define ind1990_head_lbl 510 `"Professional and commercial equipment and supplies"', add
label define ind1990_head_lbl 511 `"Metals and minerals, except petroleum"', add
label define ind1990_head_lbl 512 `"Electrical goods"', add
label define ind1990_head_lbl 521 `"Hardware, plumbing and heating supplies"', add
label define ind1990_head_lbl 530 `"Machinery, equipment, and supplies"', add
label define ind1990_head_lbl 531 `"Scrap and waste materials"', add
label define ind1990_head_lbl 532 `"Miscellaneous wholesale, durable goods"', add
label define ind1990_head_lbl 540 `"Paper and paper products"', add
label define ind1990_head_lbl 541 `"Drugs, chemicals, and allied products"', add
label define ind1990_head_lbl 542 `"Apparel, fabrics, and notions"', add
label define ind1990_head_lbl 550 `"Groceries and related products"', add
label define ind1990_head_lbl 551 `"Farm-product raw materials"', add
label define ind1990_head_lbl 552 `"Petroleum products"', add
label define ind1990_head_lbl 560 `"Alcoholic beverages"', add
label define ind1990_head_lbl 561 `"Farm supplies"', add
label define ind1990_head_lbl 562 `"Miscellaneous wholesale, nondurable goods"', add
label define ind1990_head_lbl 571 `"Wholesale trade, n.s."', add
label define ind1990_head_lbl 580 `"Lumber and building material retailing"', add
label define ind1990_head_lbl 581 `"Hardware stores"', add
label define ind1990_head_lbl 582 `"Retail nurseries and garden stores"', add
label define ind1990_head_lbl 590 `"Mobile home dealers"', add
label define ind1990_head_lbl 591 `"Department stores"', add
label define ind1990_head_lbl 592 `"Variety stores"', add
label define ind1990_head_lbl 600 `"Miscellaneous general merchandise stores"', add
label define ind1990_head_lbl 601 `"Grocery stores"', add
label define ind1990_head_lbl 602 `"Dairy products stores"', add
label define ind1990_head_lbl 610 `"Retail bakeries"', add
label define ind1990_head_lbl 611 `"Food stores, n.e.c."', add
label define ind1990_head_lbl 612 `"Motor vehicle dealers"', add
label define ind1990_head_lbl 620 `"Auto and home supply stores"', add
label define ind1990_head_lbl 621 `"Gasoline service stations"', add
label define ind1990_head_lbl 622 `"Miscellaneous vehicle dealers"', add
label define ind1990_head_lbl 623 `"Apparel and accessory stores, except shoe"', add
label define ind1990_head_lbl 630 `"Shoe stores"', add
label define ind1990_head_lbl 631 `"Furniture and home furnishings stores"', add
label define ind1990_head_lbl 632 `"Household appliance stores"', add
label define ind1990_head_lbl 633 `"Radio, TV, and computer stores"', add
label define ind1990_head_lbl 640 `"Music stores"', add
label define ind1990_head_lbl 641 `"Eating and drinking places"', add
label define ind1990_head_lbl 642 `"Drug stores"', add
label define ind1990_head_lbl 650 `"Liquor stores"', add
label define ind1990_head_lbl 651 `"Sporting goods, bicycles, and hobby stores"', add
label define ind1990_head_lbl 652 `"Book and stationery stores"', add
label define ind1990_head_lbl 660 `"Jewelry stores"', add
label define ind1990_head_lbl 661 `"Gift, novelty, and souvenir shops"', add
label define ind1990_head_lbl 662 `"Sewing, needlework, and piece goods stores"', add
label define ind1990_head_lbl 663 `"Catalog and mail order houses"', add
label define ind1990_head_lbl 670 `"Vending machine operators"', add
label define ind1990_head_lbl 671 `"Direct selling establishments"', add
label define ind1990_head_lbl 672 `"Fuel dealers"', add
label define ind1990_head_lbl 681 `"Retail florists"', add
label define ind1990_head_lbl 682 `"Miscellaneous retail stores"', add
label define ind1990_head_lbl 691 `"Retail trade, n.s."', add
label define ind1990_head_lbl 700 `"Banking"', add
label define ind1990_head_lbl 701 `"Savings institutions, including credit unions"', add
label define ind1990_head_lbl 702 `"Credit agencies, n.e.c."', add
label define ind1990_head_lbl 710 `"Security, commodity brokerage, and investment companies"', add
label define ind1990_head_lbl 711 `"Insurance"', add
label define ind1990_head_lbl 712 `"Real estate, including real estate-insurance offices"', add
label define ind1990_head_lbl 721 `"Advertising"', add
label define ind1990_head_lbl 722 `"Services to dwellings and other buildings"', add
label define ind1990_head_lbl 731 `"Personnel supply services"', add
label define ind1990_head_lbl 732 `"Computer and data processing services"', add
label define ind1990_head_lbl 740 `"Detective and protective services"', add
label define ind1990_head_lbl 741 `"Business services, n.e.c."', add
label define ind1990_head_lbl 742 `"Automotive rental and leasing, without drivers"', add
label define ind1990_head_lbl 750 `"Automobile parking and carwashes"', add
label define ind1990_head_lbl 751 `"Automotive repair and related services"', add
label define ind1990_head_lbl 752 `"Electrical repair shops"', add
label define ind1990_head_lbl 760 `"Miscellaneous repair services"', add
label define ind1990_head_lbl 761 `"Private households"', add
label define ind1990_head_lbl 762 `"Hotels and motels"', add
label define ind1990_head_lbl 770 `"Lodging places, except hotels and motels"', add
label define ind1990_head_lbl 771 `"Laundry, cleaning, and garment services"', add
label define ind1990_head_lbl 772 `"Beauty shops"', add
label define ind1990_head_lbl 780 `"Barber shops"', add
label define ind1990_head_lbl 781 `"Funeral service and crematories"', add
label define ind1990_head_lbl 782 `"Shoe repair shops"', add
label define ind1990_head_lbl 790 `"Dressmaking shops"', add
label define ind1990_head_lbl 791 `"Miscellaneous personal services"', add
label define ind1990_head_lbl 800 `"Theaters and motion pictures"', add
label define ind1990_head_lbl 801 `"Video tape rental"', add
label define ind1990_head_lbl 802 `"Bowling centers"', add
label define ind1990_head_lbl 810 `"Miscellaneous entertainment and recreation services"', add
label define ind1990_head_lbl 812 `"Offices and clinics of physicians"', add
label define ind1990_head_lbl 820 `"Offices and clinics of dentists"', add
label define ind1990_head_lbl 821 `"Offices and clinics of chiropractors"', add
label define ind1990_head_lbl 822 `"Offices and clinics of optometrists"', add
label define ind1990_head_lbl 830 `"Offices and clinics of health practitioners, n.e.c."', add
label define ind1990_head_lbl 831 `"Hospitals"', add
label define ind1990_head_lbl 832 `"Nursing and personal care facilities"', add
label define ind1990_head_lbl 840 `"Health services, n.e.c."', add
label define ind1990_head_lbl 841 `"Legal services"', add
label define ind1990_head_lbl 842 `"Elementary and secondary schools"', add
label define ind1990_head_lbl 850 `"Colleges and universities"', add
label define ind1990_head_lbl 851 `"Vocational schools"', add
label define ind1990_head_lbl 852 `"Libraries"', add
label define ind1990_head_lbl 860 `"Educational services, n.e.c."', add
label define ind1990_head_lbl 861 `"Job training and vocational rehabilitation services"', add
label define ind1990_head_lbl 862 `"Child day care services"', add
label define ind1990_head_lbl 863 `"Family child care homes"', add
label define ind1990_head_lbl 870 `"Residential care facilities, without nursing"', add
label define ind1990_head_lbl 871 `"Social services, n.e.c."', add
label define ind1990_head_lbl 872 `"Museums, art galleries, and zoos"', add
label define ind1990_head_lbl 873 `"Labor unions"', add
label define ind1990_head_lbl 880 `"Religious organizations"', add
label define ind1990_head_lbl 881 `"Membership organizations, n.e.c."', add
label define ind1990_head_lbl 882 `"Engineering, architectural, and surveying services"', add
label define ind1990_head_lbl 890 `"Accounting, auditing, and bookkeeping services"', add
label define ind1990_head_lbl 891 `"Research, development, and testing services"', add
label define ind1990_head_lbl 892 `"Management and public relations services"', add
label define ind1990_head_lbl 893 `"Miscellaneous professional and related services"', add
label define ind1990_head_lbl 900 `"Executive and legislative offices"', add
label define ind1990_head_lbl 901 `"General government, n.e.c."', add
label define ind1990_head_lbl 910 `"Justice, public order, and safety"', add
label define ind1990_head_lbl 921 `"Public finance, taxation, and monetary policy"', add
label define ind1990_head_lbl 922 `"Administration of human resources programs"', add
label define ind1990_head_lbl 930 `"Administration of environmental quality and housing programs"', add
label define ind1990_head_lbl 931 `"Administration of economic programs"', add
label define ind1990_head_lbl 932 `"National security and international affairs"', add
label define ind1990_head_lbl 940 `"Army"', add
label define ind1990_head_lbl 941 `"Air Force"', add
label define ind1990_head_lbl 942 `"Navy"', add
label define ind1990_head_lbl 950 `"Marines"', add
label define ind1990_head_lbl 951 `"Coast Guard"', add
label define ind1990_head_lbl 952 `"Armed Forces, branch not specified"', add
label define ind1990_head_lbl 960 `"Military Reserves or National Guard"', add
label define ind1990_head_lbl 998 `"Unknown"', add
label values ind1990_head ind1990_head_lbl

label define ind1990_sp_lbl 000 `"NIU"'
label define ind1990_sp_lbl 010 `"Agricultural production, crops"', add
label define ind1990_sp_lbl 011 `"Agricultural production, livestock"', add
label define ind1990_sp_lbl 012 `"Veterinary services"', add
label define ind1990_sp_lbl 020 `"Landscape and horticultural services"', add
label define ind1990_sp_lbl 030 `"Agricultural services, n.e.c."', add
label define ind1990_sp_lbl 031 `"Forestry"', add
label define ind1990_sp_lbl 032 `"Fishing, hunting, and trapping"', add
label define ind1990_sp_lbl 040 `"Metal mining"', add
label define ind1990_sp_lbl 041 `"Coal mining"', add
label define ind1990_sp_lbl 042 `"Oil and gas extraction"', add
label define ind1990_sp_lbl 050 `"Nonmetallic mining and quarrying, except fuels"', add
label define ind1990_sp_lbl 060 `"All construction"', add
label define ind1990_sp_lbl 100 `"Meat products"', add
label define ind1990_sp_lbl 101 `"Dairy products"', add
label define ind1990_sp_lbl 102 `"Canned, frozen, and preserved fruits and vegetables"', add
label define ind1990_sp_lbl 110 `"Grain mill products"', add
label define ind1990_sp_lbl 111 `"Bakery products"', add
label define ind1990_sp_lbl 112 `"Sugar and confectionery products"', add
label define ind1990_sp_lbl 120 `"Beverage industries"', add
label define ind1990_sp_lbl 121 `"Misc. food preparations and kindred products"', add
label define ind1990_sp_lbl 122 `"Food industries, n.s."', add
label define ind1990_sp_lbl 130 `"Tobacco manufactures"', add
label define ind1990_sp_lbl 132 `"Knitting mills"', add
label define ind1990_sp_lbl 140 `"Dyeing and finishing textiles, except wool and knit goods"', add
label define ind1990_sp_lbl 141 `"Carpets and rugs"', add
label define ind1990_sp_lbl 142 `"Yarn, thread, and fabric mills"', add
label define ind1990_sp_lbl 150 `"Miscellaneous textile mill products"', add
label define ind1990_sp_lbl 151 `"Apparel and accessories, except knit"', add
label define ind1990_sp_lbl 152 `"Miscellaneous fabricated textile products"', add
label define ind1990_sp_lbl 160 `"Pulp, paper, and paperboard mills"', add
label define ind1990_sp_lbl 161 `"Miscellaneous paper and pulp products"', add
label define ind1990_sp_lbl 162 `"Paperboard containers and boxes"', add
label define ind1990_sp_lbl 171 `"Newspaper publishing and printing"', add
label define ind1990_sp_lbl 172 `"Printing, publishing, and allied industries, except newspapers"', add
label define ind1990_sp_lbl 180 `"Plastics, synthetics, and resins"', add
label define ind1990_sp_lbl 181 `"Drugs"', add
label define ind1990_sp_lbl 182 `"Soaps and cosmetics"', add
label define ind1990_sp_lbl 190 `"Paints, varnishes, and related products"', add
label define ind1990_sp_lbl 191 `"Agricultural chemicals"', add
label define ind1990_sp_lbl 192 `"Industrial and miscellaneous chemicals"', add
label define ind1990_sp_lbl 200 `"Petroleum refining"', add
label define ind1990_sp_lbl 201 `"Miscellaneous petroleum and coal products"', add
label define ind1990_sp_lbl 210 `"Tires and inner tubes"', add
label define ind1990_sp_lbl 211 `"Other rubber products, and plastics footwear and belting"', add
label define ind1990_sp_lbl 212 `"Miscellaneous plastics products"', add
label define ind1990_sp_lbl 220 `"Leather tanning and finishing"', add
label define ind1990_sp_lbl 221 `"Footwear, except rubber and plastic"', add
label define ind1990_sp_lbl 222 `"Leather products, except footwear"', add
label define ind1990_sp_lbl 229 `"Manufacturing, non-durable - allocated"', add
label define ind1990_sp_lbl 230 `"Logging"', add
label define ind1990_sp_lbl 231 `"Sawmills, planing mills, and millwork"', add
label define ind1990_sp_lbl 232 `"Wood buildings and mobile homes"', add
label define ind1990_sp_lbl 241 `"Miscellaneous wood products"', add
label define ind1990_sp_lbl 242 `"Furniture and fixtures"', add
label define ind1990_sp_lbl 250 `"Glass and glass products"', add
label define ind1990_sp_lbl 251 `"Cement, concrete, gypsum, and plaster products"', add
label define ind1990_sp_lbl 252 `"Structural clay products"', add
label define ind1990_sp_lbl 261 `"Pottery and related products"', add
label define ind1990_sp_lbl 262 `"Misc. nonmetallic mineral and stone products"', add
label define ind1990_sp_lbl 270 `"Blast furnaces, steelworks, rolling and finishing mills"', add
label define ind1990_sp_lbl 271 `"Iron and steel foundries"', add
label define ind1990_sp_lbl 272 `"Primary aluminum industries"', add
label define ind1990_sp_lbl 280 `"Other primary metal industries"', add
label define ind1990_sp_lbl 281 `"Cutlery, handtools, and general hardware"', add
label define ind1990_sp_lbl 282 `"Fabricated structural metal products"', add
label define ind1990_sp_lbl 290 `"Screw machine products"', add
label define ind1990_sp_lbl 291 `"Metal forgings and stampings"', add
label define ind1990_sp_lbl 292 `"Ordnance"', add
label define ind1990_sp_lbl 300 `"Miscellaneous fabricated metal products"', add
label define ind1990_sp_lbl 301 `"Metal industries, n.s."', add
label define ind1990_sp_lbl 310 `"Engines and turbines"', add
label define ind1990_sp_lbl 311 `"Farm machinery and equipment"', add
label define ind1990_sp_lbl 312 `"Construction and material handling machines"', add
label define ind1990_sp_lbl 320 `"Metalworking machinery"', add
label define ind1990_sp_lbl 321 `"Office and accounting machines"', add
label define ind1990_sp_lbl 322 `"Computers and related equipment"', add
label define ind1990_sp_lbl 331 `"Machinery, except electrical, n.e.c."', add
label define ind1990_sp_lbl 332 `"Machinery, n.s."', add
label define ind1990_sp_lbl 340 `"Household appliances"', add
label define ind1990_sp_lbl 341 `"Radio, TV, and communication equipment"', add
label define ind1990_sp_lbl 342 `"Electrical machinery, equipment, and supplies, n.e.c."', add
label define ind1990_sp_lbl 350 `"Electrical machinery, equipment, and supplies, n.s."', add
label define ind1990_sp_lbl 351 `"Motor vehicles and motor vehicle equipment"', add
label define ind1990_sp_lbl 352 `"Aircraft and parts"', add
label define ind1990_sp_lbl 360 `"Ship and boat building and repairing"', add
label define ind1990_sp_lbl 361 `"Railroad locomotives and equipment"', add
label define ind1990_sp_lbl 362 `"Guided missiles, space vehicles, and parts"', add
label define ind1990_sp_lbl 370 `"Cycles and miscellaneous transportation equipment"', add
label define ind1990_sp_lbl 371 `"Scientific and controlling instruments"', add
label define ind1990_sp_lbl 372 `"Medical, dental, and optical instruments and supplies"', add
label define ind1990_sp_lbl 380 `"Photographic equipment and supplies"', add
label define ind1990_sp_lbl 381 `"Watches, clocks, and clockwork operated devices"', add
label define ind1990_sp_lbl 390 `"Toys, amusement, and sporting goods"', add
label define ind1990_sp_lbl 391 `"Miscellaneous manufacturing industries"', add
label define ind1990_sp_lbl 392 `"Manufacturing industries, n.s."', add
label define ind1990_sp_lbl 400 `"Railroads"', add
label define ind1990_sp_lbl 401 `"Bus service and urban transit"', add
label define ind1990_sp_lbl 402 `"Taxicab service"', add
label define ind1990_sp_lbl 410 `"Trucking service"', add
label define ind1990_sp_lbl 411 `"Warehousing and storage"', add
label define ind1990_sp_lbl 412 `"U.S. Postal Service"', add
label define ind1990_sp_lbl 420 `"Water transportation"', add
label define ind1990_sp_lbl 421 `"Air transportation"', add
label define ind1990_sp_lbl 422 `"Pipe lines, except natural gas"', add
label define ind1990_sp_lbl 432 `"Services incidental to transportation"', add
label define ind1990_sp_lbl 440 `"Radio and television broadcasting and cable"', add
label define ind1990_sp_lbl 441 `"Wired communications"', add
label define ind1990_sp_lbl 442 `"Telegraph and miscellaneous communications services"', add
label define ind1990_sp_lbl 450 `"Electric light and power"', add
label define ind1990_sp_lbl 451 `"Gas and steam supply systems"', add
label define ind1990_sp_lbl 452 `"Electric and gas, and other combinations"', add
label define ind1990_sp_lbl 470 `"Water supply and irrigation"', add
label define ind1990_sp_lbl 471 `"Sanitary services"', add
label define ind1990_sp_lbl 472 `"Utilities, n.s."', add
label define ind1990_sp_lbl 500 `"Motor vehicles and equipment"', add
label define ind1990_sp_lbl 501 `"Furniture and home furnishings"', add
label define ind1990_sp_lbl 502 `"Lumber and construction materials"', add
label define ind1990_sp_lbl 510 `"Professional and commercial equipment and supplies"', add
label define ind1990_sp_lbl 511 `"Metals and minerals, except petroleum"', add
label define ind1990_sp_lbl 512 `"Electrical goods"', add
label define ind1990_sp_lbl 521 `"Hardware, plumbing and heating supplies"', add
label define ind1990_sp_lbl 530 `"Machinery, equipment, and supplies"', add
label define ind1990_sp_lbl 531 `"Scrap and waste materials"', add
label define ind1990_sp_lbl 532 `"Miscellaneous wholesale, durable goods"', add
label define ind1990_sp_lbl 540 `"Paper and paper products"', add
label define ind1990_sp_lbl 541 `"Drugs, chemicals, and allied products"', add
label define ind1990_sp_lbl 542 `"Apparel, fabrics, and notions"', add
label define ind1990_sp_lbl 550 `"Groceries and related products"', add
label define ind1990_sp_lbl 551 `"Farm-product raw materials"', add
label define ind1990_sp_lbl 552 `"Petroleum products"', add
label define ind1990_sp_lbl 560 `"Alcoholic beverages"', add
label define ind1990_sp_lbl 561 `"Farm supplies"', add
label define ind1990_sp_lbl 562 `"Miscellaneous wholesale, nondurable goods"', add
label define ind1990_sp_lbl 571 `"Wholesale trade, n.s."', add
label define ind1990_sp_lbl 580 `"Lumber and building material retailing"', add
label define ind1990_sp_lbl 581 `"Hardware stores"', add
label define ind1990_sp_lbl 582 `"Retail nurseries and garden stores"', add
label define ind1990_sp_lbl 590 `"Mobile home dealers"', add
label define ind1990_sp_lbl 591 `"Department stores"', add
label define ind1990_sp_lbl 592 `"Variety stores"', add
label define ind1990_sp_lbl 600 `"Miscellaneous general merchandise stores"', add
label define ind1990_sp_lbl 601 `"Grocery stores"', add
label define ind1990_sp_lbl 602 `"Dairy products stores"', add
label define ind1990_sp_lbl 610 `"Retail bakeries"', add
label define ind1990_sp_lbl 611 `"Food stores, n.e.c."', add
label define ind1990_sp_lbl 612 `"Motor vehicle dealers"', add
label define ind1990_sp_lbl 620 `"Auto and home supply stores"', add
label define ind1990_sp_lbl 621 `"Gasoline service stations"', add
label define ind1990_sp_lbl 622 `"Miscellaneous vehicle dealers"', add
label define ind1990_sp_lbl 623 `"Apparel and accessory stores, except shoe"', add
label define ind1990_sp_lbl 630 `"Shoe stores"', add
label define ind1990_sp_lbl 631 `"Furniture and home furnishings stores"', add
label define ind1990_sp_lbl 632 `"Household appliance stores"', add
label define ind1990_sp_lbl 633 `"Radio, TV, and computer stores"', add
label define ind1990_sp_lbl 640 `"Music stores"', add
label define ind1990_sp_lbl 641 `"Eating and drinking places"', add
label define ind1990_sp_lbl 642 `"Drug stores"', add
label define ind1990_sp_lbl 650 `"Liquor stores"', add
label define ind1990_sp_lbl 651 `"Sporting goods, bicycles, and hobby stores"', add
label define ind1990_sp_lbl 652 `"Book and stationery stores"', add
label define ind1990_sp_lbl 660 `"Jewelry stores"', add
label define ind1990_sp_lbl 661 `"Gift, novelty, and souvenir shops"', add
label define ind1990_sp_lbl 662 `"Sewing, needlework, and piece goods stores"', add
label define ind1990_sp_lbl 663 `"Catalog and mail order houses"', add
label define ind1990_sp_lbl 670 `"Vending machine operators"', add
label define ind1990_sp_lbl 671 `"Direct selling establishments"', add
label define ind1990_sp_lbl 672 `"Fuel dealers"', add
label define ind1990_sp_lbl 681 `"Retail florists"', add
label define ind1990_sp_lbl 682 `"Miscellaneous retail stores"', add
label define ind1990_sp_lbl 691 `"Retail trade, n.s."', add
label define ind1990_sp_lbl 700 `"Banking"', add
label define ind1990_sp_lbl 701 `"Savings institutions, including credit unions"', add
label define ind1990_sp_lbl 702 `"Credit agencies, n.e.c."', add
label define ind1990_sp_lbl 710 `"Security, commodity brokerage, and investment companies"', add
label define ind1990_sp_lbl 711 `"Insurance"', add
label define ind1990_sp_lbl 712 `"Real estate, including real estate-insurance offices"', add
label define ind1990_sp_lbl 721 `"Advertising"', add
label define ind1990_sp_lbl 722 `"Services to dwellings and other buildings"', add
label define ind1990_sp_lbl 731 `"Personnel supply services"', add
label define ind1990_sp_lbl 732 `"Computer and data processing services"', add
label define ind1990_sp_lbl 740 `"Detective and protective services"', add
label define ind1990_sp_lbl 741 `"Business services, n.e.c."', add
label define ind1990_sp_lbl 742 `"Automotive rental and leasing, without drivers"', add
label define ind1990_sp_lbl 750 `"Automobile parking and carwashes"', add
label define ind1990_sp_lbl 751 `"Automotive repair and related services"', add
label define ind1990_sp_lbl 752 `"Electrical repair shops"', add
label define ind1990_sp_lbl 760 `"Miscellaneous repair services"', add
label define ind1990_sp_lbl 761 `"Private households"', add
label define ind1990_sp_lbl 762 `"Hotels and motels"', add
label define ind1990_sp_lbl 770 `"Lodging places, except hotels and motels"', add
label define ind1990_sp_lbl 771 `"Laundry, cleaning, and garment services"', add
label define ind1990_sp_lbl 772 `"Beauty shops"', add
label define ind1990_sp_lbl 780 `"Barber shops"', add
label define ind1990_sp_lbl 781 `"Funeral service and crematories"', add
label define ind1990_sp_lbl 782 `"Shoe repair shops"', add
label define ind1990_sp_lbl 790 `"Dressmaking shops"', add
label define ind1990_sp_lbl 791 `"Miscellaneous personal services"', add
label define ind1990_sp_lbl 800 `"Theaters and motion pictures"', add
label define ind1990_sp_lbl 801 `"Video tape rental"', add
label define ind1990_sp_lbl 802 `"Bowling centers"', add
label define ind1990_sp_lbl 810 `"Miscellaneous entertainment and recreation services"', add
label define ind1990_sp_lbl 812 `"Offices and clinics of physicians"', add
label define ind1990_sp_lbl 820 `"Offices and clinics of dentists"', add
label define ind1990_sp_lbl 821 `"Offices and clinics of chiropractors"', add
label define ind1990_sp_lbl 822 `"Offices and clinics of optometrists"', add
label define ind1990_sp_lbl 830 `"Offices and clinics of health practitioners, n.e.c."', add
label define ind1990_sp_lbl 831 `"Hospitals"', add
label define ind1990_sp_lbl 832 `"Nursing and personal care facilities"', add
label define ind1990_sp_lbl 840 `"Health services, n.e.c."', add
label define ind1990_sp_lbl 841 `"Legal services"', add
label define ind1990_sp_lbl 842 `"Elementary and secondary schools"', add
label define ind1990_sp_lbl 850 `"Colleges and universities"', add
label define ind1990_sp_lbl 851 `"Vocational schools"', add
label define ind1990_sp_lbl 852 `"Libraries"', add
label define ind1990_sp_lbl 860 `"Educational services, n.e.c."', add
label define ind1990_sp_lbl 861 `"Job training and vocational rehabilitation services"', add
label define ind1990_sp_lbl 862 `"Child day care services"', add
label define ind1990_sp_lbl 863 `"Family child care homes"', add
label define ind1990_sp_lbl 870 `"Residential care facilities, without nursing"', add
label define ind1990_sp_lbl 871 `"Social services, n.e.c."', add
label define ind1990_sp_lbl 872 `"Museums, art galleries, and zoos"', add
label define ind1990_sp_lbl 873 `"Labor unions"', add
label define ind1990_sp_lbl 880 `"Religious organizations"', add
label define ind1990_sp_lbl 881 `"Membership organizations, n.e.c."', add
label define ind1990_sp_lbl 882 `"Engineering, architectural, and surveying services"', add
label define ind1990_sp_lbl 890 `"Accounting, auditing, and bookkeeping services"', add
label define ind1990_sp_lbl 891 `"Research, development, and testing services"', add
label define ind1990_sp_lbl 892 `"Management and public relations services"', add
label define ind1990_sp_lbl 893 `"Miscellaneous professional and related services"', add
label define ind1990_sp_lbl 900 `"Executive and legislative offices"', add
label define ind1990_sp_lbl 901 `"General government, n.e.c."', add
label define ind1990_sp_lbl 910 `"Justice, public order, and safety"', add
label define ind1990_sp_lbl 921 `"Public finance, taxation, and monetary policy"', add
label define ind1990_sp_lbl 922 `"Administration of human resources programs"', add
label define ind1990_sp_lbl 930 `"Administration of environmental quality and housing programs"', add
label define ind1990_sp_lbl 931 `"Administration of economic programs"', add
label define ind1990_sp_lbl 932 `"National security and international affairs"', add
label define ind1990_sp_lbl 940 `"Army"', add
label define ind1990_sp_lbl 941 `"Air Force"', add
label define ind1990_sp_lbl 942 `"Navy"', add
label define ind1990_sp_lbl 950 `"Marines"', add
label define ind1990_sp_lbl 951 `"Coast Guard"', add
label define ind1990_sp_lbl 952 `"Armed Forces, branch not specified"', add
label define ind1990_sp_lbl 960 `"Military Reserves or National Guard"', add
label define ind1990_sp_lbl 998 `"Unknown"', add
label values ind1990_sp ind1990_sp_lbl

label define ind1950_head_lbl 000 `"NIU"'
label define ind1950_head_lbl 105 `"Agriculture"', add
label define ind1950_head_lbl 116 `"Forestry"', add
label define ind1950_head_lbl 126 `"Fisheries"', add
label define ind1950_head_lbl 206 `"Metal mining"', add
label define ind1950_head_lbl 216 `"Coal mining"', add
label define ind1950_head_lbl 226 `"Crude petroleum and natural gas extraction"', add
label define ind1950_head_lbl 236 `"Nonmetallic mining and quarrying, except fuel"', add
label define ind1950_head_lbl 246 `"Construction"', add
label define ind1950_head_lbl 306 `"Logging"', add
label define ind1950_head_lbl 307 `"Sawmills, planing mills, and millwork"', add
label define ind1950_head_lbl 308 `"Misc wood products"', add
label define ind1950_head_lbl 309 `"Furniture and fixtures"', add
label define ind1950_head_lbl 316 `"Glass and glass products"', add
label define ind1950_head_lbl 317 `"Cement, concrete, gypsum and plaster products"', add
label define ind1950_head_lbl 318 `"Structural clay products"', add
label define ind1950_head_lbl 319 `"Pottery and related products"', add
label define ind1950_head_lbl 326 `"Miscellaneous nonmetallic mineral and stone products"', add
label define ind1950_head_lbl 336 `"Blast furnaces, steel works, and rolling mills"', add
label define ind1950_head_lbl 337 `"Other primary iron and steel industries"', add
label define ind1950_head_lbl 338 `"Primary nonferrous industries"', add
label define ind1950_head_lbl 346 `"Fabricated steel products"', add
label define ind1950_head_lbl 347 `"Fabricated nonferrous metal products"', add
label define ind1950_head_lbl 348 `"Not specified metal industries"', add
label define ind1950_head_lbl 356 `"Agricultural machinery and tractors"', add
label define ind1950_head_lbl 357 `"Office and store machines and devices"', add
label define ind1950_head_lbl 358 `"Miscellaneous machinery"', add
label define ind1950_head_lbl 367 `"Electrical machinery, equipment, and supplies"', add
label define ind1950_head_lbl 376 `"Motor vehicles and motor vehicle equipment"', add
label define ind1950_head_lbl 377 `"Aircraft and parts"', add
label define ind1950_head_lbl 378 `"Ship and boat building and repairing"', add
label define ind1950_head_lbl 379 `"Railroad and miscellaneous transportation equipment"', add
label define ind1950_head_lbl 386 `"Professional equipment and supplies"', add
label define ind1950_head_lbl 387 `"Photographic equipment and supplies"', add
label define ind1950_head_lbl 388 `"Watches, clocks, and clockwork-operated devices"', add
label define ind1950_head_lbl 399 `"Miscellaneous manufacturing industries"', add
label define ind1950_head_lbl 406 `"Meat products"', add
label define ind1950_head_lbl 407 `"Dairy products"', add
label define ind1950_head_lbl 408 `"Canning and preserving fruits, vegetables, and seafoods"', add
label define ind1950_head_lbl 409 `"Grain-mill products"', add
label define ind1950_head_lbl 416 `"Bakery products"', add
label define ind1950_head_lbl 417 `"Confectionery and related products"', add
label define ind1950_head_lbl 418 `"Beverage industries"', add
label define ind1950_head_lbl 419 `"Miscellaneous food preparations and kindred products"', add
label define ind1950_head_lbl 426 `"Not specified food industries"', add
label define ind1950_head_lbl 429 `"Tobacco manufactures"', add
label define ind1950_head_lbl 436 `"Knitting mills"', add
label define ind1950_head_lbl 437 `"Dyeing and finishing textiles, except knit goods"', add
label define ind1950_head_lbl 438 `"Carpets, rugs, and other floor coverings"', add
label define ind1950_head_lbl 439 `"Yarn, thread, and fabric mills"', add
label define ind1950_head_lbl 446 `"Miscellaneous textile mill products"', add
label define ind1950_head_lbl 448 `"Apparel and accessories"', add
label define ind1950_head_lbl 449 `"Miscellaneous fabricated textile products"', add
label define ind1950_head_lbl 456 `"Pulp, paper, and paperboard mills"', add
label define ind1950_head_lbl 457 `"Paperboard containers and boxes"', add
label define ind1950_head_lbl 458 `"Miscellaneous paper and pulp products"', add
label define ind1950_head_lbl 459 `"Printing, publishing, and allied industries"', add
label define ind1950_head_lbl 466 `"Synthetic fibers"', add
label define ind1950_head_lbl 467 `"Drugs and medicines"', add
label define ind1950_head_lbl 468 `"Paints, varnishes, and related products"', add
label define ind1950_head_lbl 469 `"Miscellaneous chemicals and allied products"', add
label define ind1950_head_lbl 476 `"Petroleum refining"', add
label define ind1950_head_lbl 477 `"Miscellaneous petroleum and coal products"', add
label define ind1950_head_lbl 478 `"Rubber products"', add
label define ind1950_head_lbl 487 `"Leather: tanned, curried, and finished"', add
label define ind1950_head_lbl 488 `"Footwear, except rubber"', add
label define ind1950_head_lbl 489 `"Leather products, except footwear"', add
label define ind1950_head_lbl 499 `"Not specified manufacturing industries"', add
label define ind1950_head_lbl 506 `"Railroads and railway express service"', add
label define ind1950_head_lbl 516 `"Street railways and bus lines"', add
label define ind1950_head_lbl 526 `"Trucking service"', add
label define ind1950_head_lbl 527 `"Warehousing and storage"', add
label define ind1950_head_lbl 536 `"Taxicab service"', add
label define ind1950_head_lbl 546 `"Water transportation"', add
label define ind1950_head_lbl 556 `"Air transportation"', add
label define ind1950_head_lbl 567 `"Petroleum and gasoline pipe lines"', add
label define ind1950_head_lbl 568 `"Services incidental to transportation"', add
label define ind1950_head_lbl 578 `"Telephone"', add
label define ind1950_head_lbl 579 `"Telegraph"', add
label define ind1950_head_lbl 586 `"Electric light and power"', add
label define ind1950_head_lbl 587 `"Gas and steam supply systems"', add
label define ind1950_head_lbl 588 `"Electric-gas utilities"', add
label define ind1950_head_lbl 596 `"Water supply"', add
label define ind1950_head_lbl 597 `"Sanitary services"', add
label define ind1950_head_lbl 598 `"Other and not specified utilities"', add
label define ind1950_head_lbl 606 `"Motor vehicles and equipment"', add
label define ind1950_head_lbl 607 `"Drugs, chemicals, and allied products"', add
label define ind1950_head_lbl 608 `"Dry goods apparel"', add
label define ind1950_head_lbl 609 `"Food and related products"', add
label define ind1950_head_lbl 616 `"Electrical goods, hardware, and plumbing equipment"', add
label define ind1950_head_lbl 617 `"Machinery, equipment, and supplies"', add
label define ind1950_head_lbl 618 `"Petroleum products"', add
label define ind1950_head_lbl 619 `"Farm products--raw materials"', add
label define ind1950_head_lbl 626 `"Miscellaneous wholesale trade"', add
label define ind1950_head_lbl 627 `"Not specified wholesale trade"', add
label define ind1950_head_lbl 636 `"Food stores, except dairy products"', add
label define ind1950_head_lbl 637 `"Dairy products stores and milk retailing"', add
label define ind1950_head_lbl 646 `"General merchandise stores"', add
label define ind1950_head_lbl 647 `"Five and ten cent stores"', add
label define ind1950_head_lbl 656 `"Apparel and accessories stores, except shoe"', add
label define ind1950_head_lbl 657 `"Shoe stores"', add
label define ind1950_head_lbl 658 `"Furniture and house furnishing stores"', add
label define ind1950_head_lbl 659 `"Household appliance and radio stores"', add
label define ind1950_head_lbl 667 `"Motor vehicles and accessories retailing"', add
label define ind1950_head_lbl 668 `"Gasoline service stations"', add
label define ind1950_head_lbl 669 `"Drug stores"', add
label define ind1950_head_lbl 679 `"Eating and drinking places"', add
label define ind1950_head_lbl 686 `"Hardware and farm implement stores"', add
label define ind1950_head_lbl 687 `"Lumber and building material retailing"', add
label define ind1950_head_lbl 688 `"Liquor stores"', add
label define ind1950_head_lbl 689 `"Retail florists"', add
label define ind1950_head_lbl 696 `"Jewelry stores"', add
label define ind1950_head_lbl 697 `"Fuel and ice retailing"', add
label define ind1950_head_lbl 698 `"Miscellaneous retail stores"', add
label define ind1950_head_lbl 699 `"Not specified retail trade"', add
label define ind1950_head_lbl 716 `"Banking and credit agencies"', add
label define ind1950_head_lbl 726 `"Security and commodity brokerage and investment companies"', add
label define ind1950_head_lbl 736 `"Insurance"', add
label define ind1950_head_lbl 746 `"Real estate"', add
label define ind1950_head_lbl 806 `"Advertising"', add
label define ind1950_head_lbl 807 `"Accounting, auditing, and bookkeeping services"', add
label define ind1950_head_lbl 808 `"Miscellaneous business services"', add
label define ind1950_head_lbl 816 `"Auto repair services and garages"', add
label define ind1950_head_lbl 817 `"Miscellaneous repair services"', add
label define ind1950_head_lbl 826 `"Private households"', add
label define ind1950_head_lbl 836 `"Hotels and lodging places"', add
label define ind1950_head_lbl 846 `"Laundering, cleaning, and dyeing services"', add
label define ind1950_head_lbl 847 `"Dressmaking shops"', add
label define ind1950_head_lbl 848 `"Shoe repair shops"', add
label define ind1950_head_lbl 849 `"Miscellaneous personal services"', add
label define ind1950_head_lbl 856 `"Radio broadcasting and television"', add
label define ind1950_head_lbl 857 `"Theaters and motion pictures"', add
label define ind1950_head_lbl 858 `"Bowling alleys, and billiard and pool parlors"', add
label define ind1950_head_lbl 859 `"Miscellaneous entertainment and recreation services"', add
label define ind1950_head_lbl 868 `"Medical and other health services, except hospitals"', add
label define ind1950_head_lbl 869 `"Hospitals"', add
label define ind1950_head_lbl 879 `"Legal services"', add
label define ind1950_head_lbl 888 `"Educational services"', add
label define ind1950_head_lbl 896 `"Welfare and religious services"', add
label define ind1950_head_lbl 897 `"Nonprofit membership organizations"', add
label define ind1950_head_lbl 898 `"Engineering and architectural services"', add
label define ind1950_head_lbl 899 `"Miscellaneous professional and related services"', add
label define ind1950_head_lbl 906 `"Postal service"', add
label define ind1950_head_lbl 916 `"Federal public administration"', add
label define ind1950_head_lbl 926 `"State public administration"', add
label define ind1950_head_lbl 936 `"Local public administration"', add
label define ind1950_head_lbl 997 `"Nonclassifiable"', add
label define ind1950_head_lbl 998 `"Industry not reported"', add
label values ind1950_head ind1950_head_lbl

label define ind1950_sp_lbl 000 `"NIU"'
label define ind1950_sp_lbl 105 `"Agriculture"', add
label define ind1950_sp_lbl 116 `"Forestry"', add
label define ind1950_sp_lbl 126 `"Fisheries"', add
label define ind1950_sp_lbl 206 `"Metal mining"', add
label define ind1950_sp_lbl 216 `"Coal mining"', add
label define ind1950_sp_lbl 226 `"Crude petroleum and natural gas extraction"', add
label define ind1950_sp_lbl 236 `"Nonmetallic mining and quarrying, except fuel"', add
label define ind1950_sp_lbl 246 `"Construction"', add
label define ind1950_sp_lbl 306 `"Logging"', add
label define ind1950_sp_lbl 307 `"Sawmills, planing mills, and millwork"', add
label define ind1950_sp_lbl 308 `"Misc wood products"', add
label define ind1950_sp_lbl 309 `"Furniture and fixtures"', add
label define ind1950_sp_lbl 316 `"Glass and glass products"', add
label define ind1950_sp_lbl 317 `"Cement, concrete, gypsum and plaster products"', add
label define ind1950_sp_lbl 318 `"Structural clay products"', add
label define ind1950_sp_lbl 319 `"Pottery and related products"', add
label define ind1950_sp_lbl 326 `"Miscellaneous nonmetallic mineral and stone products"', add
label define ind1950_sp_lbl 336 `"Blast furnaces, steel works, and rolling mills"', add
label define ind1950_sp_lbl 337 `"Other primary iron and steel industries"', add
label define ind1950_sp_lbl 338 `"Primary nonferrous industries"', add
label define ind1950_sp_lbl 346 `"Fabricated steel products"', add
label define ind1950_sp_lbl 347 `"Fabricated nonferrous metal products"', add
label define ind1950_sp_lbl 348 `"Not specified metal industries"', add
label define ind1950_sp_lbl 356 `"Agricultural machinery and tractors"', add
label define ind1950_sp_lbl 357 `"Office and store machines and devices"', add
label define ind1950_sp_lbl 358 `"Miscellaneous machinery"', add
label define ind1950_sp_lbl 367 `"Electrical machinery, equipment, and supplies"', add
label define ind1950_sp_lbl 376 `"Motor vehicles and motor vehicle equipment"', add
label define ind1950_sp_lbl 377 `"Aircraft and parts"', add
label define ind1950_sp_lbl 378 `"Ship and boat building and repairing"', add
label define ind1950_sp_lbl 379 `"Railroad and miscellaneous transportation equipment"', add
label define ind1950_sp_lbl 386 `"Professional equipment and supplies"', add
label define ind1950_sp_lbl 387 `"Photographic equipment and supplies"', add
label define ind1950_sp_lbl 388 `"Watches, clocks, and clockwork-operated devices"', add
label define ind1950_sp_lbl 399 `"Miscellaneous manufacturing industries"', add
label define ind1950_sp_lbl 406 `"Meat products"', add
label define ind1950_sp_lbl 407 `"Dairy products"', add
label define ind1950_sp_lbl 408 `"Canning and preserving fruits, vegetables, and seafoods"', add
label define ind1950_sp_lbl 409 `"Grain-mill products"', add
label define ind1950_sp_lbl 416 `"Bakery products"', add
label define ind1950_sp_lbl 417 `"Confectionery and related products"', add
label define ind1950_sp_lbl 418 `"Beverage industries"', add
label define ind1950_sp_lbl 419 `"Miscellaneous food preparations and kindred products"', add
label define ind1950_sp_lbl 426 `"Not specified food industries"', add
label define ind1950_sp_lbl 429 `"Tobacco manufactures"', add
label define ind1950_sp_lbl 436 `"Knitting mills"', add
label define ind1950_sp_lbl 437 `"Dyeing and finishing textiles, except knit goods"', add
label define ind1950_sp_lbl 438 `"Carpets, rugs, and other floor coverings"', add
label define ind1950_sp_lbl 439 `"Yarn, thread, and fabric mills"', add
label define ind1950_sp_lbl 446 `"Miscellaneous textile mill products"', add
label define ind1950_sp_lbl 448 `"Apparel and accessories"', add
label define ind1950_sp_lbl 449 `"Miscellaneous fabricated textile products"', add
label define ind1950_sp_lbl 456 `"Pulp, paper, and paperboard mills"', add
label define ind1950_sp_lbl 457 `"Paperboard containers and boxes"', add
label define ind1950_sp_lbl 458 `"Miscellaneous paper and pulp products"', add
label define ind1950_sp_lbl 459 `"Printing, publishing, and allied industries"', add
label define ind1950_sp_lbl 466 `"Synthetic fibers"', add
label define ind1950_sp_lbl 467 `"Drugs and medicines"', add
label define ind1950_sp_lbl 468 `"Paints, varnishes, and related products"', add
label define ind1950_sp_lbl 469 `"Miscellaneous chemicals and allied products"', add
label define ind1950_sp_lbl 476 `"Petroleum refining"', add
label define ind1950_sp_lbl 477 `"Miscellaneous petroleum and coal products"', add
label define ind1950_sp_lbl 478 `"Rubber products"', add
label define ind1950_sp_lbl 487 `"Leather: tanned, curried, and finished"', add
label define ind1950_sp_lbl 488 `"Footwear, except rubber"', add
label define ind1950_sp_lbl 489 `"Leather products, except footwear"', add
label define ind1950_sp_lbl 499 `"Not specified manufacturing industries"', add
label define ind1950_sp_lbl 506 `"Railroads and railway express service"', add
label define ind1950_sp_lbl 516 `"Street railways and bus lines"', add
label define ind1950_sp_lbl 526 `"Trucking service"', add
label define ind1950_sp_lbl 527 `"Warehousing and storage"', add
label define ind1950_sp_lbl 536 `"Taxicab service"', add
label define ind1950_sp_lbl 546 `"Water transportation"', add
label define ind1950_sp_lbl 556 `"Air transportation"', add
label define ind1950_sp_lbl 567 `"Petroleum and gasoline pipe lines"', add
label define ind1950_sp_lbl 568 `"Services incidental to transportation"', add
label define ind1950_sp_lbl 578 `"Telephone"', add
label define ind1950_sp_lbl 579 `"Telegraph"', add
label define ind1950_sp_lbl 586 `"Electric light and power"', add
label define ind1950_sp_lbl 587 `"Gas and steam supply systems"', add
label define ind1950_sp_lbl 588 `"Electric-gas utilities"', add
label define ind1950_sp_lbl 596 `"Water supply"', add
label define ind1950_sp_lbl 597 `"Sanitary services"', add
label define ind1950_sp_lbl 598 `"Other and not specified utilities"', add
label define ind1950_sp_lbl 606 `"Motor vehicles and equipment"', add
label define ind1950_sp_lbl 607 `"Drugs, chemicals, and allied products"', add
label define ind1950_sp_lbl 608 `"Dry goods apparel"', add
label define ind1950_sp_lbl 609 `"Food and related products"', add
label define ind1950_sp_lbl 616 `"Electrical goods, hardware, and plumbing equipment"', add
label define ind1950_sp_lbl 617 `"Machinery, equipment, and supplies"', add
label define ind1950_sp_lbl 618 `"Petroleum products"', add
label define ind1950_sp_lbl 619 `"Farm products--raw materials"', add
label define ind1950_sp_lbl 626 `"Miscellaneous wholesale trade"', add
label define ind1950_sp_lbl 627 `"Not specified wholesale trade"', add
label define ind1950_sp_lbl 636 `"Food stores, except dairy products"', add
label define ind1950_sp_lbl 637 `"Dairy products stores and milk retailing"', add
label define ind1950_sp_lbl 646 `"General merchandise stores"', add
label define ind1950_sp_lbl 647 `"Five and ten cent stores"', add
label define ind1950_sp_lbl 656 `"Apparel and accessories stores, except shoe"', add
label define ind1950_sp_lbl 657 `"Shoe stores"', add
label define ind1950_sp_lbl 658 `"Furniture and house furnishing stores"', add
label define ind1950_sp_lbl 659 `"Household appliance and radio stores"', add
label define ind1950_sp_lbl 667 `"Motor vehicles and accessories retailing"', add
label define ind1950_sp_lbl 668 `"Gasoline service stations"', add
label define ind1950_sp_lbl 669 `"Drug stores"', add
label define ind1950_sp_lbl 679 `"Eating and drinking places"', add
label define ind1950_sp_lbl 686 `"Hardware and farm implement stores"', add
label define ind1950_sp_lbl 687 `"Lumber and building material retailing"', add
label define ind1950_sp_lbl 688 `"Liquor stores"', add
label define ind1950_sp_lbl 689 `"Retail florists"', add
label define ind1950_sp_lbl 696 `"Jewelry stores"', add
label define ind1950_sp_lbl 697 `"Fuel and ice retailing"', add
label define ind1950_sp_lbl 698 `"Miscellaneous retail stores"', add
label define ind1950_sp_lbl 699 `"Not specified retail trade"', add
label define ind1950_sp_lbl 716 `"Banking and credit agencies"', add
label define ind1950_sp_lbl 726 `"Security and commodity brokerage and investment companies"', add
label define ind1950_sp_lbl 736 `"Insurance"', add
label define ind1950_sp_lbl 746 `"Real estate"', add
label define ind1950_sp_lbl 806 `"Advertising"', add
label define ind1950_sp_lbl 807 `"Accounting, auditing, and bookkeeping services"', add
label define ind1950_sp_lbl 808 `"Miscellaneous business services"', add
label define ind1950_sp_lbl 816 `"Auto repair services and garages"', add
label define ind1950_sp_lbl 817 `"Miscellaneous repair services"', add
label define ind1950_sp_lbl 826 `"Private households"', add
label define ind1950_sp_lbl 836 `"Hotels and lodging places"', add
label define ind1950_sp_lbl 846 `"Laundering, cleaning, and dyeing services"', add
label define ind1950_sp_lbl 847 `"Dressmaking shops"', add
label define ind1950_sp_lbl 848 `"Shoe repair shops"', add
label define ind1950_sp_lbl 849 `"Miscellaneous personal services"', add
label define ind1950_sp_lbl 856 `"Radio broadcasting and television"', add
label define ind1950_sp_lbl 857 `"Theaters and motion pictures"', add
label define ind1950_sp_lbl 858 `"Bowling alleys, and billiard and pool parlors"', add
label define ind1950_sp_lbl 859 `"Miscellaneous entertainment and recreation services"', add
label define ind1950_sp_lbl 868 `"Medical and other health services, except hospitals"', add
label define ind1950_sp_lbl 869 `"Hospitals"', add
label define ind1950_sp_lbl 879 `"Legal services"', add
label define ind1950_sp_lbl 888 `"Educational services"', add
label define ind1950_sp_lbl 896 `"Welfare and religious services"', add
label define ind1950_sp_lbl 897 `"Nonprofit membership organizations"', add
label define ind1950_sp_lbl 898 `"Engineering and architectural services"', add
label define ind1950_sp_lbl 899 `"Miscellaneous professional and related services"', add
label define ind1950_sp_lbl 906 `"Postal service"', add
label define ind1950_sp_lbl 916 `"Federal public administration"', add
label define ind1950_sp_lbl 926 `"State public administration"', add
label define ind1950_sp_lbl 936 `"Local public administration"', add
label define ind1950_sp_lbl 997 `"Nonclassifiable"', add
label define ind1950_sp_lbl 998 `"Industry not reported"', add
label values ind1950_sp ind1950_sp_lbl

label define classwkr_head_lbl 00 `"NIU"'
label define classwkr_head_lbl 10 `"Self-employed"', add
label define classwkr_head_lbl 13 `"Self-employed, not incorporated"', add
label define classwkr_head_lbl 14 `"Self-employed, incorporated"', add
label define classwkr_head_lbl 20 `"Works for wages or salary"', add
label define classwkr_head_lbl 21 `"Wage/salary, private"', add
label define classwkr_head_lbl 22 `"Private, for profit"', add
label define classwkr_head_lbl 23 `"Private, nonprofit"', add
label define classwkr_head_lbl 24 `"Wage/salary, government"', add
label define classwkr_head_lbl 25 `"Federal government employee"', add
label define classwkr_head_lbl 26 `"Armed forces"', add
label define classwkr_head_lbl 27 `"State government employee"', add
label define classwkr_head_lbl 28 `"Local government employee"', add
label define classwkr_head_lbl 29 `"Unpaid family worker"', add
label define classwkr_head_lbl 99 `"Missing/Unknown"', add
label values classwkr_head classwkr_head_lbl

label define classwkr_sp_lbl 00 `"NIU"'
label define classwkr_sp_lbl 10 `"Self-employed"', add
label define classwkr_sp_lbl 13 `"Self-employed, not incorporated"', add
label define classwkr_sp_lbl 14 `"Self-employed, incorporated"', add
label define classwkr_sp_lbl 20 `"Works for wages or salary"', add
label define classwkr_sp_lbl 21 `"Wage/salary, private"', add
label define classwkr_sp_lbl 22 `"Private, for profit"', add
label define classwkr_sp_lbl 23 `"Private, nonprofit"', add
label define classwkr_sp_lbl 24 `"Wage/salary, government"', add
label define classwkr_sp_lbl 25 `"Federal government employee"', add
label define classwkr_sp_lbl 26 `"Armed forces"', add
label define classwkr_sp_lbl 27 `"State government employee"', add
label define classwkr_sp_lbl 28 `"Local government employee"', add
label define classwkr_sp_lbl 29 `"Unpaid family worker"', add
label define classwkr_sp_lbl 99 `"Missing/Unknown"', add
label values classwkr_sp classwkr_sp_lbl

label define uhrsworkt_head_lbl 997 `"Hours vary"'
label define uhrsworkt_head_lbl 999 `"NIU"', add
label values uhrsworkt_head uhrsworkt_head_lbl

label define uhrsworkt_sp_lbl 997 `"Hours vary"'
label define uhrsworkt_sp_lbl 999 `"NIU"', add
label values uhrsworkt_sp uhrsworkt_sp_lbl

label define wkstat_head_lbl 10 `"Full-time schedules"'
label define wkstat_head_lbl 11 `"Full-time hours (35+), usually full-time"', add
label define wkstat_head_lbl 12 `"Part-time for non-economic reasons, usually full-time"', add
label define wkstat_head_lbl 13 `"Not at work, usually full-time"', add
label define wkstat_head_lbl 14 `"Full-time hours, usually part-time for economic reasons"', add
label define wkstat_head_lbl 15 `"Full-time hours, usually part-time for non-economic reasons"', add
label define wkstat_head_lbl 20 `"Part-time for economic reasons"', add
label define wkstat_head_lbl 21 `"Part-time for economic reasons, usually full-time"', add
label define wkstat_head_lbl 22 `"Part-time hours, usually part-time for economic reasons"', add
label define wkstat_head_lbl 40 `"Part-time for non-economic reasons, usually part-time"', add
label define wkstat_head_lbl 41 `"Part-time hours, usually part-time for non-economic reasons"', add
label define wkstat_head_lbl 42 `"Not at work, usually part-time"', add
label define wkstat_head_lbl 50 `"Unemployed, seeking full-time work"', add
label define wkstat_head_lbl 60 `"Unemployed, seeking part-time work"', add
label define wkstat_head_lbl 99 `"NIU, blank, or not in labor force"', add
label values wkstat_head wkstat_head_lbl

label define wkstat_sp_lbl 10 `"Full-time schedules"'
label define wkstat_sp_lbl 11 `"Full-time hours (35+), usually full-time"', add
label define wkstat_sp_lbl 12 `"Part-time for non-economic reasons, usually full-time"', add
label define wkstat_sp_lbl 13 `"Not at work, usually full-time"', add
label define wkstat_sp_lbl 14 `"Full-time hours, usually part-time for economic reasons"', add
label define wkstat_sp_lbl 15 `"Full-time hours, usually part-time for non-economic reasons"', add
label define wkstat_sp_lbl 20 `"Part-time for economic reasons"', add
label define wkstat_sp_lbl 21 `"Part-time for economic reasons, usually full-time"', add
label define wkstat_sp_lbl 22 `"Part-time hours, usually part-time for economic reasons"', add
label define wkstat_sp_lbl 40 `"Part-time for non-economic reasons, usually part-time"', add
label define wkstat_sp_lbl 41 `"Part-time hours, usually part-time for non-economic reasons"', add
label define wkstat_sp_lbl 42 `"Not at work, usually part-time"', add
label define wkstat_sp_lbl 50 `"Unemployed, seeking full-time work"', add
label define wkstat_sp_lbl 60 `"Unemployed, seeking part-time work"', add
label define wkstat_sp_lbl 99 `"NIU, blank, or not in labor force"', add
label values wkstat_sp wkstat_sp_lbl

label define educ_head_lbl 000 `"NIU or no schooling"'
label define educ_head_lbl 001 `"NIU or blank"', add
label define educ_head_lbl 002 `"None or preschool"', add
label define educ_head_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_head_lbl 011 `"Grade 1"', add
label define educ_head_lbl 012 `"Grade 2"', add
label define educ_head_lbl 013 `"Grade 3"', add
label define educ_head_lbl 014 `"Grade 4"', add
label define educ_head_lbl 020 `"Grades 5 or 6"', add
label define educ_head_lbl 021 `"Grade 5"', add
label define educ_head_lbl 022 `"Grade 6"', add
label define educ_head_lbl 030 `"Grades 7 or 8"', add
label define educ_head_lbl 031 `"Grade 7"', add
label define educ_head_lbl 032 `"Grade 8"', add
label define educ_head_lbl 040 `"Grade 9"', add
label define educ_head_lbl 050 `"Grade 10"', add
label define educ_head_lbl 060 `"Grade 11"', add
label define educ_head_lbl 070 `"Grade 12"', add
label define educ_head_lbl 071 `"12th grade, no diploma"', add
label define educ_head_lbl 072 `"12th grade, diploma unclear"', add
label define educ_head_lbl 073 `"High school diploma or equivalent"', add
label define educ_head_lbl 080 `"1 year of college"', add
label define educ_head_lbl 081 `"Some college but no degree"', add
label define educ_head_lbl 090 `"2 years of college"', add
label define educ_head_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_head_lbl 092 `"Associate's degree, academic program"', add
label define educ_head_lbl 100 `"3 years of college"', add
label define educ_head_lbl 110 `"4 years of college"', add
label define educ_head_lbl 111 `"Bachelor's degree"', add
label define educ_head_lbl 120 `"5+ years of college"', add
label define educ_head_lbl 121 `"5 years of college"', add
label define educ_head_lbl 122 `"6+ years of college"', add
label define educ_head_lbl 123 `"Master's degree"', add
label define educ_head_lbl 124 `"Professional school degree"', add
label define educ_head_lbl 125 `"Doctorate degree"', add
label define educ_head_lbl 999 `"Missing/Unknown"', add
label values educ_head educ_head_lbl

label define educ_sp_lbl 000 `"NIU or no schooling"'
label define educ_sp_lbl 001 `"NIU or blank"', add
label define educ_sp_lbl 002 `"None or preschool"', add
label define educ_sp_lbl 010 `"Grades 1, 2, 3, or 4"', add
label define educ_sp_lbl 011 `"Grade 1"', add
label define educ_sp_lbl 012 `"Grade 2"', add
label define educ_sp_lbl 013 `"Grade 3"', add
label define educ_sp_lbl 014 `"Grade 4"', add
label define educ_sp_lbl 020 `"Grades 5 or 6"', add
label define educ_sp_lbl 021 `"Grade 5"', add
label define educ_sp_lbl 022 `"Grade 6"', add
label define educ_sp_lbl 030 `"Grades 7 or 8"', add
label define educ_sp_lbl 031 `"Grade 7"', add
label define educ_sp_lbl 032 `"Grade 8"', add
label define educ_sp_lbl 040 `"Grade 9"', add
label define educ_sp_lbl 050 `"Grade 10"', add
label define educ_sp_lbl 060 `"Grade 11"', add
label define educ_sp_lbl 070 `"Grade 12"', add
label define educ_sp_lbl 071 `"12th grade, no diploma"', add
label define educ_sp_lbl 072 `"12th grade, diploma unclear"', add
label define educ_sp_lbl 073 `"High school diploma or equivalent"', add
label define educ_sp_lbl 080 `"1 year of college"', add
label define educ_sp_lbl 081 `"Some college but no degree"', add
label define educ_sp_lbl 090 `"2 years of college"', add
label define educ_sp_lbl 091 `"Associate's degree, occupational/vocational program"', add
label define educ_sp_lbl 092 `"Associate's degree, academic program"', add
label define educ_sp_lbl 100 `"3 years of college"', add
label define educ_sp_lbl 110 `"4 years of college"', add
label define educ_sp_lbl 111 `"Bachelor's degree"', add
label define educ_sp_lbl 120 `"5+ years of college"', add
label define educ_sp_lbl 121 `"5 years of college"', add
label define educ_sp_lbl 122 `"6+ years of college"', add
label define educ_sp_lbl 123 `"Master's degree"', add
label define educ_sp_lbl 124 `"Professional school degree"', add
label define educ_sp_lbl 125 `"Doctorate degree"', add
label define educ_sp_lbl 999 `"Missing/Unknown"', add
label values educ_sp educ_sp_lbl

label define workly_head_lbl 00 `"NIU"'
label define workly_head_lbl 01 `"No"', add
label define workly_head_lbl 02 `"Yes"', add
label values workly_head workly_head_lbl

label define workly_sp_lbl 00 `"NIU"'
label define workly_sp_lbl 01 `"No"', add
label define workly_sp_lbl 02 `"Yes"', add
label values workly_sp workly_sp_lbl

label define wkswork2_head_lbl 0 `"NIU"'
label define wkswork2_head_lbl 1 `"1-13 weeks"', add
label define wkswork2_head_lbl 2 `"14-26 weeks"', add
label define wkswork2_head_lbl 3 `"27-39 weeks"', add
label define wkswork2_head_lbl 4 `"40-47 weeks"', add
label define wkswork2_head_lbl 5 `"48-49 weeks"', add
label define wkswork2_head_lbl 6 `"50-52 weeks"', add
label define wkswork2_head_lbl 9 `"Missing data"', add
label values wkswork2_head wkswork2_head_lbl

label define wkswork2_sp_lbl 0 `"NIU"'
label define wkswork2_sp_lbl 1 `"1-13 weeks"', add
label define wkswork2_sp_lbl 2 `"14-26 weeks"', add
label define wkswork2_sp_lbl 3 `"27-39 weeks"', add
label define wkswork2_sp_lbl 4 `"40-47 weeks"', add
label define wkswork2_sp_lbl 5 `"48-49 weeks"', add
label define wkswork2_sp_lbl 6 `"50-52 weeks"', add
label define wkswork2_sp_lbl 9 `"Missing data"', add
label values wkswork2_sp wkswork2_sp_lbl

label define fullpart_head_lbl 0 `"NIU"'
label define fullpart_head_lbl 1 `"Full-time"', add
label define fullpart_head_lbl 2 `"Part-time"', add
label define fullpart_head_lbl 9 `"Unknown"', add
label values fullpart_head fullpart_head_lbl

label define fullpart_sp_lbl 0 `"NIU"'
label define fullpart_sp_lbl 1 `"Full-time"', add
label define fullpart_sp_lbl 2 `"Part-time"', add
label define fullpart_sp_lbl 9 `"Unknown"', add
label values fullpart_sp fullpart_sp_lbl





save "/Users/hhadah/Dropbox/Research/My Research Data and Ideas/hispanic-last-names/data/datasets/FullData", replace
