* NOTE: You need to set the Stata working directory to the path
* where the data file is located.
global G_Directory "C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\raw"
cd "$G_Directory"
* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                      ///
  int     year            1-4      ///
  long    sample          5-10     ///
  double  serial          11-18    ///
  double  cbserial        19-31    ///
  double  hhwt            32-41    ///
  double  cluster         42-54    ///
  double  adjust          55-61    ///
  double  cpi99           62-66    ///
  byte    region          67-68    ///
  byte    stateicp        69-70    ///
  byte    statefip        71-72    ///
  int     countyicp       73-76    ///
  int     countyfip       77-79    ///
  byte    urban           80-80    ///
  byte    metro           81-81    ///
  int     city            82-85    ///
  double  strata          86-97    ///
  byte    gq              98-98    ///
  int     pernum          99-102   ///
  double  perwt           103-112  ///
  byte    relate          113-114  ///
  int     related         115-118  ///
  byte    sex             119-119  ///
  int     age             120-122  ///
  byte    marst           123-123  ///
  int     birthyr         124-127  ///
  byte    race            128-128  ///
  int     raced           129-131  ///
  byte    hispan          132-132  ///
  int     hispand         133-135  ///
  int     bpl             136-138  ///
  long    bpld            139-143  ///
  int     mbpl            144-146  ///
  long    mbpld           147-151  ///
  int     fbpl            152-154  ///
  long    fbpld           155-159  ///
  byte    citizen         160-160  ///
  byte    higrade         161-162  ///
  int     higraded        163-165  ///
  byte    educ            166-167  ///
  int     educd           168-170  ///
  byte    gradeatt        171-171  ///
  byte    gradeattd       172-173  ///
  long    inctot          174-180  ///
  long    ftotinc         181-187  ///
  long    incwage         188-193  ///
  byte    sex_head        194-194  ///
  byte    sex_sp          195-195  ///
  int     age_head        196-198  ///
  int     age_sp          199-201  ///
  byte    marst_head      202-202  ///
  byte    marst_sp        203-203  ///
  int     birthyr_head    204-207  ///
  int     birthyr_sp      208-211  ///
  byte    race_head       212-212  ///
  byte    race_sp         213-213  ///
  int     raced_head      214-216  ///
  int     raced_sp        217-219  ///
  byte    hispan_head     220-220  ///
  byte    hispan_sp       221-221  ///
  int     hispand_head    222-224  ///
  int     hispand_sp      225-227  ///
  int     bpl_head        228-230  ///
  int     bpl_sp          231-233  ///
  long    bpld_head       234-238  ///
  long    bpld_sp         239-243  ///
  int     mbpl_head       244-246  ///
  int     mbpl_sp         247-249  ///
  long    mbpld_head      250-254  ///
  long    mbpld_sp        255-259  ///
  int     fbpl_head       260-262  ///
  int     fbpl_sp         263-265  ///
  long    fbpld_head      266-270  ///
  long    fbpld_sp        271-275  ///
  byte    citizen_head    276-276  ///
  byte    citizen_sp      277-277  ///
  byte    higrade_head    278-279  ///
  byte    higrade_sp      280-281  ///
  int     higraded_head   282-284  ///
  int     higraded_sp     285-287  ///
  byte    educ_head       288-289  ///
  byte    educ_sp         290-291  ///
  int     educd_head      292-294  ///
  int     educd_sp        295-297  ///
  byte    gradeatt_head   298-298  ///
  byte    gradeatt_sp     299-299  ///
  byte    gradeattd_head  300-301  ///
  byte    gradeattd_sp    302-303  ///
  long    inctot_head     304-310  ///
  long    inctot_sp       311-317  ///
  long    ftotinc_head    318-324  ///
  long    ftotinc_sp      325-331  ///
  long    incwage_head    332-337  ///
  long    incwage_sp      338-343  ///
  using `"usa_00034.dat"'

replace hhwt           = hhwt           / 100
replace adjust         = adjust         / 1000000
replace cpi99          = cpi99          / 1000
replace perwt          = perwt          / 100

format serial         %8.0f
format cbserial       %13.0f
format hhwt           %10.2f
format cluster        %13.0f
format adjust         %7.6f
format cpi99          %5.3f
format strata         %12.0f
format perwt          %10.2f

label var year           `"Census year"'
label var sample         `"IPUMS sample identifier"'
label var serial         `"Household serial number"'
label var cbserial       `"Original Census Bureau household serial number"'
label var hhwt           `"Household weight"'
label var cluster        `"Household cluster for variance estimation"'
label var adjust         `"Adjustment factor, ACS/PRCS"'
label var cpi99          `"CPI-U adjustment factor to 1999 dollars"'
label var region         `"Census region and division"'
label var stateicp       `"State (ICPSR code)"'
label var statefip       `"State (FIPS code)"'
label var countyicp      `"County (ICPSR code)"'
label var countyfip      `"County (FIPS code)"'
label var urban          `"Urban/rural status"'
label var metro          `"Metropolitan status"'
label var city           `"City"'
label var strata         `"Household strata for variance estimation"'
label var gq             `"Group quarters status"'
label var pernum         `"Person number in sample unit"'
label var perwt          `"Person weight"'
label var relate         `"Relationship to household head [general version]"'
label var related        `"Relationship to household head [detailed version]"'
label var sex            `"Sex"'
label var age            `"Age"'
label var marst          `"Marital status"'
label var birthyr        `"Year of birth"'
label var race           `"Race [general version]"'
label var raced          `"Race [detailed version]"'
label var hispan         `"Hispanic origin [general version]"'
label var hispand        `"Hispanic origin [detailed version]"'
label var bpl            `"Birthplace [general version]"'
label var bpld           `"Birthplace [detailed version]"'
label var mbpl           `"Mother's birthplace [general version]"'
label var mbpld          `"Mother's birthplace [detailed version]"'
label var fbpl           `"Father's birthplace [general version]"'
label var fbpld          `"Father's birthplace [detailed version]"'
label var citizen        `"Citizenship status"'
label var higrade        `"Highest grade of schooling [general version]"'
label var higraded       `"Highest grade of schooling [detailed version]"'
label var educ           `"Educational attainment [general version]"'
label var educd          `"Educational attainment [detailed version]"'
label var gradeatt       `"Grade level attending [general version]"'
label var gradeattd      `"Grade level attending [detailed version]"'
label var inctot         `"Total personal income"'
label var ftotinc        `"Total family income"'
label var incwage        `"Wage and salary income"'
label var sex_head       `"Sex [of Location of household head]"'
label var sex_sp         `"Sex [of Spouse's location in household]"'
label var age_head       `"Age [of Location of household head]"'
label var age_sp         `"Age [of Spouse's location in household]"'
label var marst_head     `"Marital status [of Location of household head]"'
label var marst_sp       `"Marital status [of Spouse's location in household]"'
label var birthyr_head   `"Year of birth [of Location of household head]"'
label var birthyr_sp     `"Year of birth [of Spouse's location in household]"'
label var race_head      `"Race [of Location of household head; general version]"'
label var race_sp        `"Race [of Spouse's location in household; general version]"'
label var raced_head     `"Race [of Location of household head; detailed version]"'
label var raced_sp       `"Race [of Spouse's location in household; detailed version]"'
label var hispan_head    `"Hispanic origin [of Location of household head; general version]"'
label var hispan_sp      `"Hispanic origin [of Spouse's location in household; general version]"'
label var hispand_head   `"Hispanic origin [of Location of household head; detailed version]"'
label var hispand_sp     `"Hispanic origin [of Spouse's location in household; detailed version]"'
label var bpl_head       `"Birthplace [of Location of household head; general version]"'
label var bpl_sp         `"Birthplace [of Spouse's location in household; general version]"'
label var bpld_head      `"Birthplace [of Location of household head; detailed version]"'
label var bpld_sp        `"Birthplace [of Spouse's location in household; detailed version]"'
label var mbpl_head      `"Mother's birthplace [of Location of household head; general version]"'
label var mbpl_sp        `"Mother's birthplace [of Spouse's location in household; general version]"'
label var mbpld_head     `"Mother's birthplace [of Location of household head; detailed version]"'
label var mbpld_sp       `"Mother's birthplace [of Spouse's location in household; detailed version]"'
label var fbpl_head      `"Father's birthplace [of Location of household head; general version]"'
label var fbpl_sp        `"Father's birthplace [of Spouse's location in household; general version]"'
label var fbpld_head     `"Father's birthplace [of Location of household head; detailed version]"'
label var fbpld_sp       `"Father's birthplace [of Spouse's location in household; detailed version]"'
label var citizen_head   `"Citizenship status [of Location of household head]"'
label var citizen_sp     `"Citizenship status [of Spouse's location in household]"'
label var higrade_head   `"Highest grade of schooling [of Location of household head; general version]"'
label var higrade_sp     `"Highest grade of schooling [of Spouse's location in household; general version]"'
label var higraded_head  `"Highest grade of schooling [of Location of household head; detailed version]"'
label var higraded_sp    `"Highest grade of schooling [of Spouse's location in household; detailed version]"'
label var educ_head      `"Educational attainment [of Location of household head; general version]"'
label var educ_sp        `"Educational attainment [of Spouse's location in household; general version]"'
label var educd_head     `"Educational attainment [of Location of household head; detailed version]"'
label var educd_sp       `"Educational attainment [of Spouse's location in household; detailed version]"'
label var gradeatt_head  `"Grade level attending [of Location of household head; general version]"'
label var gradeatt_sp    `"Grade level attending [of Spouse's location in household; general version]"'
label var gradeattd_head `"Grade level attending [of Location of household head; detailed version]"'
label var gradeattd_sp   `"Grade level attending [of Spouse's location in household; detailed version]"'
label var inctot_head    `"Total personal income [of Location of household head]"'
label var inctot_sp      `"Total personal income [of Spouse's location in household]"'
label var ftotinc_head   `"Total family income [of Location of household head]"'
label var ftotinc_sp     `"Total family income [of Spouse's location in household]"'
label var incwage_head   `"Wage and salary income [of Location of household head]"'
label var incwage_sp     `"Wage and salary income [of Spouse's location in household]"'

label define year_lbl 1850 `"1850"'
label define year_lbl 1860 `"1860"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1920 `"1920"', add
label define year_lbl 1930 `"1930"', add
label define year_lbl 1940 `"1940"', add
label define year_lbl 1950 `"1950"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label define year_lbl 2019 `"2019"', add
label values year year_lbl

label define sample_lbl 201904 `"2015-2019, PRCS 5-year"'
label define sample_lbl 201903 `"2015-2019, ACS 5-year"', add
label define sample_lbl 201902 `"2019 PRCS"', add
label define sample_lbl 201901 `"2019 ACS"', add
label define sample_lbl 201804 `"2014-2018, PRCS 5-year"', add
label define sample_lbl 201803 `"2014-2018, ACS 5-year"', add
label define sample_lbl 201802 `"2018 PRCS"', add
label define sample_lbl 201801 `"2018 ACS"', add
label define sample_lbl 201704 `"2013-2017, PRCS 5-year"', add
label define sample_lbl 201703 `"2013-2017, ACS 5-year"', add
label define sample_lbl 201702 `"2017 PRCS"', add
label define sample_lbl 201701 `"2017 ACS"', add
label define sample_lbl 201604 `"2012-2016, PRCS 5-year"', add
label define sample_lbl 201603 `"2012-2016, ACS 5-year"', add
label define sample_lbl 201602 `"2016 PRCS"', add
label define sample_lbl 201601 `"2016 ACS"', add
label define sample_lbl 201504 `"2011-2015, PRCS 5-year"', add
label define sample_lbl 201503 `"2011-2015, ACS 5-year"', add
label define sample_lbl 201502 `"2015 PRCS"', add
label define sample_lbl 201501 `"2015 ACS"', add
label define sample_lbl 201404 `"2010-2014, PRCS 5-year"', add
label define sample_lbl 201403 `"2010-2014, ACS 5-year"', add
label define sample_lbl 201402 `"2014 PRCS"', add
label define sample_lbl 201401 `"2014 ACS"', add
label define sample_lbl 201306 `"2009-2013, PRCS 5-year"', add
label define sample_lbl 201305 `"2009-2013, ACS 5-year"', add
label define sample_lbl 201304 `"2011-2013, PRCS 3-year"', add
label define sample_lbl 201303 `"2011-2013, ACS 3-year"', add
label define sample_lbl 201302 `"2013 PRCS"', add
label define sample_lbl 201301 `"2013 ACS"', add
label define sample_lbl 201206 `"2008-2012, PRCS 5-year"', add
label define sample_lbl 201205 `"2008-2012, ACS 5-year"', add
label define sample_lbl 201204 `"2010-2012, PRCS 3-year"', add
label define sample_lbl 201203 `"2010-2012, ACS 3-year"', add
label define sample_lbl 201202 `"2012 PRCS"', add
label define sample_lbl 201201 `"2012 ACS"', add
label define sample_lbl 201106 `"2007-2011, PRCS 5-year"', add
label define sample_lbl 201105 `"2007-2011, ACS 5-year"', add
label define sample_lbl 201104 `"2009-2011, PRCS 3-year"', add
label define sample_lbl 201103 `"2009-2011, ACS 3-year"', add
label define sample_lbl 201102 `"2011 PRCS"', add
label define sample_lbl 201101 `"2011 ACS"', add
label define sample_lbl 201008 `"2010 Puerto Rico 10%"', add
label define sample_lbl 201007 `"2010 10%"', add
label define sample_lbl 201006 `"2006-2010, PRCS 5-year"', add
label define sample_lbl 201005 `"2006-2010, ACS 5-year"', add
label define sample_lbl 201004 `"2008-2010, PRCS 3-year"', add
label define sample_lbl 201003 `"2008-2010, ACS 3-year"', add
label define sample_lbl 201002 `"2010 PRCS"', add
label define sample_lbl 201001 `"2010 ACS"', add
label define sample_lbl 200906 `"2005-2009, PRCS 5-year"', add
label define sample_lbl 200905 `"2005-2009, ACS 5-year"', add
label define sample_lbl 200904 `"2007-2009, PRCS 3-year"', add
label define sample_lbl 200903 `"2007-2009, ACS 3-year"', add
label define sample_lbl 200902 `"2009 PRCS"', add
label define sample_lbl 200901 `"2009 ACS"', add
label define sample_lbl 200804 `"2006-2008, PRCS 3-year"', add
label define sample_lbl 200803 `"2006-2008, ACS 3-year"', add
label define sample_lbl 200802 `"2008 PRCS"', add
label define sample_lbl 200801 `"2008 ACS"', add
label define sample_lbl 200704 `"2005-2007, PRCS 3-year"', add
label define sample_lbl 200703 `"2005-2007, ACS 3-year"', add
label define sample_lbl 200702 `"2007 PRCS"', add
label define sample_lbl 200701 `"2007 ACS"', add
label define sample_lbl 200602 `"2006 PRCS"', add
label define sample_lbl 200601 `"2006 ACS"', add
label define sample_lbl 200502 `"2005 PRCS"', add
label define sample_lbl 200501 `"2005 ACS"', add
label define sample_lbl 200401 `"2004 ACS"', add
label define sample_lbl 200301 `"2003 ACS"', add
label define sample_lbl 200201 `"2002 ACS"', add
label define sample_lbl 200101 `"2001 ACS"', add
label define sample_lbl 200008 `"2000 Puerto Rico 1%"', add
label define sample_lbl 200007 `"2000 1%"', add
label define sample_lbl 200006 `"2000 Puerto Rico 1% sample (old version)"', add
label define sample_lbl 200005 `"2000 Puerto Rico 5%"', add
label define sample_lbl 200004 `"2000 ACS"', add
label define sample_lbl 200003 `"2000 Unweighted 1%"', add
label define sample_lbl 200002 `"2000 1% sample (old version)"', add
label define sample_lbl 200001 `"2000 5%"', add
label define sample_lbl 199007 `"1990 Puerto Rico 1%"', add
label define sample_lbl 199006 `"1990 Puerto Rico 5%"', add
label define sample_lbl 199005 `"1990 Labor Market Area"', add
label define sample_lbl 199004 `"1990 Elderly"', add
label define sample_lbl 199003 `"1990 Unweighted 1%"', add
label define sample_lbl 199002 `"1990 1%"', add
label define sample_lbl 199001 `"1990 5%"', add
label define sample_lbl 198007 `"1980 Puerto Rico 1%"', add
label define sample_lbl 198006 `"1980 Puerto Rico 5%"', add
label define sample_lbl 198005 `"1980 Detailed metro/non-metro"', add
label define sample_lbl 198004 `"1980 Labor Market Area"', add
label define sample_lbl 198003 `"1980 Urban/Rural"', add
label define sample_lbl 198002 `"1980 1%"', add
label define sample_lbl 198001 `"1980 5%"', add
label define sample_lbl 197009 `"1970 Puerto Rico Neighborhood"', add
label define sample_lbl 197008 `"1970 Puerto Rico Municipio"', add
label define sample_lbl 197007 `"1970 Puerto Rico State"', add
label define sample_lbl 197006 `"1970 Form 2 Neighborhood"', add
label define sample_lbl 197005 `"1970 Form 1 Neighborhood"', add
label define sample_lbl 197004 `"1970 Form 2 Metro"', add
label define sample_lbl 197003 `"1970 Form 1 Metro"', add
label define sample_lbl 197002 `"1970 Form 2 State"', add
label define sample_lbl 197001 `"1970 Form 1 State"', add
label define sample_lbl 196002 `"1960 5%"', add
label define sample_lbl 196001 `"1960 1%"', add
label define sample_lbl 195001 `"1950 1%"', add
label define sample_lbl 194002 `"1940 100% database"', add
label define sample_lbl 194001 `"1940 1%"', add
label define sample_lbl 193004 `"1930 100% database"', add
label define sample_lbl 193003 `"1930 Puerto Rico"', add
label define sample_lbl 193002 `"1930 5%"', add
label define sample_lbl 193001 `"1930 1%"', add
label define sample_lbl 192003 `"1920 100% database"', add
label define sample_lbl 192002 `"1920 Puerto Rico sample"', add
label define sample_lbl 192001 `"1920 1%"', add
label define sample_lbl 191004 `"1910 100% database"', add
label define sample_lbl 191003 `"1910 1.4% sample with oversamples"', add
label define sample_lbl 191002 `"1910 1%"', add
label define sample_lbl 191001 `"1910 Puerto Rico"', add
label define sample_lbl 190004 `"1900 100% database"', add
label define sample_lbl 190003 `"1900 1% sample with oversamples"', add
label define sample_lbl 190002 `"1900 1%"', add
label define sample_lbl 190001 `"1900 5%"', add
label define sample_lbl 188003 `"1880 100% database"', add
label define sample_lbl 188002 `"1880 10%"', add
label define sample_lbl 188001 `"1880 1%"', add
label define sample_lbl 187003 `"1870 100% database"', add
label define sample_lbl 187002 `"1870 1% sample with black oversample"', add
label define sample_lbl 187001 `"1870 1%"', add
label define sample_lbl 186003 `"1860 100% database"', add
label define sample_lbl 186002 `"1860 1% sample with black oversample"', add
label define sample_lbl 186001 `"1860 1%"', add
label define sample_lbl 185002 `"1850 100% database"', add
label define sample_lbl 185001 `"1850 1%"', add
label values sample sample_lbl

label define region_lbl 11 `"New England Division"'
label define region_lbl 12 `"Middle Atlantic Division"', add
label define region_lbl 13 `"Mixed Northeast Divisions (1970 Metro)"', add
label define region_lbl 21 `"East North Central Div."', add
label define region_lbl 22 `"West North Central Div."', add
label define region_lbl 23 `"Mixed Midwest Divisions (1970 Metro)"', add
label define region_lbl 31 `"South Atlantic Division"', add
label define region_lbl 32 `"East South Central Div."', add
label define region_lbl 33 `"West South Central Div."', add
label define region_lbl 34 `"Mixed Southern Divisions (1970 Metro)"', add
label define region_lbl 41 `"Mountain Division"', add
label define region_lbl 42 `"Pacific Division"', add
label define region_lbl 43 `"Mixed Western Divisions (1970 Metro)"', add
label define region_lbl 91 `"Military/Military reservations"', add
label define region_lbl 92 `"PUMA boundaries cross state lines-1% sample"', add
label define region_lbl 97 `"State not identified"', add
label define region_lbl 99 `"Not identified"', add
label values region region_lbl

label define stateicp_lbl 01 `"Connecticut"'
label define stateicp_lbl 02 `"Maine"', add
label define stateicp_lbl 03 `"Massachusetts"', add
label define stateicp_lbl 04 `"New Hampshire"', add
label define stateicp_lbl 05 `"Rhode Island"', add
label define stateicp_lbl 06 `"Vermont"', add
label define stateicp_lbl 11 `"Delaware"', add
label define stateicp_lbl 12 `"New Jersey"', add
label define stateicp_lbl 13 `"New York"', add
label define stateicp_lbl 14 `"Pennsylvania"', add
label define stateicp_lbl 21 `"Illinois"', add
label define stateicp_lbl 22 `"Indiana"', add
label define stateicp_lbl 23 `"Michigan"', add
label define stateicp_lbl 24 `"Ohio"', add
label define stateicp_lbl 25 `"Wisconsin"', add
label define stateicp_lbl 31 `"Iowa"', add
label define stateicp_lbl 32 `"Kansas"', add
label define stateicp_lbl 33 `"Minnesota"', add
label define stateicp_lbl 34 `"Missouri"', add
label define stateicp_lbl 35 `"Nebraska"', add
label define stateicp_lbl 36 `"North Dakota"', add
label define stateicp_lbl 37 `"South Dakota"', add
label define stateicp_lbl 40 `"Virginia"', add
label define stateicp_lbl 41 `"Alabama"', add
label define stateicp_lbl 42 `"Arkansas"', add
label define stateicp_lbl 43 `"Florida"', add
label define stateicp_lbl 44 `"Georgia"', add
label define stateicp_lbl 45 `"Louisiana"', add
label define stateicp_lbl 46 `"Mississippi"', add
label define stateicp_lbl 47 `"North Carolina"', add
label define stateicp_lbl 48 `"South Carolina"', add
label define stateicp_lbl 49 `"Texas"', add
label define stateicp_lbl 51 `"Kentucky"', add
label define stateicp_lbl 52 `"Maryland"', add
label define stateicp_lbl 53 `"Oklahoma"', add
label define stateicp_lbl 54 `"Tennessee"', add
label define stateicp_lbl 56 `"West Virginia"', add
label define stateicp_lbl 61 `"Arizona"', add
label define stateicp_lbl 62 `"Colorado"', add
label define stateicp_lbl 63 `"Idaho"', add
label define stateicp_lbl 64 `"Montana"', add
label define stateicp_lbl 65 `"Nevada"', add
label define stateicp_lbl 66 `"New Mexico"', add
label define stateicp_lbl 67 `"Utah"', add
label define stateicp_lbl 68 `"Wyoming"', add
label define stateicp_lbl 71 `"California"', add
label define stateicp_lbl 72 `"Oregon"', add
label define stateicp_lbl 73 `"Washington"', add
label define stateicp_lbl 81 `"Alaska"', add
label define stateicp_lbl 82 `"Hawaii"', add
label define stateicp_lbl 83 `"Puerto Rico"', add
label define stateicp_lbl 96 `"State groupings (1980 Urban/rural sample)"', add
label define stateicp_lbl 97 `"Military/Mil. Reservations"', add
label define stateicp_lbl 98 `"District of Columbia"', add
label define stateicp_lbl 99 `"State not identified"', add
label values stateicp stateicp_lbl

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
label define statefip_lbl 62 `"Massachusetts-Rhode Island"', add
label define statefip_lbl 63 `"Minnesota-Iowa-Missouri-Kansas-Nebraska-S.Dakota-N.Dakota"', add
label define statefip_lbl 64 `"Maryland-Delaware"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 66 `"Utah-Nevada"', add
label define statefip_lbl 67 `"Arizona-New Mexico"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 72 `"Puerto Rico"', add
label define statefip_lbl 97 `"Military/Mil. Reservation"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define countyicp_lbl 0010 `"0010"'
label define countyicp_lbl 0030 `"0030"', add
label define countyicp_lbl 0050 `"0050"', add
label define countyicp_lbl 0070 `"0070"', add
label define countyicp_lbl 0090 `"0090"', add
label define countyicp_lbl 0110 `"0110"', add
label define countyicp_lbl 0130 `"0130"', add
label define countyicp_lbl 0150 `"0150"', add
label define countyicp_lbl 0170 `"0170"', add
label define countyicp_lbl 0190 `"0190"', add
label define countyicp_lbl 0200 `"0200"', add
label define countyicp_lbl 0205 `"0205"', add
label define countyicp_lbl 0210 `"0210"', add
label define countyicp_lbl 0230 `"0230"', add
label define countyicp_lbl 0250 `"0250"', add
label define countyicp_lbl 0270 `"0270"', add
label define countyicp_lbl 0290 `"0290"', add
label define countyicp_lbl 0310 `"0310"', add
label define countyicp_lbl 0330 `"0330"', add
label define countyicp_lbl 0350 `"0350"', add
label define countyicp_lbl 0360 `"0360"', add
label define countyicp_lbl 0370 `"0370"', add
label define countyicp_lbl 0390 `"0390"', add
label define countyicp_lbl 0410 `"0410"', add
label define countyicp_lbl 0430 `"0430"', add
label define countyicp_lbl 0450 `"0450"', add
label define countyicp_lbl 0455 `"0455"', add
label define countyicp_lbl 0470 `"0470"', add
label define countyicp_lbl 0490 `"0490"', add
label define countyicp_lbl 0510 `"0510"', add
label define countyicp_lbl 0530 `"0530"', add
label define countyicp_lbl 0550 `"0550"', add
label define countyicp_lbl 0570 `"0570"', add
label define countyicp_lbl 0590 `"0590"', add
label define countyicp_lbl 0605 `"0605"', add
label define countyicp_lbl 0610 `"0610"', add
label define countyicp_lbl 0630 `"0630"', add
label define countyicp_lbl 0650 `"0650"', add
label define countyicp_lbl 0670 `"0670"', add
label define countyicp_lbl 0690 `"0690"', add
label define countyicp_lbl 0710 `"0710"', add
label define countyicp_lbl 0730 `"0730"', add
label define countyicp_lbl 0750 `"0750"', add
label define countyicp_lbl 0770 `"0770"', add
label define countyicp_lbl 0790 `"0790"', add
label define countyicp_lbl 0810 `"0810"', add
label define countyicp_lbl 0830 `"0830"', add
label define countyicp_lbl 0850 `"0850"', add
label define countyicp_lbl 0870 `"0870"', add
label define countyicp_lbl 0890 `"0890"', add
label define countyicp_lbl 0910 `"0910"', add
label define countyicp_lbl 0930 `"0930"', add
label define countyicp_lbl 0950 `"0950"', add
label define countyicp_lbl 0970 `"0970"', add
label define countyicp_lbl 0990 `"0990"', add
label define countyicp_lbl 1010 `"1010"', add
label define countyicp_lbl 1030 `"1030"', add
label define countyicp_lbl 1050 `"1050"', add
label define countyicp_lbl 1070 `"1070"', add
label define countyicp_lbl 1090 `"1090"', add
label define countyicp_lbl 1110 `"1110"', add
label define countyicp_lbl 1130 `"1130"', add
label define countyicp_lbl 1150 `"1150"', add
label define countyicp_lbl 1170 `"1170"', add
label define countyicp_lbl 1190 `"1190"', add
label define countyicp_lbl 1210 `"1210"', add
label define countyicp_lbl 1230 `"1230"', add
label define countyicp_lbl 1250 `"1250"', add
label define countyicp_lbl 1270 `"1270"', add
label define countyicp_lbl 1290 `"1290"', add
label define countyicp_lbl 1310 `"1310"', add
label define countyicp_lbl 1330 `"1330"', add
label define countyicp_lbl 1350 `"1350"', add
label define countyicp_lbl 1370 `"1370"', add
label define countyicp_lbl 1390 `"1390"', add
label define countyicp_lbl 1410 `"1410"', add
label define countyicp_lbl 1430 `"1430"', add
label define countyicp_lbl 1450 `"1450"', add
label define countyicp_lbl 1470 `"1470"', add
label define countyicp_lbl 1490 `"1490"', add
label define countyicp_lbl 1510 `"1510"', add
label define countyicp_lbl 1530 `"1530"', add
label define countyicp_lbl 1550 `"1550"', add
label define countyicp_lbl 1570 `"1570"', add
label define countyicp_lbl 1590 `"1590"', add
label define countyicp_lbl 1610 `"1610"', add
label define countyicp_lbl 1630 `"1630"', add
label define countyicp_lbl 1650 `"1650"', add
label define countyicp_lbl 1670 `"1670"', add
label define countyicp_lbl 1690 `"1690"', add
label define countyicp_lbl 1710 `"1710"', add
label define countyicp_lbl 1730 `"1730"', add
label define countyicp_lbl 1750 `"1750"', add
label define countyicp_lbl 1770 `"1770"', add
label define countyicp_lbl 1790 `"1790"', add
label define countyicp_lbl 1810 `"1810"', add
label define countyicp_lbl 1830 `"1830"', add
label define countyicp_lbl 1850 `"1850"', add
label define countyicp_lbl 1870 `"1870"', add
label define countyicp_lbl 1875 `"1875"', add
label define countyicp_lbl 1890 `"1890"', add
label define countyicp_lbl 1910 `"1910"', add
label define countyicp_lbl 1930 `"1930"', add
label define countyicp_lbl 1950 `"1950"', add
label define countyicp_lbl 1970 `"1970"', add
label define countyicp_lbl 1990 `"1990"', add
label define countyicp_lbl 2010 `"2010"', add
label define countyicp_lbl 2030 `"2030"', add
label define countyicp_lbl 2050 `"2050"', add
label define countyicp_lbl 2070 `"2070"', add
label define countyicp_lbl 2090 `"2090"', add
label define countyicp_lbl 2110 `"2110"', add
label define countyicp_lbl 2130 `"2130"', add
label define countyicp_lbl 2150 `"2150"', add
label define countyicp_lbl 2170 `"2170"', add
label define countyicp_lbl 2190 `"2190"', add
label define countyicp_lbl 2210 `"2210"', add
label define countyicp_lbl 2230 `"2230"', add
label define countyicp_lbl 2250 `"2250"', add
label define countyicp_lbl 2270 `"2270"', add
label define countyicp_lbl 2290 `"2290"', add
label define countyicp_lbl 2310 `"2310"', add
label define countyicp_lbl 2330 `"2330"', add
label define countyicp_lbl 2350 `"2350"', add
label define countyicp_lbl 2370 `"2370"', add
label define countyicp_lbl 2390 `"2390"', add
label define countyicp_lbl 2410 `"2410"', add
label define countyicp_lbl 2430 `"2430"', add
label define countyicp_lbl 2450 `"2450"', add
label define countyicp_lbl 2470 `"2470"', add
label define countyicp_lbl 2490 `"2490"', add
label define countyicp_lbl 2510 `"2510"', add
label define countyicp_lbl 2530 `"2530"', add
label define countyicp_lbl 2550 `"2550"', add
label define countyicp_lbl 2570 `"2570"', add
label define countyicp_lbl 2590 `"2590"', add
label define countyicp_lbl 2610 `"2610"', add
label define countyicp_lbl 2630 `"2630"', add
label define countyicp_lbl 2650 `"2650"', add
label define countyicp_lbl 2670 `"2670"', add
label define countyicp_lbl 2690 `"2690"', add
label define countyicp_lbl 2710 `"2710"', add
label define countyicp_lbl 2730 `"2730"', add
label define countyicp_lbl 2750 `"2750"', add
label define countyicp_lbl 2770 `"2770"', add
label define countyicp_lbl 2790 `"2790"', add
label define countyicp_lbl 2810 `"2810"', add
label define countyicp_lbl 2830 `"2830"', add
label define countyicp_lbl 2850 `"2850"', add
label define countyicp_lbl 2870 `"2870"', add
label define countyicp_lbl 2890 `"2890"', add
label define countyicp_lbl 2910 `"2910"', add
label define countyicp_lbl 2930 `"2930"', add
label define countyicp_lbl 2950 `"2950"', add
label define countyicp_lbl 2970 `"2970"', add
label define countyicp_lbl 2990 `"2990"', add
label define countyicp_lbl 3010 `"3010"', add
label define countyicp_lbl 3030 `"3030"', add
label define countyicp_lbl 3050 `"3050"', add
label define countyicp_lbl 3070 `"3070"', add
label define countyicp_lbl 3090 `"3090"', add
label define countyicp_lbl 3110 `"3110"', add
label define countyicp_lbl 3130 `"3130"', add
label define countyicp_lbl 3150 `"3150"', add
label define countyicp_lbl 3170 `"3170"', add
label define countyicp_lbl 3190 `"3190"', add
label define countyicp_lbl 3210 `"3210"', add
label define countyicp_lbl 3230 `"3230"', add
label define countyicp_lbl 3250 `"3250"', add
label define countyicp_lbl 3270 `"3270"', add
label define countyicp_lbl 3290 `"3290"', add
label define countyicp_lbl 3310 `"3310"', add
label define countyicp_lbl 3330 `"3330"', add
label define countyicp_lbl 3350 `"3350"', add
label define countyicp_lbl 3370 `"3370"', add
label define countyicp_lbl 3390 `"3390"', add
label define countyicp_lbl 3410 `"3410"', add
label define countyicp_lbl 3430 `"3430"', add
label define countyicp_lbl 3450 `"3450"', add
label define countyicp_lbl 3470 `"3470"', add
label define countyicp_lbl 3490 `"3490"', add
label define countyicp_lbl 3510 `"3510"', add
label define countyicp_lbl 3530 `"3530"', add
label define countyicp_lbl 3550 `"3550"', add
label define countyicp_lbl 3570 `"3570"', add
label define countyicp_lbl 3590 `"3590"', add
label define countyicp_lbl 3610 `"3610"', add
label define countyicp_lbl 3630 `"3630"', add
label define countyicp_lbl 3650 `"3650"', add
label define countyicp_lbl 3670 `"3670"', add
label define countyicp_lbl 3690 `"3690"', add
label define countyicp_lbl 3710 `"3710"', add
label define countyicp_lbl 3730 `"3730"', add
label define countyicp_lbl 3750 `"3750"', add
label define countyicp_lbl 3770 `"3770"', add
label define countyicp_lbl 3790 `"3790"', add
label define countyicp_lbl 3810 `"3810"', add
label define countyicp_lbl 3830 `"3830"', add
label define countyicp_lbl 3850 `"3850"', add
label define countyicp_lbl 3870 `"3870"', add
label define countyicp_lbl 3890 `"3890"', add
label define countyicp_lbl 3910 `"3910"', add
label define countyicp_lbl 3930 `"3930"', add
label define countyicp_lbl 3950 `"3950"', add
label define countyicp_lbl 3970 `"3970"', add
label define countyicp_lbl 3990 `"3990"', add
label define countyicp_lbl 4010 `"4010"', add
label define countyicp_lbl 4030 `"4030"', add
label define countyicp_lbl 4050 `"4050"', add
label define countyicp_lbl 4070 `"4070"', add
label define countyicp_lbl 4090 `"4090"', add
label define countyicp_lbl 4110 `"4110"', add
label define countyicp_lbl 4130 `"4130"', add
label define countyicp_lbl 4150 `"4150"', add
label define countyicp_lbl 4170 `"4170"', add
label define countyicp_lbl 4190 `"4190"', add
label define countyicp_lbl 4210 `"4210"', add
label define countyicp_lbl 4230 `"4230"', add
label define countyicp_lbl 4250 `"4250"', add
label define countyicp_lbl 4270 `"4270"', add
label define countyicp_lbl 4290 `"4290"', add
label define countyicp_lbl 4310 `"4310"', add
label define countyicp_lbl 4330 `"4330"', add
label define countyicp_lbl 4350 `"4350"', add
label define countyicp_lbl 4370 `"4370"', add
label define countyicp_lbl 4390 `"4390"', add
label define countyicp_lbl 4410 `"4410"', add
label define countyicp_lbl 4430 `"4430"', add
label define countyicp_lbl 4450 `"4450"', add
label define countyicp_lbl 4470 `"4470"', add
label define countyicp_lbl 4490 `"4490"', add
label define countyicp_lbl 4510 `"4510"', add
label define countyicp_lbl 4530 `"4530"', add
label define countyicp_lbl 4550 `"4550"', add
label define countyicp_lbl 4570 `"4570"', add
label define countyicp_lbl 4590 `"4590"', add
label define countyicp_lbl 4610 `"4610"', add
label define countyicp_lbl 4630 `"4630"', add
label define countyicp_lbl 4650 `"4650"', add
label define countyicp_lbl 4670 `"4670"', add
label define countyicp_lbl 4690 `"4690"', add
label define countyicp_lbl 4710 `"4710"', add
label define countyicp_lbl 4730 `"4730"', add
label define countyicp_lbl 4750 `"4750"', add
label define countyicp_lbl 4770 `"4770"', add
label define countyicp_lbl 4790 `"4790"', add
label define countyicp_lbl 4810 `"4810"', add
label define countyicp_lbl 4830 `"4830"', add
label define countyicp_lbl 4850 `"4850"', add
label define countyicp_lbl 4870 `"4870"', add
label define countyicp_lbl 4890 `"4890"', add
label define countyicp_lbl 4910 `"4910"', add
label define countyicp_lbl 4930 `"4930"', add
label define countyicp_lbl 4950 `"4950"', add
label define countyicp_lbl 4970 `"4970"', add
label define countyicp_lbl 4990 `"4990"', add
label define countyicp_lbl 5010 `"5010"', add
label define countyicp_lbl 5030 `"5030"', add
label define countyicp_lbl 5050 `"5050"', add
label define countyicp_lbl 5070 `"5070"', add
label define countyicp_lbl 5100 `"5100"', add
label define countyicp_lbl 5200 `"5200"', add
label define countyicp_lbl 5300 `"5300"', add
label define countyicp_lbl 5400 `"5400"', add
label define countyicp_lbl 5500 `"5500"', add
label define countyicp_lbl 5600 `"5600"', add
label define countyicp_lbl 5700 `"5700"', add
label define countyicp_lbl 5800 `"5800"', add
label define countyicp_lbl 5900 `"5900"', add
label define countyicp_lbl 6100 `"6100"', add
label define countyicp_lbl 6300 `"6300"', add
label define countyicp_lbl 6400 `"6400"', add
label define countyicp_lbl 6500 `"6500"', add
label define countyicp_lbl 6600 `"6600"', add
label define countyicp_lbl 6700 `"6700"', add
label define countyicp_lbl 6800 `"6800"', add
label define countyicp_lbl 6900 `"6900"', add
label define countyicp_lbl 7000 `"7000"', add
label define countyicp_lbl 7100 `"7100"', add
label define countyicp_lbl 7200 `"7200"', add
label define countyicp_lbl 7300 `"7300"', add
label define countyicp_lbl 7400 `"7400"', add
label define countyicp_lbl 7500 `"7500"', add
label define countyicp_lbl 7600 `"7600"', add
label define countyicp_lbl 7700 `"7700"', add
label define countyicp_lbl 7800 `"7800"', add
label define countyicp_lbl 7850 `"7850"', add
label define countyicp_lbl 7900 `"7900"', add
label define countyicp_lbl 8000 `"8000"', add
label define countyicp_lbl 8100 `"8100"', add
label define countyicp_lbl 8200 `"8200"', add
label define countyicp_lbl 8300 `"8300"', add
label define countyicp_lbl 8400 `"8400"', add
label values countyicp countyicp_lbl

label define urban_lbl 0 `"N/A"'
label define urban_lbl 1 `"Rural"', add
label define urban_lbl 2 `"Urban"', add
label values urban urban_lbl

label define metro_lbl 0 `"Metropolitan status indeterminable (mixed)"'
label define metro_lbl 1 `"Not in metropolitan area"', add
label define metro_lbl 2 `"In metropolitan area: In central/principal city"', add
label define metro_lbl 3 `"In metropolitan area: Not in central/principal city"', add
label define metro_lbl 4 `"In metropolitan area: Central/principal city status indeterminable (mixed)"', add
label values metro metro_lbl

label define city_lbl 0000 `"Not in identifiable city (or size group)"'
label define city_lbl 0001 `"Aberdeen, SD"', add
label define city_lbl 0002 `"Aberdeen, WA"', add
label define city_lbl 0003 `"Abilene, TX"', add
label define city_lbl 0004 `"Ada, OK"', add
label define city_lbl 0005 `"Adams, MA"', add
label define city_lbl 0006 `"Adrian, MI"', add
label define city_lbl 0007 `"Abington, PA"', add
label define city_lbl 0010 `"Akron, OH"', add
label define city_lbl 0030 `"Alameda, CA"', add
label define city_lbl 0050 `"Albany, NY"', add
label define city_lbl 0051 `"Albany, GA"', add
label define city_lbl 0052 `"Albert Lea, MN"', add
label define city_lbl 0070 `"Albuquerque, NM"', add
label define city_lbl 0090 `"Alexandria, VA"', add
label define city_lbl 0091 `"Alexandria, LA"', add
label define city_lbl 0100 `"Alhambra, CA"', add
label define city_lbl 0110 `"Allegheny, PA"', add
label define city_lbl 0120 `"Aliquippa, PA"', add
label define city_lbl 0130 `"Allentown, PA"', add
label define city_lbl 0131 `"Alliance, OH"', add
label define city_lbl 0132 `"Alpena, MI"', add
label define city_lbl 0140 `"Alton, IL"', add
label define city_lbl 0150 `"Altoona, PA"', add
label define city_lbl 0160 `"Amarillo, TX"', add
label define city_lbl 0161 `"Ambridge, PA"', add
label define city_lbl 0162 `"Ames, IA"', add
label define city_lbl 0163 `"Amesbury, MA"', add
label define city_lbl 0170 `"Amsterdam, NY"', add
label define city_lbl 0171 `"Anaconda, MT"', add
label define city_lbl 0190 `"Anaheim, CA"', add
label define city_lbl 0210 `"Anchorage, AK"', add
label define city_lbl 0230 `"Anderson, IN"', add
label define city_lbl 0231 `"Anderson, SC"', add
label define city_lbl 0250 `"Andover, MA"', add
label define city_lbl 0270 `"Ann Arbor, MI"', add
label define city_lbl 0271 `"Annapolis, MD"', add
label define city_lbl 0272 `"Anniston, AL"', add
label define city_lbl 0273 `"Ansonia, CT"', add
label define city_lbl 0275 `"Antioch, CA"', add
label define city_lbl 0280 `"Appleton, WI"', add
label define city_lbl 0281 `"Ardmore, OK"', add
label define city_lbl 0282 `"Argenta, AR"', add
label define city_lbl 0283 `"Arkansas, KS"', add
label define city_lbl 0284 `"Arden-Arcade, CA"', add
label define city_lbl 0290 `"Arlington, TX"', add
label define city_lbl 0310 `"Arlington, VA"', add
label define city_lbl 0311 `"Arlington, MA"', add
label define city_lbl 0312 `"Arnold, PA"', add
label define city_lbl 0313 `"Asbury Park, NJ"', add
label define city_lbl 0330 `"Asheville, NC"', add
label define city_lbl 0331 `"Ashland, OH"', add
label define city_lbl 0340 `"Ashland, KY"', add
label define city_lbl 0341 `"Ashland, WI"', add
label define city_lbl 0342 `"Ashtabula, OH"', add
label define city_lbl 0343 `"Astoria, OR"', add
label define city_lbl 0344 `"Atchison, KS"', add
label define city_lbl 0345 `"Athens, GA"', add
label define city_lbl 0346 `"Athol, MA"', add
label define city_lbl 0347 `"Athens-Clarke County, GA"', add
label define city_lbl 0350 `"Atlanta, GA"', add
label define city_lbl 0370 `"Atlantic City, NJ"', add
label define city_lbl 0371 `"Attleboro, MA"', add
label define city_lbl 0390 `"Auburn, NY"', add
label define city_lbl 0391 `"Auburn, ME"', add
label define city_lbl 0410 `"Augusta, GA"', add
label define city_lbl 0411 `"Augusta-Richmond County, GA"', add
label define city_lbl 0430 `"Augusta, ME"', add
label define city_lbl 0450 `"Aurora, CO"', add
label define city_lbl 0470 `"Aurora, IL"', add
label define city_lbl 0490 `"Austin, TX"', add
label define city_lbl 0491 `"Austin, MN"', add
label define city_lbl 0510 `"Bakersfield, CA"', add
label define city_lbl 0530 `"Baltimore, MD"', add
label define city_lbl 0550 `"Bangor, ME"', add
label define city_lbl 0551 `"Barberton, OH"', add
label define city_lbl 0552 `"Barre, VT"', add
label define city_lbl 0553 `"Bartlesville, OK"', add
label define city_lbl 0554 `"Batavia, NY"', add
label define city_lbl 0570 `"Bath, ME"', add
label define city_lbl 0590 `"Baton Rouge, LA"', add
label define city_lbl 0610 `"Battle Creek, MI"', add
label define city_lbl 0630 `"Bay City, MI"', add
label define city_lbl 0640 `"Bayamon, PR"', add
label define city_lbl 0650 `"Bayonne, NJ"', add
label define city_lbl 0651 `"Beacon, NY"', add
label define city_lbl 0652 `"Beatrice, NE"', add
label define city_lbl 0660 `"Belleville, IL"', add
label define city_lbl 0670 `"Beaumont, TX"', add
label define city_lbl 0671 `"Beaver Falls, PA"', add
label define city_lbl 0672 `"Bedford, IN"', add
label define city_lbl 0673 `"Bellaire, OH"', add
label define city_lbl 0680 `"Bellevue, WA"', add
label define city_lbl 0690 `"Bellingham, WA"', add
label define city_lbl 0695 `"Belvedere, CA"', add
label define city_lbl 0700 `"Belleville, NJ"', add
label define city_lbl 0701 `"Bellevue, PA"', add
label define city_lbl 0702 `"Belmont, OH"', add
label define city_lbl 0703 `"Belmont, MA"', add
label define city_lbl 0704 `"Beloit, WI"', add
label define city_lbl 0705 `"Bennington, VT"', add
label define city_lbl 0706 `"Benton Harbor, MI"', add
label define city_lbl 0710 `"Berkeley, CA"', add
label define city_lbl 0711 `"Berlin, NH"', add
label define city_lbl 0712 `"Berwick, PA"', add
label define city_lbl 0720 `"Berwyn, IL"', add
label define city_lbl 0721 `"Bessemer, AL"', add
label define city_lbl 0730 `"Bethlehem, PA"', add
label define city_lbl 0740 `"Biddeford, ME"', add
label define city_lbl 0741 `"Big Spring, TX"', add
label define city_lbl 0742 `"Billings, MT"', add
label define city_lbl 0743 `"Biloxi, MS"', add
label define city_lbl 0750 `"Binghamton, NY"', add
label define city_lbl 0760 `"Beverly, MA"', add
label define city_lbl 0761 `"Beverly Hills, CA"', add
label define city_lbl 0770 `"Birmingham, AL"', add
label define city_lbl 0771 `"Birmingham, CT"', add
label define city_lbl 0772 `"Bismarck, ND"', add
label define city_lbl 0780 `"Bloomfield, NJ"', add
label define city_lbl 0790 `"Bloomington, IL"', add
label define city_lbl 0791 `"Bloomington, IN"', add
label define city_lbl 0792 `"Blue Island, IL"', add
label define city_lbl 0793 `"Bluefield, WV"', add
label define city_lbl 0794 `"Blytheville, AR"', add
label define city_lbl 0795 `"Bogalusa, LA"', add
label define city_lbl 0800 `"Boise, ID"', add
label define city_lbl 0801 `"Boone, IA"', add
label define city_lbl 0810 `"Boston, MA"', add
label define city_lbl 0811 `"Boulder, CO"', add
label define city_lbl 0812 `"Bowling Green, KY"', add
label define city_lbl 0813 `"Braddock, PA"', add
label define city_lbl 0814 `"Braden, WA"', add
label define city_lbl 0815 `"Bradford, PA"', add
label define city_lbl 0816 `"Brainerd, MN"', add
label define city_lbl 0817 `"Braintree, MA"', add
label define city_lbl 0818 `"Brawley, CA"', add
label define city_lbl 0819 `"Bremerton, WA"', add
label define city_lbl 0830 `"Bridgeport, CT"', add
label define city_lbl 0831 `"Bridgeton, NJ"', add
label define city_lbl 0832 `"Bristol, CT"', add
label define city_lbl 0833 `"Bristol, PA"', add
label define city_lbl 0834 `"Bristol, VA"', add
label define city_lbl 0835 `"Bristol, TN"', add
label define city_lbl 0837 `"Bristol, RI"', add
label define city_lbl 0850 `"Brockton, MA"', add
label define city_lbl 0851 `"Brookfield, IL"', add
label define city_lbl 0870 `"Brookline, MA"', add
label define city_lbl 0880 `"Brownsville, TX"', add
label define city_lbl 0881 `"Brownwood, TX"', add
label define city_lbl 0882 `"Brunswick, GA"', add
label define city_lbl 0883 `"Bucyrus, OH"', add
label define city_lbl 0890 `"Buffalo, NY"', add
label define city_lbl 0900 `"Burlington, IA"', add
label define city_lbl 0905 `"Burlington, VT"', add
label define city_lbl 0906 `"Burlington, NJ"', add
label define city_lbl 0907 `"Bushkill, PA"', add
label define city_lbl 0910 `"Butte, MT"', add
label define city_lbl 0911 `"Butler, PA"', add
label define city_lbl 0920 `"Burbank, CA"', add
label define city_lbl 0921 `"Burlingame, CA"', add
label define city_lbl 0926 `"Cairo, IL"', add
label define city_lbl 0927 `"Calumet City, IL"', add
label define city_lbl 0930 `"Cambridge, MA"', add
label define city_lbl 0931 `"Cambridge, OH"', add
label define city_lbl 0950 `"Camden, NJ"', add
label define city_lbl 0951 `"Campbell, OH"', add
label define city_lbl 0952 `"Canonsburg, PA"', add
label define city_lbl 0970 `"Camden, NY"', add
label define city_lbl 0990 `"Canton, OH"', add
label define city_lbl 0991 `"Canton, IL"', add
label define city_lbl 0992 `"Cape Girardeau, MO"', add
label define city_lbl 0993 `"Carbondale, PA"', add
label define city_lbl 0994 `"Carlisle, PA"', add
label define city_lbl 0995 `"Carnegie, PA"', add
label define city_lbl 0996 `"Carrick, PA"', add
label define city_lbl 0997 `"Carteret, NJ"', add
label define city_lbl 0998 `"Carthage, MO"', add
label define city_lbl 0999 `"Casper, WY"', add
label define city_lbl 1000 `"Cape Coral, FL"', add
label define city_lbl 1010 `"Cedar Rapids, IA"', add
label define city_lbl 1020 `"Central Falls, RI"', add
label define city_lbl 1021 `"Centralia, IL"', add
label define city_lbl 1023 `"Chambersburg, PA"', add
label define city_lbl 1024 `"Champaign, IL"', add
label define city_lbl 1025 `"Chanute, KS"', add
label define city_lbl 1026 `"Charleroi, PA"', add
label define city_lbl 1027 `"Chandler, AZ"', add
label define city_lbl 1030 `"Charlestown, MA"', add
label define city_lbl 1050 `"Charleston, SC"', add
label define city_lbl 1060 `"Carolina, PR"', add
label define city_lbl 1070 `"Charleston, WV"', add
label define city_lbl 1090 `"Charlotte, NC"', add
label define city_lbl 1091 `"Charlottesville, VA"', add
label define city_lbl 1110 `"Chattanooga, TN"', add
label define city_lbl 1130 `"Chelsea, MA"', add
label define city_lbl 1140 `"Cheltenham, PA"', add
label define city_lbl 1150 `"Chesapeake, VA"', add
label define city_lbl 1170 `"Chester, PA"', add
label define city_lbl 1171 `"Cheyenne, WY"', add
label define city_lbl 1190 `"Chicago, IL"', add
label define city_lbl 1191 `"Chicago Heights, IL"', add
label define city_lbl 1192 `"Chickasha, OK"', add
label define city_lbl 1210 `"Chicopee, MA"', add
label define city_lbl 1230 `"Chillicothe, OH"', add
label define city_lbl 1250 `"Chula Vista, CA"', add
label define city_lbl 1270 `"Cicero, IL"', add
label define city_lbl 1290 `"Cincinnati, OH"', add
label define city_lbl 1291 `"Clairton, PA"', add
label define city_lbl 1292 `"Claremont, NH"', add
label define city_lbl 1310 `"Clarksburg, WV"', add
label define city_lbl 1311 `"Clarksdale, MS"', add
label define city_lbl 1312 `"Cleburne, TX"', add
label define city_lbl 1330 `"Cleveland, OH"', add
label define city_lbl 1340 `"Cleveland Heights, OH"', add
label define city_lbl 1341 `"Cliffside Park, NJ"', add
label define city_lbl 1350 `"Clifton, NJ"', add
label define city_lbl 1351 `"Clinton, IN"', add
label define city_lbl 1370 `"Clinton, IA"', add
label define city_lbl 1371 `"Clinton, MA"', add
label define city_lbl 1372 `"Coatesville, PA"', add
label define city_lbl 1373 `"Coffeyville, KS"', add
label define city_lbl 1374 `"Cohoes, NY"', add
label define city_lbl 1375 `"Collingswood, NJ"', add
label define city_lbl 1390 `"Colorado Springs, CO"', add
label define city_lbl 1400 `"Cohoes, NY"', add
label define city_lbl 1410 `"Columbia, SC"', add
label define city_lbl 1411 `"Columbia, PA"', add
label define city_lbl 1412 `"Columbia, MO"', add
label define city_lbl 1420 `"Columbia City, IN"', add
label define city_lbl 1430 `"Columbus, GA"', add
label define city_lbl 1450 `"Columbus, OH"', add
label define city_lbl 1451 `"Columbus, MS"', add
label define city_lbl 1452 `"Compton, CA"', add
label define city_lbl 1470 `"Concord, CA"', add
label define city_lbl 1490 `"Concord, NH"', add
label define city_lbl 1491 `"Concord, NC"', add
label define city_lbl 1492 `"Connellsville, PA"', add
label define city_lbl 1493 `"Connersville, IN"', add
label define city_lbl 1494 `"Conshohocken, PA"', add
label define city_lbl 1495 `"Coraopolis, PA"', add
label define city_lbl 1496 `"Corning, NY"', add
label define city_lbl 1500 `"Corona, CA"', add
label define city_lbl 1510 `"Council Bluffs, IA"', add
label define city_lbl 1520 `"Corpus Christi, TX"', add
label define city_lbl 1521 `"Corsicana, TX"', add
label define city_lbl 1522 `"Cortland, NY"', add
label define city_lbl 1523 `"Coshocton, OH"', add
label define city_lbl 1530 `"Covington, KY"', add
label define city_lbl 1540 `"Costa Mesa, CA"', add
label define city_lbl 1545 `"Cranford, NJ"', add
label define city_lbl 1550 `"Cranston, RI"', add
label define city_lbl 1551 `"Crawfordsville, IN"', add
label define city_lbl 1552 `"Cripple Creek, CO"', add
label define city_lbl 1553 `"Cudahy, WI"', add
label define city_lbl 1570 `"Cumberland, MD"', add
label define city_lbl 1571 `"Cumberland, RI"', add
label define city_lbl 1572 `"Cuyahoga Falls, OH"', add
label define city_lbl 1590 `"Dallas, TX"', add
label define city_lbl 1591 `"Danbury, CT"', add
label define city_lbl 1592 `"Daly City, CA"', add
label define city_lbl 1610 `"Danvers, MA"', add
label define city_lbl 1630 `"Danville, IL"', add
label define city_lbl 1631 `"Danville, VA"', add
label define city_lbl 1650 `"Davenport, IA"', add
label define city_lbl 1670 `"Dayton, OH"', add
label define city_lbl 1671 `"Daytona Beach, FL"', add
label define city_lbl 1680 `"Dearborn, MI"', add
label define city_lbl 1690 `"Decatur, IL"', add
label define city_lbl 1691 `"Decatur, AL"', add
label define city_lbl 1692 `"Decatur, GA"', add
label define city_lbl 1693 `"Dedham, MA"', add
label define city_lbl 1694 `"Del Rio, TX"', add
label define city_lbl 1695 `"Denison, TX"', add
label define city_lbl 1710 `"Denver, CO"', add
label define city_lbl 1711 `"Derby, CT"', add
label define city_lbl 1713 `"Derry, PA"', add
label define city_lbl 1730 `"Des Moines, IA"', add
label define city_lbl 1750 `"Detroit, MI"', add
label define city_lbl 1751 `"Dickson City, PA"', add
label define city_lbl 1752 `"Dodge, KS"', add
label define city_lbl 1753 `"Donora, PA"', add
label define city_lbl 1754 `"Dormont, PA"', add
label define city_lbl 1755 `"Dothan, AL"', add
label define city_lbl 1770 `"Dorchester, MA"', add
label define city_lbl 1790 `"Dover, NH"', add
label define city_lbl 1791 `"Dover, NJ"', add
label define city_lbl 1792 `"Du Bois, PA"', add
label define city_lbl 1800 `"Downey, CA"', add
label define city_lbl 1810 `"Dubuque, IA"', add
label define city_lbl 1830 `"Duluth, MN"', add
label define city_lbl 1831 `"Dunkirk, NY"', add
label define city_lbl 1832 `"Dunmore, PA"', add
label define city_lbl 1833 `"Duquesne, PA"', add
label define city_lbl 1834 `"Dundalk, MD"', add
label define city_lbl 1850 `"Durham, NC"', add
label define city_lbl 1860 `"1860"', add
label define city_lbl 1870 `"East Chicago, IN"', add
label define city_lbl 1890 `"East Cleveland, OH"', add
label define city_lbl 1891 `"East Hartford, CT"', add
label define city_lbl 1892 `"East Liverpool, OH"', add
label define city_lbl 1893 `"East Moline, IL"', add
label define city_lbl 1910 `"East Los Angeles, CA"', add
label define city_lbl 1930 `"East Orange, NJ"', add
label define city_lbl 1931 `"East Providence, RI"', add
label define city_lbl 1940 `"East Saginaw, MI"', add
label define city_lbl 1950 `"East St. Louis, IL"', add
label define city_lbl 1951 `"East Youngstown, OH"', add
label define city_lbl 1952 `"Easthampton, MA"', add
label define city_lbl 1970 `"Easton, PA"', add
label define city_lbl 1971 `"Eau Claire, WI"', add
label define city_lbl 1972 `"Ecorse, MI"', add
label define city_lbl 1973 `"El Dorado, KS"', add
label define city_lbl 1974 `"El Dorado, AR"', add
label define city_lbl 1990 `"El Monte, CA"', add
label define city_lbl 2010 `"El Paso, TX"', add
label define city_lbl 2030 `"Elgin, IL"', add
label define city_lbl 2040 `"Elyria, OH"', add
label define city_lbl 2050 `"Elizabeth, NJ"', add
label define city_lbl 2051 `"Elizabeth City, NC"', add
label define city_lbl 2055 `"Elk Grove, CA"', add
label define city_lbl 2060 `"Elkhart, IN"', add
label define city_lbl 2061 `"Ellwood City, PA"', add
label define city_lbl 2062 `"Elmhurst, IL"', add
label define city_lbl 2070 `"Elmira, NY"', add
label define city_lbl 2071 `"Elmwood Park, IL"', add
label define city_lbl 2072 `"Elwood, IN"', add
label define city_lbl 2073 `"Emporia, KS"', add
label define city_lbl 2074 `"Endicott, NY"', add
label define city_lbl 2075 `"Enfield, CT"', add
label define city_lbl 2076 `"Englewood, NJ"', add
label define city_lbl 2080 `"Enid, OK"', add
label define city_lbl 2090 `"Erie, PA"', add
label define city_lbl 2091 `"Escanaba, MI"', add
label define city_lbl 2092 `"Euclid, OH"', add
label define city_lbl 2110 `"Escondido, CA"', add
label define city_lbl 2130 `"Eugene, OR"', add
label define city_lbl 2131 `"Eureka, CA"', add
label define city_lbl 2150 `"Evanston, IL"', add
label define city_lbl 2170 `"Evansville, IN"', add
label define city_lbl 2190 `"Everett, MA"', add
label define city_lbl 2210 `"Everett, WA"', add
label define city_lbl 2211 `"Fairfield, AL"', add
label define city_lbl 2212 `"Fairfield, CT"', add
label define city_lbl 2213 `"Fairhaven, MA"', add
label define city_lbl 2214 `"Fairmont, WV"', add
label define city_lbl 2220 `"Fargo, ND"', add
label define city_lbl 2221 `"Faribault, MN"', add
label define city_lbl 2222 `"Farrell, PA"', add
label define city_lbl 2230 `"Fall River, MA"', add
label define city_lbl 2240 `"Fayetteville, NC"', add
label define city_lbl 2241 `"Ferndale, MI"', add
label define city_lbl 2242 `"Findlay, OH"', add
label define city_lbl 2250 `"Fitchburg, MA"', add
label define city_lbl 2260 `"Fontana, CA"', add
label define city_lbl 2270 `"Flint, MI"', add
label define city_lbl 2271 `"Floral Park, NY"', add
label define city_lbl 2273 `"Florence, AL"', add
label define city_lbl 2274 `"Florence, SC"', add
label define city_lbl 2275 `"Flushing, NY"', add
label define city_lbl 2280 `"Fond du Lac, WI"', add
label define city_lbl 2281 `"Forest Park, IL"', add
label define city_lbl 2290 `"Fort Lauderdale, FL"', add
label define city_lbl 2300 `"Fort Collins, CO"', add
label define city_lbl 2301 `"Fort Dodge, IA"', add
label define city_lbl 2302 `"Fort Madison, IA"', add
label define city_lbl 2303 `"Fort Scott, KS"', add
label define city_lbl 2310 `"Fort Smith, AR"', add
label define city_lbl 2311 `"Fort Thomas, KY"', add
label define city_lbl 2330 `"Fort Wayne, IN"', add
label define city_lbl 2350 `"Fort Worth, TX"', add
label define city_lbl 2351 `"Fostoria, OH"', add
label define city_lbl 2352 `"Framingham, MA"', add
label define city_lbl 2353 `"Frankfort, IN"', add
label define city_lbl 2354 `"Frankfort, KY"', add
label define city_lbl 2355 `"Franklin, PA"', add
label define city_lbl 2356 `"Frederick, MD"', add
label define city_lbl 2357 `"Freeport, NY"', add
label define city_lbl 2358 `"Freeport, IL"', add
label define city_lbl 2359 `"Fremont, OH"', add
label define city_lbl 2360 `"Fremont, NE"', add
label define city_lbl 2370 `"Fresno, CA"', add
label define city_lbl 2390 `"Fullerton, CA"', add
label define city_lbl 2391 `"Fulton, NY"', add
label define city_lbl 2392 `"Gadsden, AL"', add
label define city_lbl 2393 `"Galena, KS"', add
label define city_lbl 2394 `"Gainesville, FL"', add
label define city_lbl 2400 `"Galesburg, IL"', add
label define city_lbl 2410 `"Galveston, TX"', add
label define city_lbl 2411 `"Gardner, MA"', add
label define city_lbl 2430 `"Garden Grove, CA"', add
label define city_lbl 2435 `"Gardena, CA"', add
label define city_lbl 2440 `"Garfield, NJ"', add
label define city_lbl 2441 `"Garfield Heights, OH"', add
label define city_lbl 2450 `"Garland, TX"', add
label define city_lbl 2470 `"Gary, IN"', add
label define city_lbl 2471 `"Gastonia, NC"', add
label define city_lbl 2472 `"Geneva, NY"', add
label define city_lbl 2473 `"Glen Cove, NY"', add
label define city_lbl 2489 `"Glendale, AZ"', add
label define city_lbl 2490 `"Glendale, CA"', add
label define city_lbl 2491 `"Glens Falls, NY"', add
label define city_lbl 2510 `"Gloucester, MA"', add
label define city_lbl 2511 `"Gloucester, NJ"', add
label define city_lbl 2512 `"Gloversville, NY"', add
label define city_lbl 2513 `"Goldsboro, NC"', add
label define city_lbl 2514 `"Goshen, IN"', add
label define city_lbl 2515 `"Grand Forks, ND"', add
label define city_lbl 2516 `"Grand Island, NE"', add
label define city_lbl 2517 `"Grand Junction, CO"', add
label define city_lbl 2520 `"Granite City, IL"', add
label define city_lbl 2530 `"Grand Rapids, MI"', add
label define city_lbl 2531 `"Grandville, MI"', add
label define city_lbl 2540 `"Great Falls, MT"', add
label define city_lbl 2541 `"Greeley, CO"', add
label define city_lbl 2550 `"Green Bay, WI"', add
label define city_lbl 2551 `"Greenfield, MA"', add
label define city_lbl 2570 `"Greensboro, NC"', add
label define city_lbl 2571 `"Greensburg, PA"', add
label define city_lbl 2572 `"Greenville, MS"', add
label define city_lbl 2573 `"Greenville, SC"', add
label define city_lbl 2574 `"Greenville, TX"', add
label define city_lbl 2575 `"Greenwich, CT"', add
label define city_lbl 2576 `"Greenwood, MS"', add
label define city_lbl 2577 `"Greenwood, SC"', add
label define city_lbl 2578 `"Griffin, GA"', add
label define city_lbl 2579 `"Grosse Pointe Park, MI"', add
label define city_lbl 2580 `"Guynabo, PR"', add
label define city_lbl 2581 `"Groton, CT"', add
label define city_lbl 2582 `"Gulfport, MS"', add
label define city_lbl 2583 `"Guthrie, OK"', add
label define city_lbl 2584 `"Hackensack, NJ"', add
label define city_lbl 2590 `"Hagerstown, MD"', add
label define city_lbl 2591 `"Hamden, CT"', add
label define city_lbl 2610 `"Hamilton, OH"', add
label define city_lbl 2630 `"Hammond, IN"', add
label define city_lbl 2650 `"Hampton, VA"', add
label define city_lbl 2670 `"Hamtramck Village, MI"', add
label define city_lbl 2680 `"Hannibal, MO"', add
label define city_lbl 2681 `"Hanover, PA"', add
label define city_lbl 2682 `"Harlingen, TX"', add
label define city_lbl 2683 `"Hanover township, Luzerne county, PA"', add
label define city_lbl 2690 `"Harrisburg, PA"', add
label define city_lbl 2691 `"Harrisburg, IL"', add
label define city_lbl 2692 `"Harrison, NJ"', add
label define city_lbl 2693 `"Harrison, PA"', add
label define city_lbl 2710 `"Hartford, CT"', add
label define city_lbl 2711 `"Harvey, IL"', add
label define city_lbl 2712 `"Hastings, NE"', add
label define city_lbl 2713 `"Hattiesburg, MS"', add
label define city_lbl 2725 `"Haverford, PA"', add
label define city_lbl 2730 `"Haverhill, MA"', add
label define city_lbl 2731 `"Hawthorne, NJ"', add
label define city_lbl 2740 `"Hayward, CA"', add
label define city_lbl 2750 `"Hazleton, PA"', add
label define city_lbl 2751 `"Helena, MT"', add
label define city_lbl 2752 `"Hempstead, NY"', add
label define city_lbl 2753 `"Henderson, KY"', add
label define city_lbl 2754 `"Herkimer, NY"', add
label define city_lbl 2755 `"Herrin, IL"', add
label define city_lbl 2756 `"Hibbing, MN"', add
label define city_lbl 2757 `"Henderson, NV"', add
label define city_lbl 2770 `"Hialeah, FL"', add
label define city_lbl 2780 `"High Point, NC"', add
label define city_lbl 2781 `"Highland Park, IL"', add
label define city_lbl 2790 `"Highland Park, MI"', add
label define city_lbl 2791 `"Hilo, HI"', add
label define city_lbl 2792 `"Hillside, NJ"', add
label define city_lbl 2810 `"Hoboken, NJ"', add
label define city_lbl 2811 `"Holland, MI"', add
label define city_lbl 2830 `"Hollywood, FL"', add
label define city_lbl 2850 `"Holyoke, MA"', add
label define city_lbl 2851 `"Homestead, PA"', add
label define city_lbl 2870 `"Honolulu, HI"', add
label define city_lbl 2871 `"Hopewell, VA"', add
label define city_lbl 2872 `"Hopkinsville, KY"', add
label define city_lbl 2873 `"Hoquiam, WA"', add
label define city_lbl 2874 `"Hornell, NY"', add
label define city_lbl 2875 `"Hot Springs, AR"', add
label define city_lbl 2890 `"Houston, TX"', add
label define city_lbl 2891 `"Hudson, NY"', add
label define city_lbl 2892 `"Huntington, IN"', add
label define city_lbl 2910 `"Huntington, WV"', add
label define city_lbl 2930 `"Huntington Beach, CA"', add
label define city_lbl 2950 `"Huntsville, AL"', add
label define city_lbl 2951 `"Huron, SD"', add
label define city_lbl 2960 `"Hutchinson, KS"', add
label define city_lbl 2961 `"Hyde Park, MA"', add
label define city_lbl 2962 `"Ilion, NY"', add
label define city_lbl 2963 `"Independence, KS"', add
label define city_lbl 2970 `"Independence, MO"', add
label define city_lbl 2990 `"Indianapolis, IN"', add
label define city_lbl 3010 `"Inglewood, CA"', add
label define city_lbl 3011 `"Iowa City, IA"', add
label define city_lbl 3012 `"Iron Mountain, MI"', add
label define city_lbl 3013 `"Ironton, OH"', add
label define city_lbl 3014 `"Ironwood, MI"', add
label define city_lbl 3015 `"Irondequoit, NY"', add
label define city_lbl 3020 `"Irvine, CA"', add
label define city_lbl 3030 `"Irving, TX"', add
label define city_lbl 3050 `"Irvington, NJ"', add
label define city_lbl 3051 `"Ishpeming, MI"', add
label define city_lbl 3052 `"Ithaca, NY"', add
label define city_lbl 3070 `"Jackson, MI"', add
label define city_lbl 3071 `"Jackson, MN"', add
label define city_lbl 3090 `"Jackson, MS"', add
label define city_lbl 3091 `"Jackson, TN"', add
label define city_lbl 3110 `"Jacksonville, FL"', add
label define city_lbl 3111 `"Jacksonville, IL"', add
label define city_lbl 3130 `"Jamestown, NY"', add
label define city_lbl 3131 `"Janesville, WI"', add
label define city_lbl 3132 `"Jeannette, PA"', add
label define city_lbl 3133 `"Jefferson City, MO"', add
label define city_lbl 3134 `"Jeffersonville, IN"', add
label define city_lbl 3150 `"Jersey City, NJ"', add
label define city_lbl 3151 `"Johnson City, NY"', add
label define city_lbl 3160 `"Johnson City, TN"', add
label define city_lbl 3161 `"Johnstown, NY"', add
label define city_lbl 3170 `"Johnstown, PA"', add
label define city_lbl 3190 `"Joliet, IL"', add
label define city_lbl 3191 `"Jonesboro, AR"', add
label define city_lbl 3210 `"Joplin, MO"', add
label define city_lbl 3230 `"Kalamazoo, MI"', add
label define city_lbl 3231 `"Kankakee, IL"', add
label define city_lbl 3250 `"Kansas City, KS"', add
label define city_lbl 3260 `"Kansas City, MO"', add
label define city_lbl 3270 `"Kearny, NJ"', add
label define city_lbl 3271 `"Keene, NH"', add
label define city_lbl 3272 `"Kenmore, NY"', add
label define city_lbl 3273 `"Kenmore, OH"', add
label define city_lbl 3290 `"Kenosha, WI"', add
label define city_lbl 3291 `"Keokuk, IA"', add
label define city_lbl 3292 `"Kewanee, IL"', add
label define city_lbl 3293 `"Key West, FL"', add
label define city_lbl 3294 `"Kingsport, TN"', add
label define city_lbl 3310 `"Kingston, NY"', add
label define city_lbl 3311 `"Kingston, PA"', add
label define city_lbl 3312 `"Kinston, NC"', add
label define city_lbl 3313 `"Klamath Falls, OR"', add
label define city_lbl 3330 `"Knoxville, TN"', add
label define city_lbl 3350 `"Kokomo, IN"', add
label define city_lbl 3370 `"La Crosse, WI"', add
label define city_lbl 3380 `"Lafayette, IN"', add
label define city_lbl 3390 `"Lafayette, LA"', add
label define city_lbl 3391 `"La Grange, IL"', add
label define city_lbl 3392 `"La Grange, GA"', add
label define city_lbl 3393 `"La Porte, IN"', add
label define city_lbl 3394 `"La Salle, IL"', add
label define city_lbl 3395 `"Lackawanna, NY"', add
label define city_lbl 3396 `"Laconia, NH"', add
label define city_lbl 3400 `"Lake Charles, LA"', add
label define city_lbl 3405 `"Lakeland, FL"', add
label define city_lbl 3410 `"Lakewood, CO"', add
label define city_lbl 3430 `"Lakewood, OH"', add
label define city_lbl 3440 `"Lancaster, CA"', add
label define city_lbl 3450 `"Lancaster, PA"', add
label define city_lbl 3451 `"Lancaster, OH"', add
label define city_lbl 3470 `"Lansing, MI"', add
label define city_lbl 3471 `"Lansingburgh, NY"', add
label define city_lbl 3480 `"Laredo, TX"', add
label define city_lbl 3481 `"Latrobe, PA"', add
label define city_lbl 3482 `"Laurel, MS"', add
label define city_lbl 3490 `"Las Vegas, NV"', add
label define city_lbl 3510 `"Lawrence, MA"', add
label define city_lbl 3511 `"Lawrence, KS"', add
label define city_lbl 3512 `"Lawton, OK"', add
label define city_lbl 3513 `"Leadville, CO"', add
label define city_lbl 3520 `"Leavenworth, KS"', add
label define city_lbl 3521 `"Lebanon, PA"', add
label define city_lbl 3522 `"Leominster, MA"', add
label define city_lbl 3530 `"Lehigh, PA"', add
label define city_lbl 3540 `"Lebanon, PA"', add
label define city_lbl 3550 `"Lewiston, ME"', add
label define city_lbl 3551 `"Lewistown, PA"', add
label define city_lbl 3560 `"Lewisville, TX"', add
label define city_lbl 3570 `"Lexington, KY"', add
label define city_lbl 3590 `"Lexington-Fayette, KY"', add
label define city_lbl 3610 `"Lima, OH"', add
label define city_lbl 3630 `"Lincoln, NE"', add
label define city_lbl 3631 `"Lincoln, IL"', add
label define city_lbl 3632 `"Lincoln Park, MI"', add
label define city_lbl 3633 `"Lincoln, RI"', add
label define city_lbl 3634 `"Linden, NJ"', add
label define city_lbl 3635 `"Little Falls, NY"', add
label define city_lbl 3638 `"Lodi, NJ"', add
label define city_lbl 3639 `"Logansport, IN"', add
label define city_lbl 3650 `"Little Rock, AR"', add
label define city_lbl 3670 `"Livonia, MI"', add
label define city_lbl 3680 `"Lockport, NY"', add
label define city_lbl 3690 `"Long Beach, CA"', add
label define city_lbl 3691 `"Long Branch, NJ"', add
label define city_lbl 3692 `"Long Island City, NY"', add
label define city_lbl 3693 `"Longview, WA"', add
label define city_lbl 3710 `"Lorain, OH"', add
label define city_lbl 3730 `"Los Angeles, CA"', add
label define city_lbl 3750 `"Louisville, KY"', add
label define city_lbl 3765 `"Lower Merion, PA"', add
label define city_lbl 3770 `"Lowell, MA"', add
label define city_lbl 3771 `"Lubbock, TX"', add
label define city_lbl 3772 `"Lynbrook, NY"', add
label define city_lbl 3790 `"Lynchburg, VA"', add
label define city_lbl 3800 `"Lyndhurst, NJ"', add
label define city_lbl 3810 `"Lynn, MA"', add
label define city_lbl 3830 `"Macon, GA"', add
label define city_lbl 3850 `"Madison, IN"', add
label define city_lbl 3870 `"Madison, WI"', add
label define city_lbl 3871 `"Mahanoy City, PA"', add
label define city_lbl 3890 `"Malden, MA"', add
label define city_lbl 3891 `"Mamaroneck, NY"', add
label define city_lbl 3910 `"Manchester, NH"', add
label define city_lbl 3911 `"Manchester, CT"', add
label define city_lbl 3912 `"Manhattan, KS"', add
label define city_lbl 3913 `"Manistee, MI"', add
label define city_lbl 3914 `"Manitowoc, WI"', add
label define city_lbl 3915 `"Mankato, MN"', add
label define city_lbl 3929 `"Maplewood, NJ"', add
label define city_lbl 3930 `"Mansfield, OH"', add
label define city_lbl 3931 `"Maplewood, MO"', add
label define city_lbl 3932 `"Marietta, OH"', add
label define city_lbl 3933 `"Marinette, WI"', add
label define city_lbl 3934 `"Marion, IN"', add
label define city_lbl 3940 `"Maywood, IL"', add
label define city_lbl 3950 `"Marion, OH"', add
label define city_lbl 3951 `"Marlborough, MA"', add
label define city_lbl 3952 `"Marquette, MI"', add
label define city_lbl 3953 `"Marshall, TX"', add
label define city_lbl 3954 `"Marshalltown, IA"', add
label define city_lbl 3955 `"Martins Ferry, OH"', add
label define city_lbl 3956 `"Martinsburg, WV"', add
label define city_lbl 3957 `"Mason City, IA"', add
label define city_lbl 3958 `"Massena, NY"', add
label define city_lbl 3959 `"Massillon, OH"', add
label define city_lbl 3960 `"McAllen, TX"', add
label define city_lbl 3961 `"Mattoon, IL"', add
label define city_lbl 3962 `"Mcalester, OK"', add
label define city_lbl 3963 `"Mccomb, MS"', add
label define city_lbl 3964 `"Mckees Rocks, PA"', add
label define city_lbl 3970 `"McKeesport, PA"', add
label define city_lbl 3971 `"Meadville, PA"', add
label define city_lbl 3990 `"Medford, MA"', add
label define city_lbl 3991 `"Medford, OR"', add
label define city_lbl 3992 `"Melrose, MA"', add
label define city_lbl 3993 `"Melrose Park, IL"', add
label define city_lbl 4010 `"Memphis, TN"', add
label define city_lbl 4011 `"Menominee, MI"', add
label define city_lbl 4030 `"Meriden, CT"', add
label define city_lbl 4040 `"Meridian, MS"', add
label define city_lbl 4041 `"Methuen, MA"', add
label define city_lbl 4050 `"Mesa, AZ"', add
label define city_lbl 4070 `"Mesquite, TX"', add
label define city_lbl 4090 `"Metairie, LA"', add
label define city_lbl 4110 `"Miami, FL"', add
label define city_lbl 4120 `"Michigan City, IN"', add
label define city_lbl 4121 `"Middlesboro, KY"', add
label define city_lbl 4122 `"Middletown, CT"', add
label define city_lbl 4123 `"Middletown, NY"', add
label define city_lbl 4124 `"Middletown, OH"', add
label define city_lbl 4125 `"Milford, CT"', add
label define city_lbl 4126 `"Milford, MA"', add
label define city_lbl 4127 `"Millville, NJ"', add
label define city_lbl 4128 `"Milton, MA"', add
label define city_lbl 4130 `"Milwaukee, WI"', add
label define city_lbl 4150 `"Minneapolis, MN"', add
label define city_lbl 4151 `"Minot, ND"', add
label define city_lbl 4160 `"Mishawaka, IN"', add
label define city_lbl 4161 `"Missoula, MT"', add
label define city_lbl 4162 `"Mitchell, SD"', add
label define city_lbl 4163 `"Moberly, MO"', add
label define city_lbl 4170 `"Mobile, AL"', add
label define city_lbl 4190 `"Modesto, CA"', add
label define city_lbl 4210 `"Moline, IL"', add
label define city_lbl 4211 `"Monessen, PA"', add
label define city_lbl 4212 `"Monroe, MI"', add
label define city_lbl 4213 `"Monroe, LA"', add
label define city_lbl 4214 `"Monrovia, CA"', add
label define city_lbl 4230 `"Montclair, NJ"', add
label define city_lbl 4250 `"Montgomery, AL"', add
label define city_lbl 4251 `"Morgantown, WV"', add
label define city_lbl 4252 `"Morristown, NJ"', add
label define city_lbl 4253 `"Moundsville, WV"', add
label define city_lbl 4254 `"Mount Arlington, NJ"', add
label define city_lbl 4255 `"Mount Carmel, PA"', add
label define city_lbl 4256 `"Mount Clemens, MI"', add
label define city_lbl 4260 `"Mount Lebanon, PA"', add
label define city_lbl 4270 `"Moreno Valley, CA"', add
label define city_lbl 4290 `"Mount Vernon, NY"', add
label define city_lbl 4291 `"Mount Vernon, IL"', add
label define city_lbl 4310 `"Muncie, IN"', add
label define city_lbl 4311 `"Munhall, PA"', add
label define city_lbl 4312 `"Murphysboro, IL"', add
label define city_lbl 4313 `"Muscatine, IA"', add
label define city_lbl 4330 `"Muskegon, MI"', add
label define city_lbl 4331 `"Muskegon Heights, MI"', add
label define city_lbl 4350 `"Muskogee, OK"', add
label define city_lbl 4351 `"Nanticoke, PA"', add
label define city_lbl 4370 `"Nantucket, MA"', add
label define city_lbl 4390 `"Nashua, NH"', add
label define city_lbl 4410 `"Nashville-Davidson, TN"', add
label define city_lbl 4411 `"Nashville, TN"', add
label define city_lbl 4413 `"Natchez, MS"', add
label define city_lbl 4414 `"Natick, MA"', add
label define city_lbl 4415 `"Naugatuck, CT"', add
label define city_lbl 4416 `"Needham, MA"', add
label define city_lbl 4420 `"Neptune, NJ"', add
label define city_lbl 4430 `"New Albany, IN"', add
label define city_lbl 4450 `"New Bedford, MA"', add
label define city_lbl 4451 `"New Bern, NC"', add
label define city_lbl 4452 `"New Brighton, NY"', add
label define city_lbl 4470 `"New Britain, CT"', add
label define city_lbl 4490 `"New Brunswick, NJ"', add
label define city_lbl 4510 `"New Castle, PA"', add
label define city_lbl 4511 `"New Castle, IN"', add
label define city_lbl 4530 `"New Haven, CT"', add
label define city_lbl 4550 `"New London, CT"', add
label define city_lbl 4570 `"New Orleans, LA"', add
label define city_lbl 4571 `"New Philadelphia, OH"', add
label define city_lbl 4590 `"New Rochelle, NY"', add
label define city_lbl 4610 `"New York, NY"', add
label define city_lbl 4611 `"Brooklyn (only in census years before 1900)"', add
label define city_lbl 4630 `"Newark, NJ"', add
label define city_lbl 4650 `"Newark, OH"', add
label define city_lbl 4670 `"Newburgh, NY"', add
label define city_lbl 4690 `"Newburyport, MA"', add
label define city_lbl 4710 `"Newport, KY"', add
label define city_lbl 4730 `"Newport, RI"', add
label define city_lbl 4750 `"Newport News, VA"', add
label define city_lbl 4770 `"Newton, MA"', add
label define city_lbl 4771 `"Newton, IA"', add
label define city_lbl 4772 `"Newton, KS"', add
label define city_lbl 4790 `"Niagara Falls, NY"', add
label define city_lbl 4791 `"Niles, MI"', add
label define city_lbl 4792 `"Niles, OH"', add
label define city_lbl 4810 `"Norfolk, VA"', add
label define city_lbl 4811 `"Norfolk, NE"', add
label define city_lbl 4820 `"North Las Vegas, NV"', add
label define city_lbl 4830 `"Norristown Borough, PA"', add
label define city_lbl 4831 `"North Adams, MA"', add
label define city_lbl 4832 `"North Attleborough, MA"', add
label define city_lbl 4833 `"North Bennington, VT"', add
label define city_lbl 4834 `"North Braddock, PA"', add
label define city_lbl 4835 `"North Branford, CT"', add
label define city_lbl 4836 `"North Haven, CT"', add
label define city_lbl 4837 `"North Little Rock, AR"', add
label define city_lbl 4838 `"North Platte, NE"', add
label define city_lbl 4839 `"North Providence, RI"', add
label define city_lbl 4840 `"Northampton, MA"', add
label define city_lbl 4841 `"North Tonawanda, NY"', add
label define city_lbl 4842 `"North Yakima, WA"', add
label define city_lbl 4843 `"Northbridge, MA"', add
label define city_lbl 4845 `"North Bergen, NJ"', add
label define city_lbl 4850 `"North Providence, RI"', add
label define city_lbl 4860 `"Norwalk, CA"', add
label define city_lbl 4870 `"Norwalk, CT"', add
label define city_lbl 4890 `"Norwich, CT"', add
label define city_lbl 4900 `"Norwood, OH"', add
label define city_lbl 4901 `"Norwood, MA"', add
label define city_lbl 4902 `"Nutley, NJ"', add
label define city_lbl 4905 `"Oak Park, IL"', add
label define city_lbl 4910 `"Oak Park Village, IL"', add
label define city_lbl 4930 `"Oakland, CA"', add
label define city_lbl 4950 `"Oceanside, CA"', add
label define city_lbl 4970 `"Ogden, UT"', add
label define city_lbl 4971 `"Ogdensburg, NY"', add
label define city_lbl 4972 `"Oil City, PA"', add
label define city_lbl 4990 `"Oklahoma City, OK"', add
label define city_lbl 4991 `"Okmulgee, OK"', add
label define city_lbl 4992 `"Old Bennington, VT"', add
label define city_lbl 4993 `"Old Forge, PA"', add
label define city_lbl 4994 `"Olean, NY"', add
label define city_lbl 4995 `"Olympia, WA"', add
label define city_lbl 4996 `"Olyphant, PA"', add
label define city_lbl 5010 `"Omaha, NE"', add
label define city_lbl 5011 `"Oneida, NY"', add
label define city_lbl 5012 `"Oneonta, NY"', add
label define city_lbl 5030 `"Ontario, CA"', add
label define city_lbl 5040 `"Orange, CA"', add
label define city_lbl 5050 `"Orange, NJ"', add
label define city_lbl 5051 `"Orange, CT"', add
label define city_lbl 5070 `"Orlando, FL"', add
label define city_lbl 5090 `"Oshkosh, WI"', add
label define city_lbl 5091 `"Oskaloosa, IA"', add
label define city_lbl 5092 `"Ossining, NY"', add
label define city_lbl 5110 `"Oswego, NY"', add
label define city_lbl 5111 `"Ottawa, IL"', add
label define city_lbl 5112 `"Ottumwa, IA"', add
label define city_lbl 5113 `"Owensboro, KY"', add
label define city_lbl 5114 `"Owosso, MI"', add
label define city_lbl 5116 `"Painesville, OH"', add
label define city_lbl 5117 `"Palestine, TX"', add
label define city_lbl 5118 `"Palo Alto, CA"', add
label define city_lbl 5119 `"Pampa, TX"', add
label define city_lbl 5121 `"Paris, TX"', add
label define city_lbl 5122 `"Park Ridge, IL"', add
label define city_lbl 5123 `"Parkersburg, WV"', add
label define city_lbl 5124 `"Parma, OH"', add
label define city_lbl 5125 `"Parsons, KS"', add
label define city_lbl 5130 `"Oxnard, CA"', add
label define city_lbl 5140 `"Palmdale, CA"', add
label define city_lbl 5150 `"Pasadena, CA"', add
label define city_lbl 5170 `"Pasadena, TX"', add
label define city_lbl 5180 `"Paducah, KY"', add
label define city_lbl 5190 `"Passaic, NJ"', add
label define city_lbl 5210 `"Paterson, NJ"', add
label define city_lbl 5230 `"Pawtucket, RI"', add
label define city_lbl 5231 `"Peabody, MA"', add
label define city_lbl 5232 `"Peekskill, NY"', add
label define city_lbl 5233 `"Pekin, IL"', add
label define city_lbl 5240 `"Pembroke Pines, FL"', add
label define city_lbl 5250 `"Pensacola, FL"', add
label define city_lbl 5255 `"Pensauken, NJ"', add
label define city_lbl 5269 `"Peoria, AZ"', add
label define city_lbl 5270 `"Peoria, IL"', add
label define city_lbl 5271 `"Peoria Heights, IL"', add
label define city_lbl 5290 `"Perth Amboy, NJ"', add
label define city_lbl 5291 `"Peru, IN"', add
label define city_lbl 5310 `"Petersburg, VA"', add
label define city_lbl 5311 `"Phenix City, AL"', add
label define city_lbl 5330 `"Philadelphia, PA"', add
label define city_lbl 5331 `"Kensington"', add
label define city_lbl 5332 `"Moyamensing"', add
label define city_lbl 5333 `"Northern Liberties"', add
label define city_lbl 5334 `"Southwark"', add
label define city_lbl 5335 `"Spring Garden"', add
label define city_lbl 5341 `"Phillipsburg, NJ"', add
label define city_lbl 5350 `"Phoenix, AZ"', add
label define city_lbl 5351 `"Phoenixville, PA"', add
label define city_lbl 5352 `"Pine Bluff, AR"', add
label define city_lbl 5353 `"Piqua, OH"', add
label define city_lbl 5354 `"Pittsburg, KS"', add
label define city_lbl 5370 `"Pittsburgh, PA"', add
label define city_lbl 5390 `"Pittsfield, MA"', add
label define city_lbl 5391 `"Pittston, PA"', add
label define city_lbl 5409 `"Plains, PA"', add
label define city_lbl 5410 `"Plainfield, NJ"', add
label define city_lbl 5411 `"Plattsburg, NY"', add
label define city_lbl 5412 `"Pleasantville, NJ"', add
label define city_lbl 5413 `"Plymouth, PA"', add
label define city_lbl 5414 `"Plymouth, MA"', add
label define city_lbl 5415 `"Pocatello, ID"', add
label define city_lbl 5430 `"Plano, TX"', add
label define city_lbl 5450 `"Pomona, CA"', add
label define city_lbl 5451 `"Ponca City, OK"', add
label define city_lbl 5460 `"Ponce, PR"', add
label define city_lbl 5470 `"Pontiac, MI"', add
label define city_lbl 5471 `"Port Angeles, WA"', add
label define city_lbl 5480 `"Port Arthur, TX"', add
label define city_lbl 5481 `"Port Chester, NY"', add
label define city_lbl 5490 `"Port Huron, MI"', add
label define city_lbl 5491 `"Port Jervis, NY"', add
label define city_lbl 5500 `"Port St. Lucie, FL"', add
label define city_lbl 5510 `"Portland, ME"', add
label define city_lbl 5511 `"Portland, IL"', add
label define city_lbl 5530 `"Portland, OR"', add
label define city_lbl 5550 `"Portsmouth, NH"', add
label define city_lbl 5570 `"Portsmouth, OH"', add
label define city_lbl 5590 `"Portsmouth, VA"', add
label define city_lbl 5591 `"Pottstown, PA"', add
label define city_lbl 5610 `"Pottsville, PA"', add
label define city_lbl 5630 `"Poughkeepsie, NY"', add
label define city_lbl 5650 `"Providence, RI"', add
label define city_lbl 5660 `"Provo, UT"', add
label define city_lbl 5670 `"Pueblo, CO"', add
label define city_lbl 5671 `"Punxsutawney, PA"', add
label define city_lbl 5690 `"Quincy, IL"', add
label define city_lbl 5710 `"Quincy, MA"', add
label define city_lbl 5730 `"Racine, WI"', add
label define city_lbl 5731 `"Rahway, NJ"', add
label define city_lbl 5750 `"Raleigh, NC"', add
label define city_lbl 5751 `"Ranger, TX"', add
label define city_lbl 5752 `"Rapid City, SD"', add
label define city_lbl 5770 `"Rancho Cucamonga, CA"', add
label define city_lbl 5790 `"Reading, PA"', add
label define city_lbl 5791 `"Red Bank, NJ"', add
label define city_lbl 5792 `"Redlands, CA"', add
label define city_lbl 5810 `"Reno, NV"', add
label define city_lbl 5811 `"Rensselaer, NY"', add
label define city_lbl 5830 `"Revere, MA"', add
label define city_lbl 5850 `"Richmond, IN"', add
label define city_lbl 5870 `"Richmond, VA"', add
label define city_lbl 5871 `"Richmond, CA"', add
label define city_lbl 5872 `"Ridgefield Park, NJ"', add
label define city_lbl 5873 `"Ridgewood, NJ"', add
label define city_lbl 5874 `"River Rouge, MI"', add
label define city_lbl 5890 `"Riverside, CA"', add
label define city_lbl 5910 `"Roanoke, VA"', add
label define city_lbl 5930 `"Rochester, NY"', add
label define city_lbl 5931 `"Rochester, NH"', add
label define city_lbl 5932 `"Rochester, MN"', add
label define city_lbl 5933 `"Rock Hill, SC"', add
label define city_lbl 5950 `"Rock Island, IL"', add
label define city_lbl 5970 `"Rockford, IL"', add
label define city_lbl 5971 `"Rockland, ME"', add
label define city_lbl 5972 `"Rockton, IL"', add
label define city_lbl 5973 `"Rockville Centre, NY"', add
label define city_lbl 5974 `"Rocky Mount, NC"', add
label define city_lbl 5990 `"Rome, NY"', add
label define city_lbl 5991 `"Rome, GA"', add
label define city_lbl 5992 `"Roosevelt, NJ"', add
label define city_lbl 5993 `"Roselle, NJ"', add
label define city_lbl 5994 `"Roswell, NM"', add
label define city_lbl 5995 `"Roseville, CA"', add
label define city_lbl 6010 `"Roxbury, MA"', add
label define city_lbl 6011 `"Royal Oak, MI"', add
label define city_lbl 6012 `"Rumford Falls, ME"', add
label define city_lbl 6013 `"Rutherford, NJ"', add
label define city_lbl 6014 `"Rutland, VT"', add
label define city_lbl 6030 `"Sacramento, CA"', add
label define city_lbl 6050 `"Saginaw, MI"', add
label define city_lbl 6070 `"Saint Joseph, MO"', add
label define city_lbl 6090 `"Saint Louis, MO"', add
label define city_lbl 6110 `"Saint Paul, MN"', add
label define city_lbl 6130 `"Saint Petersburg, FL"', add
label define city_lbl 6150 `"Salem, MA"', add
label define city_lbl 6170 `"Salem, OR"', add
label define city_lbl 6171 `"Salem, OH"', add
label define city_lbl 6172 `"Salina, KS"', add
label define city_lbl 6190 `"Salinas, CA"', add
label define city_lbl 6191 `"Salisbury, NC"', add
label define city_lbl 6192 `"Salisbury, MD"', add
label define city_lbl 6210 `"Salt Lake City, UT"', add
label define city_lbl 6211 `"San Angelo, TX"', add
label define city_lbl 6220 `"San Angelo, TX"', add
label define city_lbl 6230 `"San Antonio, TX"', add
label define city_lbl 6231 `"San Benito, TX"', add
label define city_lbl 6250 `"San Bernardino, CA"', add
label define city_lbl 6260 `"San Buenaventura (Ventura), CA"', add
label define city_lbl 6270 `"San Diego, CA"', add
label define city_lbl 6280 `"Sandusky, OH"', add
label define city_lbl 6281 `"Sanford, FL"', add
label define city_lbl 6282 `"Sanford, ME"', add
label define city_lbl 6290 `"San Francisco, CA"', add
label define city_lbl 6300 `"San Juan, PR"', add
label define city_lbl 6310 `"San Jose, CA"', add
label define city_lbl 6311 `"San Leandro, CA"', add
label define city_lbl 6312 `"San Mateo, CA"', add
label define city_lbl 6320 `"Santa Barbara, CA"', add
label define city_lbl 6321 `"Santa Cruz, CA"', add
label define city_lbl 6322 `"Santa Fe, NM"', add
label define city_lbl 6330 `"Santa Ana, CA"', add
label define city_lbl 6335 `"Santa Clara, CA"', add
label define city_lbl 6340 `"Santa Clarita, CA"', add
label define city_lbl 6350 `"Santa Rosa, CA"', add
label define city_lbl 6351 `"Sapulpa, OK"', add
label define city_lbl 6352 `"Saratoga Springs, NY"', add
label define city_lbl 6353 `"Saugus, MA"', add
label define city_lbl 6354 `"Sault Ste. Marie, MI"', add
label define city_lbl 6360 `"Santa Monica, CA"', add
label define city_lbl 6370 `"Savannah, GA"', add
label define city_lbl 6390 `"Schenectedy, NY"', add
label define city_lbl 6410 `"Scranton, PA"', add
label define city_lbl 6430 `"Seattle, WA"', add
label define city_lbl 6431 `"Sedalia, MO"', add
label define city_lbl 6432 `"Selma, AL"', add
label define city_lbl 6433 `"Seminole, OK"', add
label define city_lbl 6434 `"Shaker Heights, OH"', add
label define city_lbl 6435 `"Shamokin, PA"', add
label define city_lbl 6437 `"Sharpsville, PA"', add
label define city_lbl 6438 `"Shawnee, OK"', add
label define city_lbl 6440 `"Sharon, PA"', add
label define city_lbl 6450 `"Sheboygan, WI"', add
label define city_lbl 6451 `"Shelby, NC"', add
label define city_lbl 6452 `"Shelbyville, IN"', add
label define city_lbl 6453 `"Shelton, CT"', add
label define city_lbl 6470 `"Shenandoah Borough, PA"', add
label define city_lbl 6471 `"Sherman, TX"', add
label define city_lbl 6472 `"Shorewood, WI"', add
label define city_lbl 6490 `"Shreveport, LA"', add
label define city_lbl 6500 `"Simi Valley, CA"', add
label define city_lbl 6510 `"Sioux City, IA"', add
label define city_lbl 6530 `"Sioux Falls, SD"', add
label define city_lbl 6550 `"Smithfield, RI (1850)"', add
label define city_lbl 6570 `"Somerville, MA"', add
label define city_lbl 6590 `"South Bend, IN"', add
label define city_lbl 6591 `"South Bethlehem, PA"', add
label define city_lbl 6592 `"South Boise, ID"', add
label define city_lbl 6593 `"South Gate, CA"', add
label define city_lbl 6594 `"South Milwaukee, WI"', add
label define city_lbl 6595 `"South Norwalk, CT"', add
label define city_lbl 6610 `"South Omaha, NE"', add
label define city_lbl 6611 `"South Orange, NJ"', add
label define city_lbl 6612 `"South Pasadena, CA"', add
label define city_lbl 6613 `"South Pittsburgh, PA"', add
label define city_lbl 6614 `"South Portland, ME"', add
label define city_lbl 6615 `"South River, NJ"', add
label define city_lbl 6616 `"South St. Paul, MN"', add
label define city_lbl 6617 `"Southbridge, MA"', add
label define city_lbl 6620 `"Spartanburg, SC"', add
label define city_lbl 6630 `"Spokane, WA"', add
label define city_lbl 6640 `"Spring Valley, NV"', add
label define city_lbl 6650 `"Springfield, IL"', add
label define city_lbl 6670 `"Springfield, MA"', add
label define city_lbl 6690 `"Springfield, MO"', add
label define city_lbl 6691 `"St. Augustine, FL"', add
label define city_lbl 6692 `"St. Charles, MO"', add
label define city_lbl 6693 `"St. Cloud, MN"', add
label define city_lbl 6710 `"Springfield, OH"', add
label define city_lbl 6730 `"Stamford, CT"', add
label define city_lbl 6731 `"Statesville, NC"', add
label define city_lbl 6732 `"Staunton, VA"', add
label define city_lbl 6733 `"Steelton, PA"', add
label define city_lbl 6734 `"Sterling, IL"', add
label define city_lbl 6750 `"Sterling Heights, MI"', add
label define city_lbl 6770 `"Steubenville, OH"', add
label define city_lbl 6771 `"Stevens Point, WI"', add
label define city_lbl 6772 `"Stillwater, MN"', add
label define city_lbl 6789 `"Stowe, PA"', add
label define city_lbl 6790 `"Stockton, CA"', add
label define city_lbl 6791 `"Stoneham, MA"', add
label define city_lbl 6792 `"Stonington, CT"', add
label define city_lbl 6793 `"Stratford, CT"', add
label define city_lbl 6794 `"Streator, IL"', add
label define city_lbl 6795 `"Struthers, OH"', add
label define city_lbl 6796 `"Suffolk, VA"', add
label define city_lbl 6797 `"Summit, NJ"', add
label define city_lbl 6798 `"Sumter, SC"', add
label define city_lbl 6799 `"Sunbury, PA"', add
label define city_lbl 6810 `"Sunnyvale, CA"', add
label define city_lbl 6830 `"Superior, WI"', add
label define city_lbl 6831 `"Swampscott, MA"', add
label define city_lbl 6832 `"Sweetwater, TX"', add
label define city_lbl 6833 `"Swissvale, PA"', add
label define city_lbl 6850 `"Syracuse, NY"', add
label define city_lbl 6870 `"Tacoma, WA"', add
label define city_lbl 6871 `"Tallahassee, FL"', add
label define city_lbl 6872 `"Tamaqua, PA"', add
label define city_lbl 6890 `"Tampa, FL"', add
label define city_lbl 6910 `"Taunton, MA"', add
label define city_lbl 6911 `"Taylor, PA"', add
label define city_lbl 6912 `"Temple, TX"', add
label define city_lbl 6913 `"Teaneck, NJ"', add
label define city_lbl 6930 `"Tempe, AZ"', add
label define city_lbl 6950 `"Terre Haute, IN"', add
label define city_lbl 6951 `"Texarkana, TX"', add
label define city_lbl 6952 `"Thomasville, GA"', add
label define city_lbl 6953 `"Thomasville, NC"', add
label define city_lbl 6954 `"Tiffin, OH"', add
label define city_lbl 6960 `"Thousand Oaks, CA"', add
label define city_lbl 6970 `"Toledo, OH"', add
label define city_lbl 6971 `"Tonawanda, NY"', add
label define city_lbl 6990 `"Topeka, KS"', add
label define city_lbl 6991 `"Torrington, CT"', add
label define city_lbl 6992 `"Traverse City, MI"', add
label define city_lbl 7000 `"Torrance, CA"', add
label define city_lbl 7010 `"Trenton, NJ"', add
label define city_lbl 7011 `"Trinidad, CO"', add
label define city_lbl 7030 `"Troy, NY"', add
label define city_lbl 7050 `"Tucson, AZ"', add
label define city_lbl 7070 `"Tulsa, OK"', add
label define city_lbl 7071 `"Turtle Creek, PA"', add
label define city_lbl 7072 `"Tuscaloosa, AL"', add
label define city_lbl 7073 `"Two Rivers, WI"', add
label define city_lbl 7074 `"Tyler, TX"', add
label define city_lbl 7079 `"Union, NJ"', add
label define city_lbl 7080 `"Union City, NJ"', add
label define city_lbl 7081 `"Uniontown, PA"', add
label define city_lbl 7082 `"University City, MO"', add
label define city_lbl 7083 `"Urbana, IL"', add
label define city_lbl 7084 `"Upper Darby, PA"', add
label define city_lbl 7090 `"Utica, NY"', add
label define city_lbl 7091 `"Valdosta, GA"', add
label define city_lbl 7092 `"Vallejo, CA"', add
label define city_lbl 7093 `"Valley Stream, NY"', add
label define city_lbl 7100 `"Vancouver, WA"', add
label define city_lbl 7110 `"Vallejo, CA"', add
label define city_lbl 7111 `"Vandergrift, PA"', add
label define city_lbl 7112 `"Venice, CA"', add
label define city_lbl 7120 `"Vicksburg, MS"', add
label define city_lbl 7121 `"Vincennes, IN"', add
label define city_lbl 7122 `"Virginia, MN"', add
label define city_lbl 7123 `"Virginia City, NV"', add
label define city_lbl 7130 `"Virginia Beach, VA"', add
label define city_lbl 7140 `"Visalia, CA"', add
label define city_lbl 7150 `"Waco, TX"', add
label define city_lbl 7151 `"Wakefield, MA"', add
label define city_lbl 7152 `"Walla Walla, WA"', add
label define city_lbl 7153 `"Wallingford, CT"', add
label define city_lbl 7170 `"Waltham, MA"', add
label define city_lbl 7180 `"Warren, MI"', add
label define city_lbl 7190 `"Warren, OH"', add
label define city_lbl 7191 `"Warren, PA"', add
label define city_lbl 7210 `"Warwick Town, RI"', add
label define city_lbl 7230 `"Washington, DC"', add
label define city_lbl 7231 `"Georgetown, DC"', add
label define city_lbl 7241 `"Washington, PA"', add
label define city_lbl 7242 `"Washington, VA"', add
label define city_lbl 7250 `"Waterbury, CT"', add
label define city_lbl 7270 `"Waterloo, IA"', add
label define city_lbl 7290 `"Waterloo, NY"', add
label define city_lbl 7310 `"Watertown, NY"', add
label define city_lbl 7311 `"Watertown, WI"', add
label define city_lbl 7312 `"Watertown, SD"', add
label define city_lbl 7313 `"Watertown, MA"', add
label define city_lbl 7314 `"Waterville, ME"', add
label define city_lbl 7315 `"Watervliet, NY"', add
label define city_lbl 7316 `"Waukegan, IL"', add
label define city_lbl 7317 `"Waukesha, WI"', add
label define city_lbl 7318 `"Wausau, WI"', add
label define city_lbl 7319 `"Wauwatosa, WI"', add
label define city_lbl 7320 `"West Covina, CA"', add
label define city_lbl 7321 `"Waycross, GA"', add
label define city_lbl 7322 `"Waynesboro, PA"', add
label define city_lbl 7323 `"Webb City, MO"', add
label define city_lbl 7324 `"Webster Groves, MO"', add
label define city_lbl 7325 `"Webster, MA"', add
label define city_lbl 7326 `"Wellesley, MA"', add
label define city_lbl 7327 `"Wenatchee, WA"', add
label define city_lbl 7328 `"Weehawken, NJ"', add
label define city_lbl 7329 `"West Bay City, MI"', add
label define city_lbl 7330 `"West Hoboken, NJ"', add
label define city_lbl 7331 `"West Bethlehem, PA"', add
label define city_lbl 7332 `"West Chester, PA"', add
label define city_lbl 7333 `"West Frankfort, IL"', add
label define city_lbl 7334 `"West Hartford, CT"', add
label define city_lbl 7335 `"West Haven, CT"', add
label define city_lbl 7340 `"West Allis, WI"', add
label define city_lbl 7350 `"West New York, NJ"', add
label define city_lbl 7351 `"West Orange, NJ"', add
label define city_lbl 7352 `"West Palm Beach, FL"', add
label define city_lbl 7353 `"West Springfield, MA"', add
label define city_lbl 7370 `"West Troy, NY"', add
label define city_lbl 7371 `"West Warwick, RI"', add
label define city_lbl 7372 `"Westbrook, ME"', add
label define city_lbl 7373 `"Westerly, RI"', add
label define city_lbl 7374 `"Westfield, MA"', add
label define city_lbl 7375 `"Westfield, NJ"', add
label define city_lbl 7376 `"Wewoka, OK"', add
label define city_lbl 7377 `"Weymouth, MA"', add
label define city_lbl 7390 `"Wheeling, WV"', add
label define city_lbl 7400 `"White Plains, NY"', add
label define city_lbl 7401 `"Whiting, IN"', add
label define city_lbl 7402 `"Whittier, CA"', add
label define city_lbl 7410 `"Wichita, KS"', add
label define city_lbl 7430 `"Wichita Falls, TX"', add
label define city_lbl 7450 `"Wilkes-Barre, PA"', add
label define city_lbl 7451 `"Wilkinsburg, PA"', add
label define city_lbl 7460 `"Wilkinsburg, PA"', add
label define city_lbl 7470 `"Williamsport, PA"', add
label define city_lbl 7471 `"Willimantic, CT"', add
label define city_lbl 7472 `"Wilmette, IL"', add
label define city_lbl 7490 `"Wilmington, DE"', add
label define city_lbl 7510 `"Wilmington, NC"', add
label define city_lbl 7511 `"Wilson, NC"', add
label define city_lbl 7512 `"Winchester, VA"', add
label define city_lbl 7513 `"Winchester, MA"', add
label define city_lbl 7514 `"Windham, CT"', add
label define city_lbl 7515 `"Winnetka, IL"', add
label define city_lbl 7516 `"Winona, MN"', add
label define city_lbl 7530 `"Winston-Salem, NC"', add
label define city_lbl 7531 `"Winthrop, MA"', add
label define city_lbl 7532 `"Woburn, MA"', add
label define city_lbl 7533 `"Woodlawn, PA"', add
label define city_lbl 7534 `"Woodmont, CT"', add
label define city_lbl 7535 `"Woodbridge, NJ"', add
label define city_lbl 7550 `"Woonsocket, RI"', add
label define city_lbl 7551 `"Wooster, OH"', add
label define city_lbl 7570 `"Worcester, MA"', add
label define city_lbl 7571 `"Wyandotte, MI"', add
label define city_lbl 7572 `"Xenia, OH"', add
label define city_lbl 7573 `"Yakima, WA"', add
label define city_lbl 7590 `"Yonkers, NY"', add
label define city_lbl 7610 `"York, PA"', add
label define city_lbl 7630 `"Youngstown, OH"', add
label define city_lbl 7631 `"Ypsilanti, MI"', add
label define city_lbl 7650 `"Zanesville, OH"', add
label values city city_lbl

label define gq_lbl 0 `"Vacant unit"'
label define gq_lbl 1 `"Households under 1970 definition"', add
label define gq_lbl 2 `"Additional households under 1990 definition"', add
label define gq_lbl 3 `"Group quarters--Institutions"', add
label define gq_lbl 4 `"Other group quarters"', add
label define gq_lbl 5 `"Additional households under 2000 definition"', add
label define gq_lbl 6 `"Fragment"', add
label values gq gq_lbl

label define relate_lbl 01 `"Head/Householder"'
label define relate_lbl 02 `"Spouse"', add
label define relate_lbl 03 `"Child"', add
label define relate_lbl 04 `"Child-in-law"', add
label define relate_lbl 05 `"Parent"', add
label define relate_lbl 06 `"Parent-in-Law"', add
label define relate_lbl 07 `"Sibling"', add
label define relate_lbl 08 `"Sibling-in-Law"', add
label define relate_lbl 09 `"Grandchild"', add
label define relate_lbl 10 `"Other relatives"', add
label define relate_lbl 11 `"Partner, friend, visitor"', add
label define relate_lbl 12 `"Other non-relatives"', add
label define relate_lbl 13 `"Institutional inmates"', add
label values relate relate_lbl

label define related_lbl 0101 `"Head/Householder"'
label define related_lbl 0201 `"Spouse"', add
label define related_lbl 0202 `"2nd/3rd Wife (Polygamous)"', add
label define related_lbl 0301 `"Child"', add
label define related_lbl 0302 `"Adopted Child"', add
label define related_lbl 0303 `"Stepchild"', add
label define related_lbl 0304 `"Adopted, n.s."', add
label define related_lbl 0401 `"Child-in-law"', add
label define related_lbl 0402 `"Step Child-in-law"', add
label define related_lbl 0501 `"Parent"', add
label define related_lbl 0502 `"Stepparent"', add
label define related_lbl 0601 `"Parent-in-Law"', add
label define related_lbl 0602 `"Stepparent-in-law"', add
label define related_lbl 0701 `"Sibling"', add
label define related_lbl 0702 `"Step/Half/Adopted Sibling"', add
label define related_lbl 0801 `"Sibling-in-Law"', add
label define related_lbl 0802 `"Step/Half Sibling-in-law"', add
label define related_lbl 0901 `"Grandchild"', add
label define related_lbl 0902 `"Adopted Grandchild"', add
label define related_lbl 0903 `"Step Grandchild"', add
label define related_lbl 0904 `"Grandchild-in-law"', add
label define related_lbl 1000 `"Other relatives:"', add
label define related_lbl 1001 `"Other Relatives"', add
label define related_lbl 1011 `"Grandparent"', add
label define related_lbl 1012 `"Step Grandparent"', add
label define related_lbl 1013 `"Grandparent-in-law"', add
label define related_lbl 1021 `"Aunt or Uncle"', add
label define related_lbl 1022 `"Aunt,Uncle-in-law"', add
label define related_lbl 1031 `"Nephew, Niece"', add
label define related_lbl 1032 `"Neph/Niece-in-law"', add
label define related_lbl 1033 `"Step/Adopted Nephew/Niece"', add
label define related_lbl 1034 `"Grand Niece/Nephew"', add
label define related_lbl 1041 `"Cousin"', add
label define related_lbl 1042 `"Cousin-in-law"', add
label define related_lbl 1051 `"Great Grandchild"', add
label define related_lbl 1061 `"Other relatives, nec"', add
label define related_lbl 1100 `"Partner, Friend, Visitor"', add
label define related_lbl 1110 `"Partner/friend"', add
label define related_lbl 1111 `"Friend"', add
label define related_lbl 1112 `"Partner"', add
label define related_lbl 1113 `"Partner/roommate"', add
label define related_lbl 1114 `"Unmarried Partner"', add
label define related_lbl 1115 `"Housemate/Roomate"', add
label define related_lbl 1120 `"Relative of partner"', add
label define related_lbl 1130 `"Concubine/Mistress"', add
label define related_lbl 1131 `"Visitor"', add
label define related_lbl 1132 `"Companion and family of companion"', add
label define related_lbl 1139 `"Allocated partner/friend/visitor"', add
label define related_lbl 1200 `"Other non-relatives"', add
label define related_lbl 1201 `"Roomers/boarders/lodgers"', add
label define related_lbl 1202 `"Boarders"', add
label define related_lbl 1203 `"Lodgers"', add
label define related_lbl 1204 `"Roomer"', add
label define related_lbl 1205 `"Tenant"', add
label define related_lbl 1206 `"Foster child"', add
label define related_lbl 1210 `"Employees:"', add
label define related_lbl 1211 `"Servant"', add
label define related_lbl 1212 `"Housekeeper"', add
label define related_lbl 1213 `"Maid"', add
label define related_lbl 1214 `"Cook"', add
label define related_lbl 1215 `"Nurse"', add
label define related_lbl 1216 `"Other probable domestic employee"', add
label define related_lbl 1217 `"Other employee"', add
label define related_lbl 1219 `"Relative of employee"', add
label define related_lbl 1221 `"Military"', add
label define related_lbl 1222 `"Students"', add
label define related_lbl 1223 `"Members of religious orders"', add
label define related_lbl 1230 `"Other non-relatives"', add
label define related_lbl 1239 `"Allocated other non-relative"', add
label define related_lbl 1240 `"Roomers/boarders/lodgers and foster children"', add
label define related_lbl 1241 `"Roomers/boarders/lodgers"', add
label define related_lbl 1242 `"Foster children"', add
label define related_lbl 1250 `"Employees"', add
label define related_lbl 1251 `"Domestic employees"', add
label define related_lbl 1252 `"Non-domestic employees"', add
label define related_lbl 1253 `"Relative of employee"', add
label define related_lbl 1260 `"Other non-relatives (1990 includes employees)"', add
label define related_lbl 1270 `"Non-inmate 1990"', add
label define related_lbl 1281 `"Head of group quarters"', add
label define related_lbl 1282 `"Employees of group quarters"', add
label define related_lbl 1283 `"Relative of head, staff, or employee group quarters"', add
label define related_lbl 1284 `"Other non-inmate 1940-1959"', add
label define related_lbl 1291 `"Military"', add
label define related_lbl 1292 `"College dormitories"', add
label define related_lbl 1293 `"Residents of rooming houses"', add
label define related_lbl 1294 `"Other non-inmate 1980 (includes employees and non-inmates in"', add
label define related_lbl 1295 `"Other non-inmates 1960-1970 (includes employees)"', add
label define related_lbl 1296 `"Non-inmates in institutions"', add
label define related_lbl 1301 `"Institutional inmates"', add
label define related_lbl 9996 `"Unclassifiable"', add
label define related_lbl 9997 `"Unknown"', add
label define related_lbl 9998 `"Illegible"', add
label define related_lbl 9999 `"Missing"', add
label values related related_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define age_lbl 000 `"Less than 1 year old"'
label define age_lbl 001 `"1"', add
label define age_lbl 002 `"2"', add
label define age_lbl 003 `"3"', add
label define age_lbl 004 `"4"', add
label define age_lbl 005 `"5"', add
label define age_lbl 006 `"6"', add
label define age_lbl 007 `"7"', add
label define age_lbl 008 `"8"', add
label define age_lbl 009 `"9"', add
label define age_lbl 010 `"10"', add
label define age_lbl 011 `"11"', add
label define age_lbl 012 `"12"', add
label define age_lbl 013 `"13"', add
label define age_lbl 014 `"14"', add
label define age_lbl 015 `"15"', add
label define age_lbl 016 `"16"', add
label define age_lbl 017 `"17"', add
label define age_lbl 018 `"18"', add
label define age_lbl 019 `"19"', add
label define age_lbl 020 `"20"', add
label define age_lbl 021 `"21"', add
label define age_lbl 022 `"22"', add
label define age_lbl 023 `"23"', add
label define age_lbl 024 `"24"', add
label define age_lbl 025 `"25"', add
label define age_lbl 026 `"26"', add
label define age_lbl 027 `"27"', add
label define age_lbl 028 `"28"', add
label define age_lbl 029 `"29"', add
label define age_lbl 030 `"30"', add
label define age_lbl 031 `"31"', add
label define age_lbl 032 `"32"', add
label define age_lbl 033 `"33"', add
label define age_lbl 034 `"34"', add
label define age_lbl 035 `"35"', add
label define age_lbl 036 `"36"', add
label define age_lbl 037 `"37"', add
label define age_lbl 038 `"38"', add
label define age_lbl 039 `"39"', add
label define age_lbl 040 `"40"', add
label define age_lbl 041 `"41"', add
label define age_lbl 042 `"42"', add
label define age_lbl 043 `"43"', add
label define age_lbl 044 `"44"', add
label define age_lbl 045 `"45"', add
label define age_lbl 046 `"46"', add
label define age_lbl 047 `"47"', add
label define age_lbl 048 `"48"', add
label define age_lbl 049 `"49"', add
label define age_lbl 050 `"50"', add
label define age_lbl 051 `"51"', add
label define age_lbl 052 `"52"', add
label define age_lbl 053 `"53"', add
label define age_lbl 054 `"54"', add
label define age_lbl 055 `"55"', add
label define age_lbl 056 `"56"', add
label define age_lbl 057 `"57"', add
label define age_lbl 058 `"58"', add
label define age_lbl 059 `"59"', add
label define age_lbl 060 `"60"', add
label define age_lbl 061 `"61"', add
label define age_lbl 062 `"62"', add
label define age_lbl 063 `"63"', add
label define age_lbl 064 `"64"', add
label define age_lbl 065 `"65"', add
label define age_lbl 066 `"66"', add
label define age_lbl 067 `"67"', add
label define age_lbl 068 `"68"', add
label define age_lbl 069 `"69"', add
label define age_lbl 070 `"70"', add
label define age_lbl 071 `"71"', add
label define age_lbl 072 `"72"', add
label define age_lbl 073 `"73"', add
label define age_lbl 074 `"74"', add
label define age_lbl 075 `"75"', add
label define age_lbl 076 `"76"', add
label define age_lbl 077 `"77"', add
label define age_lbl 078 `"78"', add
label define age_lbl 079 `"79"', add
label define age_lbl 080 `"80"', add
label define age_lbl 081 `"81"', add
label define age_lbl 082 `"82"', add
label define age_lbl 083 `"83"', add
label define age_lbl 084 `"84"', add
label define age_lbl 085 `"85"', add
label define age_lbl 086 `"86"', add
label define age_lbl 087 `"87"', add
label define age_lbl 088 `"88"', add
label define age_lbl 089 `"89"', add
label define age_lbl 090 `"90 (90+ in 1980 and 1990)"', add
label define age_lbl 091 `"91"', add
label define age_lbl 092 `"92"', add
label define age_lbl 093 `"93"', add
label define age_lbl 094 `"94"', add
label define age_lbl 095 `"95"', add
label define age_lbl 096 `"96"', add
label define age_lbl 097 `"97"', add
label define age_lbl 098 `"98"', add
label define age_lbl 099 `"99"', add
label define age_lbl 100 `"100 (100+ in 1960-1970)"', add
label define age_lbl 101 `"101"', add
label define age_lbl 102 `"102"', add
label define age_lbl 103 `"103"', add
label define age_lbl 104 `"104"', add
label define age_lbl 105 `"105"', add
label define age_lbl 106 `"106"', add
label define age_lbl 107 `"107"', add
label define age_lbl 108 `"108"', add
label define age_lbl 109 `"109"', add
label define age_lbl 110 `"110"', add
label define age_lbl 111 `"111"', add
label define age_lbl 112 `"112 (112+ in the 1980 internal data)"', add
label define age_lbl 113 `"113"', add
label define age_lbl 114 `"114"', add
label define age_lbl 115 `"115 (115+ in the 1990 internal data)"', add
label define age_lbl 116 `"116"', add
label define age_lbl 117 `"117"', add
label define age_lbl 118 `"118"', add
label define age_lbl 119 `"119"', add
label define age_lbl 120 `"120"', add
label define age_lbl 121 `"121"', add
label define age_lbl 122 `"122"', add
label define age_lbl 123 `"123"', add
label define age_lbl 124 `"124"', add
label define age_lbl 125 `"125"', add
label define age_lbl 126 `"126"', add
label define age_lbl 129 `"129"', add
label define age_lbl 130 `"130"', add
label define age_lbl 135 `"135"', add
label values age age_lbl

label define marst_lbl 1 `"Married, spouse present"'
label define marst_lbl 2 `"Married, spouse absent"', add
label define marst_lbl 3 `"Separated"', add
label define marst_lbl 4 `"Divorced"', add
label define marst_lbl 5 `"Widowed"', add
label define marst_lbl 6 `"Never married/single"', add
label values marst marst_lbl

label define race_lbl 1 `"White"'
label define race_lbl 2 `"Black/African American/Negro"', add
label define race_lbl 3 `"American Indian or Alaska Native"', add
label define race_lbl 4 `"Chinese"', add
label define race_lbl 5 `"Japanese"', add
label define race_lbl 6 `"Other Asian or Pacific Islander"', add
label define race_lbl 7 `"Other race, nec"', add
label define race_lbl 8 `"Two major races"', add
label define race_lbl 9 `"Three or more major races"', add
label values race race_lbl

label define raced_lbl 100 `"White"'
label define raced_lbl 110 `"Spanish write_in"', add
label define raced_lbl 120 `"Blank (white) (1850)"', add
label define raced_lbl 130 `"Portuguese"', add
label define raced_lbl 140 `"Mexican (1930)"', add
label define raced_lbl 150 `"Puerto Rican (1910 Hawaii)"', add
label define raced_lbl 200 `"Black/African American/Negro"', add
label define raced_lbl 210 `"Mulatto"', add
label define raced_lbl 300 `"American Indian/Alaska Native"', add
label define raced_lbl 302 `"Apache"', add
label define raced_lbl 303 `"Blackfoot"', add
label define raced_lbl 304 `"Cherokee"', add
label define raced_lbl 305 `"Cheyenne"', add
label define raced_lbl 306 `"Chickasaw"', add
label define raced_lbl 307 `"Chippewa"', add
label define raced_lbl 308 `"Choctaw"', add
label define raced_lbl 309 `"Comanche"', add
label define raced_lbl 310 `"Creek"', add
label define raced_lbl 311 `"Crow"', add
label define raced_lbl 312 `"Iroquois"', add
label define raced_lbl 313 `"Kiowa"', add
label define raced_lbl 314 `"Lumbee"', add
label define raced_lbl 315 `"Navajo"', add
label define raced_lbl 316 `"Osage"', add
label define raced_lbl 317 `"Paiute"', add
label define raced_lbl 318 `"Pima"', add
label define raced_lbl 319 `"Potawatomi"', add
label define raced_lbl 320 `"Pueblo"', add
label define raced_lbl 321 `"Seminole"', add
label define raced_lbl 322 `"Shoshone"', add
label define raced_lbl 323 `"Sioux"', add
label define raced_lbl 324 `"Tlingit (Tlingit_Haida, 2000/ACS)"', add
label define raced_lbl 325 `"Tohono O Odham"', add
label define raced_lbl 326 `"All other tribes (1990)"', add
label define raced_lbl 328 `"Hopi"', add
label define raced_lbl 329 `"Central American Indian"', add
label define raced_lbl 330 `"Spanish American Indian"', add
label define raced_lbl 350 `"Delaware"', add
label define raced_lbl 351 `"Latin American Indian"', add
label define raced_lbl 352 `"Puget Sound Salish"', add
label define raced_lbl 353 `"Yakama"', add
label define raced_lbl 354 `"Yaqui"', add
label define raced_lbl 355 `"Colville"', add
label define raced_lbl 356 `"Houma"', add
label define raced_lbl 357 `"Menominee"', add
label define raced_lbl 358 `"Yuman"', add
label define raced_lbl 359 `"South American Indian"', add
label define raced_lbl 360 `"Mexican American Indian"', add
label define raced_lbl 361 `"Other Amer. Indian tribe (2000,ACS)"', add
label define raced_lbl 362 `"2+ Amer. Indian tribes (2000,ACS)"', add
label define raced_lbl 370 `"Alaskan Athabaskan"', add
label define raced_lbl 371 `"Aleut"', add
label define raced_lbl 372 `"Eskimo"', add
label define raced_lbl 373 `"Alaskan mixed"', add
label define raced_lbl 374 `"Inupiat"', add
label define raced_lbl 375 `"Yup'ik"', add
label define raced_lbl 379 `"Other Alaska Native tribe(s) (2000,ACS)"', add
label define raced_lbl 398 `"Both Am. Ind. and Alaska Native (2000,ACS)"', add
label define raced_lbl 399 `"Tribe not specified"', add
label define raced_lbl 400 `"Chinese"', add
label define raced_lbl 410 `"Taiwanese"', add
label define raced_lbl 420 `"Chinese and Taiwanese"', add
label define raced_lbl 500 `"Japanese"', add
label define raced_lbl 600 `"Filipino"', add
label define raced_lbl 610 `"Asian Indian (Hindu 1920_1940)"', add
label define raced_lbl 620 `"Korean"', add
label define raced_lbl 630 `"Hawaiian"', add
label define raced_lbl 631 `"Hawaiian and Asian (1900,1920)"', add
label define raced_lbl 632 `"Hawaiian and European (1900,1920)"', add
label define raced_lbl 634 `"Hawaiian mixed"', add
label define raced_lbl 640 `"Vietnamese"', add
label define raced_lbl 641 `"Bhutanese"', add
label define raced_lbl 642 `"Mongolian"', add
label define raced_lbl 643 `"Nepalese"', add
label define raced_lbl 650 `"Other Asian or Pacific Islander (1920,1980)"', add
label define raced_lbl 651 `"Asian only (CPS)"', add
label define raced_lbl 652 `"Pacific Islander only (CPS)"', add
label define raced_lbl 653 `"Asian or Pacific Islander, n.s. (1990 Internal Census files)"', add
label define raced_lbl 660 `"Cambodian"', add
label define raced_lbl 661 `"Hmong"', add
label define raced_lbl 662 `"Laotian"', add
label define raced_lbl 663 `"Thai"', add
label define raced_lbl 664 `"Bangladeshi"', add
label define raced_lbl 665 `"Burmese"', add
label define raced_lbl 666 `"Indonesian"', add
label define raced_lbl 667 `"Malaysian"', add
label define raced_lbl 668 `"Okinawan"', add
label define raced_lbl 669 `"Pakistani"', add
label define raced_lbl 670 `"Sri Lankan"', add
label define raced_lbl 671 `"Other Asian, n.e.c."', add
label define raced_lbl 672 `"Asian, not specified"', add
label define raced_lbl 673 `"Chinese and Japanese"', add
label define raced_lbl 674 `"Chinese and Filipino"', add
label define raced_lbl 675 `"Chinese and Vietnamese"', add
label define raced_lbl 676 `"Chinese and Asian write_in"', add
label define raced_lbl 677 `"Japanese and Filipino"', add
label define raced_lbl 678 `"Asian Indian and Asian write_in"', add
label define raced_lbl 679 `"Other Asian race combinations"', add
label define raced_lbl 680 `"Samoan"', add
label define raced_lbl 681 `"Tahitian"', add
label define raced_lbl 682 `"Tongan"', add
label define raced_lbl 683 `"Other Polynesian (1990)"', add
label define raced_lbl 684 `"1+ other Polynesian races (2000,ACS)"', add
label define raced_lbl 685 `"Guamanian/Chamorro"', add
label define raced_lbl 686 `"Northern Mariana Islander"', add
label define raced_lbl 687 `"Palauan"', add
label define raced_lbl 688 `"Other Micronesian (1990)"', add
label define raced_lbl 689 `"1+ other Micronesian races (2000,ACS)"', add
label define raced_lbl 690 `"Fijian"', add
label define raced_lbl 691 `"Other Melanesian (1990)"', add
label define raced_lbl 692 `"1+ other Melanesian races (2000,ACS)"', add
label define raced_lbl 698 `"2+ PI races from 2+ PI regions"', add
label define raced_lbl 699 `"Pacific Islander, n.s."', add
label define raced_lbl 700 `"Other race, n.e.c."', add
label define raced_lbl 801 `"White and Black"', add
label define raced_lbl 802 `"White and AIAN"', add
label define raced_lbl 810 `"White and Asian"', add
label define raced_lbl 811 `"White and Chinese"', add
label define raced_lbl 812 `"White and Japanese"', add
label define raced_lbl 813 `"White and Filipino"', add
label define raced_lbl 814 `"White and Asian Indian"', add
label define raced_lbl 815 `"White and Korean"', add
label define raced_lbl 816 `"White and Vietnamese"', add
label define raced_lbl 817 `"White and Asian write_in"', add
label define raced_lbl 818 `"White and other Asian race(s)"', add
label define raced_lbl 819 `"White and two or more Asian groups"', add
label define raced_lbl 820 `"White and PI"', add
label define raced_lbl 821 `"White and Native Hawaiian"', add
label define raced_lbl 822 `"White and Samoan"', add
label define raced_lbl 823 `"White and Guamanian"', add
label define raced_lbl 824 `"White and PI write_in"', add
label define raced_lbl 825 `"White and other PI race(s)"', add
label define raced_lbl 826 `"White and other race write_in"', add
label define raced_lbl 827 `"White and other race, n.e.c."', add
label define raced_lbl 830 `"Black and AIAN"', add
label define raced_lbl 831 `"Black and Asian"', add
label define raced_lbl 832 `"Black and Chinese"', add
label define raced_lbl 833 `"Black and Japanese"', add
label define raced_lbl 834 `"Black and Filipino"', add
label define raced_lbl 835 `"Black and Asian Indian"', add
label define raced_lbl 836 `"Black and Korean"', add
label define raced_lbl 837 `"Black and Asian write_in"', add
label define raced_lbl 838 `"Black and other Asian race(s)"', add
label define raced_lbl 840 `"Black and PI"', add
label define raced_lbl 841 `"Black and PI write_in"', add
label define raced_lbl 842 `"Black and other PI race(s)"', add
label define raced_lbl 845 `"Black and other race write_in"', add
label define raced_lbl 850 `"AIAN and Asian"', add
label define raced_lbl 851 `"AIAN and Filipino (2000 1%)"', add
label define raced_lbl 852 `"AIAN and Asian Indian"', add
label define raced_lbl 853 `"AIAN and Asian write_in (2000 1%)"', add
label define raced_lbl 854 `"AIAN and other Asian race(s)"', add
label define raced_lbl 855 `"AIAN and PI"', add
label define raced_lbl 856 `"AIAN and other race write_in"', add
label define raced_lbl 860 `"Asian and PI"', add
label define raced_lbl 861 `"Chinese and Hawaiian"', add
label define raced_lbl 862 `"Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 863 `"Japanese and Hawaiian (2000 1%)"', add
label define raced_lbl 864 `"Filipino and Hawaiian"', add
label define raced_lbl 865 `"Filipino and PI write_in"', add
label define raced_lbl 866 `"Asian Indian and PI write_in (2000 1%)"', add
label define raced_lbl 867 `"Asian write_in and PI write_in"', add
label define raced_lbl 868 `"Other Asian race(s) and PI race(s)"', add
label define raced_lbl 869 `"Japanese and Korean (ACS)"', add
label define raced_lbl 880 `"Asian and other race write_in"', add
label define raced_lbl 881 `"Chinese and other race write_in"', add
label define raced_lbl 882 `"Japanese and other race write_in"', add
label define raced_lbl 883 `"Filipino and other race write_in"', add
label define raced_lbl 884 `"Asian Indian and other race write_in"', add
label define raced_lbl 885 `"Asian write_in and other race write_in"', add
label define raced_lbl 886 `"Other Asian race(s) and other race write_in"', add
label define raced_lbl 887 `"Chinese and Korean"', add
label define raced_lbl 890 `"PI and other race write_in:"', add
label define raced_lbl 891 `"PI write_in and other race write_in"', add
label define raced_lbl 892 `"Other PI race(s) and other race write_in"', add
label define raced_lbl 893 `"Native Hawaiian or PI other race(s)"', add
label define raced_lbl 899 `"API and other race write_in"', add
label define raced_lbl 901 `"White, Black, AIAN"', add
label define raced_lbl 902 `"White, Black, Asian"', add
label define raced_lbl 903 `"White, Black, PI"', add
label define raced_lbl 904 `"White, Black, other race write_in"', add
label define raced_lbl 905 `"White, AIAN, Asian"', add
label define raced_lbl 906 `"White, AIAN, PI"', add
label define raced_lbl 907 `"White, AIAN, other race write_in"', add
label define raced_lbl 910 `"White, Asian, PI"', add
label define raced_lbl 911 `"White, Chinese, Hawaiian"', add
label define raced_lbl 912 `"White, Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 913 `"White, Japanese, Hawaiian (2000 1%)"', add
label define raced_lbl 914 `"White, Filipino, Hawaiian"', add
label define raced_lbl 915 `"Other White, Asian race(s), PI race(s)"', add
label define raced_lbl 916 `"White, AIAN and Filipino"', add
label define raced_lbl 917 `"White, Black, and Filipino"', add
label define raced_lbl 920 `"White, Asian, other race write_in"', add
label define raced_lbl 921 `"White, Filipino, other race write_in (2000 1%)"', add
label define raced_lbl 922 `"White, Asian write_in, other race write_in (2000 1%)"', add
label define raced_lbl 923 `"Other White, Asian race(s), other race write_in (2000 1%)"', add
label define raced_lbl 925 `"White, PI, other race write_in"', add
label define raced_lbl 930 `"Black, AIAN, Asian"', add
label define raced_lbl 931 `"Black, AIAN, PI"', add
label define raced_lbl 932 `"Black, AIAN, other race write_in"', add
label define raced_lbl 933 `"Black, Asian, PI"', add
label define raced_lbl 934 `"Black, Asian, other race write_in"', add
label define raced_lbl 935 `"Black, PI, other race write_in"', add
label define raced_lbl 940 `"AIAN, Asian, PI"', add
label define raced_lbl 941 `"AIAN, Asian, other race write_in"', add
label define raced_lbl 942 `"AIAN, PI, other race write_in"', add
label define raced_lbl 943 `"Asian, PI, other race write_in"', add
label define raced_lbl 944 `"Asian (Chinese, Japanese, Korean, Vietnamese); and Native Hawaiian or PI; and Other"', add
label define raced_lbl 949 `"2 or 3 races (CPS)"', add
label define raced_lbl 950 `"White, Black, AIAN, Asian"', add
label define raced_lbl 951 `"White, Black, AIAN, PI"', add
label define raced_lbl 952 `"White, Black, AIAN, other race write_in"', add
label define raced_lbl 953 `"White, Black, Asian, PI"', add
label define raced_lbl 954 `"White, Black, Asian, other race write_in"', add
label define raced_lbl 955 `"White, Black, PI, other race write_in"', add
label define raced_lbl 960 `"White, AIAN, Asian, PI"', add
label define raced_lbl 961 `"White, AIAN, Asian, other race write_in"', add
label define raced_lbl 962 `"White, AIAN, PI, other race write_in"', add
label define raced_lbl 963 `"White, Asian, PI, other race write_in"', add
label define raced_lbl 964 `"White, Chinese, Japanese, Native Hawaiian"', add
label define raced_lbl 970 `"Black, AIAN, Asian, PI"', add
label define raced_lbl 971 `"Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 972 `"Black, AIAN, PI, other race write_in"', add
label define raced_lbl 973 `"Black, Asian, PI, other race write_in"', add
label define raced_lbl 974 `"AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 975 `"AIAN, Asian, PI, Hawaiian other race write_in"', add
label define raced_lbl 976 `"Two specified Asian  (Chinese and other Asian, Chinese and Japanese, Japanese and other Asian, Korean and other Asian); Native Hawaiian/PI; and Other Race"', add
label define raced_lbl 980 `"White, Black, AIAN, Asian, PI"', add
label define raced_lbl 981 `"White, Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 982 `"White, Black, AIAN, PI, other race write_in"', add
label define raced_lbl 983 `"White, Black, Asian, PI, other race write_in"', add
label define raced_lbl 984 `"White, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 985 `"Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 986 `"Black, AIAN, Asian, PI, Hawaiian, other race write_in"', add
label define raced_lbl 989 `"4 or 5 races (CPS)"', add
label define raced_lbl 990 `"White, Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 991 `"White race; Some other race; Black or African American race and/or American Indian and Alaska Native race and/or Asian groups and/or Native Hawaiian and Other Pacific Islander groups"', add
label define raced_lbl 996 `"2+ races, n.e.c. (CPS)"', add
label values raced raced_lbl

label define hispan_lbl 0 `"Not Hispanic"'
label define hispan_lbl 1 `"Mexican"', add
label define hispan_lbl 2 `"Puerto Rican"', add
label define hispan_lbl 3 `"Cuban"', add
label define hispan_lbl 4 `"Other"', add
label define hispan_lbl 9 `"Not Reported"', add
label values hispan hispan_lbl

label define hispand_lbl 000 `"Not Hispanic"'
label define hispand_lbl 100 `"Mexican"', add
label define hispand_lbl 102 `"Mexican American"', add
label define hispand_lbl 103 `"Mexicano/Mexicana"', add
label define hispand_lbl 104 `"Chicano/Chicana"', add
label define hispand_lbl 105 `"La Raza"', add
label define hispand_lbl 106 `"Mexican American Indian"', add
label define hispand_lbl 107 `"Mexico"', add
label define hispand_lbl 200 `"Puerto Rican"', add
label define hispand_lbl 300 `"Cuban"', add
label define hispand_lbl 401 `"Central American Indian"', add
label define hispand_lbl 402 `"Canal Zone"', add
label define hispand_lbl 411 `"Costa Rican"', add
label define hispand_lbl 412 `"Guatemalan"', add
label define hispand_lbl 413 `"Honduran"', add
label define hispand_lbl 414 `"Nicaraguan"', add
label define hispand_lbl 415 `"Panamanian"', add
label define hispand_lbl 416 `"Salvadoran"', add
label define hispand_lbl 417 `"Central American, n.e.c."', add
label define hispand_lbl 420 `"Argentinean"', add
label define hispand_lbl 421 `"Bolivian"', add
label define hispand_lbl 422 `"Chilean"', add
label define hispand_lbl 423 `"Colombian"', add
label define hispand_lbl 424 `"Ecuadorian"', add
label define hispand_lbl 425 `"Paraguayan"', add
label define hispand_lbl 426 `"Peruvian"', add
label define hispand_lbl 427 `"Uruguayan"', add
label define hispand_lbl 428 `"Venezuelan"', add
label define hispand_lbl 429 `"South American Indian"', add
label define hispand_lbl 430 `"Criollo"', add
label define hispand_lbl 431 `"South American, n.e.c."', add
label define hispand_lbl 450 `"Spaniard"', add
label define hispand_lbl 451 `"Andalusian"', add
label define hispand_lbl 452 `"Asturian"', add
label define hispand_lbl 453 `"Castillian"', add
label define hispand_lbl 454 `"Catalonian"', add
label define hispand_lbl 455 `"Balearic Islander"', add
label define hispand_lbl 456 `"Gallego"', add
label define hispand_lbl 457 `"Valencian"', add
label define hispand_lbl 458 `"Canarian"', add
label define hispand_lbl 459 `"Spanish Basque"', add
label define hispand_lbl 460 `"Dominican"', add
label define hispand_lbl 465 `"Latin American"', add
label define hispand_lbl 470 `"Hispanic"', add
label define hispand_lbl 480 `"Spanish"', add
label define hispand_lbl 490 `"Californio"', add
label define hispand_lbl 491 `"Tejano"', add
label define hispand_lbl 492 `"Nuevo Mexicano"', add
label define hispand_lbl 493 `"Spanish American"', add
label define hispand_lbl 494 `"Spanish American Indian"', add
label define hispand_lbl 495 `"Meso American Indian"', add
label define hispand_lbl 496 `"Mestizo"', add
label define hispand_lbl 498 `"Other, n.s."', add
label define hispand_lbl 499 `"Other, n.e.c."', add
label define hispand_lbl 900 `"Not Reported"', add
label values hispand hispand_lbl

label define bpl_lbl 001 `"Alabama"'
label define bpl_lbl 002 `"Alaska"', add
label define bpl_lbl 004 `"Arizona"', add
label define bpl_lbl 005 `"Arkansas"', add
label define bpl_lbl 006 `"California"', add
label define bpl_lbl 008 `"Colorado"', add
label define bpl_lbl 009 `"Connecticut"', add
label define bpl_lbl 010 `"Delaware"', add
label define bpl_lbl 011 `"District of Columbia"', add
label define bpl_lbl 012 `"Florida"', add
label define bpl_lbl 013 `"Georgia"', add
label define bpl_lbl 015 `"Hawaii"', add
label define bpl_lbl 016 `"Idaho"', add
label define bpl_lbl 017 `"Illinois"', add
label define bpl_lbl 018 `"Indiana"', add
label define bpl_lbl 019 `"Iowa"', add
label define bpl_lbl 020 `"Kansas"', add
label define bpl_lbl 021 `"Kentucky"', add
label define bpl_lbl 022 `"Louisiana"', add
label define bpl_lbl 023 `"Maine"', add
label define bpl_lbl 024 `"Maryland"', add
label define bpl_lbl 025 `"Massachusetts"', add
label define bpl_lbl 026 `"Michigan"', add
label define bpl_lbl 027 `"Minnesota"', add
label define bpl_lbl 028 `"Mississippi"', add
label define bpl_lbl 029 `"Missouri"', add
label define bpl_lbl 030 `"Montana"', add
label define bpl_lbl 031 `"Nebraska"', add
label define bpl_lbl 032 `"Nevada"', add
label define bpl_lbl 033 `"New Hampshire"', add
label define bpl_lbl 034 `"New Jersey"', add
label define bpl_lbl 035 `"New Mexico"', add
label define bpl_lbl 036 `"New York"', add
label define bpl_lbl 037 `"North Carolina"', add
label define bpl_lbl 038 `"North Dakota"', add
label define bpl_lbl 039 `"Ohio"', add
label define bpl_lbl 040 `"Oklahoma"', add
label define bpl_lbl 041 `"Oregon"', add
label define bpl_lbl 042 `"Pennsylvania"', add
label define bpl_lbl 044 `"Rhode Island"', add
label define bpl_lbl 045 `"South Carolina"', add
label define bpl_lbl 046 `"South Dakota"', add
label define bpl_lbl 047 `"Tennessee"', add
label define bpl_lbl 048 `"Texas"', add
label define bpl_lbl 049 `"Utah"', add
label define bpl_lbl 050 `"Vermont"', add
label define bpl_lbl 051 `"Virginia"', add
label define bpl_lbl 053 `"Washington"', add
label define bpl_lbl 054 `"West Virginia"', add
label define bpl_lbl 055 `"Wisconsin"', add
label define bpl_lbl 056 `"Wyoming"', add
label define bpl_lbl 090 `"Native American"', add
label define bpl_lbl 099 `"United States, ns"', add
label define bpl_lbl 100 `"American Samoa"', add
label define bpl_lbl 105 `"Guam"', add
label define bpl_lbl 110 `"Puerto Rico"', add
label define bpl_lbl 115 `"U.S. Virgin Islands"', add
label define bpl_lbl 120 `"Other US Possessions"', add
label define bpl_lbl 150 `"Canada"', add
label define bpl_lbl 155 `"St. Pierre and Miquelon"', add
label define bpl_lbl 160 `"Atlantic Islands"', add
label define bpl_lbl 199 `"North America, ns"', add
label define bpl_lbl 200 `"Mexico"', add
label define bpl_lbl 210 `"Central America"', add
label define bpl_lbl 250 `"Cuba"', add
label define bpl_lbl 260 `"West Indies"', add
label define bpl_lbl 299 `"Americas, n.s."', add
label define bpl_lbl 300 `"SOUTH AMERICA"', add
label define bpl_lbl 400 `"Denmark"', add
label define bpl_lbl 401 `"Finland"', add
label define bpl_lbl 402 `"Iceland"', add
label define bpl_lbl 403 `"Lapland, n.s."', add
label define bpl_lbl 404 `"Norway"', add
label define bpl_lbl 405 `"Sweden"', add
label define bpl_lbl 410 `"England"', add
label define bpl_lbl 411 `"Scotland"', add
label define bpl_lbl 412 `"Wales"', add
label define bpl_lbl 413 `"United Kingdom, ns"', add
label define bpl_lbl 414 `"Ireland"', add
label define bpl_lbl 419 `"Northern Europe, ns"', add
label define bpl_lbl 420 `"Belgium"', add
label define bpl_lbl 421 `"France"', add
label define bpl_lbl 422 `"Liechtenstein"', add
label define bpl_lbl 423 `"Luxembourg"', add
label define bpl_lbl 424 `"Monaco"', add
label define bpl_lbl 425 `"Netherlands"', add
label define bpl_lbl 426 `"Switzerland"', add
label define bpl_lbl 429 `"Western Europe, ns"', add
label define bpl_lbl 430 `"Albania"', add
label define bpl_lbl 431 `"Andorra"', add
label define bpl_lbl 432 `"Gibraltar"', add
label define bpl_lbl 433 `"Greece"', add
label define bpl_lbl 434 `"Italy"', add
label define bpl_lbl 435 `"Malta"', add
label define bpl_lbl 436 `"Portugal"', add
label define bpl_lbl 437 `"San Marino"', add
label define bpl_lbl 438 `"Spain"', add
label define bpl_lbl 439 `"Vatican City"', add
label define bpl_lbl 440 `"Southern Europe, ns"', add
label define bpl_lbl 450 `"Austria"', add
label define bpl_lbl 451 `"Bulgaria"', add
label define bpl_lbl 452 `"Czechoslovakia"', add
label define bpl_lbl 453 `"Germany"', add
label define bpl_lbl 454 `"Hungary"', add
label define bpl_lbl 455 `"Poland"', add
label define bpl_lbl 456 `"Romania"', add
label define bpl_lbl 457 `"Yugoslavia"', add
label define bpl_lbl 458 `"Central Europe, ns"', add
label define bpl_lbl 459 `"Eastern Europe, ns"', add
label define bpl_lbl 460 `"Estonia"', add
label define bpl_lbl 461 `"Latvia"', add
label define bpl_lbl 462 `"Lithuania"', add
label define bpl_lbl 463 `"Baltic States, ns"', add
label define bpl_lbl 465 `"Other USSR/Russia"', add
label define bpl_lbl 499 `"Europe, ns"', add
label define bpl_lbl 500 `"China"', add
label define bpl_lbl 501 `"Japan"', add
label define bpl_lbl 502 `"Korea"', add
label define bpl_lbl 509 `"East Asia, ns"', add
label define bpl_lbl 510 `"Brunei"', add
label define bpl_lbl 511 `"Cambodia (Kampuchea)"', add
label define bpl_lbl 512 `"Indonesia"', add
label define bpl_lbl 513 `"Laos"', add
label define bpl_lbl 514 `"Malaysia"', add
label define bpl_lbl 515 `"Philippines"', add
label define bpl_lbl 516 `"Singapore"', add
label define bpl_lbl 517 `"Thailand"', add
label define bpl_lbl 518 `"Vietnam"', add
label define bpl_lbl 519 `"Southeast Asia, ns"', add
label define bpl_lbl 520 `"Afghanistan"', add
label define bpl_lbl 521 `"India"', add
label define bpl_lbl 522 `"Iran"', add
label define bpl_lbl 523 `"Maldives"', add
label define bpl_lbl 524 `"Nepal"', add
label define bpl_lbl 530 `"Bahrain"', add
label define bpl_lbl 531 `"Cyprus"', add
label define bpl_lbl 532 `"Iraq"', add
label define bpl_lbl 533 `"Iraq/Saudi Arabia"', add
label define bpl_lbl 534 `"Israel/Palestine"', add
label define bpl_lbl 535 `"Jordan"', add
label define bpl_lbl 536 `"Kuwait"', add
label define bpl_lbl 537 `"Lebanon"', add
label define bpl_lbl 538 `"Oman"', add
label define bpl_lbl 539 `"Qatar"', add
label define bpl_lbl 540 `"Saudi Arabia"', add
label define bpl_lbl 541 `"Syria"', add
label define bpl_lbl 542 `"Turkey"', add
label define bpl_lbl 543 `"United Arab Emirates"', add
label define bpl_lbl 544 `"Yemen Arab Republic (North)"', add
label define bpl_lbl 545 `"Yemen, PDR (South)"', add
label define bpl_lbl 546 `"Persian Gulf States, n.s."', add
label define bpl_lbl 547 `"Middle East, ns"', add
label define bpl_lbl 548 `"Southwest Asia, nec/ns"', add
label define bpl_lbl 549 `"Asia Minor, ns"', add
label define bpl_lbl 550 `"South Asia, nec"', add
label define bpl_lbl 599 `"Asia, nec/ns"', add
label define bpl_lbl 600 `"AFRICA"', add
label define bpl_lbl 700 `"Australia and New Zealand"', add
label define bpl_lbl 710 `"Pacific Islands"', add
label define bpl_lbl 800 `"Antarctica, ns/nec"', add
label define bpl_lbl 900 `"Abroad (unknown) or at sea"', add
label define bpl_lbl 950 `"Other n.e.c."', add
label define bpl_lbl 999 `"Missing/blank"', add
label values bpl bpl_lbl

label define bpld_lbl 00100 `"Alabama"'
label define bpld_lbl 00200 `"Alaska"', add
label define bpld_lbl 00400 `"Arizona"', add
label define bpld_lbl 00500 `"Arkansas"', add
label define bpld_lbl 00600 `"California"', add
label define bpld_lbl 00800 `"Colorado"', add
label define bpld_lbl 00900 `"Connecticut"', add
label define bpld_lbl 01000 `"Delaware"', add
label define bpld_lbl 01100 `"District of Columbia"', add
label define bpld_lbl 01200 `"Florida"', add
label define bpld_lbl 01300 `"Georgia"', add
label define bpld_lbl 01500 `"Hawaii"', add
label define bpld_lbl 01600 `"Idaho"', add
label define bpld_lbl 01610 `"Idaho Territory"', add
label define bpld_lbl 01700 `"Illinois"', add
label define bpld_lbl 01800 `"Indiana"', add
label define bpld_lbl 01900 `"Iowa"', add
label define bpld_lbl 02000 `"Kansas"', add
label define bpld_lbl 02100 `"Kentucky"', add
label define bpld_lbl 02200 `"Louisiana"', add
label define bpld_lbl 02300 `"Maine"', add
label define bpld_lbl 02400 `"Maryland"', add
label define bpld_lbl 02500 `"Massachusetts"', add
label define bpld_lbl 02600 `"Michigan"', add
label define bpld_lbl 02700 `"Minnesota"', add
label define bpld_lbl 02800 `"Mississippi"', add
label define bpld_lbl 02900 `"Missouri"', add
label define bpld_lbl 03000 `"Montana"', add
label define bpld_lbl 03100 `"Nebraska"', add
label define bpld_lbl 03200 `"Nevada"', add
label define bpld_lbl 03300 `"New Hampshire"', add
label define bpld_lbl 03400 `"New Jersey"', add
label define bpld_lbl 03500 `"New Mexico"', add
label define bpld_lbl 03510 `"New Mexico Territory"', add
label define bpld_lbl 03600 `"New York"', add
label define bpld_lbl 03700 `"North Carolina"', add
label define bpld_lbl 03800 `"North Dakota"', add
label define bpld_lbl 03900 `"Ohio"', add
label define bpld_lbl 04000 `"Oklahoma"', add
label define bpld_lbl 04010 `"Indian Territory"', add
label define bpld_lbl 04100 `"Oregon"', add
label define bpld_lbl 04200 `"Pennsylvania"', add
label define bpld_lbl 04400 `"Rhode Island"', add
label define bpld_lbl 04500 `"South Carolina"', add
label define bpld_lbl 04600 `"South Dakota"', add
label define bpld_lbl 04610 `"Dakota Territory"', add
label define bpld_lbl 04700 `"Tennessee"', add
label define bpld_lbl 04800 `"Texas"', add
label define bpld_lbl 04900 `"Utah"', add
label define bpld_lbl 04910 `"Utah Territory"', add
label define bpld_lbl 05000 `"Vermont"', add
label define bpld_lbl 05100 `"Virginia"', add
label define bpld_lbl 05300 `"Washington"', add
label define bpld_lbl 05400 `"West Virginia"', add
label define bpld_lbl 05500 `"Wisconsin"', add
label define bpld_lbl 05600 `"Wyoming"', add
label define bpld_lbl 05610 `"Wyoming Territory"', add
label define bpld_lbl 09000 `"Native American"', add
label define bpld_lbl 09900 `"United States, ns"', add
label define bpld_lbl 10000 `"American Samoa"', add
label define bpld_lbl 10010 `"Samoa, 1940-1950"', add
label define bpld_lbl 10500 `"Guam"', add
label define bpld_lbl 11000 `"Puerto Rico"', add
label define bpld_lbl 11500 `"U.S. Virgin Islands"', add
label define bpld_lbl 11510 `"St. Croix"', add
label define bpld_lbl 11520 `"St. John"', add
label define bpld_lbl 11530 `"St. Thomas"', add
label define bpld_lbl 12000 `"Other US Possessions:"', add
label define bpld_lbl 12010 `"Johnston Atoll"', add
label define bpld_lbl 12020 `"Midway Islands"', add
label define bpld_lbl 12030 `"Wake Island"', add
label define bpld_lbl 12040 `"Other US Caribbean Islands"', add
label define bpld_lbl 12041 `"Navassa Island"', add
label define bpld_lbl 12050 `"Other US Pacific Islands"', add
label define bpld_lbl 12051 `"Baker Island"', add
label define bpld_lbl 12052 `"Howland Island"', add
label define bpld_lbl 12053 `"Jarvis Island"', add
label define bpld_lbl 12054 `"Kingman Reef"', add
label define bpld_lbl 12055 `"Palmyra Atoll"', add
label define bpld_lbl 12056 `"Canton and Enderbury Island"', add
label define bpld_lbl 12090 `"US outlying areas, ns"', add
label define bpld_lbl 12091 `"US possessions, ns"', add
label define bpld_lbl 12092 `"US territory, ns"', add
label define bpld_lbl 15000 `"Canada"', add
label define bpld_lbl 15010 `"English Canada"', add
label define bpld_lbl 15011 `"British Columbia"', add
label define bpld_lbl 15013 `"Alberta"', add
label define bpld_lbl 15015 `"Saskatchewan"', add
label define bpld_lbl 15017 `"Northwest"', add
label define bpld_lbl 15019 `"Ruperts Land"', add
label define bpld_lbl 15020 `"Manitoba"', add
label define bpld_lbl 15021 `"Red River"', add
label define bpld_lbl 15030 `"Ontario/Upper Canada"', add
label define bpld_lbl 15031 `"Upper Canada"', add
label define bpld_lbl 15032 `"Canada West"', add
label define bpld_lbl 15040 `"New Brunswick"', add
label define bpld_lbl 15050 `"Nova Scotia"', add
label define bpld_lbl 15051 `"Cape Breton"', add
label define bpld_lbl 15052 `"Halifax"', add
label define bpld_lbl 15060 `"Prince Edward Island"', add
label define bpld_lbl 15070 `"Newfoundland"', add
label define bpld_lbl 15080 `"French Canada"', add
label define bpld_lbl 15081 `"Quebec"', add
label define bpld_lbl 15082 `"Lower Canada"', add
label define bpld_lbl 15083 `"Canada East"', add
label define bpld_lbl 15500 `"St. Pierre and Miquelon"', add
label define bpld_lbl 16000 `"Atlantic Islands"', add
label define bpld_lbl 16010 `"Bermuda"', add
label define bpld_lbl 16020 `"Cape Verde"', add
label define bpld_lbl 16030 `"Falkland Islands"', add
label define bpld_lbl 16040 `"Greenland"', add
label define bpld_lbl 16050 `"St. Helena and Ascension"', add
label define bpld_lbl 16060 `"Canary Islands"', add
label define bpld_lbl 19900 `"North America, ns"', add
label define bpld_lbl 20000 `"Mexico"', add
label define bpld_lbl 21000 `"Central America"', add
label define bpld_lbl 21010 `"Belize/British Honduras"', add
label define bpld_lbl 21020 `"Costa Rica"', add
label define bpld_lbl 21030 `"El Salvador"', add
label define bpld_lbl 21040 `"Guatemala"', add
label define bpld_lbl 21050 `"Honduras"', add
label define bpld_lbl 21060 `"Nicaragua"', add
label define bpld_lbl 21070 `"Panama"', add
label define bpld_lbl 21071 `"Canal Zone"', add
label define bpld_lbl 21090 `"Central America, ns"', add
label define bpld_lbl 25000 `"Cuba"', add
label define bpld_lbl 26000 `"West Indies"', add
label define bpld_lbl 26010 `"Dominican Republic"', add
label define bpld_lbl 26020 `"Haiti"', add
label define bpld_lbl 26030 `"Jamaica"', add
label define bpld_lbl 26040 `"British West Indies"', add
label define bpld_lbl 26041 `"Anguilla"', add
label define bpld_lbl 26042 `"Antigua-Barbuda"', add
label define bpld_lbl 26043 `"Bahamas"', add
label define bpld_lbl 26044 `"Barbados"', add
label define bpld_lbl 26045 `"British Virgin Islands"', add
label define bpld_lbl 26046 `"Anegada"', add
label define bpld_lbl 26047 `"Cooper"', add
label define bpld_lbl 26048 `"Jost Van Dyke"', add
label define bpld_lbl 26049 `"Peter"', add
label define bpld_lbl 26050 `"Tortola"', add
label define bpld_lbl 26051 `"Virgin Gorda"', add
label define bpld_lbl 26052 `"Br. Virgin Islands, ns"', add
label define bpld_lbl 26053 `"Cayman Islands"', add
label define bpld_lbl 26054 `"Dominica"', add
label define bpld_lbl 26055 `"Grenada"', add
label define bpld_lbl 26056 `"Montserrat"', add
label define bpld_lbl 26057 `"St. Kitts-Nevis"', add
label define bpld_lbl 26058 `"St. Lucia"', add
label define bpld_lbl 26059 `"St. Vincent"', add
label define bpld_lbl 26060 `"Trinidad and Tobago"', add
label define bpld_lbl 26061 `"Turks and Caicos"', add
label define bpld_lbl 26069 `"Br. Virgin Islands, ns"', add
label define bpld_lbl 26070 `"Other West Indies"', add
label define bpld_lbl 26071 `"Aruba"', add
label define bpld_lbl 26072 `"Netherlands Antilles"', add
label define bpld_lbl 26073 `"Bonaire"', add
label define bpld_lbl 26074 `"Curacao"', add
label define bpld_lbl 26075 `"Dutch St. Maarten"', add
label define bpld_lbl 26076 `"Saba"', add
label define bpld_lbl 26077 `"St. Eustatius"', add
label define bpld_lbl 26079 `"Dutch Caribbean, ns"', add
label define bpld_lbl 26080 `"French St. Maarten"', add
label define bpld_lbl 26081 `"Guadeloupe"', add
label define bpld_lbl 26082 `"Martinique"', add
label define bpld_lbl 26083 `"St. Barthelemy"', add
label define bpld_lbl 26089 `"French Caribbean, ns"', add
label define bpld_lbl 26090 `"Antilles, ns"', add
label define bpld_lbl 26091 `"Caribbean, ns"', add
label define bpld_lbl 26092 `"Latin America, ns"', add
label define bpld_lbl 26093 `"Leeward Islands, ns"', add
label define bpld_lbl 26094 `"West Indies, ns"', add
label define bpld_lbl 26095 `"Windward Islands, ns"', add
label define bpld_lbl 29900 `"Americas, ns"', add
label define bpld_lbl 30000 `"South America"', add
label define bpld_lbl 30005 `"Argentina"', add
label define bpld_lbl 30010 `"Bolivia"', add
label define bpld_lbl 30015 `"Brazil"', add
label define bpld_lbl 30020 `"Chile"', add
label define bpld_lbl 30025 `"Colombia"', add
label define bpld_lbl 30030 `"Ecuador"', add
label define bpld_lbl 30035 `"French Guiana"', add
label define bpld_lbl 30040 `"Guyana/British Guiana"', add
label define bpld_lbl 30045 `"Paraguay"', add
label define bpld_lbl 30050 `"Peru"', add
label define bpld_lbl 30055 `"Suriname"', add
label define bpld_lbl 30060 `"Uruguay"', add
label define bpld_lbl 30065 `"Venezuela"', add
label define bpld_lbl 30090 `"South America, ns"', add
label define bpld_lbl 30091 `"South and Central America, n.s."', add
label define bpld_lbl 40000 `"Denmark"', add
label define bpld_lbl 40010 `"Faeroe Islands"', add
label define bpld_lbl 40100 `"Finland"', add
label define bpld_lbl 40200 `"Iceland"', add
label define bpld_lbl 40300 `"Lapland, ns"', add
label define bpld_lbl 40400 `"Norway"', add
label define bpld_lbl 40410 `"Svalbard and Jan Meyen"', add
label define bpld_lbl 40411 `"Svalbard"', add
label define bpld_lbl 40412 `"Jan Meyen"', add
label define bpld_lbl 40500 `"Sweden"', add
label define bpld_lbl 41000 `"England"', add
label define bpld_lbl 41010 `"Channel Islands"', add
label define bpld_lbl 41011 `"Guernsey"', add
label define bpld_lbl 41012 `"Jersey"', add
label define bpld_lbl 41020 `"Isle of Man"', add
label define bpld_lbl 41100 `"Scotland"', add
label define bpld_lbl 41200 `"Wales"', add
label define bpld_lbl 41300 `"United Kingdom, ns"', add
label define bpld_lbl 41400 `"Ireland"', add
label define bpld_lbl 41410 `"Northern Ireland"', add
label define bpld_lbl 41900 `"Northern Europe, ns"', add
label define bpld_lbl 42000 `"Belgium"', add
label define bpld_lbl 42100 `"France"', add
label define bpld_lbl 42110 `"Alsace-Lorraine"', add
label define bpld_lbl 42111 `"Alsace"', add
label define bpld_lbl 42112 `"Lorraine"', add
label define bpld_lbl 42200 `"Liechtenstein"', add
label define bpld_lbl 42300 `"Luxembourg"', add
label define bpld_lbl 42400 `"Monaco"', add
label define bpld_lbl 42500 `"Netherlands"', add
label define bpld_lbl 42600 `"Switzerland"', add
label define bpld_lbl 42900 `"Western Europe, ns"', add
label define bpld_lbl 43000 `"Albania"', add
label define bpld_lbl 43100 `"Andorra"', add
label define bpld_lbl 43200 `"Gibraltar"', add
label define bpld_lbl 43300 `"Greece"', add
label define bpld_lbl 43310 `"Dodecanese Islands"', add
label define bpld_lbl 43320 `"Turkey Greece"', add
label define bpld_lbl 43330 `"Macedonia"', add
label define bpld_lbl 43400 `"Italy"', add
label define bpld_lbl 43500 `"Malta"', add
label define bpld_lbl 43600 `"Portugal"', add
label define bpld_lbl 43610 `"Azores"', add
label define bpld_lbl 43620 `"Madeira Islands"', add
label define bpld_lbl 43630 `"Cape Verde Islands"', add
label define bpld_lbl 43640 `"St. Miguel"', add
label define bpld_lbl 43700 `"San Marino"', add
label define bpld_lbl 43800 `"Spain"', add
label define bpld_lbl 43900 `"Vatican City"', add
label define bpld_lbl 44000 `"Southern Europe, ns"', add
label define bpld_lbl 45000 `"Austria"', add
label define bpld_lbl 45010 `"Austria-Hungary"', add
label define bpld_lbl 45020 `"Austria-Graz"', add
label define bpld_lbl 45030 `"Austria-Linz"', add
label define bpld_lbl 45040 `"Austria-Salzburg"', add
label define bpld_lbl 45050 `"Austria-Tyrol"', add
label define bpld_lbl 45060 `"Austria-Vienna"', add
label define bpld_lbl 45070 `"Austria-Kaernsten"', add
label define bpld_lbl 45080 `"Austria-Neustadt"', add
label define bpld_lbl 45100 `"Bulgaria"', add
label define bpld_lbl 45200 `"Czechoslovakia"', add
label define bpld_lbl 45210 `"Bohemia"', add
label define bpld_lbl 45211 `"Bohemia-Moravia"', add
label define bpld_lbl 45212 `"Slovakia"', add
label define bpld_lbl 45213 `"Czech Republic"', add
label define bpld_lbl 45300 `"Germany"', add
label define bpld_lbl 45301 `"Berlin"', add
label define bpld_lbl 45302 `"West Berlin"', add
label define bpld_lbl 45303 `"East Berlin"', add
label define bpld_lbl 45310 `"West Germany"', add
label define bpld_lbl 45311 `"Baden"', add
label define bpld_lbl 45312 `"Bavaria"', add
label define bpld_lbl 45313 `"Braunschweig"', add
label define bpld_lbl 45314 `"Bremen"', add
label define bpld_lbl 45315 `"Hamburg"', add
label define bpld_lbl 45316 `"Hanover"', add
label define bpld_lbl 45317 `"Hessen"', add
label define bpld_lbl 45318 `"Hesse-Nassau"', add
label define bpld_lbl 45319 `"Lippe"', add
label define bpld_lbl 45320 `"Lubeck"', add
label define bpld_lbl 45321 `"Oldenburg"', add
label define bpld_lbl 45322 `"Rheinland"', add
label define bpld_lbl 45323 `"Schaumburg-Lippe"', add
label define bpld_lbl 45324 `"Schleswig"', add
label define bpld_lbl 45325 `"Sigmaringen"', add
label define bpld_lbl 45326 `"Schwarzburg"', add
label define bpld_lbl 45327 `"Westphalia"', add
label define bpld_lbl 45328 `"Wurttemberg"', add
label define bpld_lbl 45329 `"Waldeck"', add
label define bpld_lbl 45330 `"Wittenberg"', add
label define bpld_lbl 45331 `"Frankfurt"', add
label define bpld_lbl 45332 `"Saarland"', add
label define bpld_lbl 45333 `"Nordrhein-Westfalen"', add
label define bpld_lbl 45340 `"East Germany"', add
label define bpld_lbl 45341 `"Anhalt"', add
label define bpld_lbl 45342 `"Brandenburg"', add
label define bpld_lbl 45344 `"Kingdom of Saxony"', add
label define bpld_lbl 45345 `"Mecklenburg"', add
label define bpld_lbl 45346 `"Saxony"', add
label define bpld_lbl 45347 `"Thuringian States"', add
label define bpld_lbl 45348 `"Sachsen-Meiningen"', add
label define bpld_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define bpld_lbl 45350 `"Probable Saxony"', add
label define bpld_lbl 45351 `"Schwerin"', add
label define bpld_lbl 45352 `"Strelitz"', add
label define bpld_lbl 45353 `"Probably Thuringian States"', add
label define bpld_lbl 45360 `"Prussia, nec"', add
label define bpld_lbl 45361 `"Hohenzollern"', add
label define bpld_lbl 45362 `"Niedersachsen"', add
label define bpld_lbl 45400 `"Hungary"', add
label define bpld_lbl 45500 `"Poland"', add
label define bpld_lbl 45510 `"Austrian Poland"', add
label define bpld_lbl 45511 `"Galicia"', add
label define bpld_lbl 45520 `"German Poland"', add
label define bpld_lbl 45521 `"East Prussia"', add
label define bpld_lbl 45522 `"Pomerania"', add
label define bpld_lbl 45523 `"Posen"', add
label define bpld_lbl 45524 `"Prussian Poland"', add
label define bpld_lbl 45525 `"Silesia"', add
label define bpld_lbl 45526 `"West Prussia"', add
label define bpld_lbl 45530 `"Russian Poland"', add
label define bpld_lbl 45600 `"Romania"', add
label define bpld_lbl 45610 `"Transylvania"', add
label define bpld_lbl 45700 `"Yugoslavia"', add
label define bpld_lbl 45710 `"Croatia"', add
label define bpld_lbl 45720 `"Montenegro"', add
label define bpld_lbl 45730 `"Serbia"', add
label define bpld_lbl 45740 `"Bosnia"', add
label define bpld_lbl 45750 `"Dalmatia"', add
label define bpld_lbl 45760 `"Slovonia"', add
label define bpld_lbl 45770 `"Carniola"', add
label define bpld_lbl 45780 `"Slovenia"', add
label define bpld_lbl 45790 `"Kosovo"', add
label define bpld_lbl 45800 `"Central Europe, ns"', add
label define bpld_lbl 45900 `"Eastern Europe, ns"', add
label define bpld_lbl 46000 `"Estonia"', add
label define bpld_lbl 46100 `"Latvia"', add
label define bpld_lbl 46200 `"Lithuania"', add
label define bpld_lbl 46300 `"Baltic States, ns"', add
label define bpld_lbl 46500 `"Other USSR/Russia"', add
label define bpld_lbl 46510 `"Byelorussia"', add
label define bpld_lbl 46520 `"Moldavia"', add
label define bpld_lbl 46521 `"Bessarabia"', add
label define bpld_lbl 46530 `"Ukraine"', add
label define bpld_lbl 46540 `"Armenia"', add
label define bpld_lbl 46541 `"Azerbaijan"', add
label define bpld_lbl 46542 `"Republic of Georgia"', add
label define bpld_lbl 46543 `"Kazakhstan"', add
label define bpld_lbl 46544 `"Kirghizia"', add
label define bpld_lbl 46545 `"Tadzhik"', add
label define bpld_lbl 46546 `"Turkmenistan"', add
label define bpld_lbl 46547 `"Uzbekistan"', add
label define bpld_lbl 46548 `"Siberia"', add
label define bpld_lbl 46590 `"USSR, ns"', add
label define bpld_lbl 49900 `"Europe, ns."', add
label define bpld_lbl 50000 `"China"', add
label define bpld_lbl 50010 `"Hong Kong"', add
label define bpld_lbl 50020 `"Macau"', add
label define bpld_lbl 50030 `"Mongolia"', add
label define bpld_lbl 50040 `"Taiwan"', add
label define bpld_lbl 50100 `"Japan"', add
label define bpld_lbl 50200 `"Korea"', add
label define bpld_lbl 50210 `"North Korea"', add
label define bpld_lbl 50220 `"South Korea"', add
label define bpld_lbl 50900 `"East Asia, ns"', add
label define bpld_lbl 51000 `"Brunei"', add
label define bpld_lbl 51100 `"Cambodia (Kampuchea)"', add
label define bpld_lbl 51200 `"Indonesia"', add
label define bpld_lbl 51210 `"East Indies"', add
label define bpld_lbl 51220 `"East Timor"', add
label define bpld_lbl 51300 `"Laos"', add
label define bpld_lbl 51400 `"Malaysia"', add
label define bpld_lbl 51500 `"Philippines"', add
label define bpld_lbl 51600 `"Singapore"', add
label define bpld_lbl 51700 `"Thailand"', add
label define bpld_lbl 51800 `"Vietnam"', add
label define bpld_lbl 51900 `"Southeast Asia, ns"', add
label define bpld_lbl 51910 `"Indochina, ns"', add
label define bpld_lbl 52000 `"Afghanistan"', add
label define bpld_lbl 52100 `"India"', add
label define bpld_lbl 52110 `"Bangladesh"', add
label define bpld_lbl 52120 `"Bhutan"', add
label define bpld_lbl 52130 `"Burma (Myanmar)"', add
label define bpld_lbl 52140 `"Pakistan"', add
label define bpld_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define bpld_lbl 52200 `"Iran"', add
label define bpld_lbl 52300 `"Maldives"', add
label define bpld_lbl 52400 `"Nepal"', add
label define bpld_lbl 53000 `"Bahrain"', add
label define bpld_lbl 53100 `"Cyprus"', add
label define bpld_lbl 53200 `"Iraq"', add
label define bpld_lbl 53210 `"Mesopotamia"', add
label define bpld_lbl 53300 `"Iraq/Saudi Arabia"', add
label define bpld_lbl 53400 `"Israel/Palestine"', add
label define bpld_lbl 53410 `"Gaza Strip"', add
label define bpld_lbl 53420 `"Palestine"', add
label define bpld_lbl 53430 `"West Bank"', add
label define bpld_lbl 53440 `"Israel"', add
label define bpld_lbl 53500 `"Jordan"', add
label define bpld_lbl 53600 `"Kuwait"', add
label define bpld_lbl 53700 `"Lebanon"', add
label define bpld_lbl 53800 `"Oman"', add
label define bpld_lbl 53900 `"Qatar"', add
label define bpld_lbl 54000 `"Saudi Arabia"', add
label define bpld_lbl 54100 `"Syria"', add
label define bpld_lbl 54200 `"Turkey"', add
label define bpld_lbl 54210 `"European Turkey"', add
label define bpld_lbl 54220 `"Asian Turkey"', add
label define bpld_lbl 54300 `"United Arab Emirates"', add
label define bpld_lbl 54400 `"Yemen Arab Republic (North)"', add
label define bpld_lbl 54500 `"Yemen, PDR (South)"', add
label define bpld_lbl 54600 `"Persian Gulf States, ns"', add
label define bpld_lbl 54700 `"Middle East, ns"', add
label define bpld_lbl 54800 `"Southwest Asia, nec/ns"', add
label define bpld_lbl 54900 `"Asia Minor, ns"', add
label define bpld_lbl 55000 `"South Asia, nec"', add
label define bpld_lbl 59900 `"Asia, nec/ns"', add
label define bpld_lbl 60000 `"Africa"', add
label define bpld_lbl 60010 `"Northern Africa"', add
label define bpld_lbl 60011 `"Algeria"', add
label define bpld_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpld_lbl 60013 `"Libya"', add
label define bpld_lbl 60014 `"Morocco"', add
label define bpld_lbl 60015 `"Sudan"', add
label define bpld_lbl 60016 `"Tunisia"', add
label define bpld_lbl 60017 `"Western Sahara"', add
label define bpld_lbl 60019 `"North Africa, ns"', add
label define bpld_lbl 60020 `"Benin"', add
label define bpld_lbl 60021 `"Burkina Faso"', add
label define bpld_lbl 60022 `"Gambia"', add
label define bpld_lbl 60023 `"Ghana"', add
label define bpld_lbl 60024 `"Guinea"', add
label define bpld_lbl 60025 `"Guinea-Bissau"', add
label define bpld_lbl 60026 `"Ivory Coast"', add
label define bpld_lbl 60027 `"Liberia"', add
label define bpld_lbl 60028 `"Mali"', add
label define bpld_lbl 60029 `"Mauritania"', add
label define bpld_lbl 60030 `"Niger"', add
label define bpld_lbl 60031 `"Nigeria"', add
label define bpld_lbl 60032 `"Senegal"', add
label define bpld_lbl 60033 `"Sierra Leone"', add
label define bpld_lbl 60034 `"Togo"', add
label define bpld_lbl 60038 `"Western Africa, ns"', add
label define bpld_lbl 60039 `"French West Africa, ns"', add
label define bpld_lbl 60040 `"British Indian Ocean Territory"', add
label define bpld_lbl 60041 `"Burundi"', add
label define bpld_lbl 60042 `"Comoros"', add
label define bpld_lbl 60043 `"Djibouti"', add
label define bpld_lbl 60044 `"Ethiopia"', add
label define bpld_lbl 60045 `"Kenya"', add
label define bpld_lbl 60046 `"Madagascar"', add
label define bpld_lbl 60047 `"Malawi"', add
label define bpld_lbl 60048 `"Mauritius"', add
label define bpld_lbl 60049 `"Mozambique"', add
label define bpld_lbl 60050 `"Reunion"', add
label define bpld_lbl 60051 `"Rwanda"', add
label define bpld_lbl 60052 `"Seychelles"', add
label define bpld_lbl 60053 `"Somalia"', add
label define bpld_lbl 60054 `"Tanzania"', add
label define bpld_lbl 60055 `"Uganda"', add
label define bpld_lbl 60056 `"Zambia"', add
label define bpld_lbl 60057 `"Zimbabwe"', add
label define bpld_lbl 60058 `"Bassas de India"', add
label define bpld_lbl 60059 `"Europa"', add
label define bpld_lbl 60060 `"Gloriosos"', add
label define bpld_lbl 60061 `"Juan de Nova"', add
label define bpld_lbl 60062 `"Mayotte"', add
label define bpld_lbl 60063 `"Tromelin"', add
label define bpld_lbl 60064 `"Eastern Africa, nec/ns"', add
label define bpld_lbl 60065 `"Eritrea"', add
label define bpld_lbl 60066 `"South Sudan"', add
label define bpld_lbl 60070 `"Central Africa"', add
label define bpld_lbl 60071 `"Angola"', add
label define bpld_lbl 60072 `"Cameroon"', add
label define bpld_lbl 60073 `"Central African Republic"', add
label define bpld_lbl 60074 `"Chad"', add
label define bpld_lbl 60075 `"Congo"', add
label define bpld_lbl 60076 `"Equatorial Guinea"', add
label define bpld_lbl 60077 `"Gabon"', add
label define bpld_lbl 60078 `"Sao Tome and Principe"', add
label define bpld_lbl 60079 `"Zaire"', add
label define bpld_lbl 60080 `"Central Africa, ns"', add
label define bpld_lbl 60081 `"Equatorial Africa, ns"', add
label define bpld_lbl 60082 `"French Equatorial Africa, ns"', add
label define bpld_lbl 60090 `"Southern Africa"', add
label define bpld_lbl 60091 `"Botswana"', add
label define bpld_lbl 60092 `"Lesotho"', add
label define bpld_lbl 60093 `"Namibia"', add
label define bpld_lbl 60094 `"South Africa (Union of)"', add
label define bpld_lbl 60095 `"Swaziland"', add
label define bpld_lbl 60096 `"Southern Africa, ns"', add
label define bpld_lbl 60099 `"Africa, ns/nec"', add
label define bpld_lbl 70000 `"Australia and New Zealand"', add
label define bpld_lbl 70010 `"Australia"', add
label define bpld_lbl 70011 `"Ashmore and Cartier Islands"', add
label define bpld_lbl 70012 `"Coral Sea Islands Territory"', add
label define bpld_lbl 70013 `"Christmas Island"', add
label define bpld_lbl 70014 `"Cocos Islands"', add
label define bpld_lbl 70020 `"New Zealand"', add
label define bpld_lbl 71000 `"Pacific Islands"', add
label define bpld_lbl 71010 `"New Caledonia"', add
label define bpld_lbl 71012 `"Papua New Guinea"', add
label define bpld_lbl 71013 `"Solomon Islands"', add
label define bpld_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define bpld_lbl 71015 `"Fiji"', add
label define bpld_lbl 71016 `"Melanesia, ns"', add
label define bpld_lbl 71017 `"Norfolk Islands"', add
label define bpld_lbl 71018 `"Niue"', add
label define bpld_lbl 71020 `"Cook Islands"', add
label define bpld_lbl 71022 `"French Polynesia"', add
label define bpld_lbl 71023 `"Tonga"', add
label define bpld_lbl 71024 `"Wallis and Futuna Islands"', add
label define bpld_lbl 71025 `"Western Samoa"', add
label define bpld_lbl 71026 `"Pitcairn Island"', add
label define bpld_lbl 71027 `"Tokelau"', add
label define bpld_lbl 71028 `"Tuvalu"', add
label define bpld_lbl 71029 `"Polynesia, ns"', add
label define bpld_lbl 71032 `"Kiribati"', add
label define bpld_lbl 71033 `"Canton and Enderbury"', add
label define bpld_lbl 71034 `"Nauru"', add
label define bpld_lbl 71039 `"Micronesia, ns"', add
label define bpld_lbl 71040 `"US Pacific Trust Territories"', add
label define bpld_lbl 71041 `"Marshall Islands"', add
label define bpld_lbl 71042 `"Micronesia"', add
label define bpld_lbl 71043 `"Kosrae"', add
label define bpld_lbl 71044 `"Pohnpei"', add
label define bpld_lbl 71045 `"Truk"', add
label define bpld_lbl 71046 `"Yap"', add
label define bpld_lbl 71047 `"Northern Mariana Islands"', add
label define bpld_lbl 71048 `"Palau"', add
label define bpld_lbl 71049 `"Pacific Trust Terr, ns"', add
label define bpld_lbl 71050 `"Clipperton Island"', add
label define bpld_lbl 71090 `"Oceania, ns/nec"', add
label define bpld_lbl 80000 `"Antarctica, ns/nec"', add
label define bpld_lbl 80010 `"Bouvet Islands"', add
label define bpld_lbl 80020 `"British Antarctic Terr."', add
label define bpld_lbl 80030 `"Dronning Maud Land"', add
label define bpld_lbl 80040 `"French Southern and Antarctic Lands"', add
label define bpld_lbl 80050 `"Heard and McDonald Islands"', add
label define bpld_lbl 90000 `"Abroad (unknown) or at sea"', add
label define bpld_lbl 90010 `"Abroad, ns"', add
label define bpld_lbl 90011 `"Abroad (US citizen)"', add
label define bpld_lbl 90020 `"At sea"', add
label define bpld_lbl 90021 `"At sea (US citizen)"', add
label define bpld_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define bpld_lbl 95000 `"Other n.e.c."', add
label define bpld_lbl 99900 `"Missing/blank"', add
label values bpld bpld_lbl

label define mbpl_lbl 000 `"Not Applicable"'
label define mbpl_lbl 001 `"Alabama"', add
label define mbpl_lbl 002 `"Alaska"', add
label define mbpl_lbl 004 `"Arizona"', add
label define mbpl_lbl 005 `"Arkansas"', add
label define mbpl_lbl 006 `"California"', add
label define mbpl_lbl 008 `"Colorado"', add
label define mbpl_lbl 009 `"Connecticut"', add
label define mbpl_lbl 010 `"Delaware"', add
label define mbpl_lbl 011 `"District of Columbia"', add
label define mbpl_lbl 012 `"Florida"', add
label define mbpl_lbl 013 `"Georgia"', add
label define mbpl_lbl 015 `"Hawaii"', add
label define mbpl_lbl 016 `"Idaho"', add
label define mbpl_lbl 017 `"Illinois"', add
label define mbpl_lbl 018 `"Indiana"', add
label define mbpl_lbl 019 `"Iowa"', add
label define mbpl_lbl 020 `"Kansas"', add
label define mbpl_lbl 021 `"Kentucky"', add
label define mbpl_lbl 022 `"Louisiana"', add
label define mbpl_lbl 023 `"Maine"', add
label define mbpl_lbl 024 `"Maryland"', add
label define mbpl_lbl 025 `"Massachusetts"', add
label define mbpl_lbl 026 `"Michigan"', add
label define mbpl_lbl 027 `"Minnesota"', add
label define mbpl_lbl 028 `"Mississippi"', add
label define mbpl_lbl 029 `"Missouri"', add
label define mbpl_lbl 030 `"Montana"', add
label define mbpl_lbl 031 `"Nebraska"', add
label define mbpl_lbl 032 `"Nevada"', add
label define mbpl_lbl 033 `"New Hampshire"', add
label define mbpl_lbl 034 `"New Jersey"', add
label define mbpl_lbl 035 `"New Mexico"', add
label define mbpl_lbl 036 `"New York"', add
label define mbpl_lbl 037 `"North Carolina"', add
label define mbpl_lbl 038 `"North Dakota"', add
label define mbpl_lbl 039 `"Ohio"', add
label define mbpl_lbl 040 `"Oklahoma"', add
label define mbpl_lbl 041 `"Oregon"', add
label define mbpl_lbl 042 `"Pennsylvania"', add
label define mbpl_lbl 044 `"Rhode Island"', add
label define mbpl_lbl 045 `"South Carolina"', add
label define mbpl_lbl 046 `"South Dakota"', add
label define mbpl_lbl 047 `"Tennessee"', add
label define mbpl_lbl 048 `"Texas"', add
label define mbpl_lbl 049 `"Utah"', add
label define mbpl_lbl 050 `"Vermont"', add
label define mbpl_lbl 051 `"Virginia"', add
label define mbpl_lbl 053 `"Washington"', add
label define mbpl_lbl 054 `"West Virginia"', add
label define mbpl_lbl 055 `"Wisconsin"', add
label define mbpl_lbl 056 `"Wyoming"', add
label define mbpl_lbl 090 `"Native American"', add
label define mbpl_lbl 099 `"United States, ns"', add
label define mbpl_lbl 100 `"American Samoa"', add
label define mbpl_lbl 105 `"Guam"', add
label define mbpl_lbl 110 `"Puerto Rico"', add
label define mbpl_lbl 115 `"U.S. Virgin Islands"', add
label define mbpl_lbl 120 `"Other US Possessions"', add
label define mbpl_lbl 150 `"Canada"', add
label define mbpl_lbl 155 `"St. Pierre and Miquelon"', add
label define mbpl_lbl 160 `"Atlantic Islands"', add
label define mbpl_lbl 199 `"North America, n.s."', add
label define mbpl_lbl 200 `"Mexico"', add
label define mbpl_lbl 210 `"Central America"', add
label define mbpl_lbl 250 `"Cuba"', add
label define mbpl_lbl 260 `"West Indies"', add
label define mbpl_lbl 299 `"Americas, n.s."', add
label define mbpl_lbl 300 `"SOUTH AMERICA"', add
label define mbpl_lbl 400 `"Denmark"', add
label define mbpl_lbl 401 `"Finland"', add
label define mbpl_lbl 402 `"Iceland"', add
label define mbpl_lbl 403 `"Lapland, n.s."', add
label define mbpl_lbl 404 `"Norway"', add
label define mbpl_lbl 405 `"Sweden"', add
label define mbpl_lbl 410 `"England"', add
label define mbpl_lbl 411 `"Scotland"', add
label define mbpl_lbl 412 `"Wales"', add
label define mbpl_lbl 413 `"United Kingdom, ns"', add
label define mbpl_lbl 414 `"Ireland"', add
label define mbpl_lbl 419 `"Northern Europe, ns"', add
label define mbpl_lbl 420 `"Belgium"', add
label define mbpl_lbl 421 `"France"', add
label define mbpl_lbl 422 `"Liechtenstein"', add
label define mbpl_lbl 423 `"Luxembourg"', add
label define mbpl_lbl 424 `"Monaco"', add
label define mbpl_lbl 425 `"Netherlands"', add
label define mbpl_lbl 426 `"Switzerland"', add
label define mbpl_lbl 429 `"Western Europe, ns"', add
label define mbpl_lbl 430 `"Albania"', add
label define mbpl_lbl 431 `"Andorra"', add
label define mbpl_lbl 432 `"Gibraltar"', add
label define mbpl_lbl 433 `"Greece"', add
label define mbpl_lbl 434 `"Italy"', add
label define mbpl_lbl 435 `"Malta"', add
label define mbpl_lbl 436 `"Portugal"', add
label define mbpl_lbl 437 `"San Marino"', add
label define mbpl_lbl 438 `"Spain"', add
label define mbpl_lbl 439 `"Vatican City"', add
label define mbpl_lbl 440 `"Southern Europe, n.s."', add
label define mbpl_lbl 450 `"Austria"', add
label define mbpl_lbl 451 `"Bulgaria"', add
label define mbpl_lbl 452 `"Czechoslovakia"', add
label define mbpl_lbl 453 `"Germany"', add
label define mbpl_lbl 454 `"Hungary"', add
label define mbpl_lbl 455 `"Poland"', add
label define mbpl_lbl 456 `"Romania"', add
label define mbpl_lbl 457 `"Yugoslavia"', add
label define mbpl_lbl 458 `"Central Europe, ns"', add
label define mbpl_lbl 459 `"Eastern Europe, n.s."', add
label define mbpl_lbl 460 `"Estonia"', add
label define mbpl_lbl 461 `"Latvia"', add
label define mbpl_lbl 462 `"Lithuania"', add
label define mbpl_lbl 463 `"Baltic States, ns"', add
label define mbpl_lbl 465 `"Other USSR/Russia"', add
label define mbpl_lbl 499 `"Europe, nec/ns"', add
label define mbpl_lbl 500 `"China"', add
label define mbpl_lbl 501 `"Japan"', add
label define mbpl_lbl 502 `"Korea"', add
label define mbpl_lbl 509 `"East Asia, n.s."', add
label define mbpl_lbl 510 `"Brunei"', add
label define mbpl_lbl 511 `"Cambodia (Kampuchea)"', add
label define mbpl_lbl 512 `"Indonesia"', add
label define mbpl_lbl 513 `"Laos"', add
label define mbpl_lbl 514 `"Malaysia"', add
label define mbpl_lbl 515 `"Philippines"', add
label define mbpl_lbl 516 `"Singapore"', add
label define mbpl_lbl 517 `"Thailand"', add
label define mbpl_lbl 518 `"Vietnam"', add
label define mbpl_lbl 519 `"Southeast Asia, ns"', add
label define mbpl_lbl 520 `"Afghanistan"', add
label define mbpl_lbl 521 `"India"', add
label define mbpl_lbl 522 `"Iran"', add
label define mbpl_lbl 523 `"Maldives"', add
label define mbpl_lbl 524 `"Nepal"', add
label define mbpl_lbl 530 `"Bahrain"', add
label define mbpl_lbl 531 `"Cyprus"', add
label define mbpl_lbl 532 `"Iraq"', add
label define mbpl_lbl 533 `"Iraq/Saudi Arabia"', add
label define mbpl_lbl 534 `"Israel/Palestine"', add
label define mbpl_lbl 535 `"Jordan"', add
label define mbpl_lbl 536 `"Kuwait"', add
label define mbpl_lbl 537 `"Lebanon"', add
label define mbpl_lbl 538 `"Oman"', add
label define mbpl_lbl 539 `"Qatar"', add
label define mbpl_lbl 540 `"Saudi Arabia"', add
label define mbpl_lbl 541 `"Syria"', add
label define mbpl_lbl 542 `"Turkey"', add
label define mbpl_lbl 543 `"United Arab Emirates"', add
label define mbpl_lbl 544 `"Yemen Arab Republic (North)"', add
label define mbpl_lbl 545 `"Yemen, PDR (South)"', add
label define mbpl_lbl 546 `"Persian Gulf States, n.s."', add
label define mbpl_lbl 547 `"Middle East, n.s."', add
label define mbpl_lbl 548 `"Southwest Asia, nec/ns"', add
label define mbpl_lbl 549 `"Asia Minor, n.s."', add
label define mbpl_lbl 550 `"South Asia, n.e.c."', add
label define mbpl_lbl 599 `"Asia, nec/ns"', add
label define mbpl_lbl 600 `"AFRICA"', add
label define mbpl_lbl 700 `"Australia and New Zealand"', add
label define mbpl_lbl 710 `"Pacific Islands"', add
label define mbpl_lbl 900 `"Abroad (unknown) or at sea"', add
label define mbpl_lbl 950 `"Other n.e.c."', add
label define mbpl_lbl 997 `"Unknown"', add
label define mbpl_lbl 999 `"Missing/blank"', add
label values mbpl mbpl_lbl

label define mbpld_lbl 00000 `"Not Applicable"'
label define mbpld_lbl 00100 `"Alabama"', add
label define mbpld_lbl 00200 `"Alaska"', add
label define mbpld_lbl 00400 `"Arizona"', add
label define mbpld_lbl 00500 `"Arkansas"', add
label define mbpld_lbl 00600 `"California"', add
label define mbpld_lbl 00800 `"Colorado"', add
label define mbpld_lbl 00900 `"Connecticut"', add
label define mbpld_lbl 01000 `"Delaware"', add
label define mbpld_lbl 01100 `"District of Columbia"', add
label define mbpld_lbl 01200 `"Florida"', add
label define mbpld_lbl 01300 `"Georgia"', add
label define mbpld_lbl 01500 `"Hawaii"', add
label define mbpld_lbl 01600 `"Idaho"', add
label define mbpld_lbl 01610 `"Idaho Territory"', add
label define mbpld_lbl 01700 `"Illinois"', add
label define mbpld_lbl 01800 `"Indiana"', add
label define mbpld_lbl 01900 `"Iowa"', add
label define mbpld_lbl 02000 `"Kansas"', add
label define mbpld_lbl 02100 `"Kentucky"', add
label define mbpld_lbl 02200 `"Louisiana"', add
label define mbpld_lbl 02300 `"Maine"', add
label define mbpld_lbl 02400 `"Maryland"', add
label define mbpld_lbl 02500 `"Massachusetts"', add
label define mbpld_lbl 02600 `"Michigan"', add
label define mbpld_lbl 02700 `"Minnesota"', add
label define mbpld_lbl 02800 `"Mississippi"', add
label define mbpld_lbl 02900 `"Missouri"', add
label define mbpld_lbl 03000 `"Montana"', add
label define mbpld_lbl 03100 `"Nebraska"', add
label define mbpld_lbl 03200 `"Nevada"', add
label define mbpld_lbl 03300 `"New Hampshire"', add
label define mbpld_lbl 03400 `"New Jersey"', add
label define mbpld_lbl 03500 `"New Mexico"', add
label define mbpld_lbl 03510 `"New Mexico Territory"', add
label define mbpld_lbl 03600 `"New York"', add
label define mbpld_lbl 03700 `"North Carolina"', add
label define mbpld_lbl 03800 `"North Dakota"', add
label define mbpld_lbl 03900 `"Ohio"', add
label define mbpld_lbl 04000 `"Oklahoma"', add
label define mbpld_lbl 04010 `"Indian Territory"', add
label define mbpld_lbl 04100 `"Oregon"', add
label define mbpld_lbl 04200 `"Pennsylvania"', add
label define mbpld_lbl 04400 `"Rhode Island"', add
label define mbpld_lbl 04500 `"South Carolina"', add
label define mbpld_lbl 04600 `"South Dakota"', add
label define mbpld_lbl 04610 `"Dakota Territory"', add
label define mbpld_lbl 04700 `"Tennessee"', add
label define mbpld_lbl 04800 `"Texas"', add
label define mbpld_lbl 04900 `"Utah"', add
label define mbpld_lbl 04910 `"Utah Territory"', add
label define mbpld_lbl 05000 `"Vermont"', add
label define mbpld_lbl 05100 `"Virginia"', add
label define mbpld_lbl 05300 `"Washington"', add
label define mbpld_lbl 05400 `"West Virginia"', add
label define mbpld_lbl 05500 `"Wisconsin"', add
label define mbpld_lbl 05600 `"Wyoming"', add
label define mbpld_lbl 05610 `"Wyoming Territory"', add
label define mbpld_lbl 09000 `"Native American"', add
label define mbpld_lbl 09900 `"United States, n.s."', add
label define mbpld_lbl 10000 `"American Samoa"', add
label define mbpld_lbl 10010 `"Samoa, 1940-1950"', add
label define mbpld_lbl 10500 `"Guam"', add
label define mbpld_lbl 11000 `"Puerto Rico"', add
label define mbpld_lbl 11500 `"U.S. Virgin Islands"', add
label define mbpld_lbl 11510 `"St. Croix"', add
label define mbpld_lbl 11520 `"St. John"', add
label define mbpld_lbl 11530 `"St. Thomas"', add
label define mbpld_lbl 12000 `"Other US Possessions"', add
label define mbpld_lbl 12010 `"Johnston Atoll"', add
label define mbpld_lbl 12020 `"Midway Islands"', add
label define mbpld_lbl 12030 `"Wake Island"', add
label define mbpld_lbl 12040 `"Other US Caribbean Islands"', add
label define mbpld_lbl 12041 `"Navassa Island"', add
label define mbpld_lbl 12050 `"Other US Pacific Is."', add
label define mbpld_lbl 12051 `"Baker Island"', add
label define mbpld_lbl 12052 `"Howland Island"', add
label define mbpld_lbl 12053 `"Jarvis Island"', add
label define mbpld_lbl 12054 `"Kingman Reef"', add
label define mbpld_lbl 12055 `"Palmyra Atoll"', add
label define mbpld_lbl 12056 `"Canton and Enderbury Island"', add
label define mbpld_lbl 12090 `"US outlying areas, ns"', add
label define mbpld_lbl 12091 `"US Possessions, n.s."', add
label define mbpld_lbl 12092 `"US territory, ns"', add
label define mbpld_lbl 15000 `"Canada"', add
label define mbpld_lbl 15010 `"English Canada"', add
label define mbpld_lbl 15011 `"British Columbia"', add
label define mbpld_lbl 15013 `"Alberta"', add
label define mbpld_lbl 15015 `"Saskatchewan"', add
label define mbpld_lbl 15017 `"Northwest"', add
label define mbpld_lbl 15019 `"Ruperts Land"', add
label define mbpld_lbl 15020 `"Manitoba"', add
label define mbpld_lbl 15021 `"Red River"', add
label define mbpld_lbl 15030 `"Ontario/Upper Canada"', add
label define mbpld_lbl 15031 `"Upper Canada"', add
label define mbpld_lbl 15032 `"Canada West"', add
label define mbpld_lbl 15040 `"New Brunswick"', add
label define mbpld_lbl 15050 `"Nova Scotia"', add
label define mbpld_lbl 15051 `"Cape Breton"', add
label define mbpld_lbl 15052 `"Halifax"', add
label define mbpld_lbl 15060 `"Prince Edward Island"', add
label define mbpld_lbl 15070 `"Newfoundland"', add
label define mbpld_lbl 15080 `"French Canada"', add
label define mbpld_lbl 15081 `"Quebec"', add
label define mbpld_lbl 15082 `"Lower Canada"', add
label define mbpld_lbl 15083 `"Canada East"', add
label define mbpld_lbl 15500 `"St. Pierre and Miquelon"', add
label define mbpld_lbl 16000 `"Atlantic Islands"', add
label define mbpld_lbl 16010 `"Bermuda"', add
label define mbpld_lbl 16020 `"Cape Verde"', add
label define mbpld_lbl 16030 `"Falkland Islands"', add
label define mbpld_lbl 16040 `"Greenland"', add
label define mbpld_lbl 16050 `"St. Helena and Ascension"', add
label define mbpld_lbl 16060 `"Canary Islands"', add
label define mbpld_lbl 19900 `"North America, n.s."', add
label define mbpld_lbl 20000 `"Mexico"', add
label define mbpld_lbl 21000 `"Central America"', add
label define mbpld_lbl 21010 `"Belize/British Honduras"', add
label define mbpld_lbl 21020 `"Costa Rica"', add
label define mbpld_lbl 21030 `"El Salvador"', add
label define mbpld_lbl 21040 `"Guatemala"', add
label define mbpld_lbl 21050 `"Honduras"', add
label define mbpld_lbl 21060 `"Nicaragua"', add
label define mbpld_lbl 21070 `"Panama"', add
label define mbpld_lbl 21071 `"Canal Zone"', add
label define mbpld_lbl 21090 `"Central America, ns"', add
label define mbpld_lbl 25000 `"Cuba"', add
label define mbpld_lbl 26000 `"West Indies"', add
label define mbpld_lbl 26010 `"Dominican Republic"', add
label define mbpld_lbl 26020 `"Haiti"', add
label define mbpld_lbl 26030 `"Jamaica"', add
label define mbpld_lbl 26040 `"British West Indies"', add
label define mbpld_lbl 26041 `"Anguilla"', add
label define mbpld_lbl 26042 `"Antigua-Barbuda"', add
label define mbpld_lbl 26043 `"Bahamas"', add
label define mbpld_lbl 26044 `"Barbados"', add
label define mbpld_lbl 26045 `"British Virgin Islands"', add
label define mbpld_lbl 26046 `"Anegada"', add
label define mbpld_lbl 26047 `"Cooper"', add
label define mbpld_lbl 26048 `"Jost Van Dyke"', add
label define mbpld_lbl 26049 `"Peter"', add
label define mbpld_lbl 26050 `"Tortola"', add
label define mbpld_lbl 26051 `"Virgin Gorda"', add
label define mbpld_lbl 26052 `"Br. Virgin Islands, ns"', add
label define mbpld_lbl 26053 `"Cayman Isles"', add
label define mbpld_lbl 26054 `"Dominica"', add
label define mbpld_lbl 26055 `"Grenada"', add
label define mbpld_lbl 26056 `"Montserrat"', add
label define mbpld_lbl 26057 `"St. Kitts-Nevis"', add
label define mbpld_lbl 26058 `"St. Lucia"', add
label define mbpld_lbl 26059 `"St. Vincent"', add
label define mbpld_lbl 26060 `"Trinidad and Tobago"', add
label define mbpld_lbl 26061 `"Turks and Caicos"', add
label define mbpld_lbl 26069 `"British West Indies, ns"', add
label define mbpld_lbl 26070 `"Other West Indies"', add
label define mbpld_lbl 26071 `"Aruba"', add
label define mbpld_lbl 26072 `"Netherlands Antilles"', add
label define mbpld_lbl 26073 `"Bonaire"', add
label define mbpld_lbl 26074 `"Curacao"', add
label define mbpld_lbl 26075 `"Dutch St. Maarten"', add
label define mbpld_lbl 26076 `"Saba"', add
label define mbpld_lbl 26077 `"St. Eustatius"', add
label define mbpld_lbl 26079 `"Dutch Caribbean, ns"', add
label define mbpld_lbl 26080 `"French St. Maarten"', add
label define mbpld_lbl 26081 `"Guadeloupe"', add
label define mbpld_lbl 26082 `"Martinique"', add
label define mbpld_lbl 26083 `"St. Barthelemy"', add
label define mbpld_lbl 26089 `"French Caribbean, ns"', add
label define mbpld_lbl 26090 `"Antilles, n.s."', add
label define mbpld_lbl 26091 `"Caribbean, n.s. / n.e.c."', add
label define mbpld_lbl 26092 `"Latin America, ns"', add
label define mbpld_lbl 26093 `"Leeward Islands, n.s."', add
label define mbpld_lbl 26094 `"West Indies, ns"', add
label define mbpld_lbl 26095 `"Winward Islands"', add
label define mbpld_lbl 29900 `"Americas, ns"', add
label define mbpld_lbl 30000 `"SOUTH AMERICA"', add
label define mbpld_lbl 30005 `"Argentina"', add
label define mbpld_lbl 30010 `"Bolivia"', add
label define mbpld_lbl 30015 `"Brazil"', add
label define mbpld_lbl 30020 `"Chile"', add
label define mbpld_lbl 30025 `"Colombia"', add
label define mbpld_lbl 30030 `"Ecuador"', add
label define mbpld_lbl 30035 `"French Guiana"', add
label define mbpld_lbl 30040 `"Guyana/British Guiana"', add
label define mbpld_lbl 30045 `"Paraguay"', add
label define mbpld_lbl 30050 `"Peru"', add
label define mbpld_lbl 30055 `"Suriname"', add
label define mbpld_lbl 30060 `"Uruguay"', add
label define mbpld_lbl 30065 `"Venezuela"', add
label define mbpld_lbl 30090 `"South America, n.s."', add
label define mbpld_lbl 30091 `"South and Central America, n.s."', add
label define mbpld_lbl 40000 `"Denmark"', add
label define mbpld_lbl 40010 `"Faroe Islands"', add
label define mbpld_lbl 40100 `"Finland"', add
label define mbpld_lbl 40200 `"Iceland"', add
label define mbpld_lbl 40300 `"Lapland, ns"', add
label define mbpld_lbl 40400 `"Norway"', add
label define mbpld_lbl 40410 `"Svalbard and Jan Meyen"', add
label define mbpld_lbl 40411 `"Svalbard"', add
label define mbpld_lbl 40412 `"Jan Meyen"', add
label define mbpld_lbl 40500 `"Sweden"', add
label define mbpld_lbl 41000 `"England"', add
label define mbpld_lbl 41010 `"Channel Islands"', add
label define mbpld_lbl 41011 `"Guernsey"', add
label define mbpld_lbl 41012 `"Jersey"', add
label define mbpld_lbl 41020 `"Isle of Man"', add
label define mbpld_lbl 41100 `"Scotland"', add
label define mbpld_lbl 41200 `"Wales"', add
label define mbpld_lbl 41300 `"United Kingdom, n.s."', add
label define mbpld_lbl 41400 `"Ireland"', add
label define mbpld_lbl 41410 `"Northern Ireland"', add
label define mbpld_lbl 41900 `"Northern Europe, ns"', add
label define mbpld_lbl 42000 `"Belgium"', add
label define mbpld_lbl 42100 `"France"', add
label define mbpld_lbl 42110 `"Alsace-Lorraine"', add
label define mbpld_lbl 42111 `"Alsace"', add
label define mbpld_lbl 42112 `"Lorraine"', add
label define mbpld_lbl 42200 `"Liechtenstein"', add
label define mbpld_lbl 42300 `"Luxembourg"', add
label define mbpld_lbl 42400 `"Monaco"', add
label define mbpld_lbl 42500 `"Netherlands"', add
label define mbpld_lbl 42600 `"Switzerland"', add
label define mbpld_lbl 42900 `"Western Euproe, ns"', add
label define mbpld_lbl 43000 `"Albania"', add
label define mbpld_lbl 43100 `"Andorra"', add
label define mbpld_lbl 43200 `"Gibraltar"', add
label define mbpld_lbl 43300 `"Greece"', add
label define mbpld_lbl 43310 `"Dodecanese Islands"', add
label define mbpld_lbl 43320 `"Turkey Greece"', add
label define mbpld_lbl 43330 `"Macedonia"', add
label define mbpld_lbl 43400 `"Italy"', add
label define mbpld_lbl 43500 `"Malta"', add
label define mbpld_lbl 43600 `"Portugal"', add
label define mbpld_lbl 43610 `"Azores"', add
label define mbpld_lbl 43620 `"Madeira Islands"', add
label define mbpld_lbl 43630 `"Cape Verde Islands"', add
label define mbpld_lbl 43640 `"St. Miguel"', add
label define mbpld_lbl 43700 `"San Marino"', add
label define mbpld_lbl 43800 `"Spain"', add
label define mbpld_lbl 43900 `"Vatican City"', add
label define mbpld_lbl 44000 `"Southern Europe, ns"', add
label define mbpld_lbl 45000 `"Austria"', add
label define mbpld_lbl 45010 `"Austria-Hungary"', add
label define mbpld_lbl 45020 `"Austria-Graz"', add
label define mbpld_lbl 45030 `"Austria-Linz"', add
label define mbpld_lbl 45040 `"Austria-Salzburg"', add
label define mbpld_lbl 45050 `"Austria-Tyrol"', add
label define mbpld_lbl 45060 `"Austria-Vienna"', add
label define mbpld_lbl 45070 `"Austria-Kaernten"', add
label define mbpld_lbl 45080 `"Austria-Neustadt"', add
label define mbpld_lbl 45100 `"Bulgaria"', add
label define mbpld_lbl 45200 `"Czechoslovakia"', add
label define mbpld_lbl 45210 `"Bohemia"', add
label define mbpld_lbl 45211 `"Bohemia-Moravia"', add
label define mbpld_lbl 45212 `"Slovakia"', add
label define mbpld_lbl 45213 `"Czech Republic"', add
label define mbpld_lbl 45300 `"Germany"', add
label define mbpld_lbl 45301 `"Berlin"', add
label define mbpld_lbl 45310 `"West Germany"', add
label define mbpld_lbl 45311 `"Baden"', add
label define mbpld_lbl 45312 `"Bavaria"', add
label define mbpld_lbl 45313 `"Bremen"', add
label define mbpld_lbl 45314 `"Braunschweig"', add
label define mbpld_lbl 45315 `"Hamburg"', add
label define mbpld_lbl 45316 `"Hanover"', add
label define mbpld_lbl 45317 `"Hessen"', add
label define mbpld_lbl 45318 `"Hesse-Nassau"', add
label define mbpld_lbl 45319 `"Holstein"', add
label define mbpld_lbl 45320 `"Lippe"', add
label define mbpld_lbl 45321 `"Lubeck"', add
label define mbpld_lbl 45322 `"Oldenburg"', add
label define mbpld_lbl 45323 `"Rheinland"', add
label define mbpld_lbl 45324 `"Schleswig"', add
label define mbpld_lbl 45325 `"Schleswig-Holstein"', add
label define mbpld_lbl 45326 `"Schwarzburg"', add
label define mbpld_lbl 45327 `"Waldeck"', add
label define mbpld_lbl 45328 `"West Berlin"', add
label define mbpld_lbl 45329 `"Westphalia"', add
label define mbpld_lbl 45330 `"Wurttemberg"', add
label define mbpld_lbl 45331 `"Frankfurt"', add
label define mbpld_lbl 45332 `"Saarland"', add
label define mbpld_lbl 45333 `"Nordrhein-Westfalen"', add
label define mbpld_lbl 45340 `"East Germany"', add
label define mbpld_lbl 45341 `"Anhalt"', add
label define mbpld_lbl 45342 `"Brandenburg"', add
label define mbpld_lbl 45343 `"East Berlin"', add
label define mbpld_lbl 45344 `"Mecklenburg"', add
label define mbpld_lbl 45345 `"Sachsen-Altenburg"', add
label define mbpld_lbl 45346 `"Sachsen-Coburg"', add
label define mbpld_lbl 45347 `"Sachsen-Gotha"', add
label define mbpld_lbl 45348 `"Sachsen-Meiningen"', add
label define mbpld_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define mbpld_lbl 45350 `"Saxony"', add
label define mbpld_lbl 45351 `"Schwerin"', add
label define mbpld_lbl 45352 `"Strelitz"', add
label define mbpld_lbl 45353 `"Thuringian States"', add
label define mbpld_lbl 45360 `"Prussia, n.e.c."', add
label define mbpld_lbl 45361 `"Hohenzollern"', add
label define mbpld_lbl 45362 `"Niedersachsen"', add
label define mbpld_lbl 45400 `"Hungary"', add
label define mbpld_lbl 45500 `"Poland"', add
label define mbpld_lbl 45510 `"Austrian Poland"', add
label define mbpld_lbl 45511 `"Galicia"', add
label define mbpld_lbl 45520 `"German Poland"', add
label define mbpld_lbl 45521 `"East Prussia"', add
label define mbpld_lbl 45522 `"Pomerania"', add
label define mbpld_lbl 45523 `"Posen"', add
label define mbpld_lbl 45524 `"Prussian Poland"', add
label define mbpld_lbl 45525 `"Silesia"', add
label define mbpld_lbl 45526 `"West Prussia"', add
label define mbpld_lbl 45530 `"Russian Poland"', add
label define mbpld_lbl 45600 `"Romania"', add
label define mbpld_lbl 45610 `"Transylvania"', add
label define mbpld_lbl 45700 `"Yugoslavia"', add
label define mbpld_lbl 45710 `"Croatia"', add
label define mbpld_lbl 45720 `"Montenegro"', add
label define mbpld_lbl 45730 `"Serbia"', add
label define mbpld_lbl 45740 `"Bosnia"', add
label define mbpld_lbl 45750 `"Dalmatia"', add
label define mbpld_lbl 45760 `"Slovonia"', add
label define mbpld_lbl 45770 `"Carniola"', add
label define mbpld_lbl 45780 `"Slovenia"', add
label define mbpld_lbl 45790 `"Kosovo"', add
label define mbpld_lbl 45800 `"Central Europe, n.s."', add
label define mbpld_lbl 45900 `"Eastern Europe, n.s."', add
label define mbpld_lbl 46000 `"Estonia"', add
label define mbpld_lbl 46100 `"Latvia"', add
label define mbpld_lbl 46200 `"Lithuania"', add
label define mbpld_lbl 46300 `"Baltic States, ns"', add
label define mbpld_lbl 46500 `"Other USSR/Russia"', add
label define mbpld_lbl 46510 `"Byelorussia"', add
label define mbpld_lbl 46520 `"Moldavia"', add
label define mbpld_lbl 46521 `"Bessarabia"', add
label define mbpld_lbl 46530 `"Ukraine"', add
label define mbpld_lbl 46540 `"Armenia"', add
label define mbpld_lbl 46541 `"Azerbaijan"', add
label define mbpld_lbl 46542 `"Republic of Georgia"', add
label define mbpld_lbl 46543 `"Kazakhstan"', add
label define mbpld_lbl 46544 `"Kirghizia"', add
label define mbpld_lbl 46545 `"Tadzhik"', add
label define mbpld_lbl 46546 `"Turkmenistan"', add
label define mbpld_lbl 46547 `"Uzbekistan"', add
label define mbpld_lbl 46548 `"Siberia"', add
label define mbpld_lbl 46590 `"USSR, ns"', add
label define mbpld_lbl 49900 `"Europe, n.e.c./n.s."', add
label define mbpld_lbl 50000 `"China"', add
label define mbpld_lbl 50010 `"Hong Kong"', add
label define mbpld_lbl 50020 `"Macau"', add
label define mbpld_lbl 50030 `"Mongolia"', add
label define mbpld_lbl 50040 `"Taiwan"', add
label define mbpld_lbl 50100 `"Japan"', add
label define mbpld_lbl 50200 `"Korea"', add
label define mbpld_lbl 50210 `"North Korea"', add
label define mbpld_lbl 50220 `"South Korea"', add
label define mbpld_lbl 50900 `"East Asia, n.s."', add
label define mbpld_lbl 51000 `"Brunei"', add
label define mbpld_lbl 51100 `"Cambodia (Kampuchea)"', add
label define mbpld_lbl 51200 `"Indonesia"', add
label define mbpld_lbl 51210 `"East Indies"', add
label define mbpld_lbl 51220 `"East Timor"', add
label define mbpld_lbl 51300 `"Laos"', add
label define mbpld_lbl 51400 `"Malaysia"', add
label define mbpld_lbl 51500 `"Philippines"', add
label define mbpld_lbl 51600 `"Singapore"', add
label define mbpld_lbl 51700 `"Thailand"', add
label define mbpld_lbl 51800 `"Vietnam"', add
label define mbpld_lbl 51900 `"Southeast Asia, ns"', add
label define mbpld_lbl 51910 `"Indochina, ns"', add
label define mbpld_lbl 52000 `"Afghanistan"', add
label define mbpld_lbl 52100 `"India"', add
label define mbpld_lbl 52110 `"Bangladesh"', add
label define mbpld_lbl 52120 `"Bhutan"', add
label define mbpld_lbl 52130 `"Burma (Myanmar)"', add
label define mbpld_lbl 52140 `"Pakistan"', add
label define mbpld_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define mbpld_lbl 52200 `"Iran"', add
label define mbpld_lbl 52300 `"Maldives"', add
label define mbpld_lbl 52400 `"Nepal"', add
label define mbpld_lbl 53000 `"Bahrain"', add
label define mbpld_lbl 53100 `"Cyprus"', add
label define mbpld_lbl 53200 `"Iraq"', add
label define mbpld_lbl 53210 `"Mesopotamia"', add
label define mbpld_lbl 53300 `"Iraq/Saudi Arabia"', add
label define mbpld_lbl 53400 `"Israel/Palestine"', add
label define mbpld_lbl 53420 `"Palestine"', add
label define mbpld_lbl 53430 `"West Bank"', add
label define mbpld_lbl 53440 `"Israel"', add
label define mbpld_lbl 53410 `"Gaza Strip"', add
label define mbpld_lbl 53500 `"Jordan"', add
label define mbpld_lbl 53600 `"Kuwait"', add
label define mbpld_lbl 53700 `"Lebanon"', add
label define mbpld_lbl 53800 `"Oman"', add
label define mbpld_lbl 53900 `"Qatar"', add
label define mbpld_lbl 54000 `"Saudi Arabia"', add
label define mbpld_lbl 54100 `"Syria"', add
label define mbpld_lbl 54200 `"Turkey"', add
label define mbpld_lbl 54210 `"European Turkey"', add
label define mbpld_lbl 54220 `"Asian Turkey"', add
label define mbpld_lbl 54300 `"United Arab Emirates"', add
label define mbpld_lbl 54400 `"Yemen Arab Republic (North)"', add
label define mbpld_lbl 54500 `"Yemen, PDR (South)"', add
label define mbpld_lbl 54600 `"Persian Gulf States, ns"', add
label define mbpld_lbl 54700 `"Middle East, n.s."', add
label define mbpld_lbl 54800 `"Southwest Asia, nec/ns"', add
label define mbpld_lbl 54900 `"Asia Minor, n.s."', add
label define mbpld_lbl 55000 `"South Asia, n.e.c."', add
label define mbpld_lbl 59900 `"Asia, nec/ns"', add
label define mbpld_lbl 60000 `"AFRICA"', add
label define mbpld_lbl 60010 `"Northern Africa"', add
label define mbpld_lbl 60011 `"Algeria"', add
label define mbpld_lbl 60012 `"Egypt/United Arab Rep."', add
label define mbpld_lbl 60013 `"Libya"', add
label define mbpld_lbl 60014 `"Morocco"', add
label define mbpld_lbl 60015 `"Sudan"', add
label define mbpld_lbl 60016 `"Tunisia"', add
label define mbpld_lbl 60017 `"Western Sahara"', add
label define mbpld_lbl 60019 `"North Africa, ns"', add
label define mbpld_lbl 60020 `"Benin"', add
label define mbpld_lbl 60021 `"Burkina Faso"', add
label define mbpld_lbl 60022 `"Gambia"', add
label define mbpld_lbl 60023 `"Ghana"', add
label define mbpld_lbl 60024 `"Guinea"', add
label define mbpld_lbl 60025 `"Guinea-Bissau"', add
label define mbpld_lbl 60026 `"Ivory Coast"', add
label define mbpld_lbl 60027 `"Liberia"', add
label define mbpld_lbl 60028 `"Mali"', add
label define mbpld_lbl 60029 `"Mauritania"', add
label define mbpld_lbl 60030 `"Niger"', add
label define mbpld_lbl 60031 `"Nigeria"', add
label define mbpld_lbl 60032 `"Senegal"', add
label define mbpld_lbl 60033 `"Sierra Leone"', add
label define mbpld_lbl 60034 `"Togo"', add
label define mbpld_lbl 60038 `"Western Africa, n.s."', add
label define mbpld_lbl 60039 `"French West Africa, ns"', add
label define mbpld_lbl 60040 `"British Indian Ocean Territory"', add
label define mbpld_lbl 60041 `"Burundi"', add
label define mbpld_lbl 60042 `"Comoros"', add
label define mbpld_lbl 60043 `"Djibouti"', add
label define mbpld_lbl 60044 `"Ethiopia"', add
label define mbpld_lbl 60045 `"Kenya"', add
label define mbpld_lbl 60046 `"Madagascar"', add
label define mbpld_lbl 60047 `"Malawi"', add
label define mbpld_lbl 60048 `"Mauritius"', add
label define mbpld_lbl 60049 `"Mozambique"', add
label define mbpld_lbl 60050 `"Reunion"', add
label define mbpld_lbl 60051 `"Rwanda"', add
label define mbpld_lbl 60052 `"Seychelles"', add
label define mbpld_lbl 60053 `"Somalia"', add
label define mbpld_lbl 60054 `"Tanzania"', add
label define mbpld_lbl 60055 `"Uganda"', add
label define mbpld_lbl 60056 `"Zambia"', add
label define mbpld_lbl 60057 `"Zimbabwe"', add
label define mbpld_lbl 60058 `"Bassas de India"', add
label define mbpld_lbl 60059 `"Europa"', add
label define mbpld_lbl 60060 `"Gloriosos"', add
label define mbpld_lbl 60061 `"Juan de Nova"', add
label define mbpld_lbl 60062 `"Mayotte"', add
label define mbpld_lbl 60063 `"Tromelin"', add
label define mbpld_lbl 60064 `"Eastern Africa, nec/ns"', add
label define mbpld_lbl 60065 `"Eritrea"', add
label define mbpld_lbl 60070 `"Central Africa"', add
label define mbpld_lbl 60071 `"Angola"', add
label define mbpld_lbl 60072 `"Cameroon"', add
label define mbpld_lbl 60073 `"Central African Republic"', add
label define mbpld_lbl 60074 `"Chad"', add
label define mbpld_lbl 60075 `"Congo"', add
label define mbpld_lbl 60076 `"Equatorial Guinea"', add
label define mbpld_lbl 60077 `"Gabon"', add
label define mbpld_lbl 60078 `"Sao Tome and Principe"', add
label define mbpld_lbl 60079 `"Zaire"', add
label define mbpld_lbl 60080 `"Central Africa, ns"', add
label define mbpld_lbl 60081 `"Equatorial Africa, ns"', add
label define mbpld_lbl 60082 `"French Equatorial Africa, ns"', add
label define mbpld_lbl 60090 `"Southern Africa"', add
label define mbpld_lbl 60091 `"Botswana"', add
label define mbpld_lbl 60092 `"Lesotho"', add
label define mbpld_lbl 60093 `"Namibia"', add
label define mbpld_lbl 60094 `"South Africa (Union of)"', add
label define mbpld_lbl 60095 `"Swaziland"', add
label define mbpld_lbl 60096 `"Southern Africa, n.s."', add
label define mbpld_lbl 60099 `"Africa, ns/nec"', add
label define mbpld_lbl 70000 `"Australia and New Zealand"', add
label define mbpld_lbl 70010 `"Australia"', add
label define mbpld_lbl 70011 `"Ashmore and Cartier Islands"', add
label define mbpld_lbl 70012 `"Coral Sea Islands Territory"', add
label define mbpld_lbl 70013 `"Christmas Island"', add
label define mbpld_lbl 70014 `"Cocos Islands"', add
label define mbpld_lbl 70020 `"New Zealand"', add
label define mbpld_lbl 71000 `"Pacific Islands"', add
label define mbpld_lbl 71010 `"New Caledonia"', add
label define mbpld_lbl 71012 `"Papua New Guinea"', add
label define mbpld_lbl 71013 `"Solomon Islands"', add
label define mbpld_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define mbpld_lbl 71016 `"Melanesia, ns"', add
label define mbpld_lbl 71017 `"Norfolk Islands"', add
label define mbpld_lbl 71018 `"Niue"', add
label define mbpld_lbl 71020 `"Cook Islands"', add
label define mbpld_lbl 71021 `"Fiji"', add
label define mbpld_lbl 71022 `"French Polynesia"', add
label define mbpld_lbl 71023 `"Tonga"', add
label define mbpld_lbl 71024 `"Wallis and Futuna Islands"', add
label define mbpld_lbl 71025 `"Western Samoa"', add
label define mbpld_lbl 71026 `"Pitcairn Island"', add
label define mbpld_lbl 71027 `"Tokelau"', add
label define mbpld_lbl 71028 `"Tuvalu"', add
label define mbpld_lbl 71029 `"Polynesia, n.s."', add
label define mbpld_lbl 71032 `"Kiribati"', add
label define mbpld_lbl 71033 `"Canton and Enderbury"', add
label define mbpld_lbl 71034 `"Nauru"', add
label define mbpld_lbl 71039 `"Micronesia, ns"', add
label define mbpld_lbl 71040 `"US Pacific Trust Territories"', add
label define mbpld_lbl 71041 `"Marshall Islands"', add
label define mbpld_lbl 71042 `"Micronesia"', add
label define mbpld_lbl 71043 `"Kosrae"', add
label define mbpld_lbl 71044 `"Pohnpei"', add
label define mbpld_lbl 71045 `"Truk"', add
label define mbpld_lbl 71046 `"Yap"', add
label define mbpld_lbl 71047 `"Northern Mariana Islands"', add
label define mbpld_lbl 71048 `"Palau"', add
label define mbpld_lbl 71049 `"Pacific Trust Terr, ns"', add
label define mbpld_lbl 71050 `"Clipperton Island"', add
label define mbpld_lbl 71090 `"Oceania, ns/nec"', add
label define mbpld_lbl 80000 `"Antarctica, ns/nec"', add
label define mbpld_lbl 80010 `"Bouvet Islands"', add
label define mbpld_lbl 80020 `"British Antarctic Terr."', add
label define mbpld_lbl 80030 `"Dronning Maud Land"', add
label define mbpld_lbl 80040 `"French Southern and Antarctic Lands"', add
label define mbpld_lbl 80050 `"Heard and McDonald Islands"', add
label define mbpld_lbl 90000 `"Abroad (unknown) or at sea"', add
label define mbpld_lbl 90010 `"Abroad, ns"', add
label define mbpld_lbl 90011 `"Abroad (US citizen)"', add
label define mbpld_lbl 90020 `"At sea"', add
label define mbpld_lbl 90021 `"At sea (US citizen)"', add
label define mbpld_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define mbpld_lbl 95000 `"Other n.e.c."', add
label define mbpld_lbl 99700 `"Unknown"', add
label define mbpld_lbl 99900 `"Missing/blank"', add
label values mbpld mbpld_lbl

label define fbpl_lbl 000 `"Not Applicable"'
label define fbpl_lbl 001 `"Alabama"', add
label define fbpl_lbl 002 `"Alaska"', add
label define fbpl_lbl 004 `"Arizona"', add
label define fbpl_lbl 005 `"Arkansas"', add
label define fbpl_lbl 006 `"California"', add
label define fbpl_lbl 008 `"Colorado"', add
label define fbpl_lbl 009 `"Connecticut"', add
label define fbpl_lbl 010 `"Delaware"', add
label define fbpl_lbl 011 `"District of Columbia"', add
label define fbpl_lbl 012 `"Florida"', add
label define fbpl_lbl 013 `"Georgia"', add
label define fbpl_lbl 015 `"Hawaii"', add
label define fbpl_lbl 016 `"Idaho"', add
label define fbpl_lbl 017 `"Illinois"', add
label define fbpl_lbl 018 `"Indiana"', add
label define fbpl_lbl 019 `"Iowa"', add
label define fbpl_lbl 020 `"Kansas"', add
label define fbpl_lbl 021 `"Kentucky"', add
label define fbpl_lbl 022 `"Louisiana"', add
label define fbpl_lbl 023 `"Maine"', add
label define fbpl_lbl 024 `"Maryland"', add
label define fbpl_lbl 025 `"Massachusetts"', add
label define fbpl_lbl 026 `"Michigan"', add
label define fbpl_lbl 027 `"Minnesota"', add
label define fbpl_lbl 028 `"Mississippi"', add
label define fbpl_lbl 029 `"Missouri"', add
label define fbpl_lbl 030 `"Montana"', add
label define fbpl_lbl 031 `"Nebraska"', add
label define fbpl_lbl 032 `"Nevada"', add
label define fbpl_lbl 033 `"New Hampshire"', add
label define fbpl_lbl 034 `"New Jersey"', add
label define fbpl_lbl 035 `"New Mexico"', add
label define fbpl_lbl 036 `"New York"', add
label define fbpl_lbl 037 `"North Carolina"', add
label define fbpl_lbl 038 `"North Dakota"', add
label define fbpl_lbl 039 `"Ohio"', add
label define fbpl_lbl 040 `"Oklahoma"', add
label define fbpl_lbl 041 `"Oregon"', add
label define fbpl_lbl 042 `"Pennsylvania"', add
label define fbpl_lbl 044 `"Rhode Island"', add
label define fbpl_lbl 045 `"South Carolina"', add
label define fbpl_lbl 046 `"South Dakota"', add
label define fbpl_lbl 047 `"Tennessee"', add
label define fbpl_lbl 048 `"Texas"', add
label define fbpl_lbl 049 `"Utah"', add
label define fbpl_lbl 050 `"Vermont"', add
label define fbpl_lbl 051 `"Virginia"', add
label define fbpl_lbl 053 `"Washington"', add
label define fbpl_lbl 054 `"West Virginia"', add
label define fbpl_lbl 055 `"Wisconsin"', add
label define fbpl_lbl 056 `"Wyoming"', add
label define fbpl_lbl 090 `"Native American"', add
label define fbpl_lbl 099 `"United States, ns"', add
label define fbpl_lbl 100 `"American Samoa"', add
label define fbpl_lbl 105 `"Guam"', add
label define fbpl_lbl 110 `"Puerto Rico"', add
label define fbpl_lbl 115 `"US Virgin Islands"', add
label define fbpl_lbl 120 `"Other US Possessions"', add
label define fbpl_lbl 150 `"Canada"', add
label define fbpl_lbl 155 `"St Pierre and Miquelon"', add
label define fbpl_lbl 160 `"Atlantic Islands"', add
label define fbpl_lbl 199 `"North America, n.s."', add
label define fbpl_lbl 200 `"Mexico"', add
label define fbpl_lbl 210 `"Central America"', add
label define fbpl_lbl 250 `"Cuba"', add
label define fbpl_lbl 260 `"West Indies"', add
label define fbpl_lbl 299 `"Americas, n.s."', add
label define fbpl_lbl 300 `"SOUTH AMERICA"', add
label define fbpl_lbl 400 `"Denmark"', add
label define fbpl_lbl 401 `"Finland"', add
label define fbpl_lbl 402 `"Iceland"', add
label define fbpl_lbl 403 `"Lapland, n.s."', add
label define fbpl_lbl 404 `"Norway"', add
label define fbpl_lbl 405 `"Sweden"', add
label define fbpl_lbl 406 `"Svalbard"', add
label define fbpl_lbl 410 `"England"', add
label define fbpl_lbl 411 `"Scotland"', add
label define fbpl_lbl 412 `"Wales"', add
label define fbpl_lbl 413 `"United Kingdom, ns"', add
label define fbpl_lbl 414 `"Ireland"', add
label define fbpl_lbl 419 `"Northern Europe, ns"', add
label define fbpl_lbl 420 `"Belgium"', add
label define fbpl_lbl 421 `"France"', add
label define fbpl_lbl 422 `"Liechtenstein"', add
label define fbpl_lbl 423 `"Luxembourg"', add
label define fbpl_lbl 424 `"Monaco"', add
label define fbpl_lbl 425 `"Netherlands"', add
label define fbpl_lbl 426 `"Switzerland"', add
label define fbpl_lbl 429 `"Western Europe, ns"', add
label define fbpl_lbl 430 `"Albania"', add
label define fbpl_lbl 431 `"Andorra"', add
label define fbpl_lbl 432 `"Gibraltar"', add
label define fbpl_lbl 433 `"Greece"', add
label define fbpl_lbl 434 `"Italy"', add
label define fbpl_lbl 435 `"Malta"', add
label define fbpl_lbl 436 `"Portugal"', add
label define fbpl_lbl 437 `"San Marino"', add
label define fbpl_lbl 438 `"Spain"', add
label define fbpl_lbl 439 `"Vatican City"', add
label define fbpl_lbl 440 `"Southern Europe, n.s."', add
label define fbpl_lbl 450 `"Austria"', add
label define fbpl_lbl 451 `"Bulgaria"', add
label define fbpl_lbl 452 `"Czechsolovakia"', add
label define fbpl_lbl 453 `"Germany"', add
label define fbpl_lbl 454 `"Hungary"', add
label define fbpl_lbl 455 `"Poland"', add
label define fbpl_lbl 456 `"Romania"', add
label define fbpl_lbl 457 `"Yugoslavia"', add
label define fbpl_lbl 458 `"Central Europe, ns"', add
label define fbpl_lbl 459 `"Eastern Europe, ns"', add
label define fbpl_lbl 460 `"Estonia"', add
label define fbpl_lbl 461 `"Latvia"', add
label define fbpl_lbl 462 `"Lithuania"', add
label define fbpl_lbl 463 `"Baltic States, ns"', add
label define fbpl_lbl 465 `"Other USSR/Russia"', add
label define fbpl_lbl 499 `"Europe, nec/ns"', add
label define fbpl_lbl 500 `"China"', add
label define fbpl_lbl 501 `"Japan"', add
label define fbpl_lbl 502 `"Korea"', add
label define fbpl_lbl 510 `"Brunei"', add
label define fbpl_lbl 511 `"Cambodia (Kampuchea)"', add
label define fbpl_lbl 512 `"Indonesia"', add
label define fbpl_lbl 513 `"Laos"', add
label define fbpl_lbl 514 `"Malaysia"', add
label define fbpl_lbl 515 `"Philippines"', add
label define fbpl_lbl 516 `"Singapore"', add
label define fbpl_lbl 517 `"Thailand"', add
label define fbpl_lbl 518 `"Vietnam"', add
label define fbpl_lbl 519 `"Southeast Asia, ns"', add
label define fbpl_lbl 520 `"Afghanistan"', add
label define fbpl_lbl 521 `"India"', add
label define fbpl_lbl 522 `"Iran"', add
label define fbpl_lbl 523 `"Maldives"', add
label define fbpl_lbl 524 `"Nepal"', add
label define fbpl_lbl 530 `"Bahrain"', add
label define fbpl_lbl 531 `"Cyprus"', add
label define fbpl_lbl 532 `"Iraq"', add
label define fbpl_lbl 533 `"Iraq/Saudi Arabia"', add
label define fbpl_lbl 534 `"Israel/Palestine"', add
label define fbpl_lbl 535 `"Jordan"', add
label define fbpl_lbl 536 `"Kuwait"', add
label define fbpl_lbl 537 `"Lebanon"', add
label define fbpl_lbl 538 `"Oman"', add
label define fbpl_lbl 539 `"Qatar"', add
label define fbpl_lbl 540 `"Saudi Arabia"', add
label define fbpl_lbl 541 `"Syria"', add
label define fbpl_lbl 542 `"Turkey"', add
label define fbpl_lbl 543 `"United Arab Emirates"', add
label define fbpl_lbl 544 `"Yemen Arab Republic (North)"', add
label define fbpl_lbl 545 `"Yemen, PDR (South)"', add
label define fbpl_lbl 546 `"Persian Gulf States, n.s."', add
label define fbpl_lbl 547 `"Middle East, ns"', add
label define fbpl_lbl 548 `"Southwest Asia, nec/ns"', add
label define fbpl_lbl 549 `"Asia Minor, n.s."', add
label define fbpl_lbl 550 `"South Asia, n.e.c."', add
label define fbpl_lbl 599 `"Asia, nec/ns"', add
label define fbpl_lbl 600 `"AFRICA"', add
label define fbpl_lbl 700 `"Australia and New Zealand"', add
label define fbpl_lbl 710 `"Pacific Islands"', add
label define fbpl_lbl 900 `"Abroad (unknown) or at sea"', add
label define fbpl_lbl 950 `"Other n.e.c."', add
label define fbpl_lbl 997 `"Unknown"', add
label define fbpl_lbl 998 `"Illegible"', add
label define fbpl_lbl 999 `"Missing/blank"', add
label values fbpl fbpl_lbl

label define fbpld_lbl 00000 `"Not Applicable"'
label define fbpld_lbl 00100 `"Alabama"', add
label define fbpld_lbl 00200 `"Alaska"', add
label define fbpld_lbl 00400 `"Arizona"', add
label define fbpld_lbl 00500 `"Arkansas"', add
label define fbpld_lbl 00600 `"California"', add
label define fbpld_lbl 00800 `"Colorado"', add
label define fbpld_lbl 00900 `"Connecticut"', add
label define fbpld_lbl 01000 `"Delaware"', add
label define fbpld_lbl 01100 `"District of Columbia"', add
label define fbpld_lbl 01200 `"Florida"', add
label define fbpld_lbl 01300 `"Georgia"', add
label define fbpld_lbl 01500 `"Hawaii"', add
label define fbpld_lbl 01600 `"Idaho"', add
label define fbpld_lbl 01610 `"Idaho Territory"', add
label define fbpld_lbl 01700 `"Illinois"', add
label define fbpld_lbl 01800 `"Indiana"', add
label define fbpld_lbl 01900 `"Iowa"', add
label define fbpld_lbl 02000 `"Kansas"', add
label define fbpld_lbl 02100 `"Kentucky"', add
label define fbpld_lbl 02200 `"Louisiana"', add
label define fbpld_lbl 02300 `"Maine"', add
label define fbpld_lbl 02400 `"Maryland"', add
label define fbpld_lbl 02500 `"Massachusetts"', add
label define fbpld_lbl 02600 `"Michigan"', add
label define fbpld_lbl 02700 `"Minnesota"', add
label define fbpld_lbl 02800 `"Mississippi"', add
label define fbpld_lbl 02900 `"Missouri"', add
label define fbpld_lbl 03000 `"Montana"', add
label define fbpld_lbl 03100 `"Nebraska"', add
label define fbpld_lbl 03200 `"Nevada"', add
label define fbpld_lbl 03300 `"New Hampshire"', add
label define fbpld_lbl 03400 `"New Jersey"', add
label define fbpld_lbl 03500 `"New Mexico"', add
label define fbpld_lbl 03510 `"New Mexico Territory"', add
label define fbpld_lbl 03600 `"New York"', add
label define fbpld_lbl 03700 `"North Carolina"', add
label define fbpld_lbl 03800 `"North Dakota"', add
label define fbpld_lbl 03900 `"Ohio"', add
label define fbpld_lbl 04000 `"Oklahoma"', add
label define fbpld_lbl 04010 `"Indian Territory"', add
label define fbpld_lbl 04100 `"Oregon"', add
label define fbpld_lbl 04200 `"Pennsylvania"', add
label define fbpld_lbl 04400 `"Rhode Island"', add
label define fbpld_lbl 04500 `"South Carolina"', add
label define fbpld_lbl 04600 `"South Dakota"', add
label define fbpld_lbl 04610 `"Dakota Territory"', add
label define fbpld_lbl 04700 `"Tennessee"', add
label define fbpld_lbl 04800 `"Texas"', add
label define fbpld_lbl 04900 `"Utah"', add
label define fbpld_lbl 04910 `"Utah Territory"', add
label define fbpld_lbl 05000 `"Vermont"', add
label define fbpld_lbl 05100 `"Virginia"', add
label define fbpld_lbl 05300 `"Washington"', add
label define fbpld_lbl 05400 `"West Virginia"', add
label define fbpld_lbl 05500 `"Wisconsin"', add
label define fbpld_lbl 05600 `"Wyoming"', add
label define fbpld_lbl 05610 `"Wyoming Territory"', add
label define fbpld_lbl 09000 `"Native American"', add
label define fbpld_lbl 09900 `"United States, ns"', add
label define fbpld_lbl 10000 `"American Samoa"', add
label define fbpld_lbl 10010 `"Samoa, 1940-1950"', add
label define fbpld_lbl 10500 `"Guam"', add
label define fbpld_lbl 11000 `"Puerto Rico"', add
label define fbpld_lbl 11500 `"US Virgin Islands"', add
label define fbpld_lbl 11510 `"St Croix"', add
label define fbpld_lbl 11520 `"St. John"', add
label define fbpld_lbl 11530 `"St Thomas"', add
label define fbpld_lbl 12000 `"Other US Possessions"', add
label define fbpld_lbl 12010 `"Johnston Atoll"', add
label define fbpld_lbl 12020 `"Midway Islands"', add
label define fbpld_lbl 12030 `"Wake Island"', add
label define fbpld_lbl 12040 `"Other US Caribbean Islands"', add
label define fbpld_lbl 12041 `"Navassa Island"', add
label define fbpld_lbl 12050 `"Other US Pacific Is."', add
label define fbpld_lbl 12051 `"Baker Island"', add
label define fbpld_lbl 12052 `"Howland Island"', add
label define fbpld_lbl 12053 `"Jarvis Island"', add
label define fbpld_lbl 12054 `"Kingman Reef"', add
label define fbpld_lbl 12055 `"Palmyra Atoll"', add
label define fbpld_lbl 12056 `"Canton and Enderbury Island"', add
label define fbpld_lbl 12090 `"US outlying areas, ns"', add
label define fbpld_lbl 12091 `"US Possessions, ns"', add
label define fbpld_lbl 12092 `"US territory, ns"', add
label define fbpld_lbl 15000 `"Canada"', add
label define fbpld_lbl 15010 `"English Canada"', add
label define fbpld_lbl 15011 `"British Columbia"', add
label define fbpld_lbl 15013 `"Alberta"', add
label define fbpld_lbl 15015 `"Saskatchewan"', add
label define fbpld_lbl 15017 `"Northwest"', add
label define fbpld_lbl 15019 `"Ruperts Land"', add
label define fbpld_lbl 15020 `"Manitoba"', add
label define fbpld_lbl 15021 `"Red River"', add
label define fbpld_lbl 15030 `"Ontario/Upper Canada"', add
label define fbpld_lbl 15031 `"Upper Canada"', add
label define fbpld_lbl 15032 `"Canada West"', add
label define fbpld_lbl 15040 `"New Brunswick"', add
label define fbpld_lbl 15042 `"Canada West"', add
label define fbpld_lbl 15050 `"Nova Scotia"', add
label define fbpld_lbl 15051 `"Cape Breton"', add
label define fbpld_lbl 15052 `"Halifax"', add
label define fbpld_lbl 15060 `"Prince Edward Island"', add
label define fbpld_lbl 15070 `"Newfoundland"', add
label define fbpld_lbl 15080 `"French Canada"', add
label define fbpld_lbl 15081 `"Quebec"', add
label define fbpld_lbl 15082 `"Lower Canada"', add
label define fbpld_lbl 15083 `"Canada East"', add
label define fbpld_lbl 15500 `"St Pierre and Miquelon"', add
label define fbpld_lbl 16000 `"Atlantic Islands"', add
label define fbpld_lbl 16010 `"Bermuda"', add
label define fbpld_lbl 16020 `"Cape Verde"', add
label define fbpld_lbl 16030 `"Falkland Islands"', add
label define fbpld_lbl 16040 `"Greenland"', add
label define fbpld_lbl 16050 `"St Helena and Ascension"', add
label define fbpld_lbl 16060 `"Canary Islands"', add
label define fbpld_lbl 19900 `"North America, n.s."', add
label define fbpld_lbl 20000 `"Mexico"', add
label define fbpld_lbl 21000 `"Central America"', add
label define fbpld_lbl 21010 `"Belize/British Honduras"', add
label define fbpld_lbl 21020 `"Costa Rica"', add
label define fbpld_lbl 21030 `"El Salvador"', add
label define fbpld_lbl 21040 `"Guatemala"', add
label define fbpld_lbl 21050 `"Honduras"', add
label define fbpld_lbl 21060 `"Nicaragua"', add
label define fbpld_lbl 21070 `"Panama"', add
label define fbpld_lbl 21071 `"Canal Zone"', add
label define fbpld_lbl 21090 `"Central America, ns"', add
label define fbpld_lbl 25000 `"Cuba"', add
label define fbpld_lbl 26000 `"West Indies"', add
label define fbpld_lbl 26010 `"Dominican Republic"', add
label define fbpld_lbl 26020 `"Haiti"', add
label define fbpld_lbl 26030 `"Jamaica"', add
label define fbpld_lbl 26040 `"British West Indies"', add
label define fbpld_lbl 26041 `"Anguilla"', add
label define fbpld_lbl 26042 `"Antigua-Barbuda"', add
label define fbpld_lbl 26043 `"Bahamas"', add
label define fbpld_lbl 26044 `"Barbados"', add
label define fbpld_lbl 26045 `"British Virgin Islands"', add
label define fbpld_lbl 26046 `"Anegada"', add
label define fbpld_lbl 26047 `"Cooper"', add
label define fbpld_lbl 26048 `"Jost Van Dyke"', add
label define fbpld_lbl 26049 `"Peter"', add
label define fbpld_lbl 26050 `"Tortola"', add
label define fbpld_lbl 26051 `"Virgin Gorda"', add
label define fbpld_lbl 26052 `"Br. Virgin Islands, ns"', add
label define fbpld_lbl 26053 `"Cayman Islands"', add
label define fbpld_lbl 26054 `"Dominica"', add
label define fbpld_lbl 26055 `"Grenada"', add
label define fbpld_lbl 26056 `"Montserrat"', add
label define fbpld_lbl 26057 `"St Kitts-Nevis"', add
label define fbpld_lbl 26058 `"St Lucia"', add
label define fbpld_lbl 26059 `"St Vincent"', add
label define fbpld_lbl 26060 `"Trinidad and Tobago"', add
label define fbpld_lbl 26061 `"Turks and Caicos"', add
label define fbpld_lbl 26069 `"British West Indies, ns"', add
label define fbpld_lbl 26070 `"Other West Indies"', add
label define fbpld_lbl 26071 `"Aruba"', add
label define fbpld_lbl 26072 `"Netherlands Antilles"', add
label define fbpld_lbl 26073 `"Bonaire"', add
label define fbpld_lbl 26074 `"Curacao"', add
label define fbpld_lbl 26075 `"Dutch St. Maarten"', add
label define fbpld_lbl 26076 `"Saba"', add
label define fbpld_lbl 26077 `"St. Eustatius"', add
label define fbpld_lbl 26079 `"Dutch Caribbean, ns"', add
label define fbpld_lbl 26080 `"French St Maarten"', add
label define fbpld_lbl 26081 `"Guadeloupe"', add
label define fbpld_lbl 26082 `"Martinique"', add
label define fbpld_lbl 26083 `"St. Barthelemy"', add
label define fbpld_lbl 26089 `"French Caribbean, ns"', add
label define fbpld_lbl 26090 `"Antilles, n.s."', add
label define fbpld_lbl 26091 `"Caribbean, n.s. / n.e.c."', add
label define fbpld_lbl 26092 `"Latin America, ns"', add
label define fbpld_lbl 26093 `"Leeward Islands, ns"', add
label define fbpld_lbl 26094 `"West Indies, ns"', add
label define fbpld_lbl 26095 `"Winward Islands"', add
label define fbpld_lbl 29900 `"Americas, ns"', add
label define fbpld_lbl 30000 `"South America"', add
label define fbpld_lbl 30005 `"Argentina"', add
label define fbpld_lbl 30010 `"Bolivia"', add
label define fbpld_lbl 30015 `"Brazil"', add
label define fbpld_lbl 30020 `"Chile"', add
label define fbpld_lbl 30025 `"Colombia"', add
label define fbpld_lbl 30030 `"Ecuador"', add
label define fbpld_lbl 30035 `"French Guiana"', add
label define fbpld_lbl 30040 `"Guyana/British Guiana"', add
label define fbpld_lbl 30045 `"Paraguay"', add
label define fbpld_lbl 30050 `"Peru"', add
label define fbpld_lbl 30055 `"Suriname"', add
label define fbpld_lbl 30060 `"Uruguay"', add
label define fbpld_lbl 30065 `"Venezuela"', add
label define fbpld_lbl 30090 `"South America, ns"', add
label define fbpld_lbl 30091 `"South and Central America, n.s."', add
label define fbpld_lbl 40000 `"Denmark"', add
label define fbpld_lbl 40010 `"Faroe Islands"', add
label define fbpld_lbl 40100 `"Finland"', add
label define fbpld_lbl 40200 `"Iceland"', add
label define fbpld_lbl 40300 `"Lapland, ns"', add
label define fbpld_lbl 40400 `"Norway"', add
label define fbpld_lbl 40410 `"Svalbard and Jan Meyen"', add
label define fbpld_lbl 40412 `"Jan Meyen"', add
label define fbpld_lbl 40500 `"Sweden"', add
label define fbpld_lbl 40600 `"Svalbard"', add
label define fbpld_lbl 41000 `"England"', add
label define fbpld_lbl 41010 `"Channel Islands"', add
label define fbpld_lbl 41011 `"Guernsey"', add
label define fbpld_lbl 41012 `"Jersey"', add
label define fbpld_lbl 41020 `"Isle of Man"', add
label define fbpld_lbl 41100 `"Scotland"', add
label define fbpld_lbl 41200 `"Wales"', add
label define fbpld_lbl 41300 `"United Kingdom, ns"', add
label define fbpld_lbl 41400 `"Ireland"', add
label define fbpld_lbl 41410 `"Northern Ireland"', add
label define fbpld_lbl 41900 `"Northern Europe, ns"', add
label define fbpld_lbl 42000 `"Belgium"', add
label define fbpld_lbl 42100 `"France"', add
label define fbpld_lbl 42110 `"Alsace-Lorraine"', add
label define fbpld_lbl 42111 `"Alsace"', add
label define fbpld_lbl 42112 `"Lorraine"', add
label define fbpld_lbl 42200 `"Liechtenstein"', add
label define fbpld_lbl 42300 `"Luxembourg"', add
label define fbpld_lbl 42400 `"Monaco"', add
label define fbpld_lbl 42500 `"Netherlands"', add
label define fbpld_lbl 42600 `"Switzerland"', add
label define fbpld_lbl 42900 `"Western Europe, ns"', add
label define fbpld_lbl 43000 `"Albania"', add
label define fbpld_lbl 43100 `"Andorra"', add
label define fbpld_lbl 43200 `"Gibraltar"', add
label define fbpld_lbl 43300 `"Greece"', add
label define fbpld_lbl 43310 `"Dodecanese Islands"', add
label define fbpld_lbl 43320 `"Turkey Greece"', add
label define fbpld_lbl 43330 `"Macedonia"', add
label define fbpld_lbl 43400 `"Italy"', add
label define fbpld_lbl 43500 `"Malta"', add
label define fbpld_lbl 43600 `"Portugal"', add
label define fbpld_lbl 43610 `"Azores"', add
label define fbpld_lbl 43620 `"Madeira Islands"', add
label define fbpld_lbl 43630 `"Cape Verde Islands"', add
label define fbpld_lbl 43640 `"St Miguel"', add
label define fbpld_lbl 43700 `"San Marino"', add
label define fbpld_lbl 43800 `"Spain"', add
label define fbpld_lbl 43900 `"Vatican City"', add
label define fbpld_lbl 44000 `"Southern Europe, ns"', add
label define fbpld_lbl 45000 `"Austria"', add
label define fbpld_lbl 45010 `"Austria-Hungary"', add
label define fbpld_lbl 45020 `"Austria-Graz"', add
label define fbpld_lbl 45030 `"Austria-Linz"', add
label define fbpld_lbl 45040 `"Austria-Salzburg"', add
label define fbpld_lbl 45050 `"Austria-Tyrol"', add
label define fbpld_lbl 45060 `"Austria-Vienna"', add
label define fbpld_lbl 45070 `"Austria-Kaernsten"', add
label define fbpld_lbl 45080 `"Austria-Neustadt"', add
label define fbpld_lbl 45100 `"Bulgaria"', add
label define fbpld_lbl 45200 `"Czechsolovakia"', add
label define fbpld_lbl 45210 `"Bohemia"', add
label define fbpld_lbl 45211 `"Bohemia-Moravia"', add
label define fbpld_lbl 45212 `"Slovakia"', add
label define fbpld_lbl 45213 `"Czech Republic"', add
label define fbpld_lbl 45300 `"Germany"', add
label define fbpld_lbl 45301 `"Berlin"', add
label define fbpld_lbl 45310 `"West Germany"', add
label define fbpld_lbl 45311 `"Baden"', add
label define fbpld_lbl 45312 `"Bavaria"', add
label define fbpld_lbl 45313 `"Bremen"', add
label define fbpld_lbl 45314 `"Braunschweig"', add
label define fbpld_lbl 45315 `"Hamburg"', add
label define fbpld_lbl 45316 `"Hanover"', add
label define fbpld_lbl 45317 `"Hessen"', add
label define fbpld_lbl 45318 `"Hesse-Nassau"', add
label define fbpld_lbl 45319 `"Holstein"', add
label define fbpld_lbl 45320 `"Lippe"', add
label define fbpld_lbl 45321 `"Lubeck"', add
label define fbpld_lbl 45322 `"Oldenburg"', add
label define fbpld_lbl 45323 `"Rheinland"', add
label define fbpld_lbl 45324 `"Schleswig"', add
label define fbpld_lbl 45325 `"Schleswig-Holstein"', add
label define fbpld_lbl 45326 `"Schwarzburg"', add
label define fbpld_lbl 45327 `"Waldeck"', add
label define fbpld_lbl 45328 `"West Berlin"', add
label define fbpld_lbl 45329 `"Westphalia"', add
label define fbpld_lbl 45330 `"Wurttemberg"', add
label define fbpld_lbl 45331 `"Frankfurt"', add
label define fbpld_lbl 45332 `"Saarland"', add
label define fbpld_lbl 45333 `"Nordrhein-Westfalen"', add
label define fbpld_lbl 45340 `"East Germany"', add
label define fbpld_lbl 45341 `"Anhalt"', add
label define fbpld_lbl 45342 `"Brandenburg"', add
label define fbpld_lbl 45343 `"East Berlin"', add
label define fbpld_lbl 45344 `"Mecklenburg"', add
label define fbpld_lbl 45345 `"Sachsen-Altenburg"', add
label define fbpld_lbl 45346 `"Sachsen-Coburg"', add
label define fbpld_lbl 45347 `"Sachsen-Gotha"', add
label define fbpld_lbl 45348 `"Sachsen-Meiningen"', add
label define fbpld_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define fbpld_lbl 45350 `"Saxony"', add
label define fbpld_lbl 45351 `"Schwerin"', add
label define fbpld_lbl 45352 `"Strelitz"', add
label define fbpld_lbl 45353 `"Thuringian States"', add
label define fbpld_lbl 45360 `"Prussia, nec"', add
label define fbpld_lbl 45361 `"Hohenzollern"', add
label define fbpld_lbl 45362 `"Niedersachsen"', add
label define fbpld_lbl 45400 `"Hungary"', add
label define fbpld_lbl 45500 `"Poland"', add
label define fbpld_lbl 45510 `"Austrian Poland"', add
label define fbpld_lbl 45511 `"Galicia"', add
label define fbpld_lbl 45520 `"German Poland"', add
label define fbpld_lbl 45521 `"East Prussia"', add
label define fbpld_lbl 45522 `"Pomerania"', add
label define fbpld_lbl 45523 `"Posen"', add
label define fbpld_lbl 45524 `"Prussian Poland"', add
label define fbpld_lbl 45525 `"Silesia"', add
label define fbpld_lbl 45526 `"West Prussia"', add
label define fbpld_lbl 45530 `"Russian Poland"', add
label define fbpld_lbl 45600 `"Romania"', add
label define fbpld_lbl 45610 `"Transylvania"', add
label define fbpld_lbl 45700 `"Yugoslavia"', add
label define fbpld_lbl 45710 `"Croatia"', add
label define fbpld_lbl 45720 `"Montenegro"', add
label define fbpld_lbl 45730 `"Serbia"', add
label define fbpld_lbl 45740 `"Bosnia"', add
label define fbpld_lbl 45750 `"Dalmatia"', add
label define fbpld_lbl 45760 `"Slovonia"', add
label define fbpld_lbl 45770 `"Carniola"', add
label define fbpld_lbl 45780 `"Slovenia"', add
label define fbpld_lbl 45790 `"Kosovo"', add
label define fbpld_lbl 45800 `"Central Europe, ns"', add
label define fbpld_lbl 45900 `"Eastern Europe, ns"', add
label define fbpld_lbl 46000 `"Estonia"', add
label define fbpld_lbl 46100 `"Latvia"', add
label define fbpld_lbl 46200 `"Lithuania"', add
label define fbpld_lbl 46300 `"Baltic States, ns"', add
label define fbpld_lbl 46500 `"Other USSR/Russia"', add
label define fbpld_lbl 46510 `"Byelorussia"', add
label define fbpld_lbl 46520 `"Moldavia"', add
label define fbpld_lbl 46521 `"Bessarabia"', add
label define fbpld_lbl 46530 `"Ukraine"', add
label define fbpld_lbl 46540 `"Armenia"', add
label define fbpld_lbl 46541 `"Azerbaijan"', add
label define fbpld_lbl 46542 `"Republic of Georgia"', add
label define fbpld_lbl 46543 `"Kazakhstan"', add
label define fbpld_lbl 46544 `"Kirghizia"', add
label define fbpld_lbl 46545 `"Tadzhik"', add
label define fbpld_lbl 46546 `"Turkmenistan"', add
label define fbpld_lbl 46547 `"Uzbekistan"', add
label define fbpld_lbl 46548 `"Siberia"', add
label define fbpld_lbl 46590 `"USSR, ns"', add
label define fbpld_lbl 49900 `"Europe, nec/ns"', add
label define fbpld_lbl 50000 `"China"', add
label define fbpld_lbl 50010 `"Hong Kong"', add
label define fbpld_lbl 50020 `"Macau"', add
label define fbpld_lbl 50030 `"Mongolia"', add
label define fbpld_lbl 50040 `"Taiwan"', add
label define fbpld_lbl 50100 `"Japan"', add
label define fbpld_lbl 50200 `"Korea"', add
label define fbpld_lbl 50210 `"North Korea"', add
label define fbpld_lbl 50220 `"South Korea"', add
label define fbpld_lbl 50900 `"East Asia, n.s."', add
label define fbpld_lbl 51000 `"Brunei"', add
label define fbpld_lbl 51100 `"Cambodia (Kampuchea)"', add
label define fbpld_lbl 51200 `"Indonesia"', add
label define fbpld_lbl 51210 `"East Indies"', add
label define fbpld_lbl 51220 `"East Timor"', add
label define fbpld_lbl 51300 `"Laos"', add
label define fbpld_lbl 51400 `"Malaysia"', add
label define fbpld_lbl 51500 `"Philippines"', add
label define fbpld_lbl 51600 `"Singapore"', add
label define fbpld_lbl 51700 `"Thailand"', add
label define fbpld_lbl 51800 `"Vietnam"', add
label define fbpld_lbl 51900 `"Southeast Asia, ns"', add
label define fbpld_lbl 51910 `"Indochina, ns"', add
label define fbpld_lbl 52000 `"Afghanistan"', add
label define fbpld_lbl 52100 `"India"', add
label define fbpld_lbl 52110 `"Bangladesh"', add
label define fbpld_lbl 52120 `"Bhutan"', add
label define fbpld_lbl 52130 `"Burma (Myanmar)"', add
label define fbpld_lbl 52140 `"Pakistan"', add
label define fbpld_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define fbpld_lbl 52200 `"Iran"', add
label define fbpld_lbl 52300 `"Maldives"', add
label define fbpld_lbl 52400 `"Nepal"', add
label define fbpld_lbl 53000 `"Bahrain"', add
label define fbpld_lbl 53100 `"Cyprus"', add
label define fbpld_lbl 53200 `"Iraq"', add
label define fbpld_lbl 53210 `"Mesopotamia"', add
label define fbpld_lbl 53300 `"Iraq/Saudi Arabia"', add
label define fbpld_lbl 53400 `"Israel/Palestine"', add
label define fbpld_lbl 53410 `"Gaza Strip"', add
label define fbpld_lbl 53420 `"Palestine"', add
label define fbpld_lbl 53430 `"West Bank"', add
label define fbpld_lbl 53440 `"Israel"', add
label define fbpld_lbl 53500 `"Jordan"', add
label define fbpld_lbl 53600 `"Kuwait"', add
label define fbpld_lbl 53700 `"Lebanon"', add
label define fbpld_lbl 53800 `"Oman"', add
label define fbpld_lbl 53900 `"Qatar"', add
label define fbpld_lbl 54000 `"Saudi Arabia"', add
label define fbpld_lbl 54100 `"Syria"', add
label define fbpld_lbl 54200 `"Turkey"', add
label define fbpld_lbl 54210 `"European Turkey"', add
label define fbpld_lbl 54220 `"Asian Turkey"', add
label define fbpld_lbl 54300 `"United Arab Emirates"', add
label define fbpld_lbl 54400 `"Yemen Arab Republic (North)"', add
label define fbpld_lbl 54500 `"Yemen, PDR (South)"', add
label define fbpld_lbl 54600 `"Persian Gulf States, ns"', add
label define fbpld_lbl 54700 `"Middle East, ns"', add
label define fbpld_lbl 54800 `"Southwest Asia, nec/ns"', add
label define fbpld_lbl 54900 `"Asia Minor, ns"', add
label define fbpld_lbl 55000 `"South Asia, n.e.c."', add
label define fbpld_lbl 59900 `"Asia, nec/ns"', add
label define fbpld_lbl 60000 `"Africa"', add
label define fbpld_lbl 60010 `"Northern Africa"', add
label define fbpld_lbl 60011 `"Algeria"', add
label define fbpld_lbl 60012 `"Egypt/United Arab Rep"', add
label define fbpld_lbl 60013 `"Libya"', add
label define fbpld_lbl 60014 `"Morocco"', add
label define fbpld_lbl 60015 `"Sudan"', add
label define fbpld_lbl 60016 `"Tunisia"', add
label define fbpld_lbl 60017 `"Western Sahara"', add
label define fbpld_lbl 60019 `"North Africa, ns"', add
label define fbpld_lbl 60020 `"Benin"', add
label define fbpld_lbl 60021 `"Burkina Faso"', add
label define fbpld_lbl 60022 `"Gambia"', add
label define fbpld_lbl 60023 `"Ghana"', add
label define fbpld_lbl 60024 `"Guinea"', add
label define fbpld_lbl 60025 `"Guinea-Bissau"', add
label define fbpld_lbl 60026 `"Ivory Coast"', add
label define fbpld_lbl 60027 `"Liberia"', add
label define fbpld_lbl 60028 `"Mali"', add
label define fbpld_lbl 60029 `"Mauritania"', add
label define fbpld_lbl 60030 `"Niger"', add
label define fbpld_lbl 60031 `"Nigeria"', add
label define fbpld_lbl 60032 `"Senegal"', add
label define fbpld_lbl 60033 `"Sierra Leone"', add
label define fbpld_lbl 60034 `"Togo"', add
label define fbpld_lbl 60038 `"Western Africa, n.s."', add
label define fbpld_lbl 60039 `"French West Africa, ns"', add
label define fbpld_lbl 60040 `"British Indian Ocean Territory"', add
label define fbpld_lbl 60041 `"Burundi"', add
label define fbpld_lbl 60042 `"Comoros"', add
label define fbpld_lbl 60043 `"Djibouti"', add
label define fbpld_lbl 60044 `"Ethiopia"', add
label define fbpld_lbl 60045 `"Kenya"', add
label define fbpld_lbl 60046 `"Madagascar"', add
label define fbpld_lbl 60047 `"Malawi"', add
label define fbpld_lbl 60048 `"Mauritius"', add
label define fbpld_lbl 60049 `"Mozambique"', add
label define fbpld_lbl 60050 `"Reunion"', add
label define fbpld_lbl 60051 `"Rwanda"', add
label define fbpld_lbl 60052 `"Seychelles"', add
label define fbpld_lbl 60053 `"Somalia"', add
label define fbpld_lbl 60054 `"Tanzania"', add
label define fbpld_lbl 60055 `"Uganda"', add
label define fbpld_lbl 60056 `"Zambia"', add
label define fbpld_lbl 60057 `"Zimbabwe"', add
label define fbpld_lbl 60058 `"Bassas de India"', add
label define fbpld_lbl 60059 `"Europa"', add
label define fbpld_lbl 60060 `"Gloriosos"', add
label define fbpld_lbl 60061 `"Juan de Nova"', add
label define fbpld_lbl 60062 `"Mayotte"', add
label define fbpld_lbl 60063 `"Tromelin"', add
label define fbpld_lbl 60064 `"Eastern Africa, nec/ns"', add
label define fbpld_lbl 60065 `"Eritrea"', add
label define fbpld_lbl 60070 `"Central Africa"', add
label define fbpld_lbl 60071 `"Angola"', add
label define fbpld_lbl 60072 `"Cameroon"', add
label define fbpld_lbl 60073 `"Central African Republic"', add
label define fbpld_lbl 60074 `"Chad"', add
label define fbpld_lbl 60075 `"Congo"', add
label define fbpld_lbl 60076 `"Equatorial Guinea"', add
label define fbpld_lbl 60077 `"Gabon"', add
label define fbpld_lbl 60078 `"Sao Tome and Principe"', add
label define fbpld_lbl 60079 `"Zaire"', add
label define fbpld_lbl 60080 `"Central Africa, ns"', add
label define fbpld_lbl 60081 `"Equatorial Africa, ns"', add
label define fbpld_lbl 60082 `"French Equatorial Africa, ns"', add
label define fbpld_lbl 60090 `"Southern Africa"', add
label define fbpld_lbl 60091 `"Botswana"', add
label define fbpld_lbl 60092 `"Lesotho"', add
label define fbpld_lbl 60093 `"Namibia"', add
label define fbpld_lbl 60094 `"South Africa (Union of)"', add
label define fbpld_lbl 60095 `"Swaziland"', add
label define fbpld_lbl 60096 `"Southern Africa, n.s."', add
label define fbpld_lbl 60099 `"Africa, ns/nec"', add
label define fbpld_lbl 70000 `"Australia and New Zealand"', add
label define fbpld_lbl 70010 `"Australia"', add
label define fbpld_lbl 70011 `"Ashmore and Cartier Islands"', add
label define fbpld_lbl 70012 `"Coral Sea Islands Territory"', add
label define fbpld_lbl 70013 `"Christmas Island"', add
label define fbpld_lbl 70014 `"Cocos Islands"', add
label define fbpld_lbl 70020 `"New Zealand"', add
label define fbpld_lbl 71000 `"Pacific Islands"', add
label define fbpld_lbl 71010 `"New Caledonia"', add
label define fbpld_lbl 71012 `"Papua New Guinea"', add
label define fbpld_lbl 71013 `"Solomon Islands"', add
label define fbpld_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define fbpld_lbl 71016 `"Melanesia, ns"', add
label define fbpld_lbl 71017 `"Norfolk Islands"', add
label define fbpld_lbl 71018 `"Niue"', add
label define fbpld_lbl 71020 `"Cook Islands"', add
label define fbpld_lbl 71021 `"Fiji"', add
label define fbpld_lbl 71022 `"French Polynesia"', add
label define fbpld_lbl 71023 `"Tonga"', add
label define fbpld_lbl 71024 `"Wallis and Futuna Islands"', add
label define fbpld_lbl 71025 `"Western Samoa"', add
label define fbpld_lbl 71026 `"Pitcairn Island"', add
label define fbpld_lbl 71027 `"Tokelau"', add
label define fbpld_lbl 71028 `"Tuvalu"', add
label define fbpld_lbl 71029 `"Polynesia, n.s."', add
label define fbpld_lbl 71032 `"Kiribati"', add
label define fbpld_lbl 71033 `"Canton and Enderbury"', add
label define fbpld_lbl 71034 `"Nauru"', add
label define fbpld_lbl 71039 `"Micronesia, ns"', add
label define fbpld_lbl 71040 `"US Pacific Trust Territories"', add
label define fbpld_lbl 71041 `"Marshall Islands"', add
label define fbpld_lbl 71042 `"Micronesia"', add
label define fbpld_lbl 71043 `"Kosrae"', add
label define fbpld_lbl 71044 `"Pohnpei"', add
label define fbpld_lbl 71045 `"Truk"', add
label define fbpld_lbl 71046 `"Yap"', add
label define fbpld_lbl 71047 `"Northern Mariana Islands"', add
label define fbpld_lbl 71048 `"Palau"', add
label define fbpld_lbl 71049 `"Pacific Trust Terr, ns"', add
label define fbpld_lbl 71050 `"Clipperton Island"', add
label define fbpld_lbl 71090 `"Oceania, ns/nec"', add
label define fbpld_lbl 80000 `"Antarctica, ns/nec"', add
label define fbpld_lbl 80010 `"Bouvet Islands"', add
label define fbpld_lbl 80020 `"British Antarctic Terr."', add
label define fbpld_lbl 80030 `"Dronning Maud Land"', add
label define fbpld_lbl 80040 `"French Southern and Antarctic Lands"', add
label define fbpld_lbl 80050 `"Heard and McDonald Islands"', add
label define fbpld_lbl 90000 `"Abroad (unknown) or at sea"', add
label define fbpld_lbl 90010 `"Abroad, ns"', add
label define fbpld_lbl 90011 `"Abroad (US citizen)"', add
label define fbpld_lbl 90020 `"At sea"', add
label define fbpld_lbl 90021 `"At sea (US citizen)"', add
label define fbpld_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define fbpld_lbl 95000 `"Other n.e.c."', add
label define fbpld_lbl 99700 `"Unknown"', add
label define fbpld_lbl 99800 `"Illegible"', add
label define fbpld_lbl 99900 `"Missing/blank"', add
label values fbpld fbpld_lbl

label define citizen_lbl 0 `"N/A"'
label define citizen_lbl 1 `"Born abroad of American parents"', add
label define citizen_lbl 2 `"Naturalized citizen"', add
label define citizen_lbl 3 `"Not a citizen"', add
label define citizen_lbl 4 `"Not a citizen, but has received first papers"', add
label define citizen_lbl 5 `"Foreign born, citizenship status not reported"', add
label values citizen citizen_lbl

label define higrade_lbl 00 `"N/A  (or None, 1980)"'
label define higrade_lbl 01 `"None"', add
label define higrade_lbl 02 `"Nursery school"', add
label define higrade_lbl 03 `"Kindergarten"', add
label define higrade_lbl 04 `"1st grade"', add
label define higrade_lbl 05 `"2nd grade"', add
label define higrade_lbl 06 `"3rd grade"', add
label define higrade_lbl 07 `"4th grade"', add
label define higrade_lbl 08 `"5th grade"', add
label define higrade_lbl 09 `"6th grade"', add
label define higrade_lbl 10 `"7th grade"', add
label define higrade_lbl 11 `"8th grade"', add
label define higrade_lbl 12 `"9th grade"', add
label define higrade_lbl 13 `"10th grade"', add
label define higrade_lbl 14 `"11th grade"', add
label define higrade_lbl 15 `"12th grade"', add
label define higrade_lbl 16 `"1st year"', add
label define higrade_lbl 17 `"2nd year"', add
label define higrade_lbl 18 `"3rd year"', add
label define higrade_lbl 19 `"4th year"', add
label define higrade_lbl 20 `"5th year or more (40-50)"', add
label define higrade_lbl 21 `"6th year or more (60,70)"', add
label define higrade_lbl 22 `"7th year"', add
label define higrade_lbl 23 `"8th year or more"', add
label values higrade higrade_lbl

label define higraded_lbl 000 `"N/A"'
label define higraded_lbl 010 `"None"', add
label define higraded_lbl 011 `"Did not finish nurs sch"', add
label define higraded_lbl 012 `"Attending nurs sch"', add
label define higraded_lbl 020 `"Nursery school"', add
label define higraded_lbl 021 `"Did not finish kindergart"', add
label define higraded_lbl 022 `"Attending kindergarten"', add
label define higraded_lbl 030 `"Kindergarten"', add
label define higraded_lbl 031 `"Did not finish 1st grade"', add
label define higraded_lbl 032 `"Attending 1st grade"', add
label define higraded_lbl 040 `"1st grade"', add
label define higraded_lbl 041 `"Did not finish 2nd grade"', add
label define higraded_lbl 042 `"Attending 2nd grade"', add
label define higraded_lbl 050 `"2nd grade"', add
label define higraded_lbl 051 `"Did not finish 3rd grade"', add
label define higraded_lbl 052 `"Attending 3rd grade"', add
label define higraded_lbl 060 `"3rd grade"', add
label define higraded_lbl 061 `"Did not finish 4th grade"', add
label define higraded_lbl 062 `"Attending 4th grade"', add
label define higraded_lbl 070 `"4th grade"', add
label define higraded_lbl 071 `"Did not finish 5th grade"', add
label define higraded_lbl 072 `"Attending 5th grade"', add
label define higraded_lbl 080 `"5th grade"', add
label define higraded_lbl 081 `"Did not finish 6th grade"', add
label define higraded_lbl 082 `"Attending 6th grade"', add
label define higraded_lbl 090 `"6th grade"', add
label define higraded_lbl 091 `"Did not finish 7th grade"', add
label define higraded_lbl 092 `"Attending 7th grade"', add
label define higraded_lbl 100 `"7th grade"', add
label define higraded_lbl 101 `"Did not finish 8th grade"', add
label define higraded_lbl 102 `"Attending 8th grade"', add
label define higraded_lbl 110 `"8th grade"', add
label define higraded_lbl 111 `"Did not finish 9th grade"', add
label define higraded_lbl 112 `"Attending 9th grade"', add
label define higraded_lbl 120 `"9th grade"', add
label define higraded_lbl 121 `"Did not finish 10th grade"', add
label define higraded_lbl 122 `"Attending 10th grade"', add
label define higraded_lbl 130 `"10th grade"', add
label define higraded_lbl 131 `"Did not finish 11th grade"', add
label define higraded_lbl 132 `"Attending 11th grade"', add
label define higraded_lbl 140 `"11th grade"', add
label define higraded_lbl 141 `"Did not finish 12th grade"', add
label define higraded_lbl 142 `"Attending 12th grade"', add
label define higraded_lbl 150 `"12th grade"', add
label define higraded_lbl 151 `"Did not finish 1st year college"', add
label define higraded_lbl 152 `"Attending 1st yesr college"', add
label define higraded_lbl 160 `"1st year of college"', add
label define higraded_lbl 161 `"Did not finish 2nd year of college"', add
label define higraded_lbl 162 `"Attending 2nd year of college"', add
label define higraded_lbl 170 `"2nd year of college"', add
label define higraded_lbl 171 `"Did not finish 3rd year of college"', add
label define higraded_lbl 172 `"Attending 3rd year of college"', add
label define higraded_lbl 180 `"3rd year of college"', add
label define higraded_lbl 181 `"Did not finish 4th year of college"', add
label define higraded_lbl 182 `"Attending 4th year of college"', add
label define higraded_lbl 190 `"4th year of college"', add
label define higraded_lbl 191 `"Did not finish 5th year of college"', add
label define higraded_lbl 192 `"Attending 5th year of college"', add
label define higraded_lbl 200 `"5th year or more of college (1940, 50)"', add
label define higraded_lbl 201 `"Did not finish 6th year of college"', add
label define higraded_lbl 202 `"Attending 6th year of college"', add
label define higraded_lbl 210 `"6th year or more of college (1960,70)"', add
label define higraded_lbl 211 `"Did not finish 7th year of college"', add
label define higraded_lbl 212 `"Attending 7th year of college"', add
label define higraded_lbl 220 `"7th year of college"', add
label define higraded_lbl 221 `"Did not finish 8th year of college"', add
label define higraded_lbl 222 `"Attending 8th year of college"', add
label define higraded_lbl 230 `"8th year or more of college"', add
label define higraded_lbl 999 `"Missing"', add
label values higraded higraded_lbl

label define educ_lbl 00 `"N/A or no schooling"'
label define educ_lbl 01 `"Nursery school to grade 4"', add
label define educ_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_lbl 03 `"Grade 9"', add
label define educ_lbl 04 `"Grade 10"', add
label define educ_lbl 05 `"Grade 11"', add
label define educ_lbl 06 `"Grade 12"', add
label define educ_lbl 07 `"1 year of college"', add
label define educ_lbl 08 `"2 years of college"', add
label define educ_lbl 09 `"3 years of college"', add
label define educ_lbl 10 `"4 years of college"', add
label define educ_lbl 11 `"5+ years of college"', add
label values educ educ_lbl

label define educd_lbl 000 `"N/A or no schooling"'
label define educd_lbl 001 `"N/A"', add
label define educd_lbl 002 `"No schooling completed"', add
label define educd_lbl 010 `"Nursery school to grade 4"', add
label define educd_lbl 011 `"Nursery school, preschool"', add
label define educd_lbl 012 `"Kindergarten"', add
label define educd_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_lbl 014 `"Grade 1"', add
label define educd_lbl 015 `"Grade 2"', add
label define educd_lbl 016 `"Grade 3"', add
label define educd_lbl 017 `"Grade 4"', add
label define educd_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_lbl 021 `"Grade 5 or 6"', add
label define educd_lbl 022 `"Grade 5"', add
label define educd_lbl 023 `"Grade 6"', add
label define educd_lbl 024 `"Grade 7 or 8"', add
label define educd_lbl 025 `"Grade 7"', add
label define educd_lbl 026 `"Grade 8"', add
label define educd_lbl 030 `"Grade 9"', add
label define educd_lbl 040 `"Grade 10"', add
label define educd_lbl 050 `"Grade 11"', add
label define educd_lbl 060 `"Grade 12"', add
label define educd_lbl 061 `"12th grade, no diploma"', add
label define educd_lbl 062 `"High school graduate or GED"', add
label define educd_lbl 063 `"Regular high school diploma"', add
label define educd_lbl 064 `"GED or alternative credential"', add
label define educd_lbl 065 `"Some college, but less than 1 year"', add
label define educd_lbl 070 `"1 year of college"', add
label define educd_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_lbl 080 `"2 years of college"', add
label define educd_lbl 081 `"Associate's degree, type not specified"', add
label define educd_lbl 082 `"Associate's degree, occupational program"', add
label define educd_lbl 083 `"Associate's degree, academic program"', add
label define educd_lbl 090 `"3 years of college"', add
label define educd_lbl 100 `"4 years of college"', add
label define educd_lbl 101 `"Bachelor's degree"', add
label define educd_lbl 110 `"5+ years of college"', add
label define educd_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_lbl 112 `"7 years of college"', add
label define educd_lbl 113 `"8+ years of college"', add
label define educd_lbl 114 `"Master's degree"', add
label define educd_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_lbl 116 `"Doctoral degree"', add
label define educd_lbl 999 `"Missing"', add
label values educd educd_lbl

label define gradeatt_lbl 0 `"N/A"'
label define gradeatt_lbl 1 `"Nursery school/preschool"', add
label define gradeatt_lbl 2 `"Kindergarten"', add
label define gradeatt_lbl 3 `"Grade 1 to grade 4"', add
label define gradeatt_lbl 4 `"Grade 5 to grade 8"', add
label define gradeatt_lbl 5 `"Grade 9 to grade 12"', add
label define gradeatt_lbl 6 `"College undergraduate"', add
label define gradeatt_lbl 7 `"Graduate or professional school"', add
label values gradeatt gradeatt_lbl

label define gradeattd_lbl 00 `"N/A"'
label define gradeattd_lbl 10 `"Nursery school/preschool"', add
label define gradeattd_lbl 20 `"Kindergarten"', add
label define gradeattd_lbl 30 `"Grade 1 to grade 4"', add
label define gradeattd_lbl 31 `"Grade 1"', add
label define gradeattd_lbl 32 `"Grade 2"', add
label define gradeattd_lbl 33 `"Grade 3"', add
label define gradeattd_lbl 34 `"Grade 4"', add
label define gradeattd_lbl 40 `"Grade 5 to grade 8"', add
label define gradeattd_lbl 41 `"Grade 5"', add
label define gradeattd_lbl 42 `"Grade 6"', add
label define gradeattd_lbl 43 `"Grade 7"', add
label define gradeattd_lbl 44 `"Grade 8"', add
label define gradeattd_lbl 50 `"Grade 9 to grade 12"', add
label define gradeattd_lbl 51 `"Grade 9"', add
label define gradeattd_lbl 52 `"Grade 10"', add
label define gradeattd_lbl 53 `"Grade 11"', add
label define gradeattd_lbl 54 `"Grade 12"', add
label define gradeattd_lbl 60 `"College undergraduate"', add
label define gradeattd_lbl 61 `"First year of college"', add
label define gradeattd_lbl 62 `"Second year of college"', add
label define gradeattd_lbl 63 `"Third year of college"', add
label define gradeattd_lbl 64 `"Fourth year of college"', add
label define gradeattd_lbl 70 `"Graduate or professional school"', add
label define gradeattd_lbl 71 `"Fifth year of college"', add
label define gradeattd_lbl 72 `"Sixth year of college"', add
label define gradeattd_lbl 73 `"Seventh year of college"', add
label define gradeattd_lbl 74 `"Eighth year of college"', add
label values gradeattd gradeattd_lbl

label define sex_head_lbl 1 `"Male"'
label define sex_head_lbl 2 `"Female"', add
label values sex_head sex_head_lbl

label define sex_sp_lbl 1 `"Male"'
label define sex_sp_lbl 2 `"Female"', add
label values sex_sp sex_sp_lbl

label define age_head_lbl 000 `"Less than 1 year old"'
label define age_head_lbl 001 `"1"', add
label define age_head_lbl 002 `"2"', add
label define age_head_lbl 003 `"3"', add
label define age_head_lbl 004 `"4"', add
label define age_head_lbl 005 `"5"', add
label define age_head_lbl 006 `"6"', add
label define age_head_lbl 007 `"7"', add
label define age_head_lbl 008 `"8"', add
label define age_head_lbl 009 `"9"', add
label define age_head_lbl 010 `"10"', add
label define age_head_lbl 011 `"11"', add
label define age_head_lbl 012 `"12"', add
label define age_head_lbl 013 `"13"', add
label define age_head_lbl 014 `"14"', add
label define age_head_lbl 015 `"15"', add
label define age_head_lbl 016 `"16"', add
label define age_head_lbl 017 `"17"', add
label define age_head_lbl 018 `"18"', add
label define age_head_lbl 019 `"19"', add
label define age_head_lbl 020 `"20"', add
label define age_head_lbl 021 `"21"', add
label define age_head_lbl 022 `"22"', add
label define age_head_lbl 023 `"23"', add
label define age_head_lbl 024 `"24"', add
label define age_head_lbl 025 `"25"', add
label define age_head_lbl 026 `"26"', add
label define age_head_lbl 027 `"27"', add
label define age_head_lbl 028 `"28"', add
label define age_head_lbl 029 `"29"', add
label define age_head_lbl 030 `"30"', add
label define age_head_lbl 031 `"31"', add
label define age_head_lbl 032 `"32"', add
label define age_head_lbl 033 `"33"', add
label define age_head_lbl 034 `"34"', add
label define age_head_lbl 035 `"35"', add
label define age_head_lbl 036 `"36"', add
label define age_head_lbl 037 `"37"', add
label define age_head_lbl 038 `"38"', add
label define age_head_lbl 039 `"39"', add
label define age_head_lbl 040 `"40"', add
label define age_head_lbl 041 `"41"', add
label define age_head_lbl 042 `"42"', add
label define age_head_lbl 043 `"43"', add
label define age_head_lbl 044 `"44"', add
label define age_head_lbl 045 `"45"', add
label define age_head_lbl 046 `"46"', add
label define age_head_lbl 047 `"47"', add
label define age_head_lbl 048 `"48"', add
label define age_head_lbl 049 `"49"', add
label define age_head_lbl 050 `"50"', add
label define age_head_lbl 051 `"51"', add
label define age_head_lbl 052 `"52"', add
label define age_head_lbl 053 `"53"', add
label define age_head_lbl 054 `"54"', add
label define age_head_lbl 055 `"55"', add
label define age_head_lbl 056 `"56"', add
label define age_head_lbl 057 `"57"', add
label define age_head_lbl 058 `"58"', add
label define age_head_lbl 059 `"59"', add
label define age_head_lbl 060 `"60"', add
label define age_head_lbl 061 `"61"', add
label define age_head_lbl 062 `"62"', add
label define age_head_lbl 063 `"63"', add
label define age_head_lbl 064 `"64"', add
label define age_head_lbl 065 `"65"', add
label define age_head_lbl 066 `"66"', add
label define age_head_lbl 067 `"67"', add
label define age_head_lbl 068 `"68"', add
label define age_head_lbl 069 `"69"', add
label define age_head_lbl 070 `"70"', add
label define age_head_lbl 071 `"71"', add
label define age_head_lbl 072 `"72"', add
label define age_head_lbl 073 `"73"', add
label define age_head_lbl 074 `"74"', add
label define age_head_lbl 075 `"75"', add
label define age_head_lbl 076 `"76"', add
label define age_head_lbl 077 `"77"', add
label define age_head_lbl 078 `"78"', add
label define age_head_lbl 079 `"79"', add
label define age_head_lbl 080 `"80"', add
label define age_head_lbl 081 `"81"', add
label define age_head_lbl 082 `"82"', add
label define age_head_lbl 083 `"83"', add
label define age_head_lbl 084 `"84"', add
label define age_head_lbl 085 `"85"', add
label define age_head_lbl 086 `"86"', add
label define age_head_lbl 087 `"87"', add
label define age_head_lbl 088 `"88"', add
label define age_head_lbl 089 `"89"', add
label define age_head_lbl 090 `"90 (90+ in 1980 and 1990)"', add
label define age_head_lbl 091 `"91"', add
label define age_head_lbl 092 `"92"', add
label define age_head_lbl 093 `"93"', add
label define age_head_lbl 094 `"94"', add
label define age_head_lbl 095 `"95"', add
label define age_head_lbl 096 `"96"', add
label define age_head_lbl 097 `"97"', add
label define age_head_lbl 098 `"98"', add
label define age_head_lbl 099 `"99"', add
label define age_head_lbl 100 `"100 (100+ in 1960-1970)"', add
label define age_head_lbl 101 `"101"', add
label define age_head_lbl 102 `"102"', add
label define age_head_lbl 103 `"103"', add
label define age_head_lbl 104 `"104"', add
label define age_head_lbl 105 `"105"', add
label define age_head_lbl 106 `"106"', add
label define age_head_lbl 107 `"107"', add
label define age_head_lbl 108 `"108"', add
label define age_head_lbl 109 `"109"', add
label define age_head_lbl 110 `"110"', add
label define age_head_lbl 111 `"111"', add
label define age_head_lbl 112 `"112 (112+ in the 1980 internal data)"', add
label define age_head_lbl 113 `"113"', add
label define age_head_lbl 114 `"114"', add
label define age_head_lbl 115 `"115 (115+ in the 1990 internal data)"', add
label define age_head_lbl 116 `"116"', add
label define age_head_lbl 117 `"117"', add
label define age_head_lbl 118 `"118"', add
label define age_head_lbl 119 `"119"', add
label define age_head_lbl 120 `"120"', add
label define age_head_lbl 121 `"121"', add
label define age_head_lbl 122 `"122"', add
label define age_head_lbl 123 `"123"', add
label define age_head_lbl 124 `"124"', add
label define age_head_lbl 125 `"125"', add
label define age_head_lbl 126 `"126"', add
label define age_head_lbl 129 `"129"', add
label define age_head_lbl 130 `"130"', add
label define age_head_lbl 135 `"135"', add
label values age_head age_head_lbl

label define age_sp_lbl 000 `"Less than 1 year old"'
label define age_sp_lbl 001 `"1"', add
label define age_sp_lbl 002 `"2"', add
label define age_sp_lbl 003 `"3"', add
label define age_sp_lbl 004 `"4"', add
label define age_sp_lbl 005 `"5"', add
label define age_sp_lbl 006 `"6"', add
label define age_sp_lbl 007 `"7"', add
label define age_sp_lbl 008 `"8"', add
label define age_sp_lbl 009 `"9"', add
label define age_sp_lbl 010 `"10"', add
label define age_sp_lbl 011 `"11"', add
label define age_sp_lbl 012 `"12"', add
label define age_sp_lbl 013 `"13"', add
label define age_sp_lbl 014 `"14"', add
label define age_sp_lbl 015 `"15"', add
label define age_sp_lbl 016 `"16"', add
label define age_sp_lbl 017 `"17"', add
label define age_sp_lbl 018 `"18"', add
label define age_sp_lbl 019 `"19"', add
label define age_sp_lbl 020 `"20"', add
label define age_sp_lbl 021 `"21"', add
label define age_sp_lbl 022 `"22"', add
label define age_sp_lbl 023 `"23"', add
label define age_sp_lbl 024 `"24"', add
label define age_sp_lbl 025 `"25"', add
label define age_sp_lbl 026 `"26"', add
label define age_sp_lbl 027 `"27"', add
label define age_sp_lbl 028 `"28"', add
label define age_sp_lbl 029 `"29"', add
label define age_sp_lbl 030 `"30"', add
label define age_sp_lbl 031 `"31"', add
label define age_sp_lbl 032 `"32"', add
label define age_sp_lbl 033 `"33"', add
label define age_sp_lbl 034 `"34"', add
label define age_sp_lbl 035 `"35"', add
label define age_sp_lbl 036 `"36"', add
label define age_sp_lbl 037 `"37"', add
label define age_sp_lbl 038 `"38"', add
label define age_sp_lbl 039 `"39"', add
label define age_sp_lbl 040 `"40"', add
label define age_sp_lbl 041 `"41"', add
label define age_sp_lbl 042 `"42"', add
label define age_sp_lbl 043 `"43"', add
label define age_sp_lbl 044 `"44"', add
label define age_sp_lbl 045 `"45"', add
label define age_sp_lbl 046 `"46"', add
label define age_sp_lbl 047 `"47"', add
label define age_sp_lbl 048 `"48"', add
label define age_sp_lbl 049 `"49"', add
label define age_sp_lbl 050 `"50"', add
label define age_sp_lbl 051 `"51"', add
label define age_sp_lbl 052 `"52"', add
label define age_sp_lbl 053 `"53"', add
label define age_sp_lbl 054 `"54"', add
label define age_sp_lbl 055 `"55"', add
label define age_sp_lbl 056 `"56"', add
label define age_sp_lbl 057 `"57"', add
label define age_sp_lbl 058 `"58"', add
label define age_sp_lbl 059 `"59"', add
label define age_sp_lbl 060 `"60"', add
label define age_sp_lbl 061 `"61"', add
label define age_sp_lbl 062 `"62"', add
label define age_sp_lbl 063 `"63"', add
label define age_sp_lbl 064 `"64"', add
label define age_sp_lbl 065 `"65"', add
label define age_sp_lbl 066 `"66"', add
label define age_sp_lbl 067 `"67"', add
label define age_sp_lbl 068 `"68"', add
label define age_sp_lbl 069 `"69"', add
label define age_sp_lbl 070 `"70"', add
label define age_sp_lbl 071 `"71"', add
label define age_sp_lbl 072 `"72"', add
label define age_sp_lbl 073 `"73"', add
label define age_sp_lbl 074 `"74"', add
label define age_sp_lbl 075 `"75"', add
label define age_sp_lbl 076 `"76"', add
label define age_sp_lbl 077 `"77"', add
label define age_sp_lbl 078 `"78"', add
label define age_sp_lbl 079 `"79"', add
label define age_sp_lbl 080 `"80"', add
label define age_sp_lbl 081 `"81"', add
label define age_sp_lbl 082 `"82"', add
label define age_sp_lbl 083 `"83"', add
label define age_sp_lbl 084 `"84"', add
label define age_sp_lbl 085 `"85"', add
label define age_sp_lbl 086 `"86"', add
label define age_sp_lbl 087 `"87"', add
label define age_sp_lbl 088 `"88"', add
label define age_sp_lbl 089 `"89"', add
label define age_sp_lbl 090 `"90 (90+ in 1980 and 1990)"', add
label define age_sp_lbl 091 `"91"', add
label define age_sp_lbl 092 `"92"', add
label define age_sp_lbl 093 `"93"', add
label define age_sp_lbl 094 `"94"', add
label define age_sp_lbl 095 `"95"', add
label define age_sp_lbl 096 `"96"', add
label define age_sp_lbl 097 `"97"', add
label define age_sp_lbl 098 `"98"', add
label define age_sp_lbl 099 `"99"', add
label define age_sp_lbl 100 `"100 (100+ in 1960-1970)"', add
label define age_sp_lbl 101 `"101"', add
label define age_sp_lbl 102 `"102"', add
label define age_sp_lbl 103 `"103"', add
label define age_sp_lbl 104 `"104"', add
label define age_sp_lbl 105 `"105"', add
label define age_sp_lbl 106 `"106"', add
label define age_sp_lbl 107 `"107"', add
label define age_sp_lbl 108 `"108"', add
label define age_sp_lbl 109 `"109"', add
label define age_sp_lbl 110 `"110"', add
label define age_sp_lbl 111 `"111"', add
label define age_sp_lbl 112 `"112 (112+ in the 1980 internal data)"', add
label define age_sp_lbl 113 `"113"', add
label define age_sp_lbl 114 `"114"', add
label define age_sp_lbl 115 `"115 (115+ in the 1990 internal data)"', add
label define age_sp_lbl 116 `"116"', add
label define age_sp_lbl 117 `"117"', add
label define age_sp_lbl 118 `"118"', add
label define age_sp_lbl 119 `"119"', add
label define age_sp_lbl 120 `"120"', add
label define age_sp_lbl 121 `"121"', add
label define age_sp_lbl 122 `"122"', add
label define age_sp_lbl 123 `"123"', add
label define age_sp_lbl 124 `"124"', add
label define age_sp_lbl 125 `"125"', add
label define age_sp_lbl 126 `"126"', add
label define age_sp_lbl 129 `"129"', add
label define age_sp_lbl 130 `"130"', add
label define age_sp_lbl 135 `"135"', add
label values age_sp age_sp_lbl

label define marst_head_lbl 1 `"Married, spouse present"'
label define marst_head_lbl 2 `"Married, spouse absent"', add
label define marst_head_lbl 3 `"Separated"', add
label define marst_head_lbl 4 `"Divorced"', add
label define marst_head_lbl 5 `"Widowed"', add
label define marst_head_lbl 6 `"Never married/single"', add
label values marst_head marst_head_lbl

label define marst_sp_lbl 1 `"Married, spouse present"'
label define marst_sp_lbl 2 `"Married, spouse absent"', add
label define marst_sp_lbl 3 `"Separated"', add
label define marst_sp_lbl 4 `"Divorced"', add
label define marst_sp_lbl 5 `"Widowed"', add
label define marst_sp_lbl 6 `"Never married/single"', add
label values marst_sp marst_sp_lbl

label define race_head_lbl 1 `"White"'
label define race_head_lbl 2 `"Black/African American/Negro"', add
label define race_head_lbl 3 `"American Indian or Alaska Native"', add
label define race_head_lbl 4 `"Chinese"', add
label define race_head_lbl 5 `"Japanese"', add
label define race_head_lbl 6 `"Other Asian or Pacific Islander"', add
label define race_head_lbl 7 `"Other race, nec"', add
label define race_head_lbl 8 `"Two major races"', add
label define race_head_lbl 9 `"Three or more major races"', add
label values race_head race_head_lbl

label define race_sp_lbl 1 `"White"'
label define race_sp_lbl 2 `"Black/African American/Negro"', add
label define race_sp_lbl 3 `"American Indian or Alaska Native"', add
label define race_sp_lbl 4 `"Chinese"', add
label define race_sp_lbl 5 `"Japanese"', add
label define race_sp_lbl 6 `"Other Asian or Pacific Islander"', add
label define race_sp_lbl 7 `"Other race, nec"', add
label define race_sp_lbl 8 `"Two major races"', add
label define race_sp_lbl 9 `"Three or more major races"', add
label values race_sp race_sp_lbl

label define raced_head_lbl 100 `"White"'
label define raced_head_lbl 110 `"Spanish write_in"', add
label define raced_head_lbl 120 `"Blank (white) (1850)"', add
label define raced_head_lbl 130 `"Portuguese"', add
label define raced_head_lbl 140 `"Mexican (1930)"', add
label define raced_head_lbl 150 `"Puerto Rican (1910 Hawaii)"', add
label define raced_head_lbl 200 `"Black/African American/Negro"', add
label define raced_head_lbl 210 `"Mulatto"', add
label define raced_head_lbl 300 `"American Indian/Alaska Native"', add
label define raced_head_lbl 302 `"Apache"', add
label define raced_head_lbl 303 `"Blackfoot"', add
label define raced_head_lbl 304 `"Cherokee"', add
label define raced_head_lbl 305 `"Cheyenne"', add
label define raced_head_lbl 306 `"Chickasaw"', add
label define raced_head_lbl 307 `"Chippewa"', add
label define raced_head_lbl 308 `"Choctaw"', add
label define raced_head_lbl 309 `"Comanche"', add
label define raced_head_lbl 310 `"Creek"', add
label define raced_head_lbl 311 `"Crow"', add
label define raced_head_lbl 312 `"Iroquois"', add
label define raced_head_lbl 313 `"Kiowa"', add
label define raced_head_lbl 314 `"Lumbee"', add
label define raced_head_lbl 315 `"Navajo"', add
label define raced_head_lbl 316 `"Osage"', add
label define raced_head_lbl 317 `"Paiute"', add
label define raced_head_lbl 318 `"Pima"', add
label define raced_head_lbl 319 `"Potawatomi"', add
label define raced_head_lbl 320 `"Pueblo"', add
label define raced_head_lbl 321 `"Seminole"', add
label define raced_head_lbl 322 `"Shoshone"', add
label define raced_head_lbl 323 `"Sioux"', add
label define raced_head_lbl 324 `"Tlingit (Tlingit_Haida, 2000/ACS)"', add
label define raced_head_lbl 325 `"Tohono O Odham"', add
label define raced_head_lbl 326 `"All other tribes (1990)"', add
label define raced_head_lbl 328 `"Hopi"', add
label define raced_head_lbl 329 `"Central American Indian"', add
label define raced_head_lbl 330 `"Spanish American Indian"', add
label define raced_head_lbl 350 `"Delaware"', add
label define raced_head_lbl 351 `"Latin American Indian"', add
label define raced_head_lbl 352 `"Puget Sound Salish"', add
label define raced_head_lbl 353 `"Yakama"', add
label define raced_head_lbl 354 `"Yaqui"', add
label define raced_head_lbl 355 `"Colville"', add
label define raced_head_lbl 356 `"Houma"', add
label define raced_head_lbl 357 `"Menominee"', add
label define raced_head_lbl 358 `"Yuman"', add
label define raced_head_lbl 359 `"South American Indian"', add
label define raced_head_lbl 360 `"Mexican American Indian"', add
label define raced_head_lbl 361 `"Other Amer. Indian tribe (2000,ACS)"', add
label define raced_head_lbl 362 `"2+ Amer. Indian tribes (2000,ACS)"', add
label define raced_head_lbl 370 `"Alaskan Athabaskan"', add
label define raced_head_lbl 371 `"Aleut"', add
label define raced_head_lbl 372 `"Eskimo"', add
label define raced_head_lbl 373 `"Alaskan mixed"', add
label define raced_head_lbl 374 `"Inupiat"', add
label define raced_head_lbl 375 `"Yup'ik"', add
label define raced_head_lbl 379 `"Other Alaska Native tribe(s) (2000,ACS)"', add
label define raced_head_lbl 398 `"Both Am. Ind. and Alaska Native (2000,ACS)"', add
label define raced_head_lbl 399 `"Tribe not specified"', add
label define raced_head_lbl 400 `"Chinese"', add
label define raced_head_lbl 410 `"Taiwanese"', add
label define raced_head_lbl 420 `"Chinese and Taiwanese"', add
label define raced_head_lbl 500 `"Japanese"', add
label define raced_head_lbl 600 `"Filipino"', add
label define raced_head_lbl 610 `"Asian Indian (Hindu 1920_1940)"', add
label define raced_head_lbl 620 `"Korean"', add
label define raced_head_lbl 630 `"Hawaiian"', add
label define raced_head_lbl 631 `"Hawaiian and Asian (1900,1920)"', add
label define raced_head_lbl 632 `"Hawaiian and European (1900,1920)"', add
label define raced_head_lbl 634 `"Hawaiian mixed"', add
label define raced_head_lbl 640 `"Vietnamese"', add
label define raced_head_lbl 641 `"Bhutanese"', add
label define raced_head_lbl 642 `"Mongolian"', add
label define raced_head_lbl 643 `"Nepalese"', add
label define raced_head_lbl 650 `"Other Asian or Pacific Islander (1920,1980)"', add
label define raced_head_lbl 651 `"Asian only (CPS)"', add
label define raced_head_lbl 652 `"Pacific Islander only (CPS)"', add
label define raced_head_lbl 653 `"Asian or Pacific Islander, n.s. (1990 Internal Census files)"', add
label define raced_head_lbl 660 `"Cambodian"', add
label define raced_head_lbl 661 `"Hmong"', add
label define raced_head_lbl 662 `"Laotian"', add
label define raced_head_lbl 663 `"Thai"', add
label define raced_head_lbl 664 `"Bangladeshi"', add
label define raced_head_lbl 665 `"Burmese"', add
label define raced_head_lbl 666 `"Indonesian"', add
label define raced_head_lbl 667 `"Malaysian"', add
label define raced_head_lbl 668 `"Okinawan"', add
label define raced_head_lbl 669 `"Pakistani"', add
label define raced_head_lbl 670 `"Sri Lankan"', add
label define raced_head_lbl 671 `"Other Asian, n.e.c."', add
label define raced_head_lbl 672 `"Asian, not specified"', add
label define raced_head_lbl 673 `"Chinese and Japanese"', add
label define raced_head_lbl 674 `"Chinese and Filipino"', add
label define raced_head_lbl 675 `"Chinese and Vietnamese"', add
label define raced_head_lbl 676 `"Chinese and Asian write_in"', add
label define raced_head_lbl 677 `"Japanese and Filipino"', add
label define raced_head_lbl 678 `"Asian Indian and Asian write_in"', add
label define raced_head_lbl 679 `"Other Asian race combinations"', add
label define raced_head_lbl 680 `"Samoan"', add
label define raced_head_lbl 681 `"Tahitian"', add
label define raced_head_lbl 682 `"Tongan"', add
label define raced_head_lbl 683 `"Other Polynesian (1990)"', add
label define raced_head_lbl 684 `"1+ other Polynesian races (2000,ACS)"', add
label define raced_head_lbl 685 `"Guamanian/Chamorro"', add
label define raced_head_lbl 686 `"Northern Mariana Islander"', add
label define raced_head_lbl 687 `"Palauan"', add
label define raced_head_lbl 688 `"Other Micronesian (1990)"', add
label define raced_head_lbl 689 `"1+ other Micronesian races (2000,ACS)"', add
label define raced_head_lbl 690 `"Fijian"', add
label define raced_head_lbl 691 `"Other Melanesian (1990)"', add
label define raced_head_lbl 692 `"1+ other Melanesian races (2000,ACS)"', add
label define raced_head_lbl 698 `"2+ PI races from 2+ PI regions"', add
label define raced_head_lbl 699 `"Pacific Islander, n.s."', add
label define raced_head_lbl 700 `"Other race, n.e.c."', add
label define raced_head_lbl 801 `"White and Black"', add
label define raced_head_lbl 802 `"White and AIAN"', add
label define raced_head_lbl 810 `"White and Asian"', add
label define raced_head_lbl 811 `"White and Chinese"', add
label define raced_head_lbl 812 `"White and Japanese"', add
label define raced_head_lbl 813 `"White and Filipino"', add
label define raced_head_lbl 814 `"White and Asian Indian"', add
label define raced_head_lbl 815 `"White and Korean"', add
label define raced_head_lbl 816 `"White and Vietnamese"', add
label define raced_head_lbl 817 `"White and Asian write_in"', add
label define raced_head_lbl 818 `"White and other Asian race(s)"', add
label define raced_head_lbl 819 `"White and two or more Asian groups"', add
label define raced_head_lbl 820 `"White and PI"', add
label define raced_head_lbl 821 `"White and Native Hawaiian"', add
label define raced_head_lbl 822 `"White and Samoan"', add
label define raced_head_lbl 823 `"White and Guamanian"', add
label define raced_head_lbl 824 `"White and PI write_in"', add
label define raced_head_lbl 825 `"White and other PI race(s)"', add
label define raced_head_lbl 826 `"White and other race write_in"', add
label define raced_head_lbl 827 `"White and other race, n.e.c."', add
label define raced_head_lbl 830 `"Black and AIAN"', add
label define raced_head_lbl 831 `"Black and Asian"', add
label define raced_head_lbl 832 `"Black and Chinese"', add
label define raced_head_lbl 833 `"Black and Japanese"', add
label define raced_head_lbl 834 `"Black and Filipino"', add
label define raced_head_lbl 835 `"Black and Asian Indian"', add
label define raced_head_lbl 836 `"Black and Korean"', add
label define raced_head_lbl 837 `"Black and Asian write_in"', add
label define raced_head_lbl 838 `"Black and other Asian race(s)"', add
label define raced_head_lbl 840 `"Black and PI"', add
label define raced_head_lbl 841 `"Black and PI write_in"', add
label define raced_head_lbl 842 `"Black and other PI race(s)"', add
label define raced_head_lbl 845 `"Black and other race write_in"', add
label define raced_head_lbl 850 `"AIAN and Asian"', add
label define raced_head_lbl 851 `"AIAN and Filipino (2000 1%)"', add
label define raced_head_lbl 852 `"AIAN and Asian Indian"', add
label define raced_head_lbl 853 `"AIAN and Asian write_in (2000 1%)"', add
label define raced_head_lbl 854 `"AIAN and other Asian race(s)"', add
label define raced_head_lbl 855 `"AIAN and PI"', add
label define raced_head_lbl 856 `"AIAN and other race write_in"', add
label define raced_head_lbl 860 `"Asian and PI"', add
label define raced_head_lbl 861 `"Chinese and Hawaiian"', add
label define raced_head_lbl 862 `"Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_head_lbl 863 `"Japanese and Hawaiian (2000 1%)"', add
label define raced_head_lbl 864 `"Filipino and Hawaiian"', add
label define raced_head_lbl 865 `"Filipino and PI write_in"', add
label define raced_head_lbl 866 `"Asian Indian and PI write_in (2000 1%)"', add
label define raced_head_lbl 867 `"Asian write_in and PI write_in"', add
label define raced_head_lbl 868 `"Other Asian race(s) and PI race(s)"', add
label define raced_head_lbl 869 `"Japanese and Korean (ACS)"', add
label define raced_head_lbl 880 `"Asian and other race write_in"', add
label define raced_head_lbl 881 `"Chinese and other race write_in"', add
label define raced_head_lbl 882 `"Japanese and other race write_in"', add
label define raced_head_lbl 883 `"Filipino and other race write_in"', add
label define raced_head_lbl 884 `"Asian Indian and other race write_in"', add
label define raced_head_lbl 885 `"Asian write_in and other race write_in"', add
label define raced_head_lbl 886 `"Other Asian race(s) and other race write_in"', add
label define raced_head_lbl 887 `"Chinese and Korean"', add
label define raced_head_lbl 890 `"PI and other race write_in:"', add
label define raced_head_lbl 891 `"PI write_in and other race write_in"', add
label define raced_head_lbl 892 `"Other PI race(s) and other race write_in"', add
label define raced_head_lbl 893 `"Native Hawaiian or PI other race(s)"', add
label define raced_head_lbl 899 `"API and other race write_in"', add
label define raced_head_lbl 901 `"White, Black, AIAN"', add
label define raced_head_lbl 902 `"White, Black, Asian"', add
label define raced_head_lbl 903 `"White, Black, PI"', add
label define raced_head_lbl 904 `"White, Black, other race write_in"', add
label define raced_head_lbl 905 `"White, AIAN, Asian"', add
label define raced_head_lbl 906 `"White, AIAN, PI"', add
label define raced_head_lbl 907 `"White, AIAN, other race write_in"', add
label define raced_head_lbl 910 `"White, Asian, PI"', add
label define raced_head_lbl 911 `"White, Chinese, Hawaiian"', add
label define raced_head_lbl 912 `"White, Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_head_lbl 913 `"White, Japanese, Hawaiian (2000 1%)"', add
label define raced_head_lbl 914 `"White, Filipino, Hawaiian"', add
label define raced_head_lbl 915 `"Other White, Asian race(s), PI race(s)"', add
label define raced_head_lbl 916 `"White, AIAN and Filipino"', add
label define raced_head_lbl 917 `"White, Black, and Filipino"', add
label define raced_head_lbl 920 `"White, Asian, other race write_in"', add
label define raced_head_lbl 921 `"White, Filipino, other race write_in (2000 1%)"', add
label define raced_head_lbl 922 `"White, Asian write_in, other race write_in (2000 1%)"', add
label define raced_head_lbl 923 `"Other White, Asian race(s), other race write_in (2000 1%)"', add
label define raced_head_lbl 925 `"White, PI, other race write_in"', add
label define raced_head_lbl 930 `"Black, AIAN, Asian"', add
label define raced_head_lbl 931 `"Black, AIAN, PI"', add
label define raced_head_lbl 932 `"Black, AIAN, other race write_in"', add
label define raced_head_lbl 933 `"Black, Asian, PI"', add
label define raced_head_lbl 934 `"Black, Asian, other race write_in"', add
label define raced_head_lbl 935 `"Black, PI, other race write_in"', add
label define raced_head_lbl 940 `"AIAN, Asian, PI"', add
label define raced_head_lbl 941 `"AIAN, Asian, other race write_in"', add
label define raced_head_lbl 942 `"AIAN, PI, other race write_in"', add
label define raced_head_lbl 943 `"Asian, PI, other race write_in"', add
label define raced_head_lbl 944 `"Asian (Chinese, Japanese, Korean, Vietnamese); and Native Hawaiian or PI; and Other"', add
label define raced_head_lbl 949 `"2 or 3 races (CPS)"', add
label define raced_head_lbl 950 `"White, Black, AIAN, Asian"', add
label define raced_head_lbl 951 `"White, Black, AIAN, PI"', add
label define raced_head_lbl 952 `"White, Black, AIAN, other race write_in"', add
label define raced_head_lbl 953 `"White, Black, Asian, PI"', add
label define raced_head_lbl 954 `"White, Black, Asian, other race write_in"', add
label define raced_head_lbl 955 `"White, Black, PI, other race write_in"', add
label define raced_head_lbl 960 `"White, AIAN, Asian, PI"', add
label define raced_head_lbl 961 `"White, AIAN, Asian, other race write_in"', add
label define raced_head_lbl 962 `"White, AIAN, PI, other race write_in"', add
label define raced_head_lbl 963 `"White, Asian, PI, other race write_in"', add
label define raced_head_lbl 964 `"White, Chinese, Japanese, Native Hawaiian"', add
label define raced_head_lbl 970 `"Black, AIAN, Asian, PI"', add
label define raced_head_lbl 971 `"Black, AIAN, Asian, other race write_in"', add
label define raced_head_lbl 972 `"Black, AIAN, PI, other race write_in"', add
label define raced_head_lbl 973 `"Black, Asian, PI, other race write_in"', add
label define raced_head_lbl 974 `"AIAN, Asian, PI, other race write_in"', add
label define raced_head_lbl 975 `"AIAN, Asian, PI, Hawaiian other race write_in"', add
label define raced_head_lbl 976 `"Two specified Asian  (Chinese and other Asian, Chinese and Japanese, Japanese and other Asian, Korean and other Asian); Native Hawaiian/PI; and Other Race"', add
label define raced_head_lbl 980 `"White, Black, AIAN, Asian, PI"', add
label define raced_head_lbl 981 `"White, Black, AIAN, Asian, other race write_in"', add
label define raced_head_lbl 982 `"White, Black, AIAN, PI, other race write_in"', add
label define raced_head_lbl 983 `"White, Black, Asian, PI, other race write_in"', add
label define raced_head_lbl 984 `"White, AIAN, Asian, PI, other race write_in"', add
label define raced_head_lbl 985 `"Black, AIAN, Asian, PI, other race write_in"', add
label define raced_head_lbl 986 `"Black, AIAN, Asian, PI, Hawaiian, other race write_in"', add
label define raced_head_lbl 989 `"4 or 5 races (CPS)"', add
label define raced_head_lbl 990 `"White, Black, AIAN, Asian, PI, other race write_in"', add
label define raced_head_lbl 991 `"White race; Some other race; Black or African American race and/or American Indian and Alaska Native race and/or Asian groups and/or Native Hawaiian and Other Pacific Islander groups"', add
label define raced_head_lbl 996 `"2+ races, n.e.c. (CPS)"', add
label values raced_head raced_head_lbl

label define raced_sp_lbl 100 `"White"'
label define raced_sp_lbl 110 `"Spanish write_in"', add
label define raced_sp_lbl 120 `"Blank (white) (1850)"', add
label define raced_sp_lbl 130 `"Portuguese"', add
label define raced_sp_lbl 140 `"Mexican (1930)"', add
label define raced_sp_lbl 150 `"Puerto Rican (1910 Hawaii)"', add
label define raced_sp_lbl 200 `"Black/African American/Negro"', add
label define raced_sp_lbl 210 `"Mulatto"', add
label define raced_sp_lbl 300 `"American Indian/Alaska Native"', add
label define raced_sp_lbl 302 `"Apache"', add
label define raced_sp_lbl 303 `"Blackfoot"', add
label define raced_sp_lbl 304 `"Cherokee"', add
label define raced_sp_lbl 305 `"Cheyenne"', add
label define raced_sp_lbl 306 `"Chickasaw"', add
label define raced_sp_lbl 307 `"Chippewa"', add
label define raced_sp_lbl 308 `"Choctaw"', add
label define raced_sp_lbl 309 `"Comanche"', add
label define raced_sp_lbl 310 `"Creek"', add
label define raced_sp_lbl 311 `"Crow"', add
label define raced_sp_lbl 312 `"Iroquois"', add
label define raced_sp_lbl 313 `"Kiowa"', add
label define raced_sp_lbl 314 `"Lumbee"', add
label define raced_sp_lbl 315 `"Navajo"', add
label define raced_sp_lbl 316 `"Osage"', add
label define raced_sp_lbl 317 `"Paiute"', add
label define raced_sp_lbl 318 `"Pima"', add
label define raced_sp_lbl 319 `"Potawatomi"', add
label define raced_sp_lbl 320 `"Pueblo"', add
label define raced_sp_lbl 321 `"Seminole"', add
label define raced_sp_lbl 322 `"Shoshone"', add
label define raced_sp_lbl 323 `"Sioux"', add
label define raced_sp_lbl 324 `"Tlingit (Tlingit_Haida, 2000/ACS)"', add
label define raced_sp_lbl 325 `"Tohono O Odham"', add
label define raced_sp_lbl 326 `"All other tribes (1990)"', add
label define raced_sp_lbl 328 `"Hopi"', add
label define raced_sp_lbl 329 `"Central American Indian"', add
label define raced_sp_lbl 330 `"Spanish American Indian"', add
label define raced_sp_lbl 350 `"Delaware"', add
label define raced_sp_lbl 351 `"Latin American Indian"', add
label define raced_sp_lbl 352 `"Puget Sound Salish"', add
label define raced_sp_lbl 353 `"Yakama"', add
label define raced_sp_lbl 354 `"Yaqui"', add
label define raced_sp_lbl 355 `"Colville"', add
label define raced_sp_lbl 356 `"Houma"', add
label define raced_sp_lbl 357 `"Menominee"', add
label define raced_sp_lbl 358 `"Yuman"', add
label define raced_sp_lbl 359 `"South American Indian"', add
label define raced_sp_lbl 360 `"Mexican American Indian"', add
label define raced_sp_lbl 361 `"Other Amer. Indian tribe (2000,ACS)"', add
label define raced_sp_lbl 362 `"2+ Amer. Indian tribes (2000,ACS)"', add
label define raced_sp_lbl 370 `"Alaskan Athabaskan"', add
label define raced_sp_lbl 371 `"Aleut"', add
label define raced_sp_lbl 372 `"Eskimo"', add
label define raced_sp_lbl 373 `"Alaskan mixed"', add
label define raced_sp_lbl 374 `"Inupiat"', add
label define raced_sp_lbl 375 `"Yup'ik"', add
label define raced_sp_lbl 379 `"Other Alaska Native tribe(s) (2000,ACS)"', add
label define raced_sp_lbl 398 `"Both Am. Ind. and Alaska Native (2000,ACS)"', add
label define raced_sp_lbl 399 `"Tribe not specified"', add
label define raced_sp_lbl 400 `"Chinese"', add
label define raced_sp_lbl 410 `"Taiwanese"', add
label define raced_sp_lbl 420 `"Chinese and Taiwanese"', add
label define raced_sp_lbl 500 `"Japanese"', add
label define raced_sp_lbl 600 `"Filipino"', add
label define raced_sp_lbl 610 `"Asian Indian (Hindu 1920_1940)"', add
label define raced_sp_lbl 620 `"Korean"', add
label define raced_sp_lbl 630 `"Hawaiian"', add
label define raced_sp_lbl 631 `"Hawaiian and Asian (1900,1920)"', add
label define raced_sp_lbl 632 `"Hawaiian and European (1900,1920)"', add
label define raced_sp_lbl 634 `"Hawaiian mixed"', add
label define raced_sp_lbl 640 `"Vietnamese"', add
label define raced_sp_lbl 641 `"Bhutanese"', add
label define raced_sp_lbl 642 `"Mongolian"', add
label define raced_sp_lbl 643 `"Nepalese"', add
label define raced_sp_lbl 650 `"Other Asian or Pacific Islander (1920,1980)"', add
label define raced_sp_lbl 651 `"Asian only (CPS)"', add
label define raced_sp_lbl 652 `"Pacific Islander only (CPS)"', add
label define raced_sp_lbl 653 `"Asian or Pacific Islander, n.s. (1990 Internal Census files)"', add
label define raced_sp_lbl 660 `"Cambodian"', add
label define raced_sp_lbl 661 `"Hmong"', add
label define raced_sp_lbl 662 `"Laotian"', add
label define raced_sp_lbl 663 `"Thai"', add
label define raced_sp_lbl 664 `"Bangladeshi"', add
label define raced_sp_lbl 665 `"Burmese"', add
label define raced_sp_lbl 666 `"Indonesian"', add
label define raced_sp_lbl 667 `"Malaysian"', add
label define raced_sp_lbl 668 `"Okinawan"', add
label define raced_sp_lbl 669 `"Pakistani"', add
label define raced_sp_lbl 670 `"Sri Lankan"', add
label define raced_sp_lbl 671 `"Other Asian, n.e.c."', add
label define raced_sp_lbl 672 `"Asian, not specified"', add
label define raced_sp_lbl 673 `"Chinese and Japanese"', add
label define raced_sp_lbl 674 `"Chinese and Filipino"', add
label define raced_sp_lbl 675 `"Chinese and Vietnamese"', add
label define raced_sp_lbl 676 `"Chinese and Asian write_in"', add
label define raced_sp_lbl 677 `"Japanese and Filipino"', add
label define raced_sp_lbl 678 `"Asian Indian and Asian write_in"', add
label define raced_sp_lbl 679 `"Other Asian race combinations"', add
label define raced_sp_lbl 680 `"Samoan"', add
label define raced_sp_lbl 681 `"Tahitian"', add
label define raced_sp_lbl 682 `"Tongan"', add
label define raced_sp_lbl 683 `"Other Polynesian (1990)"', add
label define raced_sp_lbl 684 `"1+ other Polynesian races (2000,ACS)"', add
label define raced_sp_lbl 685 `"Guamanian/Chamorro"', add
label define raced_sp_lbl 686 `"Northern Mariana Islander"', add
label define raced_sp_lbl 687 `"Palauan"', add
label define raced_sp_lbl 688 `"Other Micronesian (1990)"', add
label define raced_sp_lbl 689 `"1+ other Micronesian races (2000,ACS)"', add
label define raced_sp_lbl 690 `"Fijian"', add
label define raced_sp_lbl 691 `"Other Melanesian (1990)"', add
label define raced_sp_lbl 692 `"1+ other Melanesian races (2000,ACS)"', add
label define raced_sp_lbl 698 `"2+ PI races from 2+ PI regions"', add
label define raced_sp_lbl 699 `"Pacific Islander, n.s."', add
label define raced_sp_lbl 700 `"Other race, n.e.c."', add
label define raced_sp_lbl 801 `"White and Black"', add
label define raced_sp_lbl 802 `"White and AIAN"', add
label define raced_sp_lbl 810 `"White and Asian"', add
label define raced_sp_lbl 811 `"White and Chinese"', add
label define raced_sp_lbl 812 `"White and Japanese"', add
label define raced_sp_lbl 813 `"White and Filipino"', add
label define raced_sp_lbl 814 `"White and Asian Indian"', add
label define raced_sp_lbl 815 `"White and Korean"', add
label define raced_sp_lbl 816 `"White and Vietnamese"', add
label define raced_sp_lbl 817 `"White and Asian write_in"', add
label define raced_sp_lbl 818 `"White and other Asian race(s)"', add
label define raced_sp_lbl 819 `"White and two or more Asian groups"', add
label define raced_sp_lbl 820 `"White and PI"', add
label define raced_sp_lbl 821 `"White and Native Hawaiian"', add
label define raced_sp_lbl 822 `"White and Samoan"', add
label define raced_sp_lbl 823 `"White and Guamanian"', add
label define raced_sp_lbl 824 `"White and PI write_in"', add
label define raced_sp_lbl 825 `"White and other PI race(s)"', add
label define raced_sp_lbl 826 `"White and other race write_in"', add
label define raced_sp_lbl 827 `"White and other race, n.e.c."', add
label define raced_sp_lbl 830 `"Black and AIAN"', add
label define raced_sp_lbl 831 `"Black and Asian"', add
label define raced_sp_lbl 832 `"Black and Chinese"', add
label define raced_sp_lbl 833 `"Black and Japanese"', add
label define raced_sp_lbl 834 `"Black and Filipino"', add
label define raced_sp_lbl 835 `"Black and Asian Indian"', add
label define raced_sp_lbl 836 `"Black and Korean"', add
label define raced_sp_lbl 837 `"Black and Asian write_in"', add
label define raced_sp_lbl 838 `"Black and other Asian race(s)"', add
label define raced_sp_lbl 840 `"Black and PI"', add
label define raced_sp_lbl 841 `"Black and PI write_in"', add
label define raced_sp_lbl 842 `"Black and other PI race(s)"', add
label define raced_sp_lbl 845 `"Black and other race write_in"', add
label define raced_sp_lbl 850 `"AIAN and Asian"', add
label define raced_sp_lbl 851 `"AIAN and Filipino (2000 1%)"', add
label define raced_sp_lbl 852 `"AIAN and Asian Indian"', add
label define raced_sp_lbl 853 `"AIAN and Asian write_in (2000 1%)"', add
label define raced_sp_lbl 854 `"AIAN and other Asian race(s)"', add
label define raced_sp_lbl 855 `"AIAN and PI"', add
label define raced_sp_lbl 856 `"AIAN and other race write_in"', add
label define raced_sp_lbl 860 `"Asian and PI"', add
label define raced_sp_lbl 861 `"Chinese and Hawaiian"', add
label define raced_sp_lbl 862 `"Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_sp_lbl 863 `"Japanese and Hawaiian (2000 1%)"', add
label define raced_sp_lbl 864 `"Filipino and Hawaiian"', add
label define raced_sp_lbl 865 `"Filipino and PI write_in"', add
label define raced_sp_lbl 866 `"Asian Indian and PI write_in (2000 1%)"', add
label define raced_sp_lbl 867 `"Asian write_in and PI write_in"', add
label define raced_sp_lbl 868 `"Other Asian race(s) and PI race(s)"', add
label define raced_sp_lbl 869 `"Japanese and Korean (ACS)"', add
label define raced_sp_lbl 880 `"Asian and other race write_in"', add
label define raced_sp_lbl 881 `"Chinese and other race write_in"', add
label define raced_sp_lbl 882 `"Japanese and other race write_in"', add
label define raced_sp_lbl 883 `"Filipino and other race write_in"', add
label define raced_sp_lbl 884 `"Asian Indian and other race write_in"', add
label define raced_sp_lbl 885 `"Asian write_in and other race write_in"', add
label define raced_sp_lbl 886 `"Other Asian race(s) and other race write_in"', add
label define raced_sp_lbl 887 `"Chinese and Korean"', add
label define raced_sp_lbl 890 `"PI and other race write_in:"', add
label define raced_sp_lbl 891 `"PI write_in and other race write_in"', add
label define raced_sp_lbl 892 `"Other PI race(s) and other race write_in"', add
label define raced_sp_lbl 893 `"Native Hawaiian or PI other race(s)"', add
label define raced_sp_lbl 899 `"API and other race write_in"', add
label define raced_sp_lbl 901 `"White, Black, AIAN"', add
label define raced_sp_lbl 902 `"White, Black, Asian"', add
label define raced_sp_lbl 903 `"White, Black, PI"', add
label define raced_sp_lbl 904 `"White, Black, other race write_in"', add
label define raced_sp_lbl 905 `"White, AIAN, Asian"', add
label define raced_sp_lbl 906 `"White, AIAN, PI"', add
label define raced_sp_lbl 907 `"White, AIAN, other race write_in"', add
label define raced_sp_lbl 910 `"White, Asian, PI"', add
label define raced_sp_lbl 911 `"White, Chinese, Hawaiian"', add
label define raced_sp_lbl 912 `"White, Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_sp_lbl 913 `"White, Japanese, Hawaiian (2000 1%)"', add
label define raced_sp_lbl 914 `"White, Filipino, Hawaiian"', add
label define raced_sp_lbl 915 `"Other White, Asian race(s), PI race(s)"', add
label define raced_sp_lbl 916 `"White, AIAN and Filipino"', add
label define raced_sp_lbl 917 `"White, Black, and Filipino"', add
label define raced_sp_lbl 920 `"White, Asian, other race write_in"', add
label define raced_sp_lbl 921 `"White, Filipino, other race write_in (2000 1%)"', add
label define raced_sp_lbl 922 `"White, Asian write_in, other race write_in (2000 1%)"', add
label define raced_sp_lbl 923 `"Other White, Asian race(s), other race write_in (2000 1%)"', add
label define raced_sp_lbl 925 `"White, PI, other race write_in"', add
label define raced_sp_lbl 930 `"Black, AIAN, Asian"', add
label define raced_sp_lbl 931 `"Black, AIAN, PI"', add
label define raced_sp_lbl 932 `"Black, AIAN, other race write_in"', add
label define raced_sp_lbl 933 `"Black, Asian, PI"', add
label define raced_sp_lbl 934 `"Black, Asian, other race write_in"', add
label define raced_sp_lbl 935 `"Black, PI, other race write_in"', add
label define raced_sp_lbl 940 `"AIAN, Asian, PI"', add
label define raced_sp_lbl 941 `"AIAN, Asian, other race write_in"', add
label define raced_sp_lbl 942 `"AIAN, PI, other race write_in"', add
label define raced_sp_lbl 943 `"Asian, PI, other race write_in"', add
label define raced_sp_lbl 944 `"Asian (Chinese, Japanese, Korean, Vietnamese); and Native Hawaiian or PI; and Other"', add
label define raced_sp_lbl 949 `"2 or 3 races (CPS)"', add
label define raced_sp_lbl 950 `"White, Black, AIAN, Asian"', add
label define raced_sp_lbl 951 `"White, Black, AIAN, PI"', add
label define raced_sp_lbl 952 `"White, Black, AIAN, other race write_in"', add
label define raced_sp_lbl 953 `"White, Black, Asian, PI"', add
label define raced_sp_lbl 954 `"White, Black, Asian, other race write_in"', add
label define raced_sp_lbl 955 `"White, Black, PI, other race write_in"', add
label define raced_sp_lbl 960 `"White, AIAN, Asian, PI"', add
label define raced_sp_lbl 961 `"White, AIAN, Asian, other race write_in"', add
label define raced_sp_lbl 962 `"White, AIAN, PI, other race write_in"', add
label define raced_sp_lbl 963 `"White, Asian, PI, other race write_in"', add
label define raced_sp_lbl 964 `"White, Chinese, Japanese, Native Hawaiian"', add
label define raced_sp_lbl 970 `"Black, AIAN, Asian, PI"', add
label define raced_sp_lbl 971 `"Black, AIAN, Asian, other race write_in"', add
label define raced_sp_lbl 972 `"Black, AIAN, PI, other race write_in"', add
label define raced_sp_lbl 973 `"Black, Asian, PI, other race write_in"', add
label define raced_sp_lbl 974 `"AIAN, Asian, PI, other race write_in"', add
label define raced_sp_lbl 975 `"AIAN, Asian, PI, Hawaiian other race write_in"', add
label define raced_sp_lbl 976 `"Two specified Asian  (Chinese and other Asian, Chinese and Japanese, Japanese and other Asian, Korean and other Asian); Native Hawaiian/PI; and Other Race"', add
label define raced_sp_lbl 980 `"White, Black, AIAN, Asian, PI"', add
label define raced_sp_lbl 981 `"White, Black, AIAN, Asian, other race write_in"', add
label define raced_sp_lbl 982 `"White, Black, AIAN, PI, other race write_in"', add
label define raced_sp_lbl 983 `"White, Black, Asian, PI, other race write_in"', add
label define raced_sp_lbl 984 `"White, AIAN, Asian, PI, other race write_in"', add
label define raced_sp_lbl 985 `"Black, AIAN, Asian, PI, other race write_in"', add
label define raced_sp_lbl 986 `"Black, AIAN, Asian, PI, Hawaiian, other race write_in"', add
label define raced_sp_lbl 989 `"4 or 5 races (CPS)"', add
label define raced_sp_lbl 990 `"White, Black, AIAN, Asian, PI, other race write_in"', add
label define raced_sp_lbl 991 `"White race; Some other race; Black or African American race and/or American Indian and Alaska Native race and/or Asian groups and/or Native Hawaiian and Other Pacific Islander groups"', add
label define raced_sp_lbl 996 `"2+ races, n.e.c. (CPS)"', add
label values raced_sp raced_sp_lbl

label define hispan_head_lbl 0 `"Not Hispanic"'
label define hispan_head_lbl 1 `"Mexican"', add
label define hispan_head_lbl 2 `"Puerto Rican"', add
label define hispan_head_lbl 3 `"Cuban"', add
label define hispan_head_lbl 4 `"Other"', add
label define hispan_head_lbl 9 `"Not Reported"', add
label values hispan_head hispan_head_lbl

label define hispan_sp_lbl 0 `"Not Hispanic"'
label define hispan_sp_lbl 1 `"Mexican"', add
label define hispan_sp_lbl 2 `"Puerto Rican"', add
label define hispan_sp_lbl 3 `"Cuban"', add
label define hispan_sp_lbl 4 `"Other"', add
label define hispan_sp_lbl 9 `"Not Reported"', add
label values hispan_sp hispan_sp_lbl

label define hispand_head_lbl 000 `"Not Hispanic"'
label define hispand_head_lbl 100 `"Mexican"', add
label define hispand_head_lbl 102 `"Mexican American"', add
label define hispand_head_lbl 103 `"Mexicano/Mexicana"', add
label define hispand_head_lbl 104 `"Chicano/Chicana"', add
label define hispand_head_lbl 105 `"La Raza"', add
label define hispand_head_lbl 106 `"Mexican American Indian"', add
label define hispand_head_lbl 107 `"Mexico"', add
label define hispand_head_lbl 200 `"Puerto Rican"', add
label define hispand_head_lbl 300 `"Cuban"', add
label define hispand_head_lbl 401 `"Central American Indian"', add
label define hispand_head_lbl 402 `"Canal Zone"', add
label define hispand_head_lbl 411 `"Costa Rican"', add
label define hispand_head_lbl 412 `"Guatemalan"', add
label define hispand_head_lbl 413 `"Honduran"', add
label define hispand_head_lbl 414 `"Nicaraguan"', add
label define hispand_head_lbl 415 `"Panamanian"', add
label define hispand_head_lbl 416 `"Salvadoran"', add
label define hispand_head_lbl 417 `"Central American, n.e.c."', add
label define hispand_head_lbl 420 `"Argentinean"', add
label define hispand_head_lbl 421 `"Bolivian"', add
label define hispand_head_lbl 422 `"Chilean"', add
label define hispand_head_lbl 423 `"Colombian"', add
label define hispand_head_lbl 424 `"Ecuadorian"', add
label define hispand_head_lbl 425 `"Paraguayan"', add
label define hispand_head_lbl 426 `"Peruvian"', add
label define hispand_head_lbl 427 `"Uruguayan"', add
label define hispand_head_lbl 428 `"Venezuelan"', add
label define hispand_head_lbl 429 `"South American Indian"', add
label define hispand_head_lbl 430 `"Criollo"', add
label define hispand_head_lbl 431 `"South American, n.e.c."', add
label define hispand_head_lbl 450 `"Spaniard"', add
label define hispand_head_lbl 451 `"Andalusian"', add
label define hispand_head_lbl 452 `"Asturian"', add
label define hispand_head_lbl 453 `"Castillian"', add
label define hispand_head_lbl 454 `"Catalonian"', add
label define hispand_head_lbl 455 `"Balearic Islander"', add
label define hispand_head_lbl 456 `"Gallego"', add
label define hispand_head_lbl 457 `"Valencian"', add
label define hispand_head_lbl 458 `"Canarian"', add
label define hispand_head_lbl 459 `"Spanish Basque"', add
label define hispand_head_lbl 460 `"Dominican"', add
label define hispand_head_lbl 465 `"Latin American"', add
label define hispand_head_lbl 470 `"Hispanic"', add
label define hispand_head_lbl 480 `"Spanish"', add
label define hispand_head_lbl 490 `"Californio"', add
label define hispand_head_lbl 491 `"Tejano"', add
label define hispand_head_lbl 492 `"Nuevo Mexicano"', add
label define hispand_head_lbl 493 `"Spanish American"', add
label define hispand_head_lbl 494 `"Spanish American Indian"', add
label define hispand_head_lbl 495 `"Meso American Indian"', add
label define hispand_head_lbl 496 `"Mestizo"', add
label define hispand_head_lbl 498 `"Other, n.s."', add
label define hispand_head_lbl 499 `"Other, n.e.c."', add
label define hispand_head_lbl 900 `"Not Reported"', add
label values hispand_head hispand_head_lbl

label define hispand_sp_lbl 000 `"Not Hispanic"'
label define hispand_sp_lbl 100 `"Mexican"', add
label define hispand_sp_lbl 102 `"Mexican American"', add
label define hispand_sp_lbl 103 `"Mexicano/Mexicana"', add
label define hispand_sp_lbl 104 `"Chicano/Chicana"', add
label define hispand_sp_lbl 105 `"La Raza"', add
label define hispand_sp_lbl 106 `"Mexican American Indian"', add
label define hispand_sp_lbl 107 `"Mexico"', add
label define hispand_sp_lbl 200 `"Puerto Rican"', add
label define hispand_sp_lbl 300 `"Cuban"', add
label define hispand_sp_lbl 401 `"Central American Indian"', add
label define hispand_sp_lbl 402 `"Canal Zone"', add
label define hispand_sp_lbl 411 `"Costa Rican"', add
label define hispand_sp_lbl 412 `"Guatemalan"', add
label define hispand_sp_lbl 413 `"Honduran"', add
label define hispand_sp_lbl 414 `"Nicaraguan"', add
label define hispand_sp_lbl 415 `"Panamanian"', add
label define hispand_sp_lbl 416 `"Salvadoran"', add
label define hispand_sp_lbl 417 `"Central American, n.e.c."', add
label define hispand_sp_lbl 420 `"Argentinean"', add
label define hispand_sp_lbl 421 `"Bolivian"', add
label define hispand_sp_lbl 422 `"Chilean"', add
label define hispand_sp_lbl 423 `"Colombian"', add
label define hispand_sp_lbl 424 `"Ecuadorian"', add
label define hispand_sp_lbl 425 `"Paraguayan"', add
label define hispand_sp_lbl 426 `"Peruvian"', add
label define hispand_sp_lbl 427 `"Uruguayan"', add
label define hispand_sp_lbl 428 `"Venezuelan"', add
label define hispand_sp_lbl 429 `"South American Indian"', add
label define hispand_sp_lbl 430 `"Criollo"', add
label define hispand_sp_lbl 431 `"South American, n.e.c."', add
label define hispand_sp_lbl 450 `"Spaniard"', add
label define hispand_sp_lbl 451 `"Andalusian"', add
label define hispand_sp_lbl 452 `"Asturian"', add
label define hispand_sp_lbl 453 `"Castillian"', add
label define hispand_sp_lbl 454 `"Catalonian"', add
label define hispand_sp_lbl 455 `"Balearic Islander"', add
label define hispand_sp_lbl 456 `"Gallego"', add
label define hispand_sp_lbl 457 `"Valencian"', add
label define hispand_sp_lbl 458 `"Canarian"', add
label define hispand_sp_lbl 459 `"Spanish Basque"', add
label define hispand_sp_lbl 460 `"Dominican"', add
label define hispand_sp_lbl 465 `"Latin American"', add
label define hispand_sp_lbl 470 `"Hispanic"', add
label define hispand_sp_lbl 480 `"Spanish"', add
label define hispand_sp_lbl 490 `"Californio"', add
label define hispand_sp_lbl 491 `"Tejano"', add
label define hispand_sp_lbl 492 `"Nuevo Mexicano"', add
label define hispand_sp_lbl 493 `"Spanish American"', add
label define hispand_sp_lbl 494 `"Spanish American Indian"', add
label define hispand_sp_lbl 495 `"Meso American Indian"', add
label define hispand_sp_lbl 496 `"Mestizo"', add
label define hispand_sp_lbl 498 `"Other, n.s."', add
label define hispand_sp_lbl 499 `"Other, n.e.c."', add
label define hispand_sp_lbl 900 `"Not Reported"', add
label values hispand_sp hispand_sp_lbl

label define bpl_head_lbl 001 `"Alabama"'
label define bpl_head_lbl 002 `"Alaska"', add
label define bpl_head_lbl 004 `"Arizona"', add
label define bpl_head_lbl 005 `"Arkansas"', add
label define bpl_head_lbl 006 `"California"', add
label define bpl_head_lbl 008 `"Colorado"', add
label define bpl_head_lbl 009 `"Connecticut"', add
label define bpl_head_lbl 010 `"Delaware"', add
label define bpl_head_lbl 011 `"District of Columbia"', add
label define bpl_head_lbl 012 `"Florida"', add
label define bpl_head_lbl 013 `"Georgia"', add
label define bpl_head_lbl 015 `"Hawaii"', add
label define bpl_head_lbl 016 `"Idaho"', add
label define bpl_head_lbl 017 `"Illinois"', add
label define bpl_head_lbl 018 `"Indiana"', add
label define bpl_head_lbl 019 `"Iowa"', add
label define bpl_head_lbl 020 `"Kansas"', add
label define bpl_head_lbl 021 `"Kentucky"', add
label define bpl_head_lbl 022 `"Louisiana"', add
label define bpl_head_lbl 023 `"Maine"', add
label define bpl_head_lbl 024 `"Maryland"', add
label define bpl_head_lbl 025 `"Massachusetts"', add
label define bpl_head_lbl 026 `"Michigan"', add
label define bpl_head_lbl 027 `"Minnesota"', add
label define bpl_head_lbl 028 `"Mississippi"', add
label define bpl_head_lbl 029 `"Missouri"', add
label define bpl_head_lbl 030 `"Montana"', add
label define bpl_head_lbl 031 `"Nebraska"', add
label define bpl_head_lbl 032 `"Nevada"', add
label define bpl_head_lbl 033 `"New Hampshire"', add
label define bpl_head_lbl 034 `"New Jersey"', add
label define bpl_head_lbl 035 `"New Mexico"', add
label define bpl_head_lbl 036 `"New York"', add
label define bpl_head_lbl 037 `"North Carolina"', add
label define bpl_head_lbl 038 `"North Dakota"', add
label define bpl_head_lbl 039 `"Ohio"', add
label define bpl_head_lbl 040 `"Oklahoma"', add
label define bpl_head_lbl 041 `"Oregon"', add
label define bpl_head_lbl 042 `"Pennsylvania"', add
label define bpl_head_lbl 044 `"Rhode Island"', add
label define bpl_head_lbl 045 `"South Carolina"', add
label define bpl_head_lbl 046 `"South Dakota"', add
label define bpl_head_lbl 047 `"Tennessee"', add
label define bpl_head_lbl 048 `"Texas"', add
label define bpl_head_lbl 049 `"Utah"', add
label define bpl_head_lbl 050 `"Vermont"', add
label define bpl_head_lbl 051 `"Virginia"', add
label define bpl_head_lbl 053 `"Washington"', add
label define bpl_head_lbl 054 `"West Virginia"', add
label define bpl_head_lbl 055 `"Wisconsin"', add
label define bpl_head_lbl 056 `"Wyoming"', add
label define bpl_head_lbl 090 `"Native American"', add
label define bpl_head_lbl 099 `"United States, ns"', add
label define bpl_head_lbl 100 `"American Samoa"', add
label define bpl_head_lbl 105 `"Guam"', add
label define bpl_head_lbl 110 `"Puerto Rico"', add
label define bpl_head_lbl 115 `"U.S. Virgin Islands"', add
label define bpl_head_lbl 120 `"Other US Possessions"', add
label define bpl_head_lbl 150 `"Canada"', add
label define bpl_head_lbl 155 `"St. Pierre and Miquelon"', add
label define bpl_head_lbl 160 `"Atlantic Islands"', add
label define bpl_head_lbl 199 `"North America, ns"', add
label define bpl_head_lbl 200 `"Mexico"', add
label define bpl_head_lbl 210 `"Central America"', add
label define bpl_head_lbl 250 `"Cuba"', add
label define bpl_head_lbl 260 `"West Indies"', add
label define bpl_head_lbl 299 `"Americas, n.s."', add
label define bpl_head_lbl 300 `"SOUTH AMERICA"', add
label define bpl_head_lbl 400 `"Denmark"', add
label define bpl_head_lbl 401 `"Finland"', add
label define bpl_head_lbl 402 `"Iceland"', add
label define bpl_head_lbl 403 `"Lapland, n.s."', add
label define bpl_head_lbl 404 `"Norway"', add
label define bpl_head_lbl 405 `"Sweden"', add
label define bpl_head_lbl 410 `"England"', add
label define bpl_head_lbl 411 `"Scotland"', add
label define bpl_head_lbl 412 `"Wales"', add
label define bpl_head_lbl 413 `"United Kingdom, ns"', add
label define bpl_head_lbl 414 `"Ireland"', add
label define bpl_head_lbl 419 `"Northern Europe, ns"', add
label define bpl_head_lbl 420 `"Belgium"', add
label define bpl_head_lbl 421 `"France"', add
label define bpl_head_lbl 422 `"Liechtenstein"', add
label define bpl_head_lbl 423 `"Luxembourg"', add
label define bpl_head_lbl 424 `"Monaco"', add
label define bpl_head_lbl 425 `"Netherlands"', add
label define bpl_head_lbl 426 `"Switzerland"', add
label define bpl_head_lbl 429 `"Western Europe, ns"', add
label define bpl_head_lbl 430 `"Albania"', add
label define bpl_head_lbl 431 `"Andorra"', add
label define bpl_head_lbl 432 `"Gibraltar"', add
label define bpl_head_lbl 433 `"Greece"', add
label define bpl_head_lbl 434 `"Italy"', add
label define bpl_head_lbl 435 `"Malta"', add
label define bpl_head_lbl 436 `"Portugal"', add
label define bpl_head_lbl 437 `"San Marino"', add
label define bpl_head_lbl 438 `"Spain"', add
label define bpl_head_lbl 439 `"Vatican City"', add
label define bpl_head_lbl 440 `"Southern Europe, ns"', add
label define bpl_head_lbl 450 `"Austria"', add
label define bpl_head_lbl 451 `"Bulgaria"', add
label define bpl_head_lbl 452 `"Czechoslovakia"', add
label define bpl_head_lbl 453 `"Germany"', add
label define bpl_head_lbl 454 `"Hungary"', add
label define bpl_head_lbl 455 `"Poland"', add
label define bpl_head_lbl 456 `"Romania"', add
label define bpl_head_lbl 457 `"Yugoslavia"', add
label define bpl_head_lbl 458 `"Central Europe, ns"', add
label define bpl_head_lbl 459 `"Eastern Europe, ns"', add
label define bpl_head_lbl 460 `"Estonia"', add
label define bpl_head_lbl 461 `"Latvia"', add
label define bpl_head_lbl 462 `"Lithuania"', add
label define bpl_head_lbl 463 `"Baltic States, ns"', add
label define bpl_head_lbl 465 `"Other USSR/Russia"', add
label define bpl_head_lbl 499 `"Europe, ns"', add
label define bpl_head_lbl 500 `"China"', add
label define bpl_head_lbl 501 `"Japan"', add
label define bpl_head_lbl 502 `"Korea"', add
label define bpl_head_lbl 509 `"East Asia, ns"', add
label define bpl_head_lbl 510 `"Brunei"', add
label define bpl_head_lbl 511 `"Cambodia (Kampuchea)"', add
label define bpl_head_lbl 512 `"Indonesia"', add
label define bpl_head_lbl 513 `"Laos"', add
label define bpl_head_lbl 514 `"Malaysia"', add
label define bpl_head_lbl 515 `"Philippines"', add
label define bpl_head_lbl 516 `"Singapore"', add
label define bpl_head_lbl 517 `"Thailand"', add
label define bpl_head_lbl 518 `"Vietnam"', add
label define bpl_head_lbl 519 `"Southeast Asia, ns"', add
label define bpl_head_lbl 520 `"Afghanistan"', add
label define bpl_head_lbl 521 `"India"', add
label define bpl_head_lbl 522 `"Iran"', add
label define bpl_head_lbl 523 `"Maldives"', add
label define bpl_head_lbl 524 `"Nepal"', add
label define bpl_head_lbl 530 `"Bahrain"', add
label define bpl_head_lbl 531 `"Cyprus"', add
label define bpl_head_lbl 532 `"Iraq"', add
label define bpl_head_lbl 533 `"Iraq/Saudi Arabia"', add
label define bpl_head_lbl 534 `"Israel/Palestine"', add
label define bpl_head_lbl 535 `"Jordan"', add
label define bpl_head_lbl 536 `"Kuwait"', add
label define bpl_head_lbl 537 `"Lebanon"', add
label define bpl_head_lbl 538 `"Oman"', add
label define bpl_head_lbl 539 `"Qatar"', add
label define bpl_head_lbl 540 `"Saudi Arabia"', add
label define bpl_head_lbl 541 `"Syria"', add
label define bpl_head_lbl 542 `"Turkey"', add
label define bpl_head_lbl 543 `"United Arab Emirates"', add
label define bpl_head_lbl 544 `"Yemen Arab Republic (North)"', add
label define bpl_head_lbl 545 `"Yemen, PDR (South)"', add
label define bpl_head_lbl 546 `"Persian Gulf States, n.s."', add
label define bpl_head_lbl 547 `"Middle East, ns"', add
label define bpl_head_lbl 548 `"Southwest Asia, nec/ns"', add
label define bpl_head_lbl 549 `"Asia Minor, ns"', add
label define bpl_head_lbl 550 `"South Asia, nec"', add
label define bpl_head_lbl 599 `"Asia, nec/ns"', add
label define bpl_head_lbl 600 `"AFRICA"', add
label define bpl_head_lbl 700 `"Australia and New Zealand"', add
label define bpl_head_lbl 710 `"Pacific Islands"', add
label define bpl_head_lbl 800 `"Antarctica, ns/nec"', add
label define bpl_head_lbl 900 `"Abroad (unknown) or at sea"', add
label define bpl_head_lbl 950 `"Other n.e.c."', add
label define bpl_head_lbl 999 `"Missing/blank"', add
label values bpl_head bpl_head_lbl

label define bpl_sp_lbl 001 `"Alabama"'
label define bpl_sp_lbl 002 `"Alaska"', add
label define bpl_sp_lbl 004 `"Arizona"', add
label define bpl_sp_lbl 005 `"Arkansas"', add
label define bpl_sp_lbl 006 `"California"', add
label define bpl_sp_lbl 008 `"Colorado"', add
label define bpl_sp_lbl 009 `"Connecticut"', add
label define bpl_sp_lbl 010 `"Delaware"', add
label define bpl_sp_lbl 011 `"District of Columbia"', add
label define bpl_sp_lbl 012 `"Florida"', add
label define bpl_sp_lbl 013 `"Georgia"', add
label define bpl_sp_lbl 015 `"Hawaii"', add
label define bpl_sp_lbl 016 `"Idaho"', add
label define bpl_sp_lbl 017 `"Illinois"', add
label define bpl_sp_lbl 018 `"Indiana"', add
label define bpl_sp_lbl 019 `"Iowa"', add
label define bpl_sp_lbl 020 `"Kansas"', add
label define bpl_sp_lbl 021 `"Kentucky"', add
label define bpl_sp_lbl 022 `"Louisiana"', add
label define bpl_sp_lbl 023 `"Maine"', add
label define bpl_sp_lbl 024 `"Maryland"', add
label define bpl_sp_lbl 025 `"Massachusetts"', add
label define bpl_sp_lbl 026 `"Michigan"', add
label define bpl_sp_lbl 027 `"Minnesota"', add
label define bpl_sp_lbl 028 `"Mississippi"', add
label define bpl_sp_lbl 029 `"Missouri"', add
label define bpl_sp_lbl 030 `"Montana"', add
label define bpl_sp_lbl 031 `"Nebraska"', add
label define bpl_sp_lbl 032 `"Nevada"', add
label define bpl_sp_lbl 033 `"New Hampshire"', add
label define bpl_sp_lbl 034 `"New Jersey"', add
label define bpl_sp_lbl 035 `"New Mexico"', add
label define bpl_sp_lbl 036 `"New York"', add
label define bpl_sp_lbl 037 `"North Carolina"', add
label define bpl_sp_lbl 038 `"North Dakota"', add
label define bpl_sp_lbl 039 `"Ohio"', add
label define bpl_sp_lbl 040 `"Oklahoma"', add
label define bpl_sp_lbl 041 `"Oregon"', add
label define bpl_sp_lbl 042 `"Pennsylvania"', add
label define bpl_sp_lbl 044 `"Rhode Island"', add
label define bpl_sp_lbl 045 `"South Carolina"', add
label define bpl_sp_lbl 046 `"South Dakota"', add
label define bpl_sp_lbl 047 `"Tennessee"', add
label define bpl_sp_lbl 048 `"Texas"', add
label define bpl_sp_lbl 049 `"Utah"', add
label define bpl_sp_lbl 050 `"Vermont"', add
label define bpl_sp_lbl 051 `"Virginia"', add
label define bpl_sp_lbl 053 `"Washington"', add
label define bpl_sp_lbl 054 `"West Virginia"', add
label define bpl_sp_lbl 055 `"Wisconsin"', add
label define bpl_sp_lbl 056 `"Wyoming"', add
label define bpl_sp_lbl 090 `"Native American"', add
label define bpl_sp_lbl 099 `"United States, ns"', add
label define bpl_sp_lbl 100 `"American Samoa"', add
label define bpl_sp_lbl 105 `"Guam"', add
label define bpl_sp_lbl 110 `"Puerto Rico"', add
label define bpl_sp_lbl 115 `"U.S. Virgin Islands"', add
label define bpl_sp_lbl 120 `"Other US Possessions"', add
label define bpl_sp_lbl 150 `"Canada"', add
label define bpl_sp_lbl 155 `"St. Pierre and Miquelon"', add
label define bpl_sp_lbl 160 `"Atlantic Islands"', add
label define bpl_sp_lbl 199 `"North America, ns"', add
label define bpl_sp_lbl 200 `"Mexico"', add
label define bpl_sp_lbl 210 `"Central America"', add
label define bpl_sp_lbl 250 `"Cuba"', add
label define bpl_sp_lbl 260 `"West Indies"', add
label define bpl_sp_lbl 299 `"Americas, n.s."', add
label define bpl_sp_lbl 300 `"SOUTH AMERICA"', add
label define bpl_sp_lbl 400 `"Denmark"', add
label define bpl_sp_lbl 401 `"Finland"', add
label define bpl_sp_lbl 402 `"Iceland"', add
label define bpl_sp_lbl 403 `"Lapland, n.s."', add
label define bpl_sp_lbl 404 `"Norway"', add
label define bpl_sp_lbl 405 `"Sweden"', add
label define bpl_sp_lbl 410 `"England"', add
label define bpl_sp_lbl 411 `"Scotland"', add
label define bpl_sp_lbl 412 `"Wales"', add
label define bpl_sp_lbl 413 `"United Kingdom, ns"', add
label define bpl_sp_lbl 414 `"Ireland"', add
label define bpl_sp_lbl 419 `"Northern Europe, ns"', add
label define bpl_sp_lbl 420 `"Belgium"', add
label define bpl_sp_lbl 421 `"France"', add
label define bpl_sp_lbl 422 `"Liechtenstein"', add
label define bpl_sp_lbl 423 `"Luxembourg"', add
label define bpl_sp_lbl 424 `"Monaco"', add
label define bpl_sp_lbl 425 `"Netherlands"', add
label define bpl_sp_lbl 426 `"Switzerland"', add
label define bpl_sp_lbl 429 `"Western Europe, ns"', add
label define bpl_sp_lbl 430 `"Albania"', add
label define bpl_sp_lbl 431 `"Andorra"', add
label define bpl_sp_lbl 432 `"Gibraltar"', add
label define bpl_sp_lbl 433 `"Greece"', add
label define bpl_sp_lbl 434 `"Italy"', add
label define bpl_sp_lbl 435 `"Malta"', add
label define bpl_sp_lbl 436 `"Portugal"', add
label define bpl_sp_lbl 437 `"San Marino"', add
label define bpl_sp_lbl 438 `"Spain"', add
label define bpl_sp_lbl 439 `"Vatican City"', add
label define bpl_sp_lbl 440 `"Southern Europe, ns"', add
label define bpl_sp_lbl 450 `"Austria"', add
label define bpl_sp_lbl 451 `"Bulgaria"', add
label define bpl_sp_lbl 452 `"Czechoslovakia"', add
label define bpl_sp_lbl 453 `"Germany"', add
label define bpl_sp_lbl 454 `"Hungary"', add
label define bpl_sp_lbl 455 `"Poland"', add
label define bpl_sp_lbl 456 `"Romania"', add
label define bpl_sp_lbl 457 `"Yugoslavia"', add
label define bpl_sp_lbl 458 `"Central Europe, ns"', add
label define bpl_sp_lbl 459 `"Eastern Europe, ns"', add
label define bpl_sp_lbl 460 `"Estonia"', add
label define bpl_sp_lbl 461 `"Latvia"', add
label define bpl_sp_lbl 462 `"Lithuania"', add
label define bpl_sp_lbl 463 `"Baltic States, ns"', add
label define bpl_sp_lbl 465 `"Other USSR/Russia"', add
label define bpl_sp_lbl 499 `"Europe, ns"', add
label define bpl_sp_lbl 500 `"China"', add
label define bpl_sp_lbl 501 `"Japan"', add
label define bpl_sp_lbl 502 `"Korea"', add
label define bpl_sp_lbl 509 `"East Asia, ns"', add
label define bpl_sp_lbl 510 `"Brunei"', add
label define bpl_sp_lbl 511 `"Cambodia (Kampuchea)"', add
label define bpl_sp_lbl 512 `"Indonesia"', add
label define bpl_sp_lbl 513 `"Laos"', add
label define bpl_sp_lbl 514 `"Malaysia"', add
label define bpl_sp_lbl 515 `"Philippines"', add
label define bpl_sp_lbl 516 `"Singapore"', add
label define bpl_sp_lbl 517 `"Thailand"', add
label define bpl_sp_lbl 518 `"Vietnam"', add
label define bpl_sp_lbl 519 `"Southeast Asia, ns"', add
label define bpl_sp_lbl 520 `"Afghanistan"', add
label define bpl_sp_lbl 521 `"India"', add
label define bpl_sp_lbl 522 `"Iran"', add
label define bpl_sp_lbl 523 `"Maldives"', add
label define bpl_sp_lbl 524 `"Nepal"', add
label define bpl_sp_lbl 530 `"Bahrain"', add
label define bpl_sp_lbl 531 `"Cyprus"', add
label define bpl_sp_lbl 532 `"Iraq"', add
label define bpl_sp_lbl 533 `"Iraq/Saudi Arabia"', add
label define bpl_sp_lbl 534 `"Israel/Palestine"', add
label define bpl_sp_lbl 535 `"Jordan"', add
label define bpl_sp_lbl 536 `"Kuwait"', add
label define bpl_sp_lbl 537 `"Lebanon"', add
label define bpl_sp_lbl 538 `"Oman"', add
label define bpl_sp_lbl 539 `"Qatar"', add
label define bpl_sp_lbl 540 `"Saudi Arabia"', add
label define bpl_sp_lbl 541 `"Syria"', add
label define bpl_sp_lbl 542 `"Turkey"', add
label define bpl_sp_lbl 543 `"United Arab Emirates"', add
label define bpl_sp_lbl 544 `"Yemen Arab Republic (North)"', add
label define bpl_sp_lbl 545 `"Yemen, PDR (South)"', add
label define bpl_sp_lbl 546 `"Persian Gulf States, n.s."', add
label define bpl_sp_lbl 547 `"Middle East, ns"', add
label define bpl_sp_lbl 548 `"Southwest Asia, nec/ns"', add
label define bpl_sp_lbl 549 `"Asia Minor, ns"', add
label define bpl_sp_lbl 550 `"South Asia, nec"', add
label define bpl_sp_lbl 599 `"Asia, nec/ns"', add
label define bpl_sp_lbl 600 `"AFRICA"', add
label define bpl_sp_lbl 700 `"Australia and New Zealand"', add
label define bpl_sp_lbl 710 `"Pacific Islands"', add
label define bpl_sp_lbl 800 `"Antarctica, ns/nec"', add
label define bpl_sp_lbl 900 `"Abroad (unknown) or at sea"', add
label define bpl_sp_lbl 950 `"Other n.e.c."', add
label define bpl_sp_lbl 999 `"Missing/blank"', add
label values bpl_sp bpl_sp_lbl

label define bpld_head_lbl 00100 `"Alabama"'
label define bpld_head_lbl 00200 `"Alaska"', add
label define bpld_head_lbl 00400 `"Arizona"', add
label define bpld_head_lbl 00500 `"Arkansas"', add
label define bpld_head_lbl 00600 `"California"', add
label define bpld_head_lbl 00800 `"Colorado"', add
label define bpld_head_lbl 00900 `"Connecticut"', add
label define bpld_head_lbl 01000 `"Delaware"', add
label define bpld_head_lbl 01100 `"District of Columbia"', add
label define bpld_head_lbl 01200 `"Florida"', add
label define bpld_head_lbl 01300 `"Georgia"', add
label define bpld_head_lbl 01500 `"Hawaii"', add
label define bpld_head_lbl 01600 `"Idaho"', add
label define bpld_head_lbl 01610 `"Idaho Territory"', add
label define bpld_head_lbl 01700 `"Illinois"', add
label define bpld_head_lbl 01800 `"Indiana"', add
label define bpld_head_lbl 01900 `"Iowa"', add
label define bpld_head_lbl 02000 `"Kansas"', add
label define bpld_head_lbl 02100 `"Kentucky"', add
label define bpld_head_lbl 02200 `"Louisiana"', add
label define bpld_head_lbl 02300 `"Maine"', add
label define bpld_head_lbl 02400 `"Maryland"', add
label define bpld_head_lbl 02500 `"Massachusetts"', add
label define bpld_head_lbl 02600 `"Michigan"', add
label define bpld_head_lbl 02700 `"Minnesota"', add
label define bpld_head_lbl 02800 `"Mississippi"', add
label define bpld_head_lbl 02900 `"Missouri"', add
label define bpld_head_lbl 03000 `"Montana"', add
label define bpld_head_lbl 03100 `"Nebraska"', add
label define bpld_head_lbl 03200 `"Nevada"', add
label define bpld_head_lbl 03300 `"New Hampshire"', add
label define bpld_head_lbl 03400 `"New Jersey"', add
label define bpld_head_lbl 03500 `"New Mexico"', add
label define bpld_head_lbl 03510 `"New Mexico Territory"', add
label define bpld_head_lbl 03600 `"New York"', add
label define bpld_head_lbl 03700 `"North Carolina"', add
label define bpld_head_lbl 03800 `"North Dakota"', add
label define bpld_head_lbl 03900 `"Ohio"', add
label define bpld_head_lbl 04000 `"Oklahoma"', add
label define bpld_head_lbl 04010 `"Indian Territory"', add
label define bpld_head_lbl 04100 `"Oregon"', add
label define bpld_head_lbl 04200 `"Pennsylvania"', add
label define bpld_head_lbl 04400 `"Rhode Island"', add
label define bpld_head_lbl 04500 `"South Carolina"', add
label define bpld_head_lbl 04600 `"South Dakota"', add
label define bpld_head_lbl 04610 `"Dakota Territory"', add
label define bpld_head_lbl 04700 `"Tennessee"', add
label define bpld_head_lbl 04800 `"Texas"', add
label define bpld_head_lbl 04900 `"Utah"', add
label define bpld_head_lbl 04910 `"Utah Territory"', add
label define bpld_head_lbl 05000 `"Vermont"', add
label define bpld_head_lbl 05100 `"Virginia"', add
label define bpld_head_lbl 05300 `"Washington"', add
label define bpld_head_lbl 05400 `"West Virginia"', add
label define bpld_head_lbl 05500 `"Wisconsin"', add
label define bpld_head_lbl 05600 `"Wyoming"', add
label define bpld_head_lbl 05610 `"Wyoming Territory"', add
label define bpld_head_lbl 09000 `"Native American"', add
label define bpld_head_lbl 09900 `"United States, ns"', add
label define bpld_head_lbl 10000 `"American Samoa"', add
label define bpld_head_lbl 10010 `"Samoa, 1940-1950"', add
label define bpld_head_lbl 10500 `"Guam"', add
label define bpld_head_lbl 11000 `"Puerto Rico"', add
label define bpld_head_lbl 11500 `"U.S. Virgin Islands"', add
label define bpld_head_lbl 11510 `"St. Croix"', add
label define bpld_head_lbl 11520 `"St. John"', add
label define bpld_head_lbl 11530 `"St. Thomas"', add
label define bpld_head_lbl 12000 `"Other US Possessions:"', add
label define bpld_head_lbl 12010 `"Johnston Atoll"', add
label define bpld_head_lbl 12020 `"Midway Islands"', add
label define bpld_head_lbl 12030 `"Wake Island"', add
label define bpld_head_lbl 12040 `"Other US Caribbean Islands"', add
label define bpld_head_lbl 12041 `"Navassa Island"', add
label define bpld_head_lbl 12050 `"Other US Pacific Islands"', add
label define bpld_head_lbl 12051 `"Baker Island"', add
label define bpld_head_lbl 12052 `"Howland Island"', add
label define bpld_head_lbl 12053 `"Jarvis Island"', add
label define bpld_head_lbl 12054 `"Kingman Reef"', add
label define bpld_head_lbl 12055 `"Palmyra Atoll"', add
label define bpld_head_lbl 12056 `"Canton and Enderbury Island"', add
label define bpld_head_lbl 12090 `"US outlying areas, ns"', add
label define bpld_head_lbl 12091 `"US possessions, ns"', add
label define bpld_head_lbl 12092 `"US territory, ns"', add
label define bpld_head_lbl 15000 `"Canada"', add
label define bpld_head_lbl 15010 `"English Canada"', add
label define bpld_head_lbl 15011 `"British Columbia"', add
label define bpld_head_lbl 15013 `"Alberta"', add
label define bpld_head_lbl 15015 `"Saskatchewan"', add
label define bpld_head_lbl 15017 `"Northwest"', add
label define bpld_head_lbl 15019 `"Ruperts Land"', add
label define bpld_head_lbl 15020 `"Manitoba"', add
label define bpld_head_lbl 15021 `"Red River"', add
label define bpld_head_lbl 15030 `"Ontario/Upper Canada"', add
label define bpld_head_lbl 15031 `"Upper Canada"', add
label define bpld_head_lbl 15032 `"Canada West"', add
label define bpld_head_lbl 15040 `"New Brunswick"', add
label define bpld_head_lbl 15050 `"Nova Scotia"', add
label define bpld_head_lbl 15051 `"Cape Breton"', add
label define bpld_head_lbl 15052 `"Halifax"', add
label define bpld_head_lbl 15060 `"Prince Edward Island"', add
label define bpld_head_lbl 15070 `"Newfoundland"', add
label define bpld_head_lbl 15080 `"French Canada"', add
label define bpld_head_lbl 15081 `"Quebec"', add
label define bpld_head_lbl 15082 `"Lower Canada"', add
label define bpld_head_lbl 15083 `"Canada East"', add
label define bpld_head_lbl 15500 `"St. Pierre and Miquelon"', add
label define bpld_head_lbl 16000 `"Atlantic Islands"', add
label define bpld_head_lbl 16010 `"Bermuda"', add
label define bpld_head_lbl 16020 `"Cape Verde"', add
label define bpld_head_lbl 16030 `"Falkland Islands"', add
label define bpld_head_lbl 16040 `"Greenland"', add
label define bpld_head_lbl 16050 `"St. Helena and Ascension"', add
label define bpld_head_lbl 16060 `"Canary Islands"', add
label define bpld_head_lbl 19900 `"North America, ns"', add
label define bpld_head_lbl 20000 `"Mexico"', add
label define bpld_head_lbl 21000 `"Central America"', add
label define bpld_head_lbl 21010 `"Belize/British Honduras"', add
label define bpld_head_lbl 21020 `"Costa Rica"', add
label define bpld_head_lbl 21030 `"El Salvador"', add
label define bpld_head_lbl 21040 `"Guatemala"', add
label define bpld_head_lbl 21050 `"Honduras"', add
label define bpld_head_lbl 21060 `"Nicaragua"', add
label define bpld_head_lbl 21070 `"Panama"', add
label define bpld_head_lbl 21071 `"Canal Zone"', add
label define bpld_head_lbl 21090 `"Central America, ns"', add
label define bpld_head_lbl 25000 `"Cuba"', add
label define bpld_head_lbl 26000 `"West Indies"', add
label define bpld_head_lbl 26010 `"Dominican Republic"', add
label define bpld_head_lbl 26020 `"Haiti"', add
label define bpld_head_lbl 26030 `"Jamaica"', add
label define bpld_head_lbl 26040 `"British West Indies"', add
label define bpld_head_lbl 26041 `"Anguilla"', add
label define bpld_head_lbl 26042 `"Antigua-Barbuda"', add
label define bpld_head_lbl 26043 `"Bahamas"', add
label define bpld_head_lbl 26044 `"Barbados"', add
label define bpld_head_lbl 26045 `"British Virgin Islands"', add
label define bpld_head_lbl 26046 `"Anegada"', add
label define bpld_head_lbl 26047 `"Cooper"', add
label define bpld_head_lbl 26048 `"Jost Van Dyke"', add
label define bpld_head_lbl 26049 `"Peter"', add
label define bpld_head_lbl 26050 `"Tortola"', add
label define bpld_head_lbl 26051 `"Virgin Gorda"', add
label define bpld_head_lbl 26052 `"Br. Virgin Islands, ns"', add
label define bpld_head_lbl 26053 `"Cayman Islands"', add
label define bpld_head_lbl 26054 `"Dominica"', add
label define bpld_head_lbl 26055 `"Grenada"', add
label define bpld_head_lbl 26056 `"Montserrat"', add
label define bpld_head_lbl 26057 `"St. Kitts-Nevis"', add
label define bpld_head_lbl 26058 `"St. Lucia"', add
label define bpld_head_lbl 26059 `"St. Vincent"', add
label define bpld_head_lbl 26060 `"Trinidad and Tobago"', add
label define bpld_head_lbl 26061 `"Turks and Caicos"', add
label define bpld_head_lbl 26069 `"Br. Virgin Islands, ns"', add
label define bpld_head_lbl 26070 `"Other West Indies"', add
label define bpld_head_lbl 26071 `"Aruba"', add
label define bpld_head_lbl 26072 `"Netherlands Antilles"', add
label define bpld_head_lbl 26073 `"Bonaire"', add
label define bpld_head_lbl 26074 `"Curacao"', add
label define bpld_head_lbl 26075 `"Dutch St. Maarten"', add
label define bpld_head_lbl 26076 `"Saba"', add
label define bpld_head_lbl 26077 `"St. Eustatius"', add
label define bpld_head_lbl 26079 `"Dutch Caribbean, ns"', add
label define bpld_head_lbl 26080 `"French St. Maarten"', add
label define bpld_head_lbl 26081 `"Guadeloupe"', add
label define bpld_head_lbl 26082 `"Martinique"', add
label define bpld_head_lbl 26083 `"St. Barthelemy"', add
label define bpld_head_lbl 26089 `"French Caribbean, ns"', add
label define bpld_head_lbl 26090 `"Antilles, ns"', add
label define bpld_head_lbl 26091 `"Caribbean, ns"', add
label define bpld_head_lbl 26092 `"Latin America, ns"', add
label define bpld_head_lbl 26093 `"Leeward Islands, ns"', add
label define bpld_head_lbl 26094 `"West Indies, ns"', add
label define bpld_head_lbl 26095 `"Windward Islands, ns"', add
label define bpld_head_lbl 29900 `"Americas, ns"', add
label define bpld_head_lbl 30000 `"South America"', add
label define bpld_head_lbl 30005 `"Argentina"', add
label define bpld_head_lbl 30010 `"Bolivia"', add
label define bpld_head_lbl 30015 `"Brazil"', add
label define bpld_head_lbl 30020 `"Chile"', add
label define bpld_head_lbl 30025 `"Colombia"', add
label define bpld_head_lbl 30030 `"Ecuador"', add
label define bpld_head_lbl 30035 `"French Guiana"', add
label define bpld_head_lbl 30040 `"Guyana/British Guiana"', add
label define bpld_head_lbl 30045 `"Paraguay"', add
label define bpld_head_lbl 30050 `"Peru"', add
label define bpld_head_lbl 30055 `"Suriname"', add
label define bpld_head_lbl 30060 `"Uruguay"', add
label define bpld_head_lbl 30065 `"Venezuela"', add
label define bpld_head_lbl 30090 `"South America, ns"', add
label define bpld_head_lbl 30091 `"South and Central America, n.s."', add
label define bpld_head_lbl 40000 `"Denmark"', add
label define bpld_head_lbl 40010 `"Faeroe Islands"', add
label define bpld_head_lbl 40100 `"Finland"', add
label define bpld_head_lbl 40200 `"Iceland"', add
label define bpld_head_lbl 40300 `"Lapland, ns"', add
label define bpld_head_lbl 40400 `"Norway"', add
label define bpld_head_lbl 40410 `"Svalbard and Jan Meyen"', add
label define bpld_head_lbl 40411 `"Svalbard"', add
label define bpld_head_lbl 40412 `"Jan Meyen"', add
label define bpld_head_lbl 40500 `"Sweden"', add
label define bpld_head_lbl 41000 `"England"', add
label define bpld_head_lbl 41010 `"Channel Islands"', add
label define bpld_head_lbl 41011 `"Guernsey"', add
label define bpld_head_lbl 41012 `"Jersey"', add
label define bpld_head_lbl 41020 `"Isle of Man"', add
label define bpld_head_lbl 41100 `"Scotland"', add
label define bpld_head_lbl 41200 `"Wales"', add
label define bpld_head_lbl 41300 `"United Kingdom, ns"', add
label define bpld_head_lbl 41400 `"Ireland"', add
label define bpld_head_lbl 41410 `"Northern Ireland"', add
label define bpld_head_lbl 41900 `"Northern Europe, ns"', add
label define bpld_head_lbl 42000 `"Belgium"', add
label define bpld_head_lbl 42100 `"France"', add
label define bpld_head_lbl 42110 `"Alsace-Lorraine"', add
label define bpld_head_lbl 42111 `"Alsace"', add
label define bpld_head_lbl 42112 `"Lorraine"', add
label define bpld_head_lbl 42200 `"Liechtenstein"', add
label define bpld_head_lbl 42300 `"Luxembourg"', add
label define bpld_head_lbl 42400 `"Monaco"', add
label define bpld_head_lbl 42500 `"Netherlands"', add
label define bpld_head_lbl 42600 `"Switzerland"', add
label define bpld_head_lbl 42900 `"Western Europe, ns"', add
label define bpld_head_lbl 43000 `"Albania"', add
label define bpld_head_lbl 43100 `"Andorra"', add
label define bpld_head_lbl 43200 `"Gibraltar"', add
label define bpld_head_lbl 43300 `"Greece"', add
label define bpld_head_lbl 43310 `"Dodecanese Islands"', add
label define bpld_head_lbl 43320 `"Turkey Greece"', add
label define bpld_head_lbl 43330 `"Macedonia"', add
label define bpld_head_lbl 43400 `"Italy"', add
label define bpld_head_lbl 43500 `"Malta"', add
label define bpld_head_lbl 43600 `"Portugal"', add
label define bpld_head_lbl 43610 `"Azores"', add
label define bpld_head_lbl 43620 `"Madeira Islands"', add
label define bpld_head_lbl 43630 `"Cape Verde Islands"', add
label define bpld_head_lbl 43640 `"St. Miguel"', add
label define bpld_head_lbl 43700 `"San Marino"', add
label define bpld_head_lbl 43800 `"Spain"', add
label define bpld_head_lbl 43900 `"Vatican City"', add
label define bpld_head_lbl 44000 `"Southern Europe, ns"', add
label define bpld_head_lbl 45000 `"Austria"', add
label define bpld_head_lbl 45010 `"Austria-Hungary"', add
label define bpld_head_lbl 45020 `"Austria-Graz"', add
label define bpld_head_lbl 45030 `"Austria-Linz"', add
label define bpld_head_lbl 45040 `"Austria-Salzburg"', add
label define bpld_head_lbl 45050 `"Austria-Tyrol"', add
label define bpld_head_lbl 45060 `"Austria-Vienna"', add
label define bpld_head_lbl 45070 `"Austria-Kaernsten"', add
label define bpld_head_lbl 45080 `"Austria-Neustadt"', add
label define bpld_head_lbl 45100 `"Bulgaria"', add
label define bpld_head_lbl 45200 `"Czechoslovakia"', add
label define bpld_head_lbl 45210 `"Bohemia"', add
label define bpld_head_lbl 45211 `"Bohemia-Moravia"', add
label define bpld_head_lbl 45212 `"Slovakia"', add
label define bpld_head_lbl 45213 `"Czech Republic"', add
label define bpld_head_lbl 45300 `"Germany"', add
label define bpld_head_lbl 45301 `"Berlin"', add
label define bpld_head_lbl 45302 `"West Berlin"', add
label define bpld_head_lbl 45303 `"East Berlin"', add
label define bpld_head_lbl 45310 `"West Germany"', add
label define bpld_head_lbl 45311 `"Baden"', add
label define bpld_head_lbl 45312 `"Bavaria"', add
label define bpld_head_lbl 45313 `"Braunschweig"', add
label define bpld_head_lbl 45314 `"Bremen"', add
label define bpld_head_lbl 45315 `"Hamburg"', add
label define bpld_head_lbl 45316 `"Hanover"', add
label define bpld_head_lbl 45317 `"Hessen"', add
label define bpld_head_lbl 45318 `"Hesse-Nassau"', add
label define bpld_head_lbl 45319 `"Lippe"', add
label define bpld_head_lbl 45320 `"Lubeck"', add
label define bpld_head_lbl 45321 `"Oldenburg"', add
label define bpld_head_lbl 45322 `"Rheinland"', add
label define bpld_head_lbl 45323 `"Schaumburg-Lippe"', add
label define bpld_head_lbl 45324 `"Schleswig"', add
label define bpld_head_lbl 45325 `"Sigmaringen"', add
label define bpld_head_lbl 45326 `"Schwarzburg"', add
label define bpld_head_lbl 45327 `"Westphalia"', add
label define bpld_head_lbl 45328 `"Wurttemberg"', add
label define bpld_head_lbl 45329 `"Waldeck"', add
label define bpld_head_lbl 45330 `"Wittenberg"', add
label define bpld_head_lbl 45331 `"Frankfurt"', add
label define bpld_head_lbl 45332 `"Saarland"', add
label define bpld_head_lbl 45333 `"Nordrhein-Westfalen"', add
label define bpld_head_lbl 45340 `"East Germany"', add
label define bpld_head_lbl 45341 `"Anhalt"', add
label define bpld_head_lbl 45342 `"Brandenburg"', add
label define bpld_head_lbl 45344 `"Kingdom of Saxony"', add
label define bpld_head_lbl 45345 `"Mecklenburg"', add
label define bpld_head_lbl 45346 `"Saxony"', add
label define bpld_head_lbl 45347 `"Thuringian States"', add
label define bpld_head_lbl 45348 `"Sachsen-Meiningen"', add
label define bpld_head_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define bpld_head_lbl 45350 `"Probable Saxony"', add
label define bpld_head_lbl 45351 `"Schwerin"', add
label define bpld_head_lbl 45352 `"Strelitz"', add
label define bpld_head_lbl 45353 `"Probably Thuringian States"', add
label define bpld_head_lbl 45360 `"Prussia, nec"', add
label define bpld_head_lbl 45361 `"Hohenzollern"', add
label define bpld_head_lbl 45362 `"Niedersachsen"', add
label define bpld_head_lbl 45400 `"Hungary"', add
label define bpld_head_lbl 45500 `"Poland"', add
label define bpld_head_lbl 45510 `"Austrian Poland"', add
label define bpld_head_lbl 45511 `"Galicia"', add
label define bpld_head_lbl 45520 `"German Poland"', add
label define bpld_head_lbl 45521 `"East Prussia"', add
label define bpld_head_lbl 45522 `"Pomerania"', add
label define bpld_head_lbl 45523 `"Posen"', add
label define bpld_head_lbl 45524 `"Prussian Poland"', add
label define bpld_head_lbl 45525 `"Silesia"', add
label define bpld_head_lbl 45526 `"West Prussia"', add
label define bpld_head_lbl 45530 `"Russian Poland"', add
label define bpld_head_lbl 45600 `"Romania"', add
label define bpld_head_lbl 45610 `"Transylvania"', add
label define bpld_head_lbl 45700 `"Yugoslavia"', add
label define bpld_head_lbl 45710 `"Croatia"', add
label define bpld_head_lbl 45720 `"Montenegro"', add
label define bpld_head_lbl 45730 `"Serbia"', add
label define bpld_head_lbl 45740 `"Bosnia"', add
label define bpld_head_lbl 45750 `"Dalmatia"', add
label define bpld_head_lbl 45760 `"Slovonia"', add
label define bpld_head_lbl 45770 `"Carniola"', add
label define bpld_head_lbl 45780 `"Slovenia"', add
label define bpld_head_lbl 45790 `"Kosovo"', add
label define bpld_head_lbl 45800 `"Central Europe, ns"', add
label define bpld_head_lbl 45900 `"Eastern Europe, ns"', add
label define bpld_head_lbl 46000 `"Estonia"', add
label define bpld_head_lbl 46100 `"Latvia"', add
label define bpld_head_lbl 46200 `"Lithuania"', add
label define bpld_head_lbl 46300 `"Baltic States, ns"', add
label define bpld_head_lbl 46500 `"Other USSR/Russia"', add
label define bpld_head_lbl 46510 `"Byelorussia"', add
label define bpld_head_lbl 46520 `"Moldavia"', add
label define bpld_head_lbl 46521 `"Bessarabia"', add
label define bpld_head_lbl 46530 `"Ukraine"', add
label define bpld_head_lbl 46540 `"Armenia"', add
label define bpld_head_lbl 46541 `"Azerbaijan"', add
label define bpld_head_lbl 46542 `"Republic of Georgia"', add
label define bpld_head_lbl 46543 `"Kazakhstan"', add
label define bpld_head_lbl 46544 `"Kirghizia"', add
label define bpld_head_lbl 46545 `"Tadzhik"', add
label define bpld_head_lbl 46546 `"Turkmenistan"', add
label define bpld_head_lbl 46547 `"Uzbekistan"', add
label define bpld_head_lbl 46548 `"Siberia"', add
label define bpld_head_lbl 46590 `"USSR, ns"', add
label define bpld_head_lbl 49900 `"Europe, ns."', add
label define bpld_head_lbl 50000 `"China"', add
label define bpld_head_lbl 50010 `"Hong Kong"', add
label define bpld_head_lbl 50020 `"Macau"', add
label define bpld_head_lbl 50030 `"Mongolia"', add
label define bpld_head_lbl 50040 `"Taiwan"', add
label define bpld_head_lbl 50100 `"Japan"', add
label define bpld_head_lbl 50200 `"Korea"', add
label define bpld_head_lbl 50210 `"North Korea"', add
label define bpld_head_lbl 50220 `"South Korea"', add
label define bpld_head_lbl 50900 `"East Asia, ns"', add
label define bpld_head_lbl 51000 `"Brunei"', add
label define bpld_head_lbl 51100 `"Cambodia (Kampuchea)"', add
label define bpld_head_lbl 51200 `"Indonesia"', add
label define bpld_head_lbl 51210 `"East Indies"', add
label define bpld_head_lbl 51220 `"East Timor"', add
label define bpld_head_lbl 51300 `"Laos"', add
label define bpld_head_lbl 51400 `"Malaysia"', add
label define bpld_head_lbl 51500 `"Philippines"', add
label define bpld_head_lbl 51600 `"Singapore"', add
label define bpld_head_lbl 51700 `"Thailand"', add
label define bpld_head_lbl 51800 `"Vietnam"', add
label define bpld_head_lbl 51900 `"Southeast Asia, ns"', add
label define bpld_head_lbl 51910 `"Indochina, ns"', add
label define bpld_head_lbl 52000 `"Afghanistan"', add
label define bpld_head_lbl 52100 `"India"', add
label define bpld_head_lbl 52110 `"Bangladesh"', add
label define bpld_head_lbl 52120 `"Bhutan"', add
label define bpld_head_lbl 52130 `"Burma (Myanmar)"', add
label define bpld_head_lbl 52140 `"Pakistan"', add
label define bpld_head_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define bpld_head_lbl 52200 `"Iran"', add
label define bpld_head_lbl 52300 `"Maldives"', add
label define bpld_head_lbl 52400 `"Nepal"', add
label define bpld_head_lbl 53000 `"Bahrain"', add
label define bpld_head_lbl 53100 `"Cyprus"', add
label define bpld_head_lbl 53200 `"Iraq"', add
label define bpld_head_lbl 53210 `"Mesopotamia"', add
label define bpld_head_lbl 53300 `"Iraq/Saudi Arabia"', add
label define bpld_head_lbl 53400 `"Israel/Palestine"', add
label define bpld_head_lbl 53410 `"Gaza Strip"', add
label define bpld_head_lbl 53420 `"Palestine"', add
label define bpld_head_lbl 53430 `"West Bank"', add
label define bpld_head_lbl 53440 `"Israel"', add
label define bpld_head_lbl 53500 `"Jordan"', add
label define bpld_head_lbl 53600 `"Kuwait"', add
label define bpld_head_lbl 53700 `"Lebanon"', add
label define bpld_head_lbl 53800 `"Oman"', add
label define bpld_head_lbl 53900 `"Qatar"', add
label define bpld_head_lbl 54000 `"Saudi Arabia"', add
label define bpld_head_lbl 54100 `"Syria"', add
label define bpld_head_lbl 54200 `"Turkey"', add
label define bpld_head_lbl 54210 `"European Turkey"', add
label define bpld_head_lbl 54220 `"Asian Turkey"', add
label define bpld_head_lbl 54300 `"United Arab Emirates"', add
label define bpld_head_lbl 54400 `"Yemen Arab Republic (North)"', add
label define bpld_head_lbl 54500 `"Yemen, PDR (South)"', add
label define bpld_head_lbl 54600 `"Persian Gulf States, ns"', add
label define bpld_head_lbl 54700 `"Middle East, ns"', add
label define bpld_head_lbl 54800 `"Southwest Asia, nec/ns"', add
label define bpld_head_lbl 54900 `"Asia Minor, ns"', add
label define bpld_head_lbl 55000 `"South Asia, nec"', add
label define bpld_head_lbl 59900 `"Asia, nec/ns"', add
label define bpld_head_lbl 60000 `"Africa"', add
label define bpld_head_lbl 60010 `"Northern Africa"', add
label define bpld_head_lbl 60011 `"Algeria"', add
label define bpld_head_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpld_head_lbl 60013 `"Libya"', add
label define bpld_head_lbl 60014 `"Morocco"', add
label define bpld_head_lbl 60015 `"Sudan"', add
label define bpld_head_lbl 60016 `"Tunisia"', add
label define bpld_head_lbl 60017 `"Western Sahara"', add
label define bpld_head_lbl 60019 `"North Africa, ns"', add
label define bpld_head_lbl 60020 `"Benin"', add
label define bpld_head_lbl 60021 `"Burkina Faso"', add
label define bpld_head_lbl 60022 `"Gambia"', add
label define bpld_head_lbl 60023 `"Ghana"', add
label define bpld_head_lbl 60024 `"Guinea"', add
label define bpld_head_lbl 60025 `"Guinea-Bissau"', add
label define bpld_head_lbl 60026 `"Ivory Coast"', add
label define bpld_head_lbl 60027 `"Liberia"', add
label define bpld_head_lbl 60028 `"Mali"', add
label define bpld_head_lbl 60029 `"Mauritania"', add
label define bpld_head_lbl 60030 `"Niger"', add
label define bpld_head_lbl 60031 `"Nigeria"', add
label define bpld_head_lbl 60032 `"Senegal"', add
label define bpld_head_lbl 60033 `"Sierra Leone"', add
label define bpld_head_lbl 60034 `"Togo"', add
label define bpld_head_lbl 60038 `"Western Africa, ns"', add
label define bpld_head_lbl 60039 `"French West Africa, ns"', add
label define bpld_head_lbl 60040 `"British Indian Ocean Territory"', add
label define bpld_head_lbl 60041 `"Burundi"', add
label define bpld_head_lbl 60042 `"Comoros"', add
label define bpld_head_lbl 60043 `"Djibouti"', add
label define bpld_head_lbl 60044 `"Ethiopia"', add
label define bpld_head_lbl 60045 `"Kenya"', add
label define bpld_head_lbl 60046 `"Madagascar"', add
label define bpld_head_lbl 60047 `"Malawi"', add
label define bpld_head_lbl 60048 `"Mauritius"', add
label define bpld_head_lbl 60049 `"Mozambique"', add
label define bpld_head_lbl 60050 `"Reunion"', add
label define bpld_head_lbl 60051 `"Rwanda"', add
label define bpld_head_lbl 60052 `"Seychelles"', add
label define bpld_head_lbl 60053 `"Somalia"', add
label define bpld_head_lbl 60054 `"Tanzania"', add
label define bpld_head_lbl 60055 `"Uganda"', add
label define bpld_head_lbl 60056 `"Zambia"', add
label define bpld_head_lbl 60057 `"Zimbabwe"', add
label define bpld_head_lbl 60058 `"Bassas de India"', add
label define bpld_head_lbl 60059 `"Europa"', add
label define bpld_head_lbl 60060 `"Gloriosos"', add
label define bpld_head_lbl 60061 `"Juan de Nova"', add
label define bpld_head_lbl 60062 `"Mayotte"', add
label define bpld_head_lbl 60063 `"Tromelin"', add
label define bpld_head_lbl 60064 `"Eastern Africa, nec/ns"', add
label define bpld_head_lbl 60065 `"Eritrea"', add
label define bpld_head_lbl 60066 `"South Sudan"', add
label define bpld_head_lbl 60070 `"Central Africa"', add
label define bpld_head_lbl 60071 `"Angola"', add
label define bpld_head_lbl 60072 `"Cameroon"', add
label define bpld_head_lbl 60073 `"Central African Republic"', add
label define bpld_head_lbl 60074 `"Chad"', add
label define bpld_head_lbl 60075 `"Congo"', add
label define bpld_head_lbl 60076 `"Equatorial Guinea"', add
label define bpld_head_lbl 60077 `"Gabon"', add
label define bpld_head_lbl 60078 `"Sao Tome and Principe"', add
label define bpld_head_lbl 60079 `"Zaire"', add
label define bpld_head_lbl 60080 `"Central Africa, ns"', add
label define bpld_head_lbl 60081 `"Equatorial Africa, ns"', add
label define bpld_head_lbl 60082 `"French Equatorial Africa, ns"', add
label define bpld_head_lbl 60090 `"Southern Africa"', add
label define bpld_head_lbl 60091 `"Botswana"', add
label define bpld_head_lbl 60092 `"Lesotho"', add
label define bpld_head_lbl 60093 `"Namibia"', add
label define bpld_head_lbl 60094 `"South Africa (Union of)"', add
label define bpld_head_lbl 60095 `"Swaziland"', add
label define bpld_head_lbl 60096 `"Southern Africa, ns"', add
label define bpld_head_lbl 60099 `"Africa, ns/nec"', add
label define bpld_head_lbl 70000 `"Australia and New Zealand"', add
label define bpld_head_lbl 70010 `"Australia"', add
label define bpld_head_lbl 70011 `"Ashmore and Cartier Islands"', add
label define bpld_head_lbl 70012 `"Coral Sea Islands Territory"', add
label define bpld_head_lbl 70013 `"Christmas Island"', add
label define bpld_head_lbl 70014 `"Cocos Islands"', add
label define bpld_head_lbl 70020 `"New Zealand"', add
label define bpld_head_lbl 71000 `"Pacific Islands"', add
label define bpld_head_lbl 71010 `"New Caledonia"', add
label define bpld_head_lbl 71012 `"Papua New Guinea"', add
label define bpld_head_lbl 71013 `"Solomon Islands"', add
label define bpld_head_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define bpld_head_lbl 71015 `"Fiji"', add
label define bpld_head_lbl 71016 `"Melanesia, ns"', add
label define bpld_head_lbl 71017 `"Norfolk Islands"', add
label define bpld_head_lbl 71018 `"Niue"', add
label define bpld_head_lbl 71020 `"Cook Islands"', add
label define bpld_head_lbl 71022 `"French Polynesia"', add
label define bpld_head_lbl 71023 `"Tonga"', add
label define bpld_head_lbl 71024 `"Wallis and Futuna Islands"', add
label define bpld_head_lbl 71025 `"Western Samoa"', add
label define bpld_head_lbl 71026 `"Pitcairn Island"', add
label define bpld_head_lbl 71027 `"Tokelau"', add
label define bpld_head_lbl 71028 `"Tuvalu"', add
label define bpld_head_lbl 71029 `"Polynesia, ns"', add
label define bpld_head_lbl 71032 `"Kiribati"', add
label define bpld_head_lbl 71033 `"Canton and Enderbury"', add
label define bpld_head_lbl 71034 `"Nauru"', add
label define bpld_head_lbl 71039 `"Micronesia, ns"', add
label define bpld_head_lbl 71040 `"US Pacific Trust Territories"', add
label define bpld_head_lbl 71041 `"Marshall Islands"', add
label define bpld_head_lbl 71042 `"Micronesia"', add
label define bpld_head_lbl 71043 `"Kosrae"', add
label define bpld_head_lbl 71044 `"Pohnpei"', add
label define bpld_head_lbl 71045 `"Truk"', add
label define bpld_head_lbl 71046 `"Yap"', add
label define bpld_head_lbl 71047 `"Northern Mariana Islands"', add
label define bpld_head_lbl 71048 `"Palau"', add
label define bpld_head_lbl 71049 `"Pacific Trust Terr, ns"', add
label define bpld_head_lbl 71050 `"Clipperton Island"', add
label define bpld_head_lbl 71090 `"Oceania, ns/nec"', add
label define bpld_head_lbl 80000 `"Antarctica, ns/nec"', add
label define bpld_head_lbl 80010 `"Bouvet Islands"', add
label define bpld_head_lbl 80020 `"British Antarctic Terr."', add
label define bpld_head_lbl 80030 `"Dronning Maud Land"', add
label define bpld_head_lbl 80040 `"French Southern and Antarctic Lands"', add
label define bpld_head_lbl 80050 `"Heard and McDonald Islands"', add
label define bpld_head_lbl 90000 `"Abroad (unknown) or at sea"', add
label define bpld_head_lbl 90010 `"Abroad, ns"', add
label define bpld_head_lbl 90011 `"Abroad (US citizen)"', add
label define bpld_head_lbl 90020 `"At sea"', add
label define bpld_head_lbl 90021 `"At sea (US citizen)"', add
label define bpld_head_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define bpld_head_lbl 95000 `"Other n.e.c."', add
label define bpld_head_lbl 99900 `"Missing/blank"', add
label values bpld_head bpld_head_lbl

label define bpld_sp_lbl 00100 `"Alabama"'
label define bpld_sp_lbl 00200 `"Alaska"', add
label define bpld_sp_lbl 00400 `"Arizona"', add
label define bpld_sp_lbl 00500 `"Arkansas"', add
label define bpld_sp_lbl 00600 `"California"', add
label define bpld_sp_lbl 00800 `"Colorado"', add
label define bpld_sp_lbl 00900 `"Connecticut"', add
label define bpld_sp_lbl 01000 `"Delaware"', add
label define bpld_sp_lbl 01100 `"District of Columbia"', add
label define bpld_sp_lbl 01200 `"Florida"', add
label define bpld_sp_lbl 01300 `"Georgia"', add
label define bpld_sp_lbl 01500 `"Hawaii"', add
label define bpld_sp_lbl 01600 `"Idaho"', add
label define bpld_sp_lbl 01610 `"Idaho Territory"', add
label define bpld_sp_lbl 01700 `"Illinois"', add
label define bpld_sp_lbl 01800 `"Indiana"', add
label define bpld_sp_lbl 01900 `"Iowa"', add
label define bpld_sp_lbl 02000 `"Kansas"', add
label define bpld_sp_lbl 02100 `"Kentucky"', add
label define bpld_sp_lbl 02200 `"Louisiana"', add
label define bpld_sp_lbl 02300 `"Maine"', add
label define bpld_sp_lbl 02400 `"Maryland"', add
label define bpld_sp_lbl 02500 `"Massachusetts"', add
label define bpld_sp_lbl 02600 `"Michigan"', add
label define bpld_sp_lbl 02700 `"Minnesota"', add
label define bpld_sp_lbl 02800 `"Mississippi"', add
label define bpld_sp_lbl 02900 `"Missouri"', add
label define bpld_sp_lbl 03000 `"Montana"', add
label define bpld_sp_lbl 03100 `"Nebraska"', add
label define bpld_sp_lbl 03200 `"Nevada"', add
label define bpld_sp_lbl 03300 `"New Hampshire"', add
label define bpld_sp_lbl 03400 `"New Jersey"', add
label define bpld_sp_lbl 03500 `"New Mexico"', add
label define bpld_sp_lbl 03510 `"New Mexico Territory"', add
label define bpld_sp_lbl 03600 `"New York"', add
label define bpld_sp_lbl 03700 `"North Carolina"', add
label define bpld_sp_lbl 03800 `"North Dakota"', add
label define bpld_sp_lbl 03900 `"Ohio"', add
label define bpld_sp_lbl 04000 `"Oklahoma"', add
label define bpld_sp_lbl 04010 `"Indian Territory"', add
label define bpld_sp_lbl 04100 `"Oregon"', add
label define bpld_sp_lbl 04200 `"Pennsylvania"', add
label define bpld_sp_lbl 04400 `"Rhode Island"', add
label define bpld_sp_lbl 04500 `"South Carolina"', add
label define bpld_sp_lbl 04600 `"South Dakota"', add
label define bpld_sp_lbl 04610 `"Dakota Territory"', add
label define bpld_sp_lbl 04700 `"Tennessee"', add
label define bpld_sp_lbl 04800 `"Texas"', add
label define bpld_sp_lbl 04900 `"Utah"', add
label define bpld_sp_lbl 04910 `"Utah Territory"', add
label define bpld_sp_lbl 05000 `"Vermont"', add
label define bpld_sp_lbl 05100 `"Virginia"', add
label define bpld_sp_lbl 05300 `"Washington"', add
label define bpld_sp_lbl 05400 `"West Virginia"', add
label define bpld_sp_lbl 05500 `"Wisconsin"', add
label define bpld_sp_lbl 05600 `"Wyoming"', add
label define bpld_sp_lbl 05610 `"Wyoming Territory"', add
label define bpld_sp_lbl 09000 `"Native American"', add
label define bpld_sp_lbl 09900 `"United States, ns"', add
label define bpld_sp_lbl 10000 `"American Samoa"', add
label define bpld_sp_lbl 10010 `"Samoa, 1940-1950"', add
label define bpld_sp_lbl 10500 `"Guam"', add
label define bpld_sp_lbl 11000 `"Puerto Rico"', add
label define bpld_sp_lbl 11500 `"U.S. Virgin Islands"', add
label define bpld_sp_lbl 11510 `"St. Croix"', add
label define bpld_sp_lbl 11520 `"St. John"', add
label define bpld_sp_lbl 11530 `"St. Thomas"', add
label define bpld_sp_lbl 12000 `"Other US Possessions:"', add
label define bpld_sp_lbl 12010 `"Johnston Atoll"', add
label define bpld_sp_lbl 12020 `"Midway Islands"', add
label define bpld_sp_lbl 12030 `"Wake Island"', add
label define bpld_sp_lbl 12040 `"Other US Caribbean Islands"', add
label define bpld_sp_lbl 12041 `"Navassa Island"', add
label define bpld_sp_lbl 12050 `"Other US Pacific Islands"', add
label define bpld_sp_lbl 12051 `"Baker Island"', add
label define bpld_sp_lbl 12052 `"Howland Island"', add
label define bpld_sp_lbl 12053 `"Jarvis Island"', add
label define bpld_sp_lbl 12054 `"Kingman Reef"', add
label define bpld_sp_lbl 12055 `"Palmyra Atoll"', add
label define bpld_sp_lbl 12056 `"Canton and Enderbury Island"', add
label define bpld_sp_lbl 12090 `"US outlying areas, ns"', add
label define bpld_sp_lbl 12091 `"US possessions, ns"', add
label define bpld_sp_lbl 12092 `"US territory, ns"', add
label define bpld_sp_lbl 15000 `"Canada"', add
label define bpld_sp_lbl 15010 `"English Canada"', add
label define bpld_sp_lbl 15011 `"British Columbia"', add
label define bpld_sp_lbl 15013 `"Alberta"', add
label define bpld_sp_lbl 15015 `"Saskatchewan"', add
label define bpld_sp_lbl 15017 `"Northwest"', add
label define bpld_sp_lbl 15019 `"Ruperts Land"', add
label define bpld_sp_lbl 15020 `"Manitoba"', add
label define bpld_sp_lbl 15021 `"Red River"', add
label define bpld_sp_lbl 15030 `"Ontario/Upper Canada"', add
label define bpld_sp_lbl 15031 `"Upper Canada"', add
label define bpld_sp_lbl 15032 `"Canada West"', add
label define bpld_sp_lbl 15040 `"New Brunswick"', add
label define bpld_sp_lbl 15050 `"Nova Scotia"', add
label define bpld_sp_lbl 15051 `"Cape Breton"', add
label define bpld_sp_lbl 15052 `"Halifax"', add
label define bpld_sp_lbl 15060 `"Prince Edward Island"', add
label define bpld_sp_lbl 15070 `"Newfoundland"', add
label define bpld_sp_lbl 15080 `"French Canada"', add
label define bpld_sp_lbl 15081 `"Quebec"', add
label define bpld_sp_lbl 15082 `"Lower Canada"', add
label define bpld_sp_lbl 15083 `"Canada East"', add
label define bpld_sp_lbl 15500 `"St. Pierre and Miquelon"', add
label define bpld_sp_lbl 16000 `"Atlantic Islands"', add
label define bpld_sp_lbl 16010 `"Bermuda"', add
label define bpld_sp_lbl 16020 `"Cape Verde"', add
label define bpld_sp_lbl 16030 `"Falkland Islands"', add
label define bpld_sp_lbl 16040 `"Greenland"', add
label define bpld_sp_lbl 16050 `"St. Helena and Ascension"', add
label define bpld_sp_lbl 16060 `"Canary Islands"', add
label define bpld_sp_lbl 19900 `"North America, ns"', add
label define bpld_sp_lbl 20000 `"Mexico"', add
label define bpld_sp_lbl 21000 `"Central America"', add
label define bpld_sp_lbl 21010 `"Belize/British Honduras"', add
label define bpld_sp_lbl 21020 `"Costa Rica"', add
label define bpld_sp_lbl 21030 `"El Salvador"', add
label define bpld_sp_lbl 21040 `"Guatemala"', add
label define bpld_sp_lbl 21050 `"Honduras"', add
label define bpld_sp_lbl 21060 `"Nicaragua"', add
label define bpld_sp_lbl 21070 `"Panama"', add
label define bpld_sp_lbl 21071 `"Canal Zone"', add
label define bpld_sp_lbl 21090 `"Central America, ns"', add
label define bpld_sp_lbl 25000 `"Cuba"', add
label define bpld_sp_lbl 26000 `"West Indies"', add
label define bpld_sp_lbl 26010 `"Dominican Republic"', add
label define bpld_sp_lbl 26020 `"Haiti"', add
label define bpld_sp_lbl 26030 `"Jamaica"', add
label define bpld_sp_lbl 26040 `"British West Indies"', add
label define bpld_sp_lbl 26041 `"Anguilla"', add
label define bpld_sp_lbl 26042 `"Antigua-Barbuda"', add
label define bpld_sp_lbl 26043 `"Bahamas"', add
label define bpld_sp_lbl 26044 `"Barbados"', add
label define bpld_sp_lbl 26045 `"British Virgin Islands"', add
label define bpld_sp_lbl 26046 `"Anegada"', add
label define bpld_sp_lbl 26047 `"Cooper"', add
label define bpld_sp_lbl 26048 `"Jost Van Dyke"', add
label define bpld_sp_lbl 26049 `"Peter"', add
label define bpld_sp_lbl 26050 `"Tortola"', add
label define bpld_sp_lbl 26051 `"Virgin Gorda"', add
label define bpld_sp_lbl 26052 `"Br. Virgin Islands, ns"', add
label define bpld_sp_lbl 26053 `"Cayman Islands"', add
label define bpld_sp_lbl 26054 `"Dominica"', add
label define bpld_sp_lbl 26055 `"Grenada"', add
label define bpld_sp_lbl 26056 `"Montserrat"', add
label define bpld_sp_lbl 26057 `"St. Kitts-Nevis"', add
label define bpld_sp_lbl 26058 `"St. Lucia"', add
label define bpld_sp_lbl 26059 `"St. Vincent"', add
label define bpld_sp_lbl 26060 `"Trinidad and Tobago"', add
label define bpld_sp_lbl 26061 `"Turks and Caicos"', add
label define bpld_sp_lbl 26069 `"Br. Virgin Islands, ns"', add
label define bpld_sp_lbl 26070 `"Other West Indies"', add
label define bpld_sp_lbl 26071 `"Aruba"', add
label define bpld_sp_lbl 26072 `"Netherlands Antilles"', add
label define bpld_sp_lbl 26073 `"Bonaire"', add
label define bpld_sp_lbl 26074 `"Curacao"', add
label define bpld_sp_lbl 26075 `"Dutch St. Maarten"', add
label define bpld_sp_lbl 26076 `"Saba"', add
label define bpld_sp_lbl 26077 `"St. Eustatius"', add
label define bpld_sp_lbl 26079 `"Dutch Caribbean, ns"', add
label define bpld_sp_lbl 26080 `"French St. Maarten"', add
label define bpld_sp_lbl 26081 `"Guadeloupe"', add
label define bpld_sp_lbl 26082 `"Martinique"', add
label define bpld_sp_lbl 26083 `"St. Barthelemy"', add
label define bpld_sp_lbl 26089 `"French Caribbean, ns"', add
label define bpld_sp_lbl 26090 `"Antilles, ns"', add
label define bpld_sp_lbl 26091 `"Caribbean, ns"', add
label define bpld_sp_lbl 26092 `"Latin America, ns"', add
label define bpld_sp_lbl 26093 `"Leeward Islands, ns"', add
label define bpld_sp_lbl 26094 `"West Indies, ns"', add
label define bpld_sp_lbl 26095 `"Windward Islands, ns"', add
label define bpld_sp_lbl 29900 `"Americas, ns"', add
label define bpld_sp_lbl 30000 `"South America"', add
label define bpld_sp_lbl 30005 `"Argentina"', add
label define bpld_sp_lbl 30010 `"Bolivia"', add
label define bpld_sp_lbl 30015 `"Brazil"', add
label define bpld_sp_lbl 30020 `"Chile"', add
label define bpld_sp_lbl 30025 `"Colombia"', add
label define bpld_sp_lbl 30030 `"Ecuador"', add
label define bpld_sp_lbl 30035 `"French Guiana"', add
label define bpld_sp_lbl 30040 `"Guyana/British Guiana"', add
label define bpld_sp_lbl 30045 `"Paraguay"', add
label define bpld_sp_lbl 30050 `"Peru"', add
label define bpld_sp_lbl 30055 `"Suriname"', add
label define bpld_sp_lbl 30060 `"Uruguay"', add
label define bpld_sp_lbl 30065 `"Venezuela"', add
label define bpld_sp_lbl 30090 `"South America, ns"', add
label define bpld_sp_lbl 30091 `"South and Central America, n.s."', add
label define bpld_sp_lbl 40000 `"Denmark"', add
label define bpld_sp_lbl 40010 `"Faeroe Islands"', add
label define bpld_sp_lbl 40100 `"Finland"', add
label define bpld_sp_lbl 40200 `"Iceland"', add
label define bpld_sp_lbl 40300 `"Lapland, ns"', add
label define bpld_sp_lbl 40400 `"Norway"', add
label define bpld_sp_lbl 40410 `"Svalbard and Jan Meyen"', add
label define bpld_sp_lbl 40411 `"Svalbard"', add
label define bpld_sp_lbl 40412 `"Jan Meyen"', add
label define bpld_sp_lbl 40500 `"Sweden"', add
label define bpld_sp_lbl 41000 `"England"', add
label define bpld_sp_lbl 41010 `"Channel Islands"', add
label define bpld_sp_lbl 41011 `"Guernsey"', add
label define bpld_sp_lbl 41012 `"Jersey"', add
label define bpld_sp_lbl 41020 `"Isle of Man"', add
label define bpld_sp_lbl 41100 `"Scotland"', add
label define bpld_sp_lbl 41200 `"Wales"', add
label define bpld_sp_lbl 41300 `"United Kingdom, ns"', add
label define bpld_sp_lbl 41400 `"Ireland"', add
label define bpld_sp_lbl 41410 `"Northern Ireland"', add
label define bpld_sp_lbl 41900 `"Northern Europe, ns"', add
label define bpld_sp_lbl 42000 `"Belgium"', add
label define bpld_sp_lbl 42100 `"France"', add
label define bpld_sp_lbl 42110 `"Alsace-Lorraine"', add
label define bpld_sp_lbl 42111 `"Alsace"', add
label define bpld_sp_lbl 42112 `"Lorraine"', add
label define bpld_sp_lbl 42200 `"Liechtenstein"', add
label define bpld_sp_lbl 42300 `"Luxembourg"', add
label define bpld_sp_lbl 42400 `"Monaco"', add
label define bpld_sp_lbl 42500 `"Netherlands"', add
label define bpld_sp_lbl 42600 `"Switzerland"', add
label define bpld_sp_lbl 42900 `"Western Europe, ns"', add
label define bpld_sp_lbl 43000 `"Albania"', add
label define bpld_sp_lbl 43100 `"Andorra"', add
label define bpld_sp_lbl 43200 `"Gibraltar"', add
label define bpld_sp_lbl 43300 `"Greece"', add
label define bpld_sp_lbl 43310 `"Dodecanese Islands"', add
label define bpld_sp_lbl 43320 `"Turkey Greece"', add
label define bpld_sp_lbl 43330 `"Macedonia"', add
label define bpld_sp_lbl 43400 `"Italy"', add
label define bpld_sp_lbl 43500 `"Malta"', add
label define bpld_sp_lbl 43600 `"Portugal"', add
label define bpld_sp_lbl 43610 `"Azores"', add
label define bpld_sp_lbl 43620 `"Madeira Islands"', add
label define bpld_sp_lbl 43630 `"Cape Verde Islands"', add
label define bpld_sp_lbl 43640 `"St. Miguel"', add
label define bpld_sp_lbl 43700 `"San Marino"', add
label define bpld_sp_lbl 43800 `"Spain"', add
label define bpld_sp_lbl 43900 `"Vatican City"', add
label define bpld_sp_lbl 44000 `"Southern Europe, ns"', add
label define bpld_sp_lbl 45000 `"Austria"', add
label define bpld_sp_lbl 45010 `"Austria-Hungary"', add
label define bpld_sp_lbl 45020 `"Austria-Graz"', add
label define bpld_sp_lbl 45030 `"Austria-Linz"', add
label define bpld_sp_lbl 45040 `"Austria-Salzburg"', add
label define bpld_sp_lbl 45050 `"Austria-Tyrol"', add
label define bpld_sp_lbl 45060 `"Austria-Vienna"', add
label define bpld_sp_lbl 45070 `"Austria-Kaernsten"', add
label define bpld_sp_lbl 45080 `"Austria-Neustadt"', add
label define bpld_sp_lbl 45100 `"Bulgaria"', add
label define bpld_sp_lbl 45200 `"Czechoslovakia"', add
label define bpld_sp_lbl 45210 `"Bohemia"', add
label define bpld_sp_lbl 45211 `"Bohemia-Moravia"', add
label define bpld_sp_lbl 45212 `"Slovakia"', add
label define bpld_sp_lbl 45213 `"Czech Republic"', add
label define bpld_sp_lbl 45300 `"Germany"', add
label define bpld_sp_lbl 45301 `"Berlin"', add
label define bpld_sp_lbl 45302 `"West Berlin"', add
label define bpld_sp_lbl 45303 `"East Berlin"', add
label define bpld_sp_lbl 45310 `"West Germany"', add
label define bpld_sp_lbl 45311 `"Baden"', add
label define bpld_sp_lbl 45312 `"Bavaria"', add
label define bpld_sp_lbl 45313 `"Braunschweig"', add
label define bpld_sp_lbl 45314 `"Bremen"', add
label define bpld_sp_lbl 45315 `"Hamburg"', add
label define bpld_sp_lbl 45316 `"Hanover"', add
label define bpld_sp_lbl 45317 `"Hessen"', add
label define bpld_sp_lbl 45318 `"Hesse-Nassau"', add
label define bpld_sp_lbl 45319 `"Lippe"', add
label define bpld_sp_lbl 45320 `"Lubeck"', add
label define bpld_sp_lbl 45321 `"Oldenburg"', add
label define bpld_sp_lbl 45322 `"Rheinland"', add
label define bpld_sp_lbl 45323 `"Schaumburg-Lippe"', add
label define bpld_sp_lbl 45324 `"Schleswig"', add
label define bpld_sp_lbl 45325 `"Sigmaringen"', add
label define bpld_sp_lbl 45326 `"Schwarzburg"', add
label define bpld_sp_lbl 45327 `"Westphalia"', add
label define bpld_sp_lbl 45328 `"Wurttemberg"', add
label define bpld_sp_lbl 45329 `"Waldeck"', add
label define bpld_sp_lbl 45330 `"Wittenberg"', add
label define bpld_sp_lbl 45331 `"Frankfurt"', add
label define bpld_sp_lbl 45332 `"Saarland"', add
label define bpld_sp_lbl 45333 `"Nordrhein-Westfalen"', add
label define bpld_sp_lbl 45340 `"East Germany"', add
label define bpld_sp_lbl 45341 `"Anhalt"', add
label define bpld_sp_lbl 45342 `"Brandenburg"', add
label define bpld_sp_lbl 45344 `"Kingdom of Saxony"', add
label define bpld_sp_lbl 45345 `"Mecklenburg"', add
label define bpld_sp_lbl 45346 `"Saxony"', add
label define bpld_sp_lbl 45347 `"Thuringian States"', add
label define bpld_sp_lbl 45348 `"Sachsen-Meiningen"', add
label define bpld_sp_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define bpld_sp_lbl 45350 `"Probable Saxony"', add
label define bpld_sp_lbl 45351 `"Schwerin"', add
label define bpld_sp_lbl 45352 `"Strelitz"', add
label define bpld_sp_lbl 45353 `"Probably Thuringian States"', add
label define bpld_sp_lbl 45360 `"Prussia, nec"', add
label define bpld_sp_lbl 45361 `"Hohenzollern"', add
label define bpld_sp_lbl 45362 `"Niedersachsen"', add
label define bpld_sp_lbl 45400 `"Hungary"', add
label define bpld_sp_lbl 45500 `"Poland"', add
label define bpld_sp_lbl 45510 `"Austrian Poland"', add
label define bpld_sp_lbl 45511 `"Galicia"', add
label define bpld_sp_lbl 45520 `"German Poland"', add
label define bpld_sp_lbl 45521 `"East Prussia"', add
label define bpld_sp_lbl 45522 `"Pomerania"', add
label define bpld_sp_lbl 45523 `"Posen"', add
label define bpld_sp_lbl 45524 `"Prussian Poland"', add
label define bpld_sp_lbl 45525 `"Silesia"', add
label define bpld_sp_lbl 45526 `"West Prussia"', add
label define bpld_sp_lbl 45530 `"Russian Poland"', add
label define bpld_sp_lbl 45600 `"Romania"', add
label define bpld_sp_lbl 45610 `"Transylvania"', add
label define bpld_sp_lbl 45700 `"Yugoslavia"', add
label define bpld_sp_lbl 45710 `"Croatia"', add
label define bpld_sp_lbl 45720 `"Montenegro"', add
label define bpld_sp_lbl 45730 `"Serbia"', add
label define bpld_sp_lbl 45740 `"Bosnia"', add
label define bpld_sp_lbl 45750 `"Dalmatia"', add
label define bpld_sp_lbl 45760 `"Slovonia"', add
label define bpld_sp_lbl 45770 `"Carniola"', add
label define bpld_sp_lbl 45780 `"Slovenia"', add
label define bpld_sp_lbl 45790 `"Kosovo"', add
label define bpld_sp_lbl 45800 `"Central Europe, ns"', add
label define bpld_sp_lbl 45900 `"Eastern Europe, ns"', add
label define bpld_sp_lbl 46000 `"Estonia"', add
label define bpld_sp_lbl 46100 `"Latvia"', add
label define bpld_sp_lbl 46200 `"Lithuania"', add
label define bpld_sp_lbl 46300 `"Baltic States, ns"', add
label define bpld_sp_lbl 46500 `"Other USSR/Russia"', add
label define bpld_sp_lbl 46510 `"Byelorussia"', add
label define bpld_sp_lbl 46520 `"Moldavia"', add
label define bpld_sp_lbl 46521 `"Bessarabia"', add
label define bpld_sp_lbl 46530 `"Ukraine"', add
label define bpld_sp_lbl 46540 `"Armenia"', add
label define bpld_sp_lbl 46541 `"Azerbaijan"', add
label define bpld_sp_lbl 46542 `"Republic of Georgia"', add
label define bpld_sp_lbl 46543 `"Kazakhstan"', add
label define bpld_sp_lbl 46544 `"Kirghizia"', add
label define bpld_sp_lbl 46545 `"Tadzhik"', add
label define bpld_sp_lbl 46546 `"Turkmenistan"', add
label define bpld_sp_lbl 46547 `"Uzbekistan"', add
label define bpld_sp_lbl 46548 `"Siberia"', add
label define bpld_sp_lbl 46590 `"USSR, ns"', add
label define bpld_sp_lbl 49900 `"Europe, ns."', add
label define bpld_sp_lbl 50000 `"China"', add
label define bpld_sp_lbl 50010 `"Hong Kong"', add
label define bpld_sp_lbl 50020 `"Macau"', add
label define bpld_sp_lbl 50030 `"Mongolia"', add
label define bpld_sp_lbl 50040 `"Taiwan"', add
label define bpld_sp_lbl 50100 `"Japan"', add
label define bpld_sp_lbl 50200 `"Korea"', add
label define bpld_sp_lbl 50210 `"North Korea"', add
label define bpld_sp_lbl 50220 `"South Korea"', add
label define bpld_sp_lbl 50900 `"East Asia, ns"', add
label define bpld_sp_lbl 51000 `"Brunei"', add
label define bpld_sp_lbl 51100 `"Cambodia (Kampuchea)"', add
label define bpld_sp_lbl 51200 `"Indonesia"', add
label define bpld_sp_lbl 51210 `"East Indies"', add
label define bpld_sp_lbl 51220 `"East Timor"', add
label define bpld_sp_lbl 51300 `"Laos"', add
label define bpld_sp_lbl 51400 `"Malaysia"', add
label define bpld_sp_lbl 51500 `"Philippines"', add
label define bpld_sp_lbl 51600 `"Singapore"', add
label define bpld_sp_lbl 51700 `"Thailand"', add
label define bpld_sp_lbl 51800 `"Vietnam"', add
label define bpld_sp_lbl 51900 `"Southeast Asia, ns"', add
label define bpld_sp_lbl 51910 `"Indochina, ns"', add
label define bpld_sp_lbl 52000 `"Afghanistan"', add
label define bpld_sp_lbl 52100 `"India"', add
label define bpld_sp_lbl 52110 `"Bangladesh"', add
label define bpld_sp_lbl 52120 `"Bhutan"', add
label define bpld_sp_lbl 52130 `"Burma (Myanmar)"', add
label define bpld_sp_lbl 52140 `"Pakistan"', add
label define bpld_sp_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define bpld_sp_lbl 52200 `"Iran"', add
label define bpld_sp_lbl 52300 `"Maldives"', add
label define bpld_sp_lbl 52400 `"Nepal"', add
label define bpld_sp_lbl 53000 `"Bahrain"', add
label define bpld_sp_lbl 53100 `"Cyprus"', add
label define bpld_sp_lbl 53200 `"Iraq"', add
label define bpld_sp_lbl 53210 `"Mesopotamia"', add
label define bpld_sp_lbl 53300 `"Iraq/Saudi Arabia"', add
label define bpld_sp_lbl 53400 `"Israel/Palestine"', add
label define bpld_sp_lbl 53410 `"Gaza Strip"', add
label define bpld_sp_lbl 53420 `"Palestine"', add
label define bpld_sp_lbl 53430 `"West Bank"', add
label define bpld_sp_lbl 53440 `"Israel"', add
label define bpld_sp_lbl 53500 `"Jordan"', add
label define bpld_sp_lbl 53600 `"Kuwait"', add
label define bpld_sp_lbl 53700 `"Lebanon"', add
label define bpld_sp_lbl 53800 `"Oman"', add
label define bpld_sp_lbl 53900 `"Qatar"', add
label define bpld_sp_lbl 54000 `"Saudi Arabia"', add
label define bpld_sp_lbl 54100 `"Syria"', add
label define bpld_sp_lbl 54200 `"Turkey"', add
label define bpld_sp_lbl 54210 `"European Turkey"', add
label define bpld_sp_lbl 54220 `"Asian Turkey"', add
label define bpld_sp_lbl 54300 `"United Arab Emirates"', add
label define bpld_sp_lbl 54400 `"Yemen Arab Republic (North)"', add
label define bpld_sp_lbl 54500 `"Yemen, PDR (South)"', add
label define bpld_sp_lbl 54600 `"Persian Gulf States, ns"', add
label define bpld_sp_lbl 54700 `"Middle East, ns"', add
label define bpld_sp_lbl 54800 `"Southwest Asia, nec/ns"', add
label define bpld_sp_lbl 54900 `"Asia Minor, ns"', add
label define bpld_sp_lbl 55000 `"South Asia, nec"', add
label define bpld_sp_lbl 59900 `"Asia, nec/ns"', add
label define bpld_sp_lbl 60000 `"Africa"', add
label define bpld_sp_lbl 60010 `"Northern Africa"', add
label define bpld_sp_lbl 60011 `"Algeria"', add
label define bpld_sp_lbl 60012 `"Egypt/United Arab Rep."', add
label define bpld_sp_lbl 60013 `"Libya"', add
label define bpld_sp_lbl 60014 `"Morocco"', add
label define bpld_sp_lbl 60015 `"Sudan"', add
label define bpld_sp_lbl 60016 `"Tunisia"', add
label define bpld_sp_lbl 60017 `"Western Sahara"', add
label define bpld_sp_lbl 60019 `"North Africa, ns"', add
label define bpld_sp_lbl 60020 `"Benin"', add
label define bpld_sp_lbl 60021 `"Burkina Faso"', add
label define bpld_sp_lbl 60022 `"Gambia"', add
label define bpld_sp_lbl 60023 `"Ghana"', add
label define bpld_sp_lbl 60024 `"Guinea"', add
label define bpld_sp_lbl 60025 `"Guinea-Bissau"', add
label define bpld_sp_lbl 60026 `"Ivory Coast"', add
label define bpld_sp_lbl 60027 `"Liberia"', add
label define bpld_sp_lbl 60028 `"Mali"', add
label define bpld_sp_lbl 60029 `"Mauritania"', add
label define bpld_sp_lbl 60030 `"Niger"', add
label define bpld_sp_lbl 60031 `"Nigeria"', add
label define bpld_sp_lbl 60032 `"Senegal"', add
label define bpld_sp_lbl 60033 `"Sierra Leone"', add
label define bpld_sp_lbl 60034 `"Togo"', add
label define bpld_sp_lbl 60038 `"Western Africa, ns"', add
label define bpld_sp_lbl 60039 `"French West Africa, ns"', add
label define bpld_sp_lbl 60040 `"British Indian Ocean Territory"', add
label define bpld_sp_lbl 60041 `"Burundi"', add
label define bpld_sp_lbl 60042 `"Comoros"', add
label define bpld_sp_lbl 60043 `"Djibouti"', add
label define bpld_sp_lbl 60044 `"Ethiopia"', add
label define bpld_sp_lbl 60045 `"Kenya"', add
label define bpld_sp_lbl 60046 `"Madagascar"', add
label define bpld_sp_lbl 60047 `"Malawi"', add
label define bpld_sp_lbl 60048 `"Mauritius"', add
label define bpld_sp_lbl 60049 `"Mozambique"', add
label define bpld_sp_lbl 60050 `"Reunion"', add
label define bpld_sp_lbl 60051 `"Rwanda"', add
label define bpld_sp_lbl 60052 `"Seychelles"', add
label define bpld_sp_lbl 60053 `"Somalia"', add
label define bpld_sp_lbl 60054 `"Tanzania"', add
label define bpld_sp_lbl 60055 `"Uganda"', add
label define bpld_sp_lbl 60056 `"Zambia"', add
label define bpld_sp_lbl 60057 `"Zimbabwe"', add
label define bpld_sp_lbl 60058 `"Bassas de India"', add
label define bpld_sp_lbl 60059 `"Europa"', add
label define bpld_sp_lbl 60060 `"Gloriosos"', add
label define bpld_sp_lbl 60061 `"Juan de Nova"', add
label define bpld_sp_lbl 60062 `"Mayotte"', add
label define bpld_sp_lbl 60063 `"Tromelin"', add
label define bpld_sp_lbl 60064 `"Eastern Africa, nec/ns"', add
label define bpld_sp_lbl 60065 `"Eritrea"', add
label define bpld_sp_lbl 60066 `"South Sudan"', add
label define bpld_sp_lbl 60070 `"Central Africa"', add
label define bpld_sp_lbl 60071 `"Angola"', add
label define bpld_sp_lbl 60072 `"Cameroon"', add
label define bpld_sp_lbl 60073 `"Central African Republic"', add
label define bpld_sp_lbl 60074 `"Chad"', add
label define bpld_sp_lbl 60075 `"Congo"', add
label define bpld_sp_lbl 60076 `"Equatorial Guinea"', add
label define bpld_sp_lbl 60077 `"Gabon"', add
label define bpld_sp_lbl 60078 `"Sao Tome and Principe"', add
label define bpld_sp_lbl 60079 `"Zaire"', add
label define bpld_sp_lbl 60080 `"Central Africa, ns"', add
label define bpld_sp_lbl 60081 `"Equatorial Africa, ns"', add
label define bpld_sp_lbl 60082 `"French Equatorial Africa, ns"', add
label define bpld_sp_lbl 60090 `"Southern Africa"', add
label define bpld_sp_lbl 60091 `"Botswana"', add
label define bpld_sp_lbl 60092 `"Lesotho"', add
label define bpld_sp_lbl 60093 `"Namibia"', add
label define bpld_sp_lbl 60094 `"South Africa (Union of)"', add
label define bpld_sp_lbl 60095 `"Swaziland"', add
label define bpld_sp_lbl 60096 `"Southern Africa, ns"', add
label define bpld_sp_lbl 60099 `"Africa, ns/nec"', add
label define bpld_sp_lbl 70000 `"Australia and New Zealand"', add
label define bpld_sp_lbl 70010 `"Australia"', add
label define bpld_sp_lbl 70011 `"Ashmore and Cartier Islands"', add
label define bpld_sp_lbl 70012 `"Coral Sea Islands Territory"', add
label define bpld_sp_lbl 70013 `"Christmas Island"', add
label define bpld_sp_lbl 70014 `"Cocos Islands"', add
label define bpld_sp_lbl 70020 `"New Zealand"', add
label define bpld_sp_lbl 71000 `"Pacific Islands"', add
label define bpld_sp_lbl 71010 `"New Caledonia"', add
label define bpld_sp_lbl 71012 `"Papua New Guinea"', add
label define bpld_sp_lbl 71013 `"Solomon Islands"', add
label define bpld_sp_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define bpld_sp_lbl 71015 `"Fiji"', add
label define bpld_sp_lbl 71016 `"Melanesia, ns"', add
label define bpld_sp_lbl 71017 `"Norfolk Islands"', add
label define bpld_sp_lbl 71018 `"Niue"', add
label define bpld_sp_lbl 71020 `"Cook Islands"', add
label define bpld_sp_lbl 71022 `"French Polynesia"', add
label define bpld_sp_lbl 71023 `"Tonga"', add
label define bpld_sp_lbl 71024 `"Wallis and Futuna Islands"', add
label define bpld_sp_lbl 71025 `"Western Samoa"', add
label define bpld_sp_lbl 71026 `"Pitcairn Island"', add
label define bpld_sp_lbl 71027 `"Tokelau"', add
label define bpld_sp_lbl 71028 `"Tuvalu"', add
label define bpld_sp_lbl 71029 `"Polynesia, ns"', add
label define bpld_sp_lbl 71032 `"Kiribati"', add
label define bpld_sp_lbl 71033 `"Canton and Enderbury"', add
label define bpld_sp_lbl 71034 `"Nauru"', add
label define bpld_sp_lbl 71039 `"Micronesia, ns"', add
label define bpld_sp_lbl 71040 `"US Pacific Trust Territories"', add
label define bpld_sp_lbl 71041 `"Marshall Islands"', add
label define bpld_sp_lbl 71042 `"Micronesia"', add
label define bpld_sp_lbl 71043 `"Kosrae"', add
label define bpld_sp_lbl 71044 `"Pohnpei"', add
label define bpld_sp_lbl 71045 `"Truk"', add
label define bpld_sp_lbl 71046 `"Yap"', add
label define bpld_sp_lbl 71047 `"Northern Mariana Islands"', add
label define bpld_sp_lbl 71048 `"Palau"', add
label define bpld_sp_lbl 71049 `"Pacific Trust Terr, ns"', add
label define bpld_sp_lbl 71050 `"Clipperton Island"', add
label define bpld_sp_lbl 71090 `"Oceania, ns/nec"', add
label define bpld_sp_lbl 80000 `"Antarctica, ns/nec"', add
label define bpld_sp_lbl 80010 `"Bouvet Islands"', add
label define bpld_sp_lbl 80020 `"British Antarctic Terr."', add
label define bpld_sp_lbl 80030 `"Dronning Maud Land"', add
label define bpld_sp_lbl 80040 `"French Southern and Antarctic Lands"', add
label define bpld_sp_lbl 80050 `"Heard and McDonald Islands"', add
label define bpld_sp_lbl 90000 `"Abroad (unknown) or at sea"', add
label define bpld_sp_lbl 90010 `"Abroad, ns"', add
label define bpld_sp_lbl 90011 `"Abroad (US citizen)"', add
label define bpld_sp_lbl 90020 `"At sea"', add
label define bpld_sp_lbl 90021 `"At sea (US citizen)"', add
label define bpld_sp_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define bpld_sp_lbl 95000 `"Other n.e.c."', add
label define bpld_sp_lbl 99900 `"Missing/blank"', add
label values bpld_sp bpld_sp_lbl

label define mbpl_head_lbl 000 `"Not Applicable"'
label define mbpl_head_lbl 001 `"Alabama"', add
label define mbpl_head_lbl 002 `"Alaska"', add
label define mbpl_head_lbl 004 `"Arizona"', add
label define mbpl_head_lbl 005 `"Arkansas"', add
label define mbpl_head_lbl 006 `"California"', add
label define mbpl_head_lbl 008 `"Colorado"', add
label define mbpl_head_lbl 009 `"Connecticut"', add
label define mbpl_head_lbl 010 `"Delaware"', add
label define mbpl_head_lbl 011 `"District of Columbia"', add
label define mbpl_head_lbl 012 `"Florida"', add
label define mbpl_head_lbl 013 `"Georgia"', add
label define mbpl_head_lbl 015 `"Hawaii"', add
label define mbpl_head_lbl 016 `"Idaho"', add
label define mbpl_head_lbl 017 `"Illinois"', add
label define mbpl_head_lbl 018 `"Indiana"', add
label define mbpl_head_lbl 019 `"Iowa"', add
label define mbpl_head_lbl 020 `"Kansas"', add
label define mbpl_head_lbl 021 `"Kentucky"', add
label define mbpl_head_lbl 022 `"Louisiana"', add
label define mbpl_head_lbl 023 `"Maine"', add
label define mbpl_head_lbl 024 `"Maryland"', add
label define mbpl_head_lbl 025 `"Massachusetts"', add
label define mbpl_head_lbl 026 `"Michigan"', add
label define mbpl_head_lbl 027 `"Minnesota"', add
label define mbpl_head_lbl 028 `"Mississippi"', add
label define mbpl_head_lbl 029 `"Missouri"', add
label define mbpl_head_lbl 030 `"Montana"', add
label define mbpl_head_lbl 031 `"Nebraska"', add
label define mbpl_head_lbl 032 `"Nevada"', add
label define mbpl_head_lbl 033 `"New Hampshire"', add
label define mbpl_head_lbl 034 `"New Jersey"', add
label define mbpl_head_lbl 035 `"New Mexico"', add
label define mbpl_head_lbl 036 `"New York"', add
label define mbpl_head_lbl 037 `"North Carolina"', add
label define mbpl_head_lbl 038 `"North Dakota"', add
label define mbpl_head_lbl 039 `"Ohio"', add
label define mbpl_head_lbl 040 `"Oklahoma"', add
label define mbpl_head_lbl 041 `"Oregon"', add
label define mbpl_head_lbl 042 `"Pennsylvania"', add
label define mbpl_head_lbl 044 `"Rhode Island"', add
label define mbpl_head_lbl 045 `"South Carolina"', add
label define mbpl_head_lbl 046 `"South Dakota"', add
label define mbpl_head_lbl 047 `"Tennessee"', add
label define mbpl_head_lbl 048 `"Texas"', add
label define mbpl_head_lbl 049 `"Utah"', add
label define mbpl_head_lbl 050 `"Vermont"', add
label define mbpl_head_lbl 051 `"Virginia"', add
label define mbpl_head_lbl 053 `"Washington"', add
label define mbpl_head_lbl 054 `"West Virginia"', add
label define mbpl_head_lbl 055 `"Wisconsin"', add
label define mbpl_head_lbl 056 `"Wyoming"', add
label define mbpl_head_lbl 090 `"Native American"', add
label define mbpl_head_lbl 099 `"United States, ns"', add
label define mbpl_head_lbl 100 `"American Samoa"', add
label define mbpl_head_lbl 105 `"Guam"', add
label define mbpl_head_lbl 110 `"Puerto Rico"', add
label define mbpl_head_lbl 115 `"U.S. Virgin Islands"', add
label define mbpl_head_lbl 120 `"Other US Possessions"', add
label define mbpl_head_lbl 150 `"Canada"', add
label define mbpl_head_lbl 155 `"St. Pierre and Miquelon"', add
label define mbpl_head_lbl 160 `"Atlantic Islands"', add
label define mbpl_head_lbl 199 `"North America, n.s."', add
label define mbpl_head_lbl 200 `"Mexico"', add
label define mbpl_head_lbl 210 `"Central America"', add
label define mbpl_head_lbl 250 `"Cuba"', add
label define mbpl_head_lbl 260 `"West Indies"', add
label define mbpl_head_lbl 299 `"Americas, n.s."', add
label define mbpl_head_lbl 300 `"SOUTH AMERICA"', add
label define mbpl_head_lbl 400 `"Denmark"', add
label define mbpl_head_lbl 401 `"Finland"', add
label define mbpl_head_lbl 402 `"Iceland"', add
label define mbpl_head_lbl 403 `"Lapland, n.s."', add
label define mbpl_head_lbl 404 `"Norway"', add
label define mbpl_head_lbl 405 `"Sweden"', add
label define mbpl_head_lbl 410 `"England"', add
label define mbpl_head_lbl 411 `"Scotland"', add
label define mbpl_head_lbl 412 `"Wales"', add
label define mbpl_head_lbl 413 `"United Kingdom, ns"', add
label define mbpl_head_lbl 414 `"Ireland"', add
label define mbpl_head_lbl 419 `"Northern Europe, ns"', add
label define mbpl_head_lbl 420 `"Belgium"', add
label define mbpl_head_lbl 421 `"France"', add
label define mbpl_head_lbl 422 `"Liechtenstein"', add
label define mbpl_head_lbl 423 `"Luxembourg"', add
label define mbpl_head_lbl 424 `"Monaco"', add
label define mbpl_head_lbl 425 `"Netherlands"', add
label define mbpl_head_lbl 426 `"Switzerland"', add
label define mbpl_head_lbl 429 `"Western Europe, ns"', add
label define mbpl_head_lbl 430 `"Albania"', add
label define mbpl_head_lbl 431 `"Andorra"', add
label define mbpl_head_lbl 432 `"Gibraltar"', add
label define mbpl_head_lbl 433 `"Greece"', add
label define mbpl_head_lbl 434 `"Italy"', add
label define mbpl_head_lbl 435 `"Malta"', add
label define mbpl_head_lbl 436 `"Portugal"', add
label define mbpl_head_lbl 437 `"San Marino"', add
label define mbpl_head_lbl 438 `"Spain"', add
label define mbpl_head_lbl 439 `"Vatican City"', add
label define mbpl_head_lbl 440 `"Southern Europe, n.s."', add
label define mbpl_head_lbl 450 `"Austria"', add
label define mbpl_head_lbl 451 `"Bulgaria"', add
label define mbpl_head_lbl 452 `"Czechoslovakia"', add
label define mbpl_head_lbl 453 `"Germany"', add
label define mbpl_head_lbl 454 `"Hungary"', add
label define mbpl_head_lbl 455 `"Poland"', add
label define mbpl_head_lbl 456 `"Romania"', add
label define mbpl_head_lbl 457 `"Yugoslavia"', add
label define mbpl_head_lbl 458 `"Central Europe, ns"', add
label define mbpl_head_lbl 459 `"Eastern Europe, n.s."', add
label define mbpl_head_lbl 460 `"Estonia"', add
label define mbpl_head_lbl 461 `"Latvia"', add
label define mbpl_head_lbl 462 `"Lithuania"', add
label define mbpl_head_lbl 463 `"Baltic States, ns"', add
label define mbpl_head_lbl 465 `"Other USSR/Russia"', add
label define mbpl_head_lbl 499 `"Europe, nec/ns"', add
label define mbpl_head_lbl 500 `"China"', add
label define mbpl_head_lbl 501 `"Japan"', add
label define mbpl_head_lbl 502 `"Korea"', add
label define mbpl_head_lbl 509 `"East Asia, n.s."', add
label define mbpl_head_lbl 510 `"Brunei"', add
label define mbpl_head_lbl 511 `"Cambodia (Kampuchea)"', add
label define mbpl_head_lbl 512 `"Indonesia"', add
label define mbpl_head_lbl 513 `"Laos"', add
label define mbpl_head_lbl 514 `"Malaysia"', add
label define mbpl_head_lbl 515 `"Philippines"', add
label define mbpl_head_lbl 516 `"Singapore"', add
label define mbpl_head_lbl 517 `"Thailand"', add
label define mbpl_head_lbl 518 `"Vietnam"', add
label define mbpl_head_lbl 519 `"Southeast Asia, ns"', add
label define mbpl_head_lbl 520 `"Afghanistan"', add
label define mbpl_head_lbl 521 `"India"', add
label define mbpl_head_lbl 522 `"Iran"', add
label define mbpl_head_lbl 523 `"Maldives"', add
label define mbpl_head_lbl 524 `"Nepal"', add
label define mbpl_head_lbl 530 `"Bahrain"', add
label define mbpl_head_lbl 531 `"Cyprus"', add
label define mbpl_head_lbl 532 `"Iraq"', add
label define mbpl_head_lbl 533 `"Iraq/Saudi Arabia"', add
label define mbpl_head_lbl 534 `"Israel/Palestine"', add
label define mbpl_head_lbl 535 `"Jordan"', add
label define mbpl_head_lbl 536 `"Kuwait"', add
label define mbpl_head_lbl 537 `"Lebanon"', add
label define mbpl_head_lbl 538 `"Oman"', add
label define mbpl_head_lbl 539 `"Qatar"', add
label define mbpl_head_lbl 540 `"Saudi Arabia"', add
label define mbpl_head_lbl 541 `"Syria"', add
label define mbpl_head_lbl 542 `"Turkey"', add
label define mbpl_head_lbl 543 `"United Arab Emirates"', add
label define mbpl_head_lbl 544 `"Yemen Arab Republic (North)"', add
label define mbpl_head_lbl 545 `"Yemen, PDR (South)"', add
label define mbpl_head_lbl 546 `"Persian Gulf States, n.s."', add
label define mbpl_head_lbl 547 `"Middle East, n.s."', add
label define mbpl_head_lbl 548 `"Southwest Asia, nec/ns"', add
label define mbpl_head_lbl 549 `"Asia Minor, n.s."', add
label define mbpl_head_lbl 550 `"South Asia, n.e.c."', add
label define mbpl_head_lbl 599 `"Asia, nec/ns"', add
label define mbpl_head_lbl 600 `"AFRICA"', add
label define mbpl_head_lbl 700 `"Australia and New Zealand"', add
label define mbpl_head_lbl 710 `"Pacific Islands"', add
label define mbpl_head_lbl 900 `"Abroad (unknown) or at sea"', add
label define mbpl_head_lbl 950 `"Other n.e.c."', add
label define mbpl_head_lbl 997 `"Unknown"', add
label define mbpl_head_lbl 999 `"Missing/blank"', add
label values mbpl_head mbpl_head_lbl

label define mbpl_sp_lbl 000 `"Not Applicable"'
label define mbpl_sp_lbl 001 `"Alabama"', add
label define mbpl_sp_lbl 002 `"Alaska"', add
label define mbpl_sp_lbl 004 `"Arizona"', add
label define mbpl_sp_lbl 005 `"Arkansas"', add
label define mbpl_sp_lbl 006 `"California"', add
label define mbpl_sp_lbl 008 `"Colorado"', add
label define mbpl_sp_lbl 009 `"Connecticut"', add
label define mbpl_sp_lbl 010 `"Delaware"', add
label define mbpl_sp_lbl 011 `"District of Columbia"', add
label define mbpl_sp_lbl 012 `"Florida"', add
label define mbpl_sp_lbl 013 `"Georgia"', add
label define mbpl_sp_lbl 015 `"Hawaii"', add
label define mbpl_sp_lbl 016 `"Idaho"', add
label define mbpl_sp_lbl 017 `"Illinois"', add
label define mbpl_sp_lbl 018 `"Indiana"', add
label define mbpl_sp_lbl 019 `"Iowa"', add
label define mbpl_sp_lbl 020 `"Kansas"', add
label define mbpl_sp_lbl 021 `"Kentucky"', add
label define mbpl_sp_lbl 022 `"Louisiana"', add
label define mbpl_sp_lbl 023 `"Maine"', add
label define mbpl_sp_lbl 024 `"Maryland"', add
label define mbpl_sp_lbl 025 `"Massachusetts"', add
label define mbpl_sp_lbl 026 `"Michigan"', add
label define mbpl_sp_lbl 027 `"Minnesota"', add
label define mbpl_sp_lbl 028 `"Mississippi"', add
label define mbpl_sp_lbl 029 `"Missouri"', add
label define mbpl_sp_lbl 030 `"Montana"', add
label define mbpl_sp_lbl 031 `"Nebraska"', add
label define mbpl_sp_lbl 032 `"Nevada"', add
label define mbpl_sp_lbl 033 `"New Hampshire"', add
label define mbpl_sp_lbl 034 `"New Jersey"', add
label define mbpl_sp_lbl 035 `"New Mexico"', add
label define mbpl_sp_lbl 036 `"New York"', add
label define mbpl_sp_lbl 037 `"North Carolina"', add
label define mbpl_sp_lbl 038 `"North Dakota"', add
label define mbpl_sp_lbl 039 `"Ohio"', add
label define mbpl_sp_lbl 040 `"Oklahoma"', add
label define mbpl_sp_lbl 041 `"Oregon"', add
label define mbpl_sp_lbl 042 `"Pennsylvania"', add
label define mbpl_sp_lbl 044 `"Rhode Island"', add
label define mbpl_sp_lbl 045 `"South Carolina"', add
label define mbpl_sp_lbl 046 `"South Dakota"', add
label define mbpl_sp_lbl 047 `"Tennessee"', add
label define mbpl_sp_lbl 048 `"Texas"', add
label define mbpl_sp_lbl 049 `"Utah"', add
label define mbpl_sp_lbl 050 `"Vermont"', add
label define mbpl_sp_lbl 051 `"Virginia"', add
label define mbpl_sp_lbl 053 `"Washington"', add
label define mbpl_sp_lbl 054 `"West Virginia"', add
label define mbpl_sp_lbl 055 `"Wisconsin"', add
label define mbpl_sp_lbl 056 `"Wyoming"', add
label define mbpl_sp_lbl 090 `"Native American"', add
label define mbpl_sp_lbl 099 `"United States, ns"', add
label define mbpl_sp_lbl 100 `"American Samoa"', add
label define mbpl_sp_lbl 105 `"Guam"', add
label define mbpl_sp_lbl 110 `"Puerto Rico"', add
label define mbpl_sp_lbl 115 `"U.S. Virgin Islands"', add
label define mbpl_sp_lbl 120 `"Other US Possessions"', add
label define mbpl_sp_lbl 150 `"Canada"', add
label define mbpl_sp_lbl 155 `"St. Pierre and Miquelon"', add
label define mbpl_sp_lbl 160 `"Atlantic Islands"', add
label define mbpl_sp_lbl 199 `"North America, n.s."', add
label define mbpl_sp_lbl 200 `"Mexico"', add
label define mbpl_sp_lbl 210 `"Central America"', add
label define mbpl_sp_lbl 250 `"Cuba"', add
label define mbpl_sp_lbl 260 `"West Indies"', add
label define mbpl_sp_lbl 299 `"Americas, n.s."', add
label define mbpl_sp_lbl 300 `"SOUTH AMERICA"', add
label define mbpl_sp_lbl 400 `"Denmark"', add
label define mbpl_sp_lbl 401 `"Finland"', add
label define mbpl_sp_lbl 402 `"Iceland"', add
label define mbpl_sp_lbl 403 `"Lapland, n.s."', add
label define mbpl_sp_lbl 404 `"Norway"', add
label define mbpl_sp_lbl 405 `"Sweden"', add
label define mbpl_sp_lbl 410 `"England"', add
label define mbpl_sp_lbl 411 `"Scotland"', add
label define mbpl_sp_lbl 412 `"Wales"', add
label define mbpl_sp_lbl 413 `"United Kingdom, ns"', add
label define mbpl_sp_lbl 414 `"Ireland"', add
label define mbpl_sp_lbl 419 `"Northern Europe, ns"', add
label define mbpl_sp_lbl 420 `"Belgium"', add
label define mbpl_sp_lbl 421 `"France"', add
label define mbpl_sp_lbl 422 `"Liechtenstein"', add
label define mbpl_sp_lbl 423 `"Luxembourg"', add
label define mbpl_sp_lbl 424 `"Monaco"', add
label define mbpl_sp_lbl 425 `"Netherlands"', add
label define mbpl_sp_lbl 426 `"Switzerland"', add
label define mbpl_sp_lbl 429 `"Western Europe, ns"', add
label define mbpl_sp_lbl 430 `"Albania"', add
label define mbpl_sp_lbl 431 `"Andorra"', add
label define mbpl_sp_lbl 432 `"Gibraltar"', add
label define mbpl_sp_lbl 433 `"Greece"', add
label define mbpl_sp_lbl 434 `"Italy"', add
label define mbpl_sp_lbl 435 `"Malta"', add
label define mbpl_sp_lbl 436 `"Portugal"', add
label define mbpl_sp_lbl 437 `"San Marino"', add
label define mbpl_sp_lbl 438 `"Spain"', add
label define mbpl_sp_lbl 439 `"Vatican City"', add
label define mbpl_sp_lbl 440 `"Southern Europe, n.s."', add
label define mbpl_sp_lbl 450 `"Austria"', add
label define mbpl_sp_lbl 451 `"Bulgaria"', add
label define mbpl_sp_lbl 452 `"Czechoslovakia"', add
label define mbpl_sp_lbl 453 `"Germany"', add
label define mbpl_sp_lbl 454 `"Hungary"', add
label define mbpl_sp_lbl 455 `"Poland"', add
label define mbpl_sp_lbl 456 `"Romania"', add
label define mbpl_sp_lbl 457 `"Yugoslavia"', add
label define mbpl_sp_lbl 458 `"Central Europe, ns"', add
label define mbpl_sp_lbl 459 `"Eastern Europe, n.s."', add
label define mbpl_sp_lbl 460 `"Estonia"', add
label define mbpl_sp_lbl 461 `"Latvia"', add
label define mbpl_sp_lbl 462 `"Lithuania"', add
label define mbpl_sp_lbl 463 `"Baltic States, ns"', add
label define mbpl_sp_lbl 465 `"Other USSR/Russia"', add
label define mbpl_sp_lbl 499 `"Europe, nec/ns"', add
label define mbpl_sp_lbl 500 `"China"', add
label define mbpl_sp_lbl 501 `"Japan"', add
label define mbpl_sp_lbl 502 `"Korea"', add
label define mbpl_sp_lbl 509 `"East Asia, n.s."', add
label define mbpl_sp_lbl 510 `"Brunei"', add
label define mbpl_sp_lbl 511 `"Cambodia (Kampuchea)"', add
label define mbpl_sp_lbl 512 `"Indonesia"', add
label define mbpl_sp_lbl 513 `"Laos"', add
label define mbpl_sp_lbl 514 `"Malaysia"', add
label define mbpl_sp_lbl 515 `"Philippines"', add
label define mbpl_sp_lbl 516 `"Singapore"', add
label define mbpl_sp_lbl 517 `"Thailand"', add
label define mbpl_sp_lbl 518 `"Vietnam"', add
label define mbpl_sp_lbl 519 `"Southeast Asia, ns"', add
label define mbpl_sp_lbl 520 `"Afghanistan"', add
label define mbpl_sp_lbl 521 `"India"', add
label define mbpl_sp_lbl 522 `"Iran"', add
label define mbpl_sp_lbl 523 `"Maldives"', add
label define mbpl_sp_lbl 524 `"Nepal"', add
label define mbpl_sp_lbl 530 `"Bahrain"', add
label define mbpl_sp_lbl 531 `"Cyprus"', add
label define mbpl_sp_lbl 532 `"Iraq"', add
label define mbpl_sp_lbl 533 `"Iraq/Saudi Arabia"', add
label define mbpl_sp_lbl 534 `"Israel/Palestine"', add
label define mbpl_sp_lbl 535 `"Jordan"', add
label define mbpl_sp_lbl 536 `"Kuwait"', add
label define mbpl_sp_lbl 537 `"Lebanon"', add
label define mbpl_sp_lbl 538 `"Oman"', add
label define mbpl_sp_lbl 539 `"Qatar"', add
label define mbpl_sp_lbl 540 `"Saudi Arabia"', add
label define mbpl_sp_lbl 541 `"Syria"', add
label define mbpl_sp_lbl 542 `"Turkey"', add
label define mbpl_sp_lbl 543 `"United Arab Emirates"', add
label define mbpl_sp_lbl 544 `"Yemen Arab Republic (North)"', add
label define mbpl_sp_lbl 545 `"Yemen, PDR (South)"', add
label define mbpl_sp_lbl 546 `"Persian Gulf States, n.s."', add
label define mbpl_sp_lbl 547 `"Middle East, n.s."', add
label define mbpl_sp_lbl 548 `"Southwest Asia, nec/ns"', add
label define mbpl_sp_lbl 549 `"Asia Minor, n.s."', add
label define mbpl_sp_lbl 550 `"South Asia, n.e.c."', add
label define mbpl_sp_lbl 599 `"Asia, nec/ns"', add
label define mbpl_sp_lbl 600 `"AFRICA"', add
label define mbpl_sp_lbl 700 `"Australia and New Zealand"', add
label define mbpl_sp_lbl 710 `"Pacific Islands"', add
label define mbpl_sp_lbl 900 `"Abroad (unknown) or at sea"', add
label define mbpl_sp_lbl 950 `"Other n.e.c."', add
label define mbpl_sp_lbl 997 `"Unknown"', add
label define mbpl_sp_lbl 999 `"Missing/blank"', add
label values mbpl_sp mbpl_sp_lbl

label define mbpld_head_lbl 00000 `"Not Applicable"'
label define mbpld_head_lbl 00100 `"Alabama"', add
label define mbpld_head_lbl 00200 `"Alaska"', add
label define mbpld_head_lbl 00400 `"Arizona"', add
label define mbpld_head_lbl 00500 `"Arkansas"', add
label define mbpld_head_lbl 00600 `"California"', add
label define mbpld_head_lbl 00800 `"Colorado"', add
label define mbpld_head_lbl 00900 `"Connecticut"', add
label define mbpld_head_lbl 01000 `"Delaware"', add
label define mbpld_head_lbl 01100 `"District of Columbia"', add
label define mbpld_head_lbl 01200 `"Florida"', add
label define mbpld_head_lbl 01300 `"Georgia"', add
label define mbpld_head_lbl 01500 `"Hawaii"', add
label define mbpld_head_lbl 01600 `"Idaho"', add
label define mbpld_head_lbl 01610 `"Idaho Territory"', add
label define mbpld_head_lbl 01700 `"Illinois"', add
label define mbpld_head_lbl 01800 `"Indiana"', add
label define mbpld_head_lbl 01900 `"Iowa"', add
label define mbpld_head_lbl 02000 `"Kansas"', add
label define mbpld_head_lbl 02100 `"Kentucky"', add
label define mbpld_head_lbl 02200 `"Louisiana"', add
label define mbpld_head_lbl 02300 `"Maine"', add
label define mbpld_head_lbl 02400 `"Maryland"', add
label define mbpld_head_lbl 02500 `"Massachusetts"', add
label define mbpld_head_lbl 02600 `"Michigan"', add
label define mbpld_head_lbl 02700 `"Minnesota"', add
label define mbpld_head_lbl 02800 `"Mississippi"', add
label define mbpld_head_lbl 02900 `"Missouri"', add
label define mbpld_head_lbl 03000 `"Montana"', add
label define mbpld_head_lbl 03100 `"Nebraska"', add
label define mbpld_head_lbl 03200 `"Nevada"', add
label define mbpld_head_lbl 03300 `"New Hampshire"', add
label define mbpld_head_lbl 03400 `"New Jersey"', add
label define mbpld_head_lbl 03500 `"New Mexico"', add
label define mbpld_head_lbl 03510 `"New Mexico Territory"', add
label define mbpld_head_lbl 03600 `"New York"', add
label define mbpld_head_lbl 03700 `"North Carolina"', add
label define mbpld_head_lbl 03800 `"North Dakota"', add
label define mbpld_head_lbl 03900 `"Ohio"', add
label define mbpld_head_lbl 04000 `"Oklahoma"', add
label define mbpld_head_lbl 04010 `"Indian Territory"', add
label define mbpld_head_lbl 04100 `"Oregon"', add
label define mbpld_head_lbl 04200 `"Pennsylvania"', add
label define mbpld_head_lbl 04400 `"Rhode Island"', add
label define mbpld_head_lbl 04500 `"South Carolina"', add
label define mbpld_head_lbl 04600 `"South Dakota"', add
label define mbpld_head_lbl 04610 `"Dakota Territory"', add
label define mbpld_head_lbl 04700 `"Tennessee"', add
label define mbpld_head_lbl 04800 `"Texas"', add
label define mbpld_head_lbl 04900 `"Utah"', add
label define mbpld_head_lbl 04910 `"Utah Territory"', add
label define mbpld_head_lbl 05000 `"Vermont"', add
label define mbpld_head_lbl 05100 `"Virginia"', add
label define mbpld_head_lbl 05300 `"Washington"', add
label define mbpld_head_lbl 05400 `"West Virginia"', add
label define mbpld_head_lbl 05500 `"Wisconsin"', add
label define mbpld_head_lbl 05600 `"Wyoming"', add
label define mbpld_head_lbl 05610 `"Wyoming Territory"', add
label define mbpld_head_lbl 09000 `"Native American"', add
label define mbpld_head_lbl 09900 `"United States, n.s."', add
label define mbpld_head_lbl 10000 `"American Samoa"', add
label define mbpld_head_lbl 10010 `"Samoa, 1940-1950"', add
label define mbpld_head_lbl 10500 `"Guam"', add
label define mbpld_head_lbl 11000 `"Puerto Rico"', add
label define mbpld_head_lbl 11500 `"U.S. Virgin Islands"', add
label define mbpld_head_lbl 11510 `"St. Croix"', add
label define mbpld_head_lbl 11520 `"St. John"', add
label define mbpld_head_lbl 11530 `"St. Thomas"', add
label define mbpld_head_lbl 12000 `"Other US Possessions"', add
label define mbpld_head_lbl 12010 `"Johnston Atoll"', add
label define mbpld_head_lbl 12020 `"Midway Islands"', add
label define mbpld_head_lbl 12030 `"Wake Island"', add
label define mbpld_head_lbl 12040 `"Other US Caribbean Islands"', add
label define mbpld_head_lbl 12041 `"Navassa Island"', add
label define mbpld_head_lbl 12050 `"Other US Pacific Is."', add
label define mbpld_head_lbl 12051 `"Baker Island"', add
label define mbpld_head_lbl 12052 `"Howland Island"', add
label define mbpld_head_lbl 12053 `"Jarvis Island"', add
label define mbpld_head_lbl 12054 `"Kingman Reef"', add
label define mbpld_head_lbl 12055 `"Palmyra Atoll"', add
label define mbpld_head_lbl 12056 `"Canton and Enderbury Island"', add
label define mbpld_head_lbl 12090 `"US outlying areas, ns"', add
label define mbpld_head_lbl 12091 `"US Possessions, n.s."', add
label define mbpld_head_lbl 12092 `"US territory, ns"', add
label define mbpld_head_lbl 15000 `"Canada"', add
label define mbpld_head_lbl 15010 `"English Canada"', add
label define mbpld_head_lbl 15011 `"British Columbia"', add
label define mbpld_head_lbl 15013 `"Alberta"', add
label define mbpld_head_lbl 15015 `"Saskatchewan"', add
label define mbpld_head_lbl 15017 `"Northwest"', add
label define mbpld_head_lbl 15019 `"Ruperts Land"', add
label define mbpld_head_lbl 15020 `"Manitoba"', add
label define mbpld_head_lbl 15021 `"Red River"', add
label define mbpld_head_lbl 15030 `"Ontario/Upper Canada"', add
label define mbpld_head_lbl 15031 `"Upper Canada"', add
label define mbpld_head_lbl 15032 `"Canada West"', add
label define mbpld_head_lbl 15040 `"New Brunswick"', add
label define mbpld_head_lbl 15050 `"Nova Scotia"', add
label define mbpld_head_lbl 15051 `"Cape Breton"', add
label define mbpld_head_lbl 15052 `"Halifax"', add
label define mbpld_head_lbl 15060 `"Prince Edward Island"', add
label define mbpld_head_lbl 15070 `"Newfoundland"', add
label define mbpld_head_lbl 15080 `"French Canada"', add
label define mbpld_head_lbl 15081 `"Quebec"', add
label define mbpld_head_lbl 15082 `"Lower Canada"', add
label define mbpld_head_lbl 15083 `"Canada East"', add
label define mbpld_head_lbl 15500 `"St. Pierre and Miquelon"', add
label define mbpld_head_lbl 16000 `"Atlantic Islands"', add
label define mbpld_head_lbl 16010 `"Bermuda"', add
label define mbpld_head_lbl 16020 `"Cape Verde"', add
label define mbpld_head_lbl 16030 `"Falkland Islands"', add
label define mbpld_head_lbl 16040 `"Greenland"', add
label define mbpld_head_lbl 16050 `"St. Helena and Ascension"', add
label define mbpld_head_lbl 16060 `"Canary Islands"', add
label define mbpld_head_lbl 19900 `"North America, n.s."', add
label define mbpld_head_lbl 20000 `"Mexico"', add
label define mbpld_head_lbl 21000 `"Central America"', add
label define mbpld_head_lbl 21010 `"Belize/British Honduras"', add
label define mbpld_head_lbl 21020 `"Costa Rica"', add
label define mbpld_head_lbl 21030 `"El Salvador"', add
label define mbpld_head_lbl 21040 `"Guatemala"', add
label define mbpld_head_lbl 21050 `"Honduras"', add
label define mbpld_head_lbl 21060 `"Nicaragua"', add
label define mbpld_head_lbl 21070 `"Panama"', add
label define mbpld_head_lbl 21071 `"Canal Zone"', add
label define mbpld_head_lbl 21090 `"Central America, ns"', add
label define mbpld_head_lbl 25000 `"Cuba"', add
label define mbpld_head_lbl 26000 `"West Indies"', add
label define mbpld_head_lbl 26010 `"Dominican Republic"', add
label define mbpld_head_lbl 26020 `"Haiti"', add
label define mbpld_head_lbl 26030 `"Jamaica"', add
label define mbpld_head_lbl 26040 `"British West Indies"', add
label define mbpld_head_lbl 26041 `"Anguilla"', add
label define mbpld_head_lbl 26042 `"Antigua-Barbuda"', add
label define mbpld_head_lbl 26043 `"Bahamas"', add
label define mbpld_head_lbl 26044 `"Barbados"', add
label define mbpld_head_lbl 26045 `"British Virgin Islands"', add
label define mbpld_head_lbl 26046 `"Anegada"', add
label define mbpld_head_lbl 26047 `"Cooper"', add
label define mbpld_head_lbl 26048 `"Jost Van Dyke"', add
label define mbpld_head_lbl 26049 `"Peter"', add
label define mbpld_head_lbl 26050 `"Tortola"', add
label define mbpld_head_lbl 26051 `"Virgin Gorda"', add
label define mbpld_head_lbl 26052 `"Br. Virgin Islands, ns"', add
label define mbpld_head_lbl 26053 `"Cayman Isles"', add
label define mbpld_head_lbl 26054 `"Dominica"', add
label define mbpld_head_lbl 26055 `"Grenada"', add
label define mbpld_head_lbl 26056 `"Montserrat"', add
label define mbpld_head_lbl 26057 `"St. Kitts-Nevis"', add
label define mbpld_head_lbl 26058 `"St. Lucia"', add
label define mbpld_head_lbl 26059 `"St. Vincent"', add
label define mbpld_head_lbl 26060 `"Trinidad and Tobago"', add
label define mbpld_head_lbl 26061 `"Turks and Caicos"', add
label define mbpld_head_lbl 26069 `"British West Indies, ns"', add
label define mbpld_head_lbl 26070 `"Other West Indies"', add
label define mbpld_head_lbl 26071 `"Aruba"', add
label define mbpld_head_lbl 26072 `"Netherlands Antilles"', add
label define mbpld_head_lbl 26073 `"Bonaire"', add
label define mbpld_head_lbl 26074 `"Curacao"', add
label define mbpld_head_lbl 26075 `"Dutch St. Maarten"', add
label define mbpld_head_lbl 26076 `"Saba"', add
label define mbpld_head_lbl 26077 `"St. Eustatius"', add
label define mbpld_head_lbl 26079 `"Dutch Caribbean, ns"', add
label define mbpld_head_lbl 26080 `"French St. Maarten"', add
label define mbpld_head_lbl 26081 `"Guadeloupe"', add
label define mbpld_head_lbl 26082 `"Martinique"', add
label define mbpld_head_lbl 26083 `"St. Barthelemy"', add
label define mbpld_head_lbl 26089 `"French Caribbean, ns"', add
label define mbpld_head_lbl 26090 `"Antilles, n.s."', add
label define mbpld_head_lbl 26091 `"Caribbean, n.s. / n.e.c."', add
label define mbpld_head_lbl 26092 `"Latin America, ns"', add
label define mbpld_head_lbl 26093 `"Leeward Islands, n.s."', add
label define mbpld_head_lbl 26094 `"West Indies, ns"', add
label define mbpld_head_lbl 26095 `"Winward Islands"', add
label define mbpld_head_lbl 29900 `"Americas, ns"', add
label define mbpld_head_lbl 30000 `"SOUTH AMERICA"', add
label define mbpld_head_lbl 30005 `"Argentina"', add
label define mbpld_head_lbl 30010 `"Bolivia"', add
label define mbpld_head_lbl 30015 `"Brazil"', add
label define mbpld_head_lbl 30020 `"Chile"', add
label define mbpld_head_lbl 30025 `"Colombia"', add
label define mbpld_head_lbl 30030 `"Ecuador"', add
label define mbpld_head_lbl 30035 `"French Guiana"', add
label define mbpld_head_lbl 30040 `"Guyana/British Guiana"', add
label define mbpld_head_lbl 30045 `"Paraguay"', add
label define mbpld_head_lbl 30050 `"Peru"', add
label define mbpld_head_lbl 30055 `"Suriname"', add
label define mbpld_head_lbl 30060 `"Uruguay"', add
label define mbpld_head_lbl 30065 `"Venezuela"', add
label define mbpld_head_lbl 30090 `"South America, n.s."', add
label define mbpld_head_lbl 30091 `"South and Central America, n.s."', add
label define mbpld_head_lbl 40000 `"Denmark"', add
label define mbpld_head_lbl 40010 `"Faroe Islands"', add
label define mbpld_head_lbl 40100 `"Finland"', add
label define mbpld_head_lbl 40200 `"Iceland"', add
label define mbpld_head_lbl 40300 `"Lapland, ns"', add
label define mbpld_head_lbl 40400 `"Norway"', add
label define mbpld_head_lbl 40410 `"Svalbard and Jan Meyen"', add
label define mbpld_head_lbl 40411 `"Svalbard"', add
label define mbpld_head_lbl 40412 `"Jan Meyen"', add
label define mbpld_head_lbl 40500 `"Sweden"', add
label define mbpld_head_lbl 41000 `"England"', add
label define mbpld_head_lbl 41010 `"Channel Islands"', add
label define mbpld_head_lbl 41011 `"Guernsey"', add
label define mbpld_head_lbl 41012 `"Jersey"', add
label define mbpld_head_lbl 41020 `"Isle of Man"', add
label define mbpld_head_lbl 41100 `"Scotland"', add
label define mbpld_head_lbl 41200 `"Wales"', add
label define mbpld_head_lbl 41300 `"United Kingdom, n.s."', add
label define mbpld_head_lbl 41400 `"Ireland"', add
label define mbpld_head_lbl 41410 `"Northern Ireland"', add
label define mbpld_head_lbl 41900 `"Northern Europe, ns"', add
label define mbpld_head_lbl 42000 `"Belgium"', add
label define mbpld_head_lbl 42100 `"France"', add
label define mbpld_head_lbl 42110 `"Alsace-Lorraine"', add
label define mbpld_head_lbl 42111 `"Alsace"', add
label define mbpld_head_lbl 42112 `"Lorraine"', add
label define mbpld_head_lbl 42200 `"Liechtenstein"', add
label define mbpld_head_lbl 42300 `"Luxembourg"', add
label define mbpld_head_lbl 42400 `"Monaco"', add
label define mbpld_head_lbl 42500 `"Netherlands"', add
label define mbpld_head_lbl 42600 `"Switzerland"', add
label define mbpld_head_lbl 42900 `"Western Euproe, ns"', add
label define mbpld_head_lbl 43000 `"Albania"', add
label define mbpld_head_lbl 43100 `"Andorra"', add
label define mbpld_head_lbl 43200 `"Gibraltar"', add
label define mbpld_head_lbl 43300 `"Greece"', add
label define mbpld_head_lbl 43310 `"Dodecanese Islands"', add
label define mbpld_head_lbl 43320 `"Turkey Greece"', add
label define mbpld_head_lbl 43330 `"Macedonia"', add
label define mbpld_head_lbl 43400 `"Italy"', add
label define mbpld_head_lbl 43500 `"Malta"', add
label define mbpld_head_lbl 43600 `"Portugal"', add
label define mbpld_head_lbl 43610 `"Azores"', add
label define mbpld_head_lbl 43620 `"Madeira Islands"', add
label define mbpld_head_lbl 43630 `"Cape Verde Islands"', add
label define mbpld_head_lbl 43640 `"St. Miguel"', add
label define mbpld_head_lbl 43700 `"San Marino"', add
label define mbpld_head_lbl 43800 `"Spain"', add
label define mbpld_head_lbl 43900 `"Vatican City"', add
label define mbpld_head_lbl 44000 `"Southern Europe, ns"', add
label define mbpld_head_lbl 45000 `"Austria"', add
label define mbpld_head_lbl 45010 `"Austria-Hungary"', add
label define mbpld_head_lbl 45020 `"Austria-Graz"', add
label define mbpld_head_lbl 45030 `"Austria-Linz"', add
label define mbpld_head_lbl 45040 `"Austria-Salzburg"', add
label define mbpld_head_lbl 45050 `"Austria-Tyrol"', add
label define mbpld_head_lbl 45060 `"Austria-Vienna"', add
label define mbpld_head_lbl 45070 `"Austria-Kaernten"', add
label define mbpld_head_lbl 45080 `"Austria-Neustadt"', add
label define mbpld_head_lbl 45100 `"Bulgaria"', add
label define mbpld_head_lbl 45200 `"Czechoslovakia"', add
label define mbpld_head_lbl 45210 `"Bohemia"', add
label define mbpld_head_lbl 45211 `"Bohemia-Moravia"', add
label define mbpld_head_lbl 45212 `"Slovakia"', add
label define mbpld_head_lbl 45213 `"Czech Republic"', add
label define mbpld_head_lbl 45300 `"Germany"', add
label define mbpld_head_lbl 45301 `"Berlin"', add
label define mbpld_head_lbl 45310 `"West Germany"', add
label define mbpld_head_lbl 45311 `"Baden"', add
label define mbpld_head_lbl 45312 `"Bavaria"', add
label define mbpld_head_lbl 45313 `"Bremen"', add
label define mbpld_head_lbl 45314 `"Braunschweig"', add
label define mbpld_head_lbl 45315 `"Hamburg"', add
label define mbpld_head_lbl 45316 `"Hanover"', add
label define mbpld_head_lbl 45317 `"Hessen"', add
label define mbpld_head_lbl 45318 `"Hesse-Nassau"', add
label define mbpld_head_lbl 45319 `"Holstein"', add
label define mbpld_head_lbl 45320 `"Lippe"', add
label define mbpld_head_lbl 45321 `"Lubeck"', add
label define mbpld_head_lbl 45322 `"Oldenburg"', add
label define mbpld_head_lbl 45323 `"Rheinland"', add
label define mbpld_head_lbl 45324 `"Schleswig"', add
label define mbpld_head_lbl 45325 `"Schleswig-Holstein"', add
label define mbpld_head_lbl 45326 `"Schwarzburg"', add
label define mbpld_head_lbl 45327 `"Waldeck"', add
label define mbpld_head_lbl 45328 `"West Berlin"', add
label define mbpld_head_lbl 45329 `"Westphalia"', add
label define mbpld_head_lbl 45330 `"Wurttemberg"', add
label define mbpld_head_lbl 45331 `"Frankfurt"', add
label define mbpld_head_lbl 45332 `"Saarland"', add
label define mbpld_head_lbl 45333 `"Nordrhein-Westfalen"', add
label define mbpld_head_lbl 45340 `"East Germany"', add
label define mbpld_head_lbl 45341 `"Anhalt"', add
label define mbpld_head_lbl 45342 `"Brandenburg"', add
label define mbpld_head_lbl 45343 `"East Berlin"', add
label define mbpld_head_lbl 45344 `"Mecklenburg"', add
label define mbpld_head_lbl 45345 `"Sachsen-Altenburg"', add
label define mbpld_head_lbl 45346 `"Sachsen-Coburg"', add
label define mbpld_head_lbl 45347 `"Sachsen-Gotha"', add
label define mbpld_head_lbl 45348 `"Sachsen-Meiningen"', add
label define mbpld_head_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define mbpld_head_lbl 45350 `"Saxony"', add
label define mbpld_head_lbl 45351 `"Schwerin"', add
label define mbpld_head_lbl 45352 `"Strelitz"', add
label define mbpld_head_lbl 45353 `"Thuringian States"', add
label define mbpld_head_lbl 45360 `"Prussia, n.e.c."', add
label define mbpld_head_lbl 45361 `"Hohenzollern"', add
label define mbpld_head_lbl 45362 `"Niedersachsen"', add
label define mbpld_head_lbl 45400 `"Hungary"', add
label define mbpld_head_lbl 45500 `"Poland"', add
label define mbpld_head_lbl 45510 `"Austrian Poland"', add
label define mbpld_head_lbl 45511 `"Galicia"', add
label define mbpld_head_lbl 45520 `"German Poland"', add
label define mbpld_head_lbl 45521 `"East Prussia"', add
label define mbpld_head_lbl 45522 `"Pomerania"', add
label define mbpld_head_lbl 45523 `"Posen"', add
label define mbpld_head_lbl 45524 `"Prussian Poland"', add
label define mbpld_head_lbl 45525 `"Silesia"', add
label define mbpld_head_lbl 45526 `"West Prussia"', add
label define mbpld_head_lbl 45530 `"Russian Poland"', add
label define mbpld_head_lbl 45600 `"Romania"', add
label define mbpld_head_lbl 45610 `"Transylvania"', add
label define mbpld_head_lbl 45700 `"Yugoslavia"', add
label define mbpld_head_lbl 45710 `"Croatia"', add
label define mbpld_head_lbl 45720 `"Montenegro"', add
label define mbpld_head_lbl 45730 `"Serbia"', add
label define mbpld_head_lbl 45740 `"Bosnia"', add
label define mbpld_head_lbl 45750 `"Dalmatia"', add
label define mbpld_head_lbl 45760 `"Slovonia"', add
label define mbpld_head_lbl 45770 `"Carniola"', add
label define mbpld_head_lbl 45780 `"Slovenia"', add
label define mbpld_head_lbl 45790 `"Kosovo"', add
label define mbpld_head_lbl 45800 `"Central Europe, n.s."', add
label define mbpld_head_lbl 45900 `"Eastern Europe, n.s."', add
label define mbpld_head_lbl 46000 `"Estonia"', add
label define mbpld_head_lbl 46100 `"Latvia"', add
label define mbpld_head_lbl 46200 `"Lithuania"', add
label define mbpld_head_lbl 46300 `"Baltic States, ns"', add
label define mbpld_head_lbl 46500 `"Other USSR/Russia"', add
label define mbpld_head_lbl 46510 `"Byelorussia"', add
label define mbpld_head_lbl 46520 `"Moldavia"', add
label define mbpld_head_lbl 46521 `"Bessarabia"', add
label define mbpld_head_lbl 46530 `"Ukraine"', add
label define mbpld_head_lbl 46540 `"Armenia"', add
label define mbpld_head_lbl 46541 `"Azerbaijan"', add
label define mbpld_head_lbl 46542 `"Republic of Georgia"', add
label define mbpld_head_lbl 46543 `"Kazakhstan"', add
label define mbpld_head_lbl 46544 `"Kirghizia"', add
label define mbpld_head_lbl 46545 `"Tadzhik"', add
label define mbpld_head_lbl 46546 `"Turkmenistan"', add
label define mbpld_head_lbl 46547 `"Uzbekistan"', add
label define mbpld_head_lbl 46548 `"Siberia"', add
label define mbpld_head_lbl 46590 `"USSR, ns"', add
label define mbpld_head_lbl 49900 `"Europe, n.e.c./n.s."', add
label define mbpld_head_lbl 50000 `"China"', add
label define mbpld_head_lbl 50010 `"Hong Kong"', add
label define mbpld_head_lbl 50020 `"Macau"', add
label define mbpld_head_lbl 50030 `"Mongolia"', add
label define mbpld_head_lbl 50040 `"Taiwan"', add
label define mbpld_head_lbl 50100 `"Japan"', add
label define mbpld_head_lbl 50200 `"Korea"', add
label define mbpld_head_lbl 50210 `"North Korea"', add
label define mbpld_head_lbl 50220 `"South Korea"', add
label define mbpld_head_lbl 50900 `"East Asia, n.s."', add
label define mbpld_head_lbl 51000 `"Brunei"', add
label define mbpld_head_lbl 51100 `"Cambodia (Kampuchea)"', add
label define mbpld_head_lbl 51200 `"Indonesia"', add
label define mbpld_head_lbl 51210 `"East Indies"', add
label define mbpld_head_lbl 51220 `"East Timor"', add
label define mbpld_head_lbl 51300 `"Laos"', add
label define mbpld_head_lbl 51400 `"Malaysia"', add
label define mbpld_head_lbl 51500 `"Philippines"', add
label define mbpld_head_lbl 51600 `"Singapore"', add
label define mbpld_head_lbl 51700 `"Thailand"', add
label define mbpld_head_lbl 51800 `"Vietnam"', add
label define mbpld_head_lbl 51900 `"Southeast Asia, ns"', add
label define mbpld_head_lbl 51910 `"Indochina, ns"', add
label define mbpld_head_lbl 52000 `"Afghanistan"', add
label define mbpld_head_lbl 52100 `"India"', add
label define mbpld_head_lbl 52110 `"Bangladesh"', add
label define mbpld_head_lbl 52120 `"Bhutan"', add
label define mbpld_head_lbl 52130 `"Burma (Myanmar)"', add
label define mbpld_head_lbl 52140 `"Pakistan"', add
label define mbpld_head_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define mbpld_head_lbl 52200 `"Iran"', add
label define mbpld_head_lbl 52300 `"Maldives"', add
label define mbpld_head_lbl 52400 `"Nepal"', add
label define mbpld_head_lbl 53000 `"Bahrain"', add
label define mbpld_head_lbl 53100 `"Cyprus"', add
label define mbpld_head_lbl 53200 `"Iraq"', add
label define mbpld_head_lbl 53210 `"Mesopotamia"', add
label define mbpld_head_lbl 53300 `"Iraq/Saudi Arabia"', add
label define mbpld_head_lbl 53400 `"Israel/Palestine"', add
label define mbpld_head_lbl 53420 `"Palestine"', add
label define mbpld_head_lbl 53430 `"West Bank"', add
label define mbpld_head_lbl 53440 `"Israel"', add
label define mbpld_head_lbl 53410 `"Gaza Strip"', add
label define mbpld_head_lbl 53500 `"Jordan"', add
label define mbpld_head_lbl 53600 `"Kuwait"', add
label define mbpld_head_lbl 53700 `"Lebanon"', add
label define mbpld_head_lbl 53800 `"Oman"', add
label define mbpld_head_lbl 53900 `"Qatar"', add
label define mbpld_head_lbl 54000 `"Saudi Arabia"', add
label define mbpld_head_lbl 54100 `"Syria"', add
label define mbpld_head_lbl 54200 `"Turkey"', add
label define mbpld_head_lbl 54210 `"European Turkey"', add
label define mbpld_head_lbl 54220 `"Asian Turkey"', add
label define mbpld_head_lbl 54300 `"United Arab Emirates"', add
label define mbpld_head_lbl 54400 `"Yemen Arab Republic (North)"', add
label define mbpld_head_lbl 54500 `"Yemen, PDR (South)"', add
label define mbpld_head_lbl 54600 `"Persian Gulf States, ns"', add
label define mbpld_head_lbl 54700 `"Middle East, n.s."', add
label define mbpld_head_lbl 54800 `"Southwest Asia, nec/ns"', add
label define mbpld_head_lbl 54900 `"Asia Minor, n.s."', add
label define mbpld_head_lbl 55000 `"South Asia, n.e.c."', add
label define mbpld_head_lbl 59900 `"Asia, nec/ns"', add
label define mbpld_head_lbl 60000 `"AFRICA"', add
label define mbpld_head_lbl 60010 `"Northern Africa"', add
label define mbpld_head_lbl 60011 `"Algeria"', add
label define mbpld_head_lbl 60012 `"Egypt/United Arab Rep."', add
label define mbpld_head_lbl 60013 `"Libya"', add
label define mbpld_head_lbl 60014 `"Morocco"', add
label define mbpld_head_lbl 60015 `"Sudan"', add
label define mbpld_head_lbl 60016 `"Tunisia"', add
label define mbpld_head_lbl 60017 `"Western Sahara"', add
label define mbpld_head_lbl 60019 `"North Africa, ns"', add
label define mbpld_head_lbl 60020 `"Benin"', add
label define mbpld_head_lbl 60021 `"Burkina Faso"', add
label define mbpld_head_lbl 60022 `"Gambia"', add
label define mbpld_head_lbl 60023 `"Ghana"', add
label define mbpld_head_lbl 60024 `"Guinea"', add
label define mbpld_head_lbl 60025 `"Guinea-Bissau"', add
label define mbpld_head_lbl 60026 `"Ivory Coast"', add
label define mbpld_head_lbl 60027 `"Liberia"', add
label define mbpld_head_lbl 60028 `"Mali"', add
label define mbpld_head_lbl 60029 `"Mauritania"', add
label define mbpld_head_lbl 60030 `"Niger"', add
label define mbpld_head_lbl 60031 `"Nigeria"', add
label define mbpld_head_lbl 60032 `"Senegal"', add
label define mbpld_head_lbl 60033 `"Sierra Leone"', add
label define mbpld_head_lbl 60034 `"Togo"', add
label define mbpld_head_lbl 60038 `"Western Africa, n.s."', add
label define mbpld_head_lbl 60039 `"French West Africa, ns"', add
label define mbpld_head_lbl 60040 `"British Indian Ocean Territory"', add
label define mbpld_head_lbl 60041 `"Burundi"', add
label define mbpld_head_lbl 60042 `"Comoros"', add
label define mbpld_head_lbl 60043 `"Djibouti"', add
label define mbpld_head_lbl 60044 `"Ethiopia"', add
label define mbpld_head_lbl 60045 `"Kenya"', add
label define mbpld_head_lbl 60046 `"Madagascar"', add
label define mbpld_head_lbl 60047 `"Malawi"', add
label define mbpld_head_lbl 60048 `"Mauritius"', add
label define mbpld_head_lbl 60049 `"Mozambique"', add
label define mbpld_head_lbl 60050 `"Reunion"', add
label define mbpld_head_lbl 60051 `"Rwanda"', add
label define mbpld_head_lbl 60052 `"Seychelles"', add
label define mbpld_head_lbl 60053 `"Somalia"', add
label define mbpld_head_lbl 60054 `"Tanzania"', add
label define mbpld_head_lbl 60055 `"Uganda"', add
label define mbpld_head_lbl 60056 `"Zambia"', add
label define mbpld_head_lbl 60057 `"Zimbabwe"', add
label define mbpld_head_lbl 60058 `"Bassas de India"', add
label define mbpld_head_lbl 60059 `"Europa"', add
label define mbpld_head_lbl 60060 `"Gloriosos"', add
label define mbpld_head_lbl 60061 `"Juan de Nova"', add
label define mbpld_head_lbl 60062 `"Mayotte"', add
label define mbpld_head_lbl 60063 `"Tromelin"', add
label define mbpld_head_lbl 60064 `"Eastern Africa, nec/ns"', add
label define mbpld_head_lbl 60065 `"Eritrea"', add
label define mbpld_head_lbl 60070 `"Central Africa"', add
label define mbpld_head_lbl 60071 `"Angola"', add
label define mbpld_head_lbl 60072 `"Cameroon"', add
label define mbpld_head_lbl 60073 `"Central African Republic"', add
label define mbpld_head_lbl 60074 `"Chad"', add
label define mbpld_head_lbl 60075 `"Congo"', add
label define mbpld_head_lbl 60076 `"Equatorial Guinea"', add
label define mbpld_head_lbl 60077 `"Gabon"', add
label define mbpld_head_lbl 60078 `"Sao Tome and Principe"', add
label define mbpld_head_lbl 60079 `"Zaire"', add
label define mbpld_head_lbl 60080 `"Central Africa, ns"', add
label define mbpld_head_lbl 60081 `"Equatorial Africa, ns"', add
label define mbpld_head_lbl 60082 `"French Equatorial Africa, ns"', add
label define mbpld_head_lbl 60090 `"Southern Africa"', add
label define mbpld_head_lbl 60091 `"Botswana"', add
label define mbpld_head_lbl 60092 `"Lesotho"', add
label define mbpld_head_lbl 60093 `"Namibia"', add
label define mbpld_head_lbl 60094 `"South Africa (Union of)"', add
label define mbpld_head_lbl 60095 `"Swaziland"', add
label define mbpld_head_lbl 60096 `"Southern Africa, n.s."', add
label define mbpld_head_lbl 60099 `"Africa, ns/nec"', add
label define mbpld_head_lbl 70000 `"Australia and New Zealand"', add
label define mbpld_head_lbl 70010 `"Australia"', add
label define mbpld_head_lbl 70011 `"Ashmore and Cartier Islands"', add
label define mbpld_head_lbl 70012 `"Coral Sea Islands Territory"', add
label define mbpld_head_lbl 70013 `"Christmas Island"', add
label define mbpld_head_lbl 70014 `"Cocos Islands"', add
label define mbpld_head_lbl 70020 `"New Zealand"', add
label define mbpld_head_lbl 71000 `"Pacific Islands"', add
label define mbpld_head_lbl 71010 `"New Caledonia"', add
label define mbpld_head_lbl 71012 `"Papua New Guinea"', add
label define mbpld_head_lbl 71013 `"Solomon Islands"', add
label define mbpld_head_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define mbpld_head_lbl 71016 `"Melanesia, ns"', add
label define mbpld_head_lbl 71017 `"Norfolk Islands"', add
label define mbpld_head_lbl 71018 `"Niue"', add
label define mbpld_head_lbl 71020 `"Cook Islands"', add
label define mbpld_head_lbl 71021 `"Fiji"', add
label define mbpld_head_lbl 71022 `"French Polynesia"', add
label define mbpld_head_lbl 71023 `"Tonga"', add
label define mbpld_head_lbl 71024 `"Wallis and Futuna Islands"', add
label define mbpld_head_lbl 71025 `"Western Samoa"', add
label define mbpld_head_lbl 71026 `"Pitcairn Island"', add
label define mbpld_head_lbl 71027 `"Tokelau"', add
label define mbpld_head_lbl 71028 `"Tuvalu"', add
label define mbpld_head_lbl 71029 `"Polynesia, n.s."', add
label define mbpld_head_lbl 71032 `"Kiribati"', add
label define mbpld_head_lbl 71033 `"Canton and Enderbury"', add
label define mbpld_head_lbl 71034 `"Nauru"', add
label define mbpld_head_lbl 71039 `"Micronesia, ns"', add
label define mbpld_head_lbl 71040 `"US Pacific Trust Territories"', add
label define mbpld_head_lbl 71041 `"Marshall Islands"', add
label define mbpld_head_lbl 71042 `"Micronesia"', add
label define mbpld_head_lbl 71043 `"Kosrae"', add
label define mbpld_head_lbl 71044 `"Pohnpei"', add
label define mbpld_head_lbl 71045 `"Truk"', add
label define mbpld_head_lbl 71046 `"Yap"', add
label define mbpld_head_lbl 71047 `"Northern Mariana Islands"', add
label define mbpld_head_lbl 71048 `"Palau"', add
label define mbpld_head_lbl 71049 `"Pacific Trust Terr, ns"', add
label define mbpld_head_lbl 71050 `"Clipperton Island"', add
label define mbpld_head_lbl 71090 `"Oceania, ns/nec"', add
label define mbpld_head_lbl 80000 `"Antarctica, ns/nec"', add
label define mbpld_head_lbl 80010 `"Bouvet Islands"', add
label define mbpld_head_lbl 80020 `"British Antarctic Terr."', add
label define mbpld_head_lbl 80030 `"Dronning Maud Land"', add
label define mbpld_head_lbl 80040 `"French Southern and Antarctic Lands"', add
label define mbpld_head_lbl 80050 `"Heard and McDonald Islands"', add
label define mbpld_head_lbl 90000 `"Abroad (unknown) or at sea"', add
label define mbpld_head_lbl 90010 `"Abroad, ns"', add
label define mbpld_head_lbl 90011 `"Abroad (US citizen)"', add
label define mbpld_head_lbl 90020 `"At sea"', add
label define mbpld_head_lbl 90021 `"At sea (US citizen)"', add
label define mbpld_head_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define mbpld_head_lbl 95000 `"Other n.e.c."', add
label define mbpld_head_lbl 99700 `"Unknown"', add
label define mbpld_head_lbl 99900 `"Missing/blank"', add
label values mbpld_head mbpld_head_lbl

label define mbpld_sp_lbl 00000 `"Not Applicable"'
label define mbpld_sp_lbl 00100 `"Alabama"', add
label define mbpld_sp_lbl 00200 `"Alaska"', add
label define mbpld_sp_lbl 00400 `"Arizona"', add
label define mbpld_sp_lbl 00500 `"Arkansas"', add
label define mbpld_sp_lbl 00600 `"California"', add
label define mbpld_sp_lbl 00800 `"Colorado"', add
label define mbpld_sp_lbl 00900 `"Connecticut"', add
label define mbpld_sp_lbl 01000 `"Delaware"', add
label define mbpld_sp_lbl 01100 `"District of Columbia"', add
label define mbpld_sp_lbl 01200 `"Florida"', add
label define mbpld_sp_lbl 01300 `"Georgia"', add
label define mbpld_sp_lbl 01500 `"Hawaii"', add
label define mbpld_sp_lbl 01600 `"Idaho"', add
label define mbpld_sp_lbl 01610 `"Idaho Territory"', add
label define mbpld_sp_lbl 01700 `"Illinois"', add
label define mbpld_sp_lbl 01800 `"Indiana"', add
label define mbpld_sp_lbl 01900 `"Iowa"', add
label define mbpld_sp_lbl 02000 `"Kansas"', add
label define mbpld_sp_lbl 02100 `"Kentucky"', add
label define mbpld_sp_lbl 02200 `"Louisiana"', add
label define mbpld_sp_lbl 02300 `"Maine"', add
label define mbpld_sp_lbl 02400 `"Maryland"', add
label define mbpld_sp_lbl 02500 `"Massachusetts"', add
label define mbpld_sp_lbl 02600 `"Michigan"', add
label define mbpld_sp_lbl 02700 `"Minnesota"', add
label define mbpld_sp_lbl 02800 `"Mississippi"', add
label define mbpld_sp_lbl 02900 `"Missouri"', add
label define mbpld_sp_lbl 03000 `"Montana"', add
label define mbpld_sp_lbl 03100 `"Nebraska"', add
label define mbpld_sp_lbl 03200 `"Nevada"', add
label define mbpld_sp_lbl 03300 `"New Hampshire"', add
label define mbpld_sp_lbl 03400 `"New Jersey"', add
label define mbpld_sp_lbl 03500 `"New Mexico"', add
label define mbpld_sp_lbl 03510 `"New Mexico Territory"', add
label define mbpld_sp_lbl 03600 `"New York"', add
label define mbpld_sp_lbl 03700 `"North Carolina"', add
label define mbpld_sp_lbl 03800 `"North Dakota"', add
label define mbpld_sp_lbl 03900 `"Ohio"', add
label define mbpld_sp_lbl 04000 `"Oklahoma"', add
label define mbpld_sp_lbl 04010 `"Indian Territory"', add
label define mbpld_sp_lbl 04100 `"Oregon"', add
label define mbpld_sp_lbl 04200 `"Pennsylvania"', add
label define mbpld_sp_lbl 04400 `"Rhode Island"', add
label define mbpld_sp_lbl 04500 `"South Carolina"', add
label define mbpld_sp_lbl 04600 `"South Dakota"', add
label define mbpld_sp_lbl 04610 `"Dakota Territory"', add
label define mbpld_sp_lbl 04700 `"Tennessee"', add
label define mbpld_sp_lbl 04800 `"Texas"', add
label define mbpld_sp_lbl 04900 `"Utah"', add
label define mbpld_sp_lbl 04910 `"Utah Territory"', add
label define mbpld_sp_lbl 05000 `"Vermont"', add
label define mbpld_sp_lbl 05100 `"Virginia"', add
label define mbpld_sp_lbl 05300 `"Washington"', add
label define mbpld_sp_lbl 05400 `"West Virginia"', add
label define mbpld_sp_lbl 05500 `"Wisconsin"', add
label define mbpld_sp_lbl 05600 `"Wyoming"', add
label define mbpld_sp_lbl 05610 `"Wyoming Territory"', add
label define mbpld_sp_lbl 09000 `"Native American"', add
label define mbpld_sp_lbl 09900 `"United States, n.s."', add
label define mbpld_sp_lbl 10000 `"American Samoa"', add
label define mbpld_sp_lbl 10010 `"Samoa, 1940-1950"', add
label define mbpld_sp_lbl 10500 `"Guam"', add
label define mbpld_sp_lbl 11000 `"Puerto Rico"', add
label define mbpld_sp_lbl 11500 `"U.S. Virgin Islands"', add
label define mbpld_sp_lbl 11510 `"St. Croix"', add
label define mbpld_sp_lbl 11520 `"St. John"', add
label define mbpld_sp_lbl 11530 `"St. Thomas"', add
label define mbpld_sp_lbl 12000 `"Other US Possessions"', add
label define mbpld_sp_lbl 12010 `"Johnston Atoll"', add
label define mbpld_sp_lbl 12020 `"Midway Islands"', add
label define mbpld_sp_lbl 12030 `"Wake Island"', add
label define mbpld_sp_lbl 12040 `"Other US Caribbean Islands"', add
label define mbpld_sp_lbl 12041 `"Navassa Island"', add
label define mbpld_sp_lbl 12050 `"Other US Pacific Is."', add
label define mbpld_sp_lbl 12051 `"Baker Island"', add
label define mbpld_sp_lbl 12052 `"Howland Island"', add
label define mbpld_sp_lbl 12053 `"Jarvis Island"', add
label define mbpld_sp_lbl 12054 `"Kingman Reef"', add
label define mbpld_sp_lbl 12055 `"Palmyra Atoll"', add
label define mbpld_sp_lbl 12056 `"Canton and Enderbury Island"', add
label define mbpld_sp_lbl 12090 `"US outlying areas, ns"', add
label define mbpld_sp_lbl 12091 `"US Possessions, n.s."', add
label define mbpld_sp_lbl 12092 `"US territory, ns"', add
label define mbpld_sp_lbl 15000 `"Canada"', add
label define mbpld_sp_lbl 15010 `"English Canada"', add
label define mbpld_sp_lbl 15011 `"British Columbia"', add
label define mbpld_sp_lbl 15013 `"Alberta"', add
label define mbpld_sp_lbl 15015 `"Saskatchewan"', add
label define mbpld_sp_lbl 15017 `"Northwest"', add
label define mbpld_sp_lbl 15019 `"Ruperts Land"', add
label define mbpld_sp_lbl 15020 `"Manitoba"', add
label define mbpld_sp_lbl 15021 `"Red River"', add
label define mbpld_sp_lbl 15030 `"Ontario/Upper Canada"', add
label define mbpld_sp_lbl 15031 `"Upper Canada"', add
label define mbpld_sp_lbl 15032 `"Canada West"', add
label define mbpld_sp_lbl 15040 `"New Brunswick"', add
label define mbpld_sp_lbl 15050 `"Nova Scotia"', add
label define mbpld_sp_lbl 15051 `"Cape Breton"', add
label define mbpld_sp_lbl 15052 `"Halifax"', add
label define mbpld_sp_lbl 15060 `"Prince Edward Island"', add
label define mbpld_sp_lbl 15070 `"Newfoundland"', add
label define mbpld_sp_lbl 15080 `"French Canada"', add
label define mbpld_sp_lbl 15081 `"Quebec"', add
label define mbpld_sp_lbl 15082 `"Lower Canada"', add
label define mbpld_sp_lbl 15083 `"Canada East"', add
label define mbpld_sp_lbl 15500 `"St. Pierre and Miquelon"', add
label define mbpld_sp_lbl 16000 `"Atlantic Islands"', add
label define mbpld_sp_lbl 16010 `"Bermuda"', add
label define mbpld_sp_lbl 16020 `"Cape Verde"', add
label define mbpld_sp_lbl 16030 `"Falkland Islands"', add
label define mbpld_sp_lbl 16040 `"Greenland"', add
label define mbpld_sp_lbl 16050 `"St. Helena and Ascension"', add
label define mbpld_sp_lbl 16060 `"Canary Islands"', add
label define mbpld_sp_lbl 19900 `"North America, n.s."', add
label define mbpld_sp_lbl 20000 `"Mexico"', add
label define mbpld_sp_lbl 21000 `"Central America"', add
label define mbpld_sp_lbl 21010 `"Belize/British Honduras"', add
label define mbpld_sp_lbl 21020 `"Costa Rica"', add
label define mbpld_sp_lbl 21030 `"El Salvador"', add
label define mbpld_sp_lbl 21040 `"Guatemala"', add
label define mbpld_sp_lbl 21050 `"Honduras"', add
label define mbpld_sp_lbl 21060 `"Nicaragua"', add
label define mbpld_sp_lbl 21070 `"Panama"', add
label define mbpld_sp_lbl 21071 `"Canal Zone"', add
label define mbpld_sp_lbl 21090 `"Central America, ns"', add
label define mbpld_sp_lbl 25000 `"Cuba"', add
label define mbpld_sp_lbl 26000 `"West Indies"', add
label define mbpld_sp_lbl 26010 `"Dominican Republic"', add
label define mbpld_sp_lbl 26020 `"Haiti"', add
label define mbpld_sp_lbl 26030 `"Jamaica"', add
label define mbpld_sp_lbl 26040 `"British West Indies"', add
label define mbpld_sp_lbl 26041 `"Anguilla"', add
label define mbpld_sp_lbl 26042 `"Antigua-Barbuda"', add
label define mbpld_sp_lbl 26043 `"Bahamas"', add
label define mbpld_sp_lbl 26044 `"Barbados"', add
label define mbpld_sp_lbl 26045 `"British Virgin Islands"', add
label define mbpld_sp_lbl 26046 `"Anegada"', add
label define mbpld_sp_lbl 26047 `"Cooper"', add
label define mbpld_sp_lbl 26048 `"Jost Van Dyke"', add
label define mbpld_sp_lbl 26049 `"Peter"', add
label define mbpld_sp_lbl 26050 `"Tortola"', add
label define mbpld_sp_lbl 26051 `"Virgin Gorda"', add
label define mbpld_sp_lbl 26052 `"Br. Virgin Islands, ns"', add
label define mbpld_sp_lbl 26053 `"Cayman Isles"', add
label define mbpld_sp_lbl 26054 `"Dominica"', add
label define mbpld_sp_lbl 26055 `"Grenada"', add
label define mbpld_sp_lbl 26056 `"Montserrat"', add
label define mbpld_sp_lbl 26057 `"St. Kitts-Nevis"', add
label define mbpld_sp_lbl 26058 `"St. Lucia"', add
label define mbpld_sp_lbl 26059 `"St. Vincent"', add
label define mbpld_sp_lbl 26060 `"Trinidad and Tobago"', add
label define mbpld_sp_lbl 26061 `"Turks and Caicos"', add
label define mbpld_sp_lbl 26069 `"British West Indies, ns"', add
label define mbpld_sp_lbl 26070 `"Other West Indies"', add
label define mbpld_sp_lbl 26071 `"Aruba"', add
label define mbpld_sp_lbl 26072 `"Netherlands Antilles"', add
label define mbpld_sp_lbl 26073 `"Bonaire"', add
label define mbpld_sp_lbl 26074 `"Curacao"', add
label define mbpld_sp_lbl 26075 `"Dutch St. Maarten"', add
label define mbpld_sp_lbl 26076 `"Saba"', add
label define mbpld_sp_lbl 26077 `"St. Eustatius"', add
label define mbpld_sp_lbl 26079 `"Dutch Caribbean, ns"', add
label define mbpld_sp_lbl 26080 `"French St. Maarten"', add
label define mbpld_sp_lbl 26081 `"Guadeloupe"', add
label define mbpld_sp_lbl 26082 `"Martinique"', add
label define mbpld_sp_lbl 26083 `"St. Barthelemy"', add
label define mbpld_sp_lbl 26089 `"French Caribbean, ns"', add
label define mbpld_sp_lbl 26090 `"Antilles, n.s."', add
label define mbpld_sp_lbl 26091 `"Caribbean, n.s. / n.e.c."', add
label define mbpld_sp_lbl 26092 `"Latin America, ns"', add
label define mbpld_sp_lbl 26093 `"Leeward Islands, n.s."', add
label define mbpld_sp_lbl 26094 `"West Indies, ns"', add
label define mbpld_sp_lbl 26095 `"Winward Islands"', add
label define mbpld_sp_lbl 29900 `"Americas, ns"', add
label define mbpld_sp_lbl 30000 `"SOUTH AMERICA"', add
label define mbpld_sp_lbl 30005 `"Argentina"', add
label define mbpld_sp_lbl 30010 `"Bolivia"', add
label define mbpld_sp_lbl 30015 `"Brazil"', add
label define mbpld_sp_lbl 30020 `"Chile"', add
label define mbpld_sp_lbl 30025 `"Colombia"', add
label define mbpld_sp_lbl 30030 `"Ecuador"', add
label define mbpld_sp_lbl 30035 `"French Guiana"', add
label define mbpld_sp_lbl 30040 `"Guyana/British Guiana"', add
label define mbpld_sp_lbl 30045 `"Paraguay"', add
label define mbpld_sp_lbl 30050 `"Peru"', add
label define mbpld_sp_lbl 30055 `"Suriname"', add
label define mbpld_sp_lbl 30060 `"Uruguay"', add
label define mbpld_sp_lbl 30065 `"Venezuela"', add
label define mbpld_sp_lbl 30090 `"South America, n.s."', add
label define mbpld_sp_lbl 30091 `"South and Central America, n.s."', add
label define mbpld_sp_lbl 40000 `"Denmark"', add
label define mbpld_sp_lbl 40010 `"Faroe Islands"', add
label define mbpld_sp_lbl 40100 `"Finland"', add
label define mbpld_sp_lbl 40200 `"Iceland"', add
label define mbpld_sp_lbl 40300 `"Lapland, ns"', add
label define mbpld_sp_lbl 40400 `"Norway"', add
label define mbpld_sp_lbl 40410 `"Svalbard and Jan Meyen"', add
label define mbpld_sp_lbl 40411 `"Svalbard"', add
label define mbpld_sp_lbl 40412 `"Jan Meyen"', add
label define mbpld_sp_lbl 40500 `"Sweden"', add
label define mbpld_sp_lbl 41000 `"England"', add
label define mbpld_sp_lbl 41010 `"Channel Islands"', add
label define mbpld_sp_lbl 41011 `"Guernsey"', add
label define mbpld_sp_lbl 41012 `"Jersey"', add
label define mbpld_sp_lbl 41020 `"Isle of Man"', add
label define mbpld_sp_lbl 41100 `"Scotland"', add
label define mbpld_sp_lbl 41200 `"Wales"', add
label define mbpld_sp_lbl 41300 `"United Kingdom, n.s."', add
label define mbpld_sp_lbl 41400 `"Ireland"', add
label define mbpld_sp_lbl 41410 `"Northern Ireland"', add
label define mbpld_sp_lbl 41900 `"Northern Europe, ns"', add
label define mbpld_sp_lbl 42000 `"Belgium"', add
label define mbpld_sp_lbl 42100 `"France"', add
label define mbpld_sp_lbl 42110 `"Alsace-Lorraine"', add
label define mbpld_sp_lbl 42111 `"Alsace"', add
label define mbpld_sp_lbl 42112 `"Lorraine"', add
label define mbpld_sp_lbl 42200 `"Liechtenstein"', add
label define mbpld_sp_lbl 42300 `"Luxembourg"', add
label define mbpld_sp_lbl 42400 `"Monaco"', add
label define mbpld_sp_lbl 42500 `"Netherlands"', add
label define mbpld_sp_lbl 42600 `"Switzerland"', add
label define mbpld_sp_lbl 42900 `"Western Euproe, ns"', add
label define mbpld_sp_lbl 43000 `"Albania"', add
label define mbpld_sp_lbl 43100 `"Andorra"', add
label define mbpld_sp_lbl 43200 `"Gibraltar"', add
label define mbpld_sp_lbl 43300 `"Greece"', add
label define mbpld_sp_lbl 43310 `"Dodecanese Islands"', add
label define mbpld_sp_lbl 43320 `"Turkey Greece"', add
label define mbpld_sp_lbl 43330 `"Macedonia"', add
label define mbpld_sp_lbl 43400 `"Italy"', add
label define mbpld_sp_lbl 43500 `"Malta"', add
label define mbpld_sp_lbl 43600 `"Portugal"', add
label define mbpld_sp_lbl 43610 `"Azores"', add
label define mbpld_sp_lbl 43620 `"Madeira Islands"', add
label define mbpld_sp_lbl 43630 `"Cape Verde Islands"', add
label define mbpld_sp_lbl 43640 `"St. Miguel"', add
label define mbpld_sp_lbl 43700 `"San Marino"', add
label define mbpld_sp_lbl 43800 `"Spain"', add
label define mbpld_sp_lbl 43900 `"Vatican City"', add
label define mbpld_sp_lbl 44000 `"Southern Europe, ns"', add
label define mbpld_sp_lbl 45000 `"Austria"', add
label define mbpld_sp_lbl 45010 `"Austria-Hungary"', add
label define mbpld_sp_lbl 45020 `"Austria-Graz"', add
label define mbpld_sp_lbl 45030 `"Austria-Linz"', add
label define mbpld_sp_lbl 45040 `"Austria-Salzburg"', add
label define mbpld_sp_lbl 45050 `"Austria-Tyrol"', add
label define mbpld_sp_lbl 45060 `"Austria-Vienna"', add
label define mbpld_sp_lbl 45070 `"Austria-Kaernten"', add
label define mbpld_sp_lbl 45080 `"Austria-Neustadt"', add
label define mbpld_sp_lbl 45100 `"Bulgaria"', add
label define mbpld_sp_lbl 45200 `"Czechoslovakia"', add
label define mbpld_sp_lbl 45210 `"Bohemia"', add
label define mbpld_sp_lbl 45211 `"Bohemia-Moravia"', add
label define mbpld_sp_lbl 45212 `"Slovakia"', add
label define mbpld_sp_lbl 45213 `"Czech Republic"', add
label define mbpld_sp_lbl 45300 `"Germany"', add
label define mbpld_sp_lbl 45301 `"Berlin"', add
label define mbpld_sp_lbl 45310 `"West Germany"', add
label define mbpld_sp_lbl 45311 `"Baden"', add
label define mbpld_sp_lbl 45312 `"Bavaria"', add
label define mbpld_sp_lbl 45313 `"Bremen"', add
label define mbpld_sp_lbl 45314 `"Braunschweig"', add
label define mbpld_sp_lbl 45315 `"Hamburg"', add
label define mbpld_sp_lbl 45316 `"Hanover"', add
label define mbpld_sp_lbl 45317 `"Hessen"', add
label define mbpld_sp_lbl 45318 `"Hesse-Nassau"', add
label define mbpld_sp_lbl 45319 `"Holstein"', add
label define mbpld_sp_lbl 45320 `"Lippe"', add
label define mbpld_sp_lbl 45321 `"Lubeck"', add
label define mbpld_sp_lbl 45322 `"Oldenburg"', add
label define mbpld_sp_lbl 45323 `"Rheinland"', add
label define mbpld_sp_lbl 45324 `"Schleswig"', add
label define mbpld_sp_lbl 45325 `"Schleswig-Holstein"', add
label define mbpld_sp_lbl 45326 `"Schwarzburg"', add
label define mbpld_sp_lbl 45327 `"Waldeck"', add
label define mbpld_sp_lbl 45328 `"West Berlin"', add
label define mbpld_sp_lbl 45329 `"Westphalia"', add
label define mbpld_sp_lbl 45330 `"Wurttemberg"', add
label define mbpld_sp_lbl 45331 `"Frankfurt"', add
label define mbpld_sp_lbl 45332 `"Saarland"', add
label define mbpld_sp_lbl 45333 `"Nordrhein-Westfalen"', add
label define mbpld_sp_lbl 45340 `"East Germany"', add
label define mbpld_sp_lbl 45341 `"Anhalt"', add
label define mbpld_sp_lbl 45342 `"Brandenburg"', add
label define mbpld_sp_lbl 45343 `"East Berlin"', add
label define mbpld_sp_lbl 45344 `"Mecklenburg"', add
label define mbpld_sp_lbl 45345 `"Sachsen-Altenburg"', add
label define mbpld_sp_lbl 45346 `"Sachsen-Coburg"', add
label define mbpld_sp_lbl 45347 `"Sachsen-Gotha"', add
label define mbpld_sp_lbl 45348 `"Sachsen-Meiningen"', add
label define mbpld_sp_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define mbpld_sp_lbl 45350 `"Saxony"', add
label define mbpld_sp_lbl 45351 `"Schwerin"', add
label define mbpld_sp_lbl 45352 `"Strelitz"', add
label define mbpld_sp_lbl 45353 `"Thuringian States"', add
label define mbpld_sp_lbl 45360 `"Prussia, n.e.c."', add
label define mbpld_sp_lbl 45361 `"Hohenzollern"', add
label define mbpld_sp_lbl 45362 `"Niedersachsen"', add
label define mbpld_sp_lbl 45400 `"Hungary"', add
label define mbpld_sp_lbl 45500 `"Poland"', add
label define mbpld_sp_lbl 45510 `"Austrian Poland"', add
label define mbpld_sp_lbl 45511 `"Galicia"', add
label define mbpld_sp_lbl 45520 `"German Poland"', add
label define mbpld_sp_lbl 45521 `"East Prussia"', add
label define mbpld_sp_lbl 45522 `"Pomerania"', add
label define mbpld_sp_lbl 45523 `"Posen"', add
label define mbpld_sp_lbl 45524 `"Prussian Poland"', add
label define mbpld_sp_lbl 45525 `"Silesia"', add
label define mbpld_sp_lbl 45526 `"West Prussia"', add
label define mbpld_sp_lbl 45530 `"Russian Poland"', add
label define mbpld_sp_lbl 45600 `"Romania"', add
label define mbpld_sp_lbl 45610 `"Transylvania"', add
label define mbpld_sp_lbl 45700 `"Yugoslavia"', add
label define mbpld_sp_lbl 45710 `"Croatia"', add
label define mbpld_sp_lbl 45720 `"Montenegro"', add
label define mbpld_sp_lbl 45730 `"Serbia"', add
label define mbpld_sp_lbl 45740 `"Bosnia"', add
label define mbpld_sp_lbl 45750 `"Dalmatia"', add
label define mbpld_sp_lbl 45760 `"Slovonia"', add
label define mbpld_sp_lbl 45770 `"Carniola"', add
label define mbpld_sp_lbl 45780 `"Slovenia"', add
label define mbpld_sp_lbl 45790 `"Kosovo"', add
label define mbpld_sp_lbl 45800 `"Central Europe, n.s."', add
label define mbpld_sp_lbl 45900 `"Eastern Europe, n.s."', add
label define mbpld_sp_lbl 46000 `"Estonia"', add
label define mbpld_sp_lbl 46100 `"Latvia"', add
label define mbpld_sp_lbl 46200 `"Lithuania"', add
label define mbpld_sp_lbl 46300 `"Baltic States, ns"', add
label define mbpld_sp_lbl 46500 `"Other USSR/Russia"', add
label define mbpld_sp_lbl 46510 `"Byelorussia"', add
label define mbpld_sp_lbl 46520 `"Moldavia"', add
label define mbpld_sp_lbl 46521 `"Bessarabia"', add
label define mbpld_sp_lbl 46530 `"Ukraine"', add
label define mbpld_sp_lbl 46540 `"Armenia"', add
label define mbpld_sp_lbl 46541 `"Azerbaijan"', add
label define mbpld_sp_lbl 46542 `"Republic of Georgia"', add
label define mbpld_sp_lbl 46543 `"Kazakhstan"', add
label define mbpld_sp_lbl 46544 `"Kirghizia"', add
label define mbpld_sp_lbl 46545 `"Tadzhik"', add
label define mbpld_sp_lbl 46546 `"Turkmenistan"', add
label define mbpld_sp_lbl 46547 `"Uzbekistan"', add
label define mbpld_sp_lbl 46548 `"Siberia"', add
label define mbpld_sp_lbl 46590 `"USSR, ns"', add
label define mbpld_sp_lbl 49900 `"Europe, n.e.c./n.s."', add
label define mbpld_sp_lbl 50000 `"China"', add
label define mbpld_sp_lbl 50010 `"Hong Kong"', add
label define mbpld_sp_lbl 50020 `"Macau"', add
label define mbpld_sp_lbl 50030 `"Mongolia"', add
label define mbpld_sp_lbl 50040 `"Taiwan"', add
label define mbpld_sp_lbl 50100 `"Japan"', add
label define mbpld_sp_lbl 50200 `"Korea"', add
label define mbpld_sp_lbl 50210 `"North Korea"', add
label define mbpld_sp_lbl 50220 `"South Korea"', add
label define mbpld_sp_lbl 50900 `"East Asia, n.s."', add
label define mbpld_sp_lbl 51000 `"Brunei"', add
label define mbpld_sp_lbl 51100 `"Cambodia (Kampuchea)"', add
label define mbpld_sp_lbl 51200 `"Indonesia"', add
label define mbpld_sp_lbl 51210 `"East Indies"', add
label define mbpld_sp_lbl 51220 `"East Timor"', add
label define mbpld_sp_lbl 51300 `"Laos"', add
label define mbpld_sp_lbl 51400 `"Malaysia"', add
label define mbpld_sp_lbl 51500 `"Philippines"', add
label define mbpld_sp_lbl 51600 `"Singapore"', add
label define mbpld_sp_lbl 51700 `"Thailand"', add
label define mbpld_sp_lbl 51800 `"Vietnam"', add
label define mbpld_sp_lbl 51900 `"Southeast Asia, ns"', add
label define mbpld_sp_lbl 51910 `"Indochina, ns"', add
label define mbpld_sp_lbl 52000 `"Afghanistan"', add
label define mbpld_sp_lbl 52100 `"India"', add
label define mbpld_sp_lbl 52110 `"Bangladesh"', add
label define mbpld_sp_lbl 52120 `"Bhutan"', add
label define mbpld_sp_lbl 52130 `"Burma (Myanmar)"', add
label define mbpld_sp_lbl 52140 `"Pakistan"', add
label define mbpld_sp_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define mbpld_sp_lbl 52200 `"Iran"', add
label define mbpld_sp_lbl 52300 `"Maldives"', add
label define mbpld_sp_lbl 52400 `"Nepal"', add
label define mbpld_sp_lbl 53000 `"Bahrain"', add
label define mbpld_sp_lbl 53100 `"Cyprus"', add
label define mbpld_sp_lbl 53200 `"Iraq"', add
label define mbpld_sp_lbl 53210 `"Mesopotamia"', add
label define mbpld_sp_lbl 53300 `"Iraq/Saudi Arabia"', add
label define mbpld_sp_lbl 53400 `"Israel/Palestine"', add
label define mbpld_sp_lbl 53420 `"Palestine"', add
label define mbpld_sp_lbl 53430 `"West Bank"', add
label define mbpld_sp_lbl 53440 `"Israel"', add
label define mbpld_sp_lbl 53410 `"Gaza Strip"', add
label define mbpld_sp_lbl 53500 `"Jordan"', add
label define mbpld_sp_lbl 53600 `"Kuwait"', add
label define mbpld_sp_lbl 53700 `"Lebanon"', add
label define mbpld_sp_lbl 53800 `"Oman"', add
label define mbpld_sp_lbl 53900 `"Qatar"', add
label define mbpld_sp_lbl 54000 `"Saudi Arabia"', add
label define mbpld_sp_lbl 54100 `"Syria"', add
label define mbpld_sp_lbl 54200 `"Turkey"', add
label define mbpld_sp_lbl 54210 `"European Turkey"', add
label define mbpld_sp_lbl 54220 `"Asian Turkey"', add
label define mbpld_sp_lbl 54300 `"United Arab Emirates"', add
label define mbpld_sp_lbl 54400 `"Yemen Arab Republic (North)"', add
label define mbpld_sp_lbl 54500 `"Yemen, PDR (South)"', add
label define mbpld_sp_lbl 54600 `"Persian Gulf States, ns"', add
label define mbpld_sp_lbl 54700 `"Middle East, n.s."', add
label define mbpld_sp_lbl 54800 `"Southwest Asia, nec/ns"', add
label define mbpld_sp_lbl 54900 `"Asia Minor, n.s."', add
label define mbpld_sp_lbl 55000 `"South Asia, n.e.c."', add
label define mbpld_sp_lbl 59900 `"Asia, nec/ns"', add
label define mbpld_sp_lbl 60000 `"AFRICA"', add
label define mbpld_sp_lbl 60010 `"Northern Africa"', add
label define mbpld_sp_lbl 60011 `"Algeria"', add
label define mbpld_sp_lbl 60012 `"Egypt/United Arab Rep."', add
label define mbpld_sp_lbl 60013 `"Libya"', add
label define mbpld_sp_lbl 60014 `"Morocco"', add
label define mbpld_sp_lbl 60015 `"Sudan"', add
label define mbpld_sp_lbl 60016 `"Tunisia"', add
label define mbpld_sp_lbl 60017 `"Western Sahara"', add
label define mbpld_sp_lbl 60019 `"North Africa, ns"', add
label define mbpld_sp_lbl 60020 `"Benin"', add
label define mbpld_sp_lbl 60021 `"Burkina Faso"', add
label define mbpld_sp_lbl 60022 `"Gambia"', add
label define mbpld_sp_lbl 60023 `"Ghana"', add
label define mbpld_sp_lbl 60024 `"Guinea"', add
label define mbpld_sp_lbl 60025 `"Guinea-Bissau"', add
label define mbpld_sp_lbl 60026 `"Ivory Coast"', add
label define mbpld_sp_lbl 60027 `"Liberia"', add
label define mbpld_sp_lbl 60028 `"Mali"', add
label define mbpld_sp_lbl 60029 `"Mauritania"', add
label define mbpld_sp_lbl 60030 `"Niger"', add
label define mbpld_sp_lbl 60031 `"Nigeria"', add
label define mbpld_sp_lbl 60032 `"Senegal"', add
label define mbpld_sp_lbl 60033 `"Sierra Leone"', add
label define mbpld_sp_lbl 60034 `"Togo"', add
label define mbpld_sp_lbl 60038 `"Western Africa, n.s."', add
label define mbpld_sp_lbl 60039 `"French West Africa, ns"', add
label define mbpld_sp_lbl 60040 `"British Indian Ocean Territory"', add
label define mbpld_sp_lbl 60041 `"Burundi"', add
label define mbpld_sp_lbl 60042 `"Comoros"', add
label define mbpld_sp_lbl 60043 `"Djibouti"', add
label define mbpld_sp_lbl 60044 `"Ethiopia"', add
label define mbpld_sp_lbl 60045 `"Kenya"', add
label define mbpld_sp_lbl 60046 `"Madagascar"', add
label define mbpld_sp_lbl 60047 `"Malawi"', add
label define mbpld_sp_lbl 60048 `"Mauritius"', add
label define mbpld_sp_lbl 60049 `"Mozambique"', add
label define mbpld_sp_lbl 60050 `"Reunion"', add
label define mbpld_sp_lbl 60051 `"Rwanda"', add
label define mbpld_sp_lbl 60052 `"Seychelles"', add
label define mbpld_sp_lbl 60053 `"Somalia"', add
label define mbpld_sp_lbl 60054 `"Tanzania"', add
label define mbpld_sp_lbl 60055 `"Uganda"', add
label define mbpld_sp_lbl 60056 `"Zambia"', add
label define mbpld_sp_lbl 60057 `"Zimbabwe"', add
label define mbpld_sp_lbl 60058 `"Bassas de India"', add
label define mbpld_sp_lbl 60059 `"Europa"', add
label define mbpld_sp_lbl 60060 `"Gloriosos"', add
label define mbpld_sp_lbl 60061 `"Juan de Nova"', add
label define mbpld_sp_lbl 60062 `"Mayotte"', add
label define mbpld_sp_lbl 60063 `"Tromelin"', add
label define mbpld_sp_lbl 60064 `"Eastern Africa, nec/ns"', add
label define mbpld_sp_lbl 60065 `"Eritrea"', add
label define mbpld_sp_lbl 60070 `"Central Africa"', add
label define mbpld_sp_lbl 60071 `"Angola"', add
label define mbpld_sp_lbl 60072 `"Cameroon"', add
label define mbpld_sp_lbl 60073 `"Central African Republic"', add
label define mbpld_sp_lbl 60074 `"Chad"', add
label define mbpld_sp_lbl 60075 `"Congo"', add
label define mbpld_sp_lbl 60076 `"Equatorial Guinea"', add
label define mbpld_sp_lbl 60077 `"Gabon"', add
label define mbpld_sp_lbl 60078 `"Sao Tome and Principe"', add
label define mbpld_sp_lbl 60079 `"Zaire"', add
label define mbpld_sp_lbl 60080 `"Central Africa, ns"', add
label define mbpld_sp_lbl 60081 `"Equatorial Africa, ns"', add
label define mbpld_sp_lbl 60082 `"French Equatorial Africa, ns"', add
label define mbpld_sp_lbl 60090 `"Southern Africa"', add
label define mbpld_sp_lbl 60091 `"Botswana"', add
label define mbpld_sp_lbl 60092 `"Lesotho"', add
label define mbpld_sp_lbl 60093 `"Namibia"', add
label define mbpld_sp_lbl 60094 `"South Africa (Union of)"', add
label define mbpld_sp_lbl 60095 `"Swaziland"', add
label define mbpld_sp_lbl 60096 `"Southern Africa, n.s."', add
label define mbpld_sp_lbl 60099 `"Africa, ns/nec"', add
label define mbpld_sp_lbl 70000 `"Australia and New Zealand"', add
label define mbpld_sp_lbl 70010 `"Australia"', add
label define mbpld_sp_lbl 70011 `"Ashmore and Cartier Islands"', add
label define mbpld_sp_lbl 70012 `"Coral Sea Islands Territory"', add
label define mbpld_sp_lbl 70013 `"Christmas Island"', add
label define mbpld_sp_lbl 70014 `"Cocos Islands"', add
label define mbpld_sp_lbl 70020 `"New Zealand"', add
label define mbpld_sp_lbl 71000 `"Pacific Islands"', add
label define mbpld_sp_lbl 71010 `"New Caledonia"', add
label define mbpld_sp_lbl 71012 `"Papua New Guinea"', add
label define mbpld_sp_lbl 71013 `"Solomon Islands"', add
label define mbpld_sp_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define mbpld_sp_lbl 71016 `"Melanesia, ns"', add
label define mbpld_sp_lbl 71017 `"Norfolk Islands"', add
label define mbpld_sp_lbl 71018 `"Niue"', add
label define mbpld_sp_lbl 71020 `"Cook Islands"', add
label define mbpld_sp_lbl 71021 `"Fiji"', add
label define mbpld_sp_lbl 71022 `"French Polynesia"', add
label define mbpld_sp_lbl 71023 `"Tonga"', add
label define mbpld_sp_lbl 71024 `"Wallis and Futuna Islands"', add
label define mbpld_sp_lbl 71025 `"Western Samoa"', add
label define mbpld_sp_lbl 71026 `"Pitcairn Island"', add
label define mbpld_sp_lbl 71027 `"Tokelau"', add
label define mbpld_sp_lbl 71028 `"Tuvalu"', add
label define mbpld_sp_lbl 71029 `"Polynesia, n.s."', add
label define mbpld_sp_lbl 71032 `"Kiribati"', add
label define mbpld_sp_lbl 71033 `"Canton and Enderbury"', add
label define mbpld_sp_lbl 71034 `"Nauru"', add
label define mbpld_sp_lbl 71039 `"Micronesia, ns"', add
label define mbpld_sp_lbl 71040 `"US Pacific Trust Territories"', add
label define mbpld_sp_lbl 71041 `"Marshall Islands"', add
label define mbpld_sp_lbl 71042 `"Micronesia"', add
label define mbpld_sp_lbl 71043 `"Kosrae"', add
label define mbpld_sp_lbl 71044 `"Pohnpei"', add
label define mbpld_sp_lbl 71045 `"Truk"', add
label define mbpld_sp_lbl 71046 `"Yap"', add
label define mbpld_sp_lbl 71047 `"Northern Mariana Islands"', add
label define mbpld_sp_lbl 71048 `"Palau"', add
label define mbpld_sp_lbl 71049 `"Pacific Trust Terr, ns"', add
label define mbpld_sp_lbl 71050 `"Clipperton Island"', add
label define mbpld_sp_lbl 71090 `"Oceania, ns/nec"', add
label define mbpld_sp_lbl 80000 `"Antarctica, ns/nec"', add
label define mbpld_sp_lbl 80010 `"Bouvet Islands"', add
label define mbpld_sp_lbl 80020 `"British Antarctic Terr."', add
label define mbpld_sp_lbl 80030 `"Dronning Maud Land"', add
label define mbpld_sp_lbl 80040 `"French Southern and Antarctic Lands"', add
label define mbpld_sp_lbl 80050 `"Heard and McDonald Islands"', add
label define mbpld_sp_lbl 90000 `"Abroad (unknown) or at sea"', add
label define mbpld_sp_lbl 90010 `"Abroad, ns"', add
label define mbpld_sp_lbl 90011 `"Abroad (US citizen)"', add
label define mbpld_sp_lbl 90020 `"At sea"', add
label define mbpld_sp_lbl 90021 `"At sea (US citizen)"', add
label define mbpld_sp_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define mbpld_sp_lbl 95000 `"Other n.e.c."', add
label define mbpld_sp_lbl 99700 `"Unknown"', add
label define mbpld_sp_lbl 99900 `"Missing/blank"', add
label values mbpld_sp mbpld_sp_lbl

label define fbpl_head_lbl 000 `"Not Applicable"'
label define fbpl_head_lbl 001 `"Alabama"', add
label define fbpl_head_lbl 002 `"Alaska"', add
label define fbpl_head_lbl 004 `"Arizona"', add
label define fbpl_head_lbl 005 `"Arkansas"', add
label define fbpl_head_lbl 006 `"California"', add
label define fbpl_head_lbl 008 `"Colorado"', add
label define fbpl_head_lbl 009 `"Connecticut"', add
label define fbpl_head_lbl 010 `"Delaware"', add
label define fbpl_head_lbl 011 `"District of Columbia"', add
label define fbpl_head_lbl 012 `"Florida"', add
label define fbpl_head_lbl 013 `"Georgia"', add
label define fbpl_head_lbl 015 `"Hawaii"', add
label define fbpl_head_lbl 016 `"Idaho"', add
label define fbpl_head_lbl 017 `"Illinois"', add
label define fbpl_head_lbl 018 `"Indiana"', add
label define fbpl_head_lbl 019 `"Iowa"', add
label define fbpl_head_lbl 020 `"Kansas"', add
label define fbpl_head_lbl 021 `"Kentucky"', add
label define fbpl_head_lbl 022 `"Louisiana"', add
label define fbpl_head_lbl 023 `"Maine"', add
label define fbpl_head_lbl 024 `"Maryland"', add
label define fbpl_head_lbl 025 `"Massachusetts"', add
label define fbpl_head_lbl 026 `"Michigan"', add
label define fbpl_head_lbl 027 `"Minnesota"', add
label define fbpl_head_lbl 028 `"Mississippi"', add
label define fbpl_head_lbl 029 `"Missouri"', add
label define fbpl_head_lbl 030 `"Montana"', add
label define fbpl_head_lbl 031 `"Nebraska"', add
label define fbpl_head_lbl 032 `"Nevada"', add
label define fbpl_head_lbl 033 `"New Hampshire"', add
label define fbpl_head_lbl 034 `"New Jersey"', add
label define fbpl_head_lbl 035 `"New Mexico"', add
label define fbpl_head_lbl 036 `"New York"', add
label define fbpl_head_lbl 037 `"North Carolina"', add
label define fbpl_head_lbl 038 `"North Dakota"', add
label define fbpl_head_lbl 039 `"Ohio"', add
label define fbpl_head_lbl 040 `"Oklahoma"', add
label define fbpl_head_lbl 041 `"Oregon"', add
label define fbpl_head_lbl 042 `"Pennsylvania"', add
label define fbpl_head_lbl 044 `"Rhode Island"', add
label define fbpl_head_lbl 045 `"South Carolina"', add
label define fbpl_head_lbl 046 `"South Dakota"', add
label define fbpl_head_lbl 047 `"Tennessee"', add
label define fbpl_head_lbl 048 `"Texas"', add
label define fbpl_head_lbl 049 `"Utah"', add
label define fbpl_head_lbl 050 `"Vermont"', add
label define fbpl_head_lbl 051 `"Virginia"', add
label define fbpl_head_lbl 053 `"Washington"', add
label define fbpl_head_lbl 054 `"West Virginia"', add
label define fbpl_head_lbl 055 `"Wisconsin"', add
label define fbpl_head_lbl 056 `"Wyoming"', add
label define fbpl_head_lbl 090 `"Native American"', add
label define fbpl_head_lbl 099 `"United States, ns"', add
label define fbpl_head_lbl 100 `"American Samoa"', add
label define fbpl_head_lbl 105 `"Guam"', add
label define fbpl_head_lbl 110 `"Puerto Rico"', add
label define fbpl_head_lbl 115 `"US Virgin Islands"', add
label define fbpl_head_lbl 120 `"Other US Possessions"', add
label define fbpl_head_lbl 150 `"Canada"', add
label define fbpl_head_lbl 155 `"St Pierre and Miquelon"', add
label define fbpl_head_lbl 160 `"Atlantic Islands"', add
label define fbpl_head_lbl 199 `"North America, n.s."', add
label define fbpl_head_lbl 200 `"Mexico"', add
label define fbpl_head_lbl 210 `"Central America"', add
label define fbpl_head_lbl 250 `"Cuba"', add
label define fbpl_head_lbl 260 `"West Indies"', add
label define fbpl_head_lbl 299 `"Americas, n.s."', add
label define fbpl_head_lbl 300 `"SOUTH AMERICA"', add
label define fbpl_head_lbl 400 `"Denmark"', add
label define fbpl_head_lbl 401 `"Finland"', add
label define fbpl_head_lbl 402 `"Iceland"', add
label define fbpl_head_lbl 403 `"Lapland, n.s."', add
label define fbpl_head_lbl 404 `"Norway"', add
label define fbpl_head_lbl 405 `"Sweden"', add
label define fbpl_head_lbl 406 `"Svalbard"', add
label define fbpl_head_lbl 410 `"England"', add
label define fbpl_head_lbl 411 `"Scotland"', add
label define fbpl_head_lbl 412 `"Wales"', add
label define fbpl_head_lbl 413 `"United Kingdom, ns"', add
label define fbpl_head_lbl 414 `"Ireland"', add
label define fbpl_head_lbl 419 `"Northern Europe, ns"', add
label define fbpl_head_lbl 420 `"Belgium"', add
label define fbpl_head_lbl 421 `"France"', add
label define fbpl_head_lbl 422 `"Liechtenstein"', add
label define fbpl_head_lbl 423 `"Luxembourg"', add
label define fbpl_head_lbl 424 `"Monaco"', add
label define fbpl_head_lbl 425 `"Netherlands"', add
label define fbpl_head_lbl 426 `"Switzerland"', add
label define fbpl_head_lbl 429 `"Western Europe, ns"', add
label define fbpl_head_lbl 430 `"Albania"', add
label define fbpl_head_lbl 431 `"Andorra"', add
label define fbpl_head_lbl 432 `"Gibraltar"', add
label define fbpl_head_lbl 433 `"Greece"', add
label define fbpl_head_lbl 434 `"Italy"', add
label define fbpl_head_lbl 435 `"Malta"', add
label define fbpl_head_lbl 436 `"Portugal"', add
label define fbpl_head_lbl 437 `"San Marino"', add
label define fbpl_head_lbl 438 `"Spain"', add
label define fbpl_head_lbl 439 `"Vatican City"', add
label define fbpl_head_lbl 440 `"Southern Europe, n.s."', add
label define fbpl_head_lbl 450 `"Austria"', add
label define fbpl_head_lbl 451 `"Bulgaria"', add
label define fbpl_head_lbl 452 `"Czechsolovakia"', add
label define fbpl_head_lbl 453 `"Germany"', add
label define fbpl_head_lbl 454 `"Hungary"', add
label define fbpl_head_lbl 455 `"Poland"', add
label define fbpl_head_lbl 456 `"Romania"', add
label define fbpl_head_lbl 457 `"Yugoslavia"', add
label define fbpl_head_lbl 458 `"Central Europe, ns"', add
label define fbpl_head_lbl 459 `"Eastern Europe, ns"', add
label define fbpl_head_lbl 460 `"Estonia"', add
label define fbpl_head_lbl 461 `"Latvia"', add
label define fbpl_head_lbl 462 `"Lithuania"', add
label define fbpl_head_lbl 463 `"Baltic States, ns"', add
label define fbpl_head_lbl 465 `"Other USSR/Russia"', add
label define fbpl_head_lbl 499 `"Europe, nec/ns"', add
label define fbpl_head_lbl 500 `"China"', add
label define fbpl_head_lbl 501 `"Japan"', add
label define fbpl_head_lbl 502 `"Korea"', add
label define fbpl_head_lbl 510 `"Brunei"', add
label define fbpl_head_lbl 511 `"Cambodia (Kampuchea)"', add
label define fbpl_head_lbl 512 `"Indonesia"', add
label define fbpl_head_lbl 513 `"Laos"', add
label define fbpl_head_lbl 514 `"Malaysia"', add
label define fbpl_head_lbl 515 `"Philippines"', add
label define fbpl_head_lbl 516 `"Singapore"', add
label define fbpl_head_lbl 517 `"Thailand"', add
label define fbpl_head_lbl 518 `"Vietnam"', add
label define fbpl_head_lbl 519 `"Southeast Asia, ns"', add
label define fbpl_head_lbl 520 `"Afghanistan"', add
label define fbpl_head_lbl 521 `"India"', add
label define fbpl_head_lbl 522 `"Iran"', add
label define fbpl_head_lbl 523 `"Maldives"', add
label define fbpl_head_lbl 524 `"Nepal"', add
label define fbpl_head_lbl 530 `"Bahrain"', add
label define fbpl_head_lbl 531 `"Cyprus"', add
label define fbpl_head_lbl 532 `"Iraq"', add
label define fbpl_head_lbl 533 `"Iraq/Saudi Arabia"', add
label define fbpl_head_lbl 534 `"Israel/Palestine"', add
label define fbpl_head_lbl 535 `"Jordan"', add
label define fbpl_head_lbl 536 `"Kuwait"', add
label define fbpl_head_lbl 537 `"Lebanon"', add
label define fbpl_head_lbl 538 `"Oman"', add
label define fbpl_head_lbl 539 `"Qatar"', add
label define fbpl_head_lbl 540 `"Saudi Arabia"', add
label define fbpl_head_lbl 541 `"Syria"', add
label define fbpl_head_lbl 542 `"Turkey"', add
label define fbpl_head_lbl 543 `"United Arab Emirates"', add
label define fbpl_head_lbl 544 `"Yemen Arab Republic (North)"', add
label define fbpl_head_lbl 545 `"Yemen, PDR (South)"', add
label define fbpl_head_lbl 546 `"Persian Gulf States, n.s."', add
label define fbpl_head_lbl 547 `"Middle East, ns"', add
label define fbpl_head_lbl 548 `"Southwest Asia, nec/ns"', add
label define fbpl_head_lbl 549 `"Asia Minor, n.s."', add
label define fbpl_head_lbl 550 `"South Asia, n.e.c."', add
label define fbpl_head_lbl 599 `"Asia, nec/ns"', add
label define fbpl_head_lbl 600 `"AFRICA"', add
label define fbpl_head_lbl 700 `"Australia and New Zealand"', add
label define fbpl_head_lbl 710 `"Pacific Islands"', add
label define fbpl_head_lbl 900 `"Abroad (unknown) or at sea"', add
label define fbpl_head_lbl 950 `"Other n.e.c."', add
label define fbpl_head_lbl 997 `"Unknown"', add
label define fbpl_head_lbl 998 `"Illegible"', add
label define fbpl_head_lbl 999 `"Missing/blank"', add
label values fbpl_head fbpl_head_lbl

label define fbpl_sp_lbl 000 `"Not Applicable"'
label define fbpl_sp_lbl 001 `"Alabama"', add
label define fbpl_sp_lbl 002 `"Alaska"', add
label define fbpl_sp_lbl 004 `"Arizona"', add
label define fbpl_sp_lbl 005 `"Arkansas"', add
label define fbpl_sp_lbl 006 `"California"', add
label define fbpl_sp_lbl 008 `"Colorado"', add
label define fbpl_sp_lbl 009 `"Connecticut"', add
label define fbpl_sp_lbl 010 `"Delaware"', add
label define fbpl_sp_lbl 011 `"District of Columbia"', add
label define fbpl_sp_lbl 012 `"Florida"', add
label define fbpl_sp_lbl 013 `"Georgia"', add
label define fbpl_sp_lbl 015 `"Hawaii"', add
label define fbpl_sp_lbl 016 `"Idaho"', add
label define fbpl_sp_lbl 017 `"Illinois"', add
label define fbpl_sp_lbl 018 `"Indiana"', add
label define fbpl_sp_lbl 019 `"Iowa"', add
label define fbpl_sp_lbl 020 `"Kansas"', add
label define fbpl_sp_lbl 021 `"Kentucky"', add
label define fbpl_sp_lbl 022 `"Louisiana"', add
label define fbpl_sp_lbl 023 `"Maine"', add
label define fbpl_sp_lbl 024 `"Maryland"', add
label define fbpl_sp_lbl 025 `"Massachusetts"', add
label define fbpl_sp_lbl 026 `"Michigan"', add
label define fbpl_sp_lbl 027 `"Minnesota"', add
label define fbpl_sp_lbl 028 `"Mississippi"', add
label define fbpl_sp_lbl 029 `"Missouri"', add
label define fbpl_sp_lbl 030 `"Montana"', add
label define fbpl_sp_lbl 031 `"Nebraska"', add
label define fbpl_sp_lbl 032 `"Nevada"', add
label define fbpl_sp_lbl 033 `"New Hampshire"', add
label define fbpl_sp_lbl 034 `"New Jersey"', add
label define fbpl_sp_lbl 035 `"New Mexico"', add
label define fbpl_sp_lbl 036 `"New York"', add
label define fbpl_sp_lbl 037 `"North Carolina"', add
label define fbpl_sp_lbl 038 `"North Dakota"', add
label define fbpl_sp_lbl 039 `"Ohio"', add
label define fbpl_sp_lbl 040 `"Oklahoma"', add
label define fbpl_sp_lbl 041 `"Oregon"', add
label define fbpl_sp_lbl 042 `"Pennsylvania"', add
label define fbpl_sp_lbl 044 `"Rhode Island"', add
label define fbpl_sp_lbl 045 `"South Carolina"', add
label define fbpl_sp_lbl 046 `"South Dakota"', add
label define fbpl_sp_lbl 047 `"Tennessee"', add
label define fbpl_sp_lbl 048 `"Texas"', add
label define fbpl_sp_lbl 049 `"Utah"', add
label define fbpl_sp_lbl 050 `"Vermont"', add
label define fbpl_sp_lbl 051 `"Virginia"', add
label define fbpl_sp_lbl 053 `"Washington"', add
label define fbpl_sp_lbl 054 `"West Virginia"', add
label define fbpl_sp_lbl 055 `"Wisconsin"', add
label define fbpl_sp_lbl 056 `"Wyoming"', add
label define fbpl_sp_lbl 090 `"Native American"', add
label define fbpl_sp_lbl 099 `"United States, ns"', add
label define fbpl_sp_lbl 100 `"American Samoa"', add
label define fbpl_sp_lbl 105 `"Guam"', add
label define fbpl_sp_lbl 110 `"Puerto Rico"', add
label define fbpl_sp_lbl 115 `"US Virgin Islands"', add
label define fbpl_sp_lbl 120 `"Other US Possessions"', add
label define fbpl_sp_lbl 150 `"Canada"', add
label define fbpl_sp_lbl 155 `"St Pierre and Miquelon"', add
label define fbpl_sp_lbl 160 `"Atlantic Islands"', add
label define fbpl_sp_lbl 199 `"North America, n.s."', add
label define fbpl_sp_lbl 200 `"Mexico"', add
label define fbpl_sp_lbl 210 `"Central America"', add
label define fbpl_sp_lbl 250 `"Cuba"', add
label define fbpl_sp_lbl 260 `"West Indies"', add
label define fbpl_sp_lbl 299 `"Americas, n.s."', add
label define fbpl_sp_lbl 300 `"SOUTH AMERICA"', add
label define fbpl_sp_lbl 400 `"Denmark"', add
label define fbpl_sp_lbl 401 `"Finland"', add
label define fbpl_sp_lbl 402 `"Iceland"', add
label define fbpl_sp_lbl 403 `"Lapland, n.s."', add
label define fbpl_sp_lbl 404 `"Norway"', add
label define fbpl_sp_lbl 405 `"Sweden"', add
label define fbpl_sp_lbl 406 `"Svalbard"', add
label define fbpl_sp_lbl 410 `"England"', add
label define fbpl_sp_lbl 411 `"Scotland"', add
label define fbpl_sp_lbl 412 `"Wales"', add
label define fbpl_sp_lbl 413 `"United Kingdom, ns"', add
label define fbpl_sp_lbl 414 `"Ireland"', add
label define fbpl_sp_lbl 419 `"Northern Europe, ns"', add
label define fbpl_sp_lbl 420 `"Belgium"', add
label define fbpl_sp_lbl 421 `"France"', add
label define fbpl_sp_lbl 422 `"Liechtenstein"', add
label define fbpl_sp_lbl 423 `"Luxembourg"', add
label define fbpl_sp_lbl 424 `"Monaco"', add
label define fbpl_sp_lbl 425 `"Netherlands"', add
label define fbpl_sp_lbl 426 `"Switzerland"', add
label define fbpl_sp_lbl 429 `"Western Europe, ns"', add
label define fbpl_sp_lbl 430 `"Albania"', add
label define fbpl_sp_lbl 431 `"Andorra"', add
label define fbpl_sp_lbl 432 `"Gibraltar"', add
label define fbpl_sp_lbl 433 `"Greece"', add
label define fbpl_sp_lbl 434 `"Italy"', add
label define fbpl_sp_lbl 435 `"Malta"', add
label define fbpl_sp_lbl 436 `"Portugal"', add
label define fbpl_sp_lbl 437 `"San Marino"', add
label define fbpl_sp_lbl 438 `"Spain"', add
label define fbpl_sp_lbl 439 `"Vatican City"', add
label define fbpl_sp_lbl 440 `"Southern Europe, n.s."', add
label define fbpl_sp_lbl 450 `"Austria"', add
label define fbpl_sp_lbl 451 `"Bulgaria"', add
label define fbpl_sp_lbl 452 `"Czechsolovakia"', add
label define fbpl_sp_lbl 453 `"Germany"', add
label define fbpl_sp_lbl 454 `"Hungary"', add
label define fbpl_sp_lbl 455 `"Poland"', add
label define fbpl_sp_lbl 456 `"Romania"', add
label define fbpl_sp_lbl 457 `"Yugoslavia"', add
label define fbpl_sp_lbl 458 `"Central Europe, ns"', add
label define fbpl_sp_lbl 459 `"Eastern Europe, ns"', add
label define fbpl_sp_lbl 460 `"Estonia"', add
label define fbpl_sp_lbl 461 `"Latvia"', add
label define fbpl_sp_lbl 462 `"Lithuania"', add
label define fbpl_sp_lbl 463 `"Baltic States, ns"', add
label define fbpl_sp_lbl 465 `"Other USSR/Russia"', add
label define fbpl_sp_lbl 499 `"Europe, nec/ns"', add
label define fbpl_sp_lbl 500 `"China"', add
label define fbpl_sp_lbl 501 `"Japan"', add
label define fbpl_sp_lbl 502 `"Korea"', add
label define fbpl_sp_lbl 510 `"Brunei"', add
label define fbpl_sp_lbl 511 `"Cambodia (Kampuchea)"', add
label define fbpl_sp_lbl 512 `"Indonesia"', add
label define fbpl_sp_lbl 513 `"Laos"', add
label define fbpl_sp_lbl 514 `"Malaysia"', add
label define fbpl_sp_lbl 515 `"Philippines"', add
label define fbpl_sp_lbl 516 `"Singapore"', add
label define fbpl_sp_lbl 517 `"Thailand"', add
label define fbpl_sp_lbl 518 `"Vietnam"', add
label define fbpl_sp_lbl 519 `"Southeast Asia, ns"', add
label define fbpl_sp_lbl 520 `"Afghanistan"', add
label define fbpl_sp_lbl 521 `"India"', add
label define fbpl_sp_lbl 522 `"Iran"', add
label define fbpl_sp_lbl 523 `"Maldives"', add
label define fbpl_sp_lbl 524 `"Nepal"', add
label define fbpl_sp_lbl 530 `"Bahrain"', add
label define fbpl_sp_lbl 531 `"Cyprus"', add
label define fbpl_sp_lbl 532 `"Iraq"', add
label define fbpl_sp_lbl 533 `"Iraq/Saudi Arabia"', add
label define fbpl_sp_lbl 534 `"Israel/Palestine"', add
label define fbpl_sp_lbl 535 `"Jordan"', add
label define fbpl_sp_lbl 536 `"Kuwait"', add
label define fbpl_sp_lbl 537 `"Lebanon"', add
label define fbpl_sp_lbl 538 `"Oman"', add
label define fbpl_sp_lbl 539 `"Qatar"', add
label define fbpl_sp_lbl 540 `"Saudi Arabia"', add
label define fbpl_sp_lbl 541 `"Syria"', add
label define fbpl_sp_lbl 542 `"Turkey"', add
label define fbpl_sp_lbl 543 `"United Arab Emirates"', add
label define fbpl_sp_lbl 544 `"Yemen Arab Republic (North)"', add
label define fbpl_sp_lbl 545 `"Yemen, PDR (South)"', add
label define fbpl_sp_lbl 546 `"Persian Gulf States, n.s."', add
label define fbpl_sp_lbl 547 `"Middle East, ns"', add
label define fbpl_sp_lbl 548 `"Southwest Asia, nec/ns"', add
label define fbpl_sp_lbl 549 `"Asia Minor, n.s."', add
label define fbpl_sp_lbl 550 `"South Asia, n.e.c."', add
label define fbpl_sp_lbl 599 `"Asia, nec/ns"', add
label define fbpl_sp_lbl 600 `"AFRICA"', add
label define fbpl_sp_lbl 700 `"Australia and New Zealand"', add
label define fbpl_sp_lbl 710 `"Pacific Islands"', add
label define fbpl_sp_lbl 900 `"Abroad (unknown) or at sea"', add
label define fbpl_sp_lbl 950 `"Other n.e.c."', add
label define fbpl_sp_lbl 997 `"Unknown"', add
label define fbpl_sp_lbl 998 `"Illegible"', add
label define fbpl_sp_lbl 999 `"Missing/blank"', add
label values fbpl_sp fbpl_sp_lbl

label define fbpld_head_lbl 00000 `"Not Applicable"'
label define fbpld_head_lbl 00100 `"Alabama"', add
label define fbpld_head_lbl 00200 `"Alaska"', add
label define fbpld_head_lbl 00400 `"Arizona"', add
label define fbpld_head_lbl 00500 `"Arkansas"', add
label define fbpld_head_lbl 00600 `"California"', add
label define fbpld_head_lbl 00800 `"Colorado"', add
label define fbpld_head_lbl 00900 `"Connecticut"', add
label define fbpld_head_lbl 01000 `"Delaware"', add
label define fbpld_head_lbl 01100 `"District of Columbia"', add
label define fbpld_head_lbl 01200 `"Florida"', add
label define fbpld_head_lbl 01300 `"Georgia"', add
label define fbpld_head_lbl 01500 `"Hawaii"', add
label define fbpld_head_lbl 01600 `"Idaho"', add
label define fbpld_head_lbl 01610 `"Idaho Territory"', add
label define fbpld_head_lbl 01700 `"Illinois"', add
label define fbpld_head_lbl 01800 `"Indiana"', add
label define fbpld_head_lbl 01900 `"Iowa"', add
label define fbpld_head_lbl 02000 `"Kansas"', add
label define fbpld_head_lbl 02100 `"Kentucky"', add
label define fbpld_head_lbl 02200 `"Louisiana"', add
label define fbpld_head_lbl 02300 `"Maine"', add
label define fbpld_head_lbl 02400 `"Maryland"', add
label define fbpld_head_lbl 02500 `"Massachusetts"', add
label define fbpld_head_lbl 02600 `"Michigan"', add
label define fbpld_head_lbl 02700 `"Minnesota"', add
label define fbpld_head_lbl 02800 `"Mississippi"', add
label define fbpld_head_lbl 02900 `"Missouri"', add
label define fbpld_head_lbl 03000 `"Montana"', add
label define fbpld_head_lbl 03100 `"Nebraska"', add
label define fbpld_head_lbl 03200 `"Nevada"', add
label define fbpld_head_lbl 03300 `"New Hampshire"', add
label define fbpld_head_lbl 03400 `"New Jersey"', add
label define fbpld_head_lbl 03500 `"New Mexico"', add
label define fbpld_head_lbl 03510 `"New Mexico Territory"', add
label define fbpld_head_lbl 03600 `"New York"', add
label define fbpld_head_lbl 03700 `"North Carolina"', add
label define fbpld_head_lbl 03800 `"North Dakota"', add
label define fbpld_head_lbl 03900 `"Ohio"', add
label define fbpld_head_lbl 04000 `"Oklahoma"', add
label define fbpld_head_lbl 04010 `"Indian Territory"', add
label define fbpld_head_lbl 04100 `"Oregon"', add
label define fbpld_head_lbl 04200 `"Pennsylvania"', add
label define fbpld_head_lbl 04400 `"Rhode Island"', add
label define fbpld_head_lbl 04500 `"South Carolina"', add
label define fbpld_head_lbl 04600 `"South Dakota"', add
label define fbpld_head_lbl 04610 `"Dakota Territory"', add
label define fbpld_head_lbl 04700 `"Tennessee"', add
label define fbpld_head_lbl 04800 `"Texas"', add
label define fbpld_head_lbl 04900 `"Utah"', add
label define fbpld_head_lbl 04910 `"Utah Territory"', add
label define fbpld_head_lbl 05000 `"Vermont"', add
label define fbpld_head_lbl 05100 `"Virginia"', add
label define fbpld_head_lbl 05300 `"Washington"', add
label define fbpld_head_lbl 05400 `"West Virginia"', add
label define fbpld_head_lbl 05500 `"Wisconsin"', add
label define fbpld_head_lbl 05600 `"Wyoming"', add
label define fbpld_head_lbl 05610 `"Wyoming Territory"', add
label define fbpld_head_lbl 09000 `"Native American"', add
label define fbpld_head_lbl 09900 `"United States, ns"', add
label define fbpld_head_lbl 10000 `"American Samoa"', add
label define fbpld_head_lbl 10010 `"Samoa, 1940-1950"', add
label define fbpld_head_lbl 10500 `"Guam"', add
label define fbpld_head_lbl 11000 `"Puerto Rico"', add
label define fbpld_head_lbl 11500 `"US Virgin Islands"', add
label define fbpld_head_lbl 11510 `"St Croix"', add
label define fbpld_head_lbl 11520 `"St. John"', add
label define fbpld_head_lbl 11530 `"St Thomas"', add
label define fbpld_head_lbl 12000 `"Other US Possessions"', add
label define fbpld_head_lbl 12010 `"Johnston Atoll"', add
label define fbpld_head_lbl 12020 `"Midway Islands"', add
label define fbpld_head_lbl 12030 `"Wake Island"', add
label define fbpld_head_lbl 12040 `"Other US Caribbean Islands"', add
label define fbpld_head_lbl 12041 `"Navassa Island"', add
label define fbpld_head_lbl 12050 `"Other US Pacific Is."', add
label define fbpld_head_lbl 12051 `"Baker Island"', add
label define fbpld_head_lbl 12052 `"Howland Island"', add
label define fbpld_head_lbl 12053 `"Jarvis Island"', add
label define fbpld_head_lbl 12054 `"Kingman Reef"', add
label define fbpld_head_lbl 12055 `"Palmyra Atoll"', add
label define fbpld_head_lbl 12056 `"Canton and Enderbury Island"', add
label define fbpld_head_lbl 12090 `"US outlying areas, ns"', add
label define fbpld_head_lbl 12091 `"US Possessions, ns"', add
label define fbpld_head_lbl 12092 `"US territory, ns"', add
label define fbpld_head_lbl 15000 `"Canada"', add
label define fbpld_head_lbl 15010 `"English Canada"', add
label define fbpld_head_lbl 15011 `"British Columbia"', add
label define fbpld_head_lbl 15013 `"Alberta"', add
label define fbpld_head_lbl 15015 `"Saskatchewan"', add
label define fbpld_head_lbl 15017 `"Northwest"', add
label define fbpld_head_lbl 15019 `"Ruperts Land"', add
label define fbpld_head_lbl 15020 `"Manitoba"', add
label define fbpld_head_lbl 15021 `"Red River"', add
label define fbpld_head_lbl 15030 `"Ontario/Upper Canada"', add
label define fbpld_head_lbl 15031 `"Upper Canada"', add
label define fbpld_head_lbl 15032 `"Canada West"', add
label define fbpld_head_lbl 15040 `"New Brunswick"', add
label define fbpld_head_lbl 15042 `"Canada West"', add
label define fbpld_head_lbl 15050 `"Nova Scotia"', add
label define fbpld_head_lbl 15051 `"Cape Breton"', add
label define fbpld_head_lbl 15052 `"Halifax"', add
label define fbpld_head_lbl 15060 `"Prince Edward Island"', add
label define fbpld_head_lbl 15070 `"Newfoundland"', add
label define fbpld_head_lbl 15080 `"French Canada"', add
label define fbpld_head_lbl 15081 `"Quebec"', add
label define fbpld_head_lbl 15082 `"Lower Canada"', add
label define fbpld_head_lbl 15083 `"Canada East"', add
label define fbpld_head_lbl 15500 `"St Pierre and Miquelon"', add
label define fbpld_head_lbl 16000 `"Atlantic Islands"', add
label define fbpld_head_lbl 16010 `"Bermuda"', add
label define fbpld_head_lbl 16020 `"Cape Verde"', add
label define fbpld_head_lbl 16030 `"Falkland Islands"', add
label define fbpld_head_lbl 16040 `"Greenland"', add
label define fbpld_head_lbl 16050 `"St Helena and Ascension"', add
label define fbpld_head_lbl 16060 `"Canary Islands"', add
label define fbpld_head_lbl 19900 `"North America, n.s."', add
label define fbpld_head_lbl 20000 `"Mexico"', add
label define fbpld_head_lbl 21000 `"Central America"', add
label define fbpld_head_lbl 21010 `"Belize/British Honduras"', add
label define fbpld_head_lbl 21020 `"Costa Rica"', add
label define fbpld_head_lbl 21030 `"El Salvador"', add
label define fbpld_head_lbl 21040 `"Guatemala"', add
label define fbpld_head_lbl 21050 `"Honduras"', add
label define fbpld_head_lbl 21060 `"Nicaragua"', add
label define fbpld_head_lbl 21070 `"Panama"', add
label define fbpld_head_lbl 21071 `"Canal Zone"', add
label define fbpld_head_lbl 21090 `"Central America, ns"', add
label define fbpld_head_lbl 25000 `"Cuba"', add
label define fbpld_head_lbl 26000 `"West Indies"', add
label define fbpld_head_lbl 26010 `"Dominican Republic"', add
label define fbpld_head_lbl 26020 `"Haiti"', add
label define fbpld_head_lbl 26030 `"Jamaica"', add
label define fbpld_head_lbl 26040 `"British West Indies"', add
label define fbpld_head_lbl 26041 `"Anguilla"', add
label define fbpld_head_lbl 26042 `"Antigua-Barbuda"', add
label define fbpld_head_lbl 26043 `"Bahamas"', add
label define fbpld_head_lbl 26044 `"Barbados"', add
label define fbpld_head_lbl 26045 `"British Virgin Islands"', add
label define fbpld_head_lbl 26046 `"Anegada"', add
label define fbpld_head_lbl 26047 `"Cooper"', add
label define fbpld_head_lbl 26048 `"Jost Van Dyke"', add
label define fbpld_head_lbl 26049 `"Peter"', add
label define fbpld_head_lbl 26050 `"Tortola"', add
label define fbpld_head_lbl 26051 `"Virgin Gorda"', add
label define fbpld_head_lbl 26052 `"Br. Virgin Islands, ns"', add
label define fbpld_head_lbl 26053 `"Cayman Islands"', add
label define fbpld_head_lbl 26054 `"Dominica"', add
label define fbpld_head_lbl 26055 `"Grenada"', add
label define fbpld_head_lbl 26056 `"Montserrat"', add
label define fbpld_head_lbl 26057 `"St Kitts-Nevis"', add
label define fbpld_head_lbl 26058 `"St Lucia"', add
label define fbpld_head_lbl 26059 `"St Vincent"', add
label define fbpld_head_lbl 26060 `"Trinidad and Tobago"', add
label define fbpld_head_lbl 26061 `"Turks and Caicos"', add
label define fbpld_head_lbl 26069 `"British West Indies, ns"', add
label define fbpld_head_lbl 26070 `"Other West Indies"', add
label define fbpld_head_lbl 26071 `"Aruba"', add
label define fbpld_head_lbl 26072 `"Netherlands Antilles"', add
label define fbpld_head_lbl 26073 `"Bonaire"', add
label define fbpld_head_lbl 26074 `"Curacao"', add
label define fbpld_head_lbl 26075 `"Dutch St. Maarten"', add
label define fbpld_head_lbl 26076 `"Saba"', add
label define fbpld_head_lbl 26077 `"St. Eustatius"', add
label define fbpld_head_lbl 26079 `"Dutch Caribbean, ns"', add
label define fbpld_head_lbl 26080 `"French St Maarten"', add
label define fbpld_head_lbl 26081 `"Guadeloupe"', add
label define fbpld_head_lbl 26082 `"Martinique"', add
label define fbpld_head_lbl 26083 `"St. Barthelemy"', add
label define fbpld_head_lbl 26089 `"French Caribbean, ns"', add
label define fbpld_head_lbl 26090 `"Antilles, n.s."', add
label define fbpld_head_lbl 26091 `"Caribbean, n.s. / n.e.c."', add
label define fbpld_head_lbl 26092 `"Latin America, ns"', add
label define fbpld_head_lbl 26093 `"Leeward Islands, ns"', add
label define fbpld_head_lbl 26094 `"West Indies, ns"', add
label define fbpld_head_lbl 26095 `"Winward Islands"', add
label define fbpld_head_lbl 29900 `"Americas, ns"', add
label define fbpld_head_lbl 30000 `"South America"', add
label define fbpld_head_lbl 30005 `"Argentina"', add
label define fbpld_head_lbl 30010 `"Bolivia"', add
label define fbpld_head_lbl 30015 `"Brazil"', add
label define fbpld_head_lbl 30020 `"Chile"', add
label define fbpld_head_lbl 30025 `"Colombia"', add
label define fbpld_head_lbl 30030 `"Ecuador"', add
label define fbpld_head_lbl 30035 `"French Guiana"', add
label define fbpld_head_lbl 30040 `"Guyana/British Guiana"', add
label define fbpld_head_lbl 30045 `"Paraguay"', add
label define fbpld_head_lbl 30050 `"Peru"', add
label define fbpld_head_lbl 30055 `"Suriname"', add
label define fbpld_head_lbl 30060 `"Uruguay"', add
label define fbpld_head_lbl 30065 `"Venezuela"', add
label define fbpld_head_lbl 30090 `"South America, ns"', add
label define fbpld_head_lbl 30091 `"South and Central America, n.s."', add
label define fbpld_head_lbl 40000 `"Denmark"', add
label define fbpld_head_lbl 40010 `"Faroe Islands"', add
label define fbpld_head_lbl 40100 `"Finland"', add
label define fbpld_head_lbl 40200 `"Iceland"', add
label define fbpld_head_lbl 40300 `"Lapland, ns"', add
label define fbpld_head_lbl 40400 `"Norway"', add
label define fbpld_head_lbl 40410 `"Svalbard and Jan Meyen"', add
label define fbpld_head_lbl 40412 `"Jan Meyen"', add
label define fbpld_head_lbl 40500 `"Sweden"', add
label define fbpld_head_lbl 40600 `"Svalbard"', add
label define fbpld_head_lbl 41000 `"England"', add
label define fbpld_head_lbl 41010 `"Channel Islands"', add
label define fbpld_head_lbl 41011 `"Guernsey"', add
label define fbpld_head_lbl 41012 `"Jersey"', add
label define fbpld_head_lbl 41020 `"Isle of Man"', add
label define fbpld_head_lbl 41100 `"Scotland"', add
label define fbpld_head_lbl 41200 `"Wales"', add
label define fbpld_head_lbl 41300 `"United Kingdom, ns"', add
label define fbpld_head_lbl 41400 `"Ireland"', add
label define fbpld_head_lbl 41410 `"Northern Ireland"', add
label define fbpld_head_lbl 41900 `"Northern Europe, ns"', add
label define fbpld_head_lbl 42000 `"Belgium"', add
label define fbpld_head_lbl 42100 `"France"', add
label define fbpld_head_lbl 42110 `"Alsace-Lorraine"', add
label define fbpld_head_lbl 42111 `"Alsace"', add
label define fbpld_head_lbl 42112 `"Lorraine"', add
label define fbpld_head_lbl 42200 `"Liechtenstein"', add
label define fbpld_head_lbl 42300 `"Luxembourg"', add
label define fbpld_head_lbl 42400 `"Monaco"', add
label define fbpld_head_lbl 42500 `"Netherlands"', add
label define fbpld_head_lbl 42600 `"Switzerland"', add
label define fbpld_head_lbl 42900 `"Western Europe, ns"', add
label define fbpld_head_lbl 43000 `"Albania"', add
label define fbpld_head_lbl 43100 `"Andorra"', add
label define fbpld_head_lbl 43200 `"Gibraltar"', add
label define fbpld_head_lbl 43300 `"Greece"', add
label define fbpld_head_lbl 43310 `"Dodecanese Islands"', add
label define fbpld_head_lbl 43320 `"Turkey Greece"', add
label define fbpld_head_lbl 43330 `"Macedonia"', add
label define fbpld_head_lbl 43400 `"Italy"', add
label define fbpld_head_lbl 43500 `"Malta"', add
label define fbpld_head_lbl 43600 `"Portugal"', add
label define fbpld_head_lbl 43610 `"Azores"', add
label define fbpld_head_lbl 43620 `"Madeira Islands"', add
label define fbpld_head_lbl 43630 `"Cape Verde Islands"', add
label define fbpld_head_lbl 43640 `"St Miguel"', add
label define fbpld_head_lbl 43700 `"San Marino"', add
label define fbpld_head_lbl 43800 `"Spain"', add
label define fbpld_head_lbl 43900 `"Vatican City"', add
label define fbpld_head_lbl 44000 `"Southern Europe, ns"', add
label define fbpld_head_lbl 45000 `"Austria"', add
label define fbpld_head_lbl 45010 `"Austria-Hungary"', add
label define fbpld_head_lbl 45020 `"Austria-Graz"', add
label define fbpld_head_lbl 45030 `"Austria-Linz"', add
label define fbpld_head_lbl 45040 `"Austria-Salzburg"', add
label define fbpld_head_lbl 45050 `"Austria-Tyrol"', add
label define fbpld_head_lbl 45060 `"Austria-Vienna"', add
label define fbpld_head_lbl 45070 `"Austria-Kaernsten"', add
label define fbpld_head_lbl 45080 `"Austria-Neustadt"', add
label define fbpld_head_lbl 45100 `"Bulgaria"', add
label define fbpld_head_lbl 45200 `"Czechsolovakia"', add
label define fbpld_head_lbl 45210 `"Bohemia"', add
label define fbpld_head_lbl 45211 `"Bohemia-Moravia"', add
label define fbpld_head_lbl 45212 `"Slovakia"', add
label define fbpld_head_lbl 45213 `"Czech Republic"', add
label define fbpld_head_lbl 45300 `"Germany"', add
label define fbpld_head_lbl 45301 `"Berlin"', add
label define fbpld_head_lbl 45310 `"West Germany"', add
label define fbpld_head_lbl 45311 `"Baden"', add
label define fbpld_head_lbl 45312 `"Bavaria"', add
label define fbpld_head_lbl 45313 `"Bremen"', add
label define fbpld_head_lbl 45314 `"Braunschweig"', add
label define fbpld_head_lbl 45315 `"Hamburg"', add
label define fbpld_head_lbl 45316 `"Hanover"', add
label define fbpld_head_lbl 45317 `"Hessen"', add
label define fbpld_head_lbl 45318 `"Hesse-Nassau"', add
label define fbpld_head_lbl 45319 `"Holstein"', add
label define fbpld_head_lbl 45320 `"Lippe"', add
label define fbpld_head_lbl 45321 `"Lubeck"', add
label define fbpld_head_lbl 45322 `"Oldenburg"', add
label define fbpld_head_lbl 45323 `"Rheinland"', add
label define fbpld_head_lbl 45324 `"Schleswig"', add
label define fbpld_head_lbl 45325 `"Schleswig-Holstein"', add
label define fbpld_head_lbl 45326 `"Schwarzburg"', add
label define fbpld_head_lbl 45327 `"Waldeck"', add
label define fbpld_head_lbl 45328 `"West Berlin"', add
label define fbpld_head_lbl 45329 `"Westphalia"', add
label define fbpld_head_lbl 45330 `"Wurttemberg"', add
label define fbpld_head_lbl 45331 `"Frankfurt"', add
label define fbpld_head_lbl 45332 `"Saarland"', add
label define fbpld_head_lbl 45333 `"Nordrhein-Westfalen"', add
label define fbpld_head_lbl 45340 `"East Germany"', add
label define fbpld_head_lbl 45341 `"Anhalt"', add
label define fbpld_head_lbl 45342 `"Brandenburg"', add
label define fbpld_head_lbl 45343 `"East Berlin"', add
label define fbpld_head_lbl 45344 `"Mecklenburg"', add
label define fbpld_head_lbl 45345 `"Sachsen-Altenburg"', add
label define fbpld_head_lbl 45346 `"Sachsen-Coburg"', add
label define fbpld_head_lbl 45347 `"Sachsen-Gotha"', add
label define fbpld_head_lbl 45348 `"Sachsen-Meiningen"', add
label define fbpld_head_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define fbpld_head_lbl 45350 `"Saxony"', add
label define fbpld_head_lbl 45351 `"Schwerin"', add
label define fbpld_head_lbl 45352 `"Strelitz"', add
label define fbpld_head_lbl 45353 `"Thuringian States"', add
label define fbpld_head_lbl 45360 `"Prussia, nec"', add
label define fbpld_head_lbl 45361 `"Hohenzollern"', add
label define fbpld_head_lbl 45362 `"Niedersachsen"', add
label define fbpld_head_lbl 45400 `"Hungary"', add
label define fbpld_head_lbl 45500 `"Poland"', add
label define fbpld_head_lbl 45510 `"Austrian Poland"', add
label define fbpld_head_lbl 45511 `"Galicia"', add
label define fbpld_head_lbl 45520 `"German Poland"', add
label define fbpld_head_lbl 45521 `"East Prussia"', add
label define fbpld_head_lbl 45522 `"Pomerania"', add
label define fbpld_head_lbl 45523 `"Posen"', add
label define fbpld_head_lbl 45524 `"Prussian Poland"', add
label define fbpld_head_lbl 45525 `"Silesia"', add
label define fbpld_head_lbl 45526 `"West Prussia"', add
label define fbpld_head_lbl 45530 `"Russian Poland"', add
label define fbpld_head_lbl 45600 `"Romania"', add
label define fbpld_head_lbl 45610 `"Transylvania"', add
label define fbpld_head_lbl 45700 `"Yugoslavia"', add
label define fbpld_head_lbl 45710 `"Croatia"', add
label define fbpld_head_lbl 45720 `"Montenegro"', add
label define fbpld_head_lbl 45730 `"Serbia"', add
label define fbpld_head_lbl 45740 `"Bosnia"', add
label define fbpld_head_lbl 45750 `"Dalmatia"', add
label define fbpld_head_lbl 45760 `"Slovonia"', add
label define fbpld_head_lbl 45770 `"Carniola"', add
label define fbpld_head_lbl 45780 `"Slovenia"', add
label define fbpld_head_lbl 45790 `"Kosovo"', add
label define fbpld_head_lbl 45800 `"Central Europe, ns"', add
label define fbpld_head_lbl 45900 `"Eastern Europe, ns"', add
label define fbpld_head_lbl 46000 `"Estonia"', add
label define fbpld_head_lbl 46100 `"Latvia"', add
label define fbpld_head_lbl 46200 `"Lithuania"', add
label define fbpld_head_lbl 46300 `"Baltic States, ns"', add
label define fbpld_head_lbl 46500 `"Other USSR/Russia"', add
label define fbpld_head_lbl 46510 `"Byelorussia"', add
label define fbpld_head_lbl 46520 `"Moldavia"', add
label define fbpld_head_lbl 46521 `"Bessarabia"', add
label define fbpld_head_lbl 46530 `"Ukraine"', add
label define fbpld_head_lbl 46540 `"Armenia"', add
label define fbpld_head_lbl 46541 `"Azerbaijan"', add
label define fbpld_head_lbl 46542 `"Republic of Georgia"', add
label define fbpld_head_lbl 46543 `"Kazakhstan"', add
label define fbpld_head_lbl 46544 `"Kirghizia"', add
label define fbpld_head_lbl 46545 `"Tadzhik"', add
label define fbpld_head_lbl 46546 `"Turkmenistan"', add
label define fbpld_head_lbl 46547 `"Uzbekistan"', add
label define fbpld_head_lbl 46548 `"Siberia"', add
label define fbpld_head_lbl 46590 `"USSR, ns"', add
label define fbpld_head_lbl 49900 `"Europe, nec/ns"', add
label define fbpld_head_lbl 50000 `"China"', add
label define fbpld_head_lbl 50010 `"Hong Kong"', add
label define fbpld_head_lbl 50020 `"Macau"', add
label define fbpld_head_lbl 50030 `"Mongolia"', add
label define fbpld_head_lbl 50040 `"Taiwan"', add
label define fbpld_head_lbl 50100 `"Japan"', add
label define fbpld_head_lbl 50200 `"Korea"', add
label define fbpld_head_lbl 50210 `"North Korea"', add
label define fbpld_head_lbl 50220 `"South Korea"', add
label define fbpld_head_lbl 50900 `"East Asia, n.s."', add
label define fbpld_head_lbl 51000 `"Brunei"', add
label define fbpld_head_lbl 51100 `"Cambodia (Kampuchea)"', add
label define fbpld_head_lbl 51200 `"Indonesia"', add
label define fbpld_head_lbl 51210 `"East Indies"', add
label define fbpld_head_lbl 51220 `"East Timor"', add
label define fbpld_head_lbl 51300 `"Laos"', add
label define fbpld_head_lbl 51400 `"Malaysia"', add
label define fbpld_head_lbl 51500 `"Philippines"', add
label define fbpld_head_lbl 51600 `"Singapore"', add
label define fbpld_head_lbl 51700 `"Thailand"', add
label define fbpld_head_lbl 51800 `"Vietnam"', add
label define fbpld_head_lbl 51900 `"Southeast Asia, ns"', add
label define fbpld_head_lbl 51910 `"Indochina, ns"', add
label define fbpld_head_lbl 52000 `"Afghanistan"', add
label define fbpld_head_lbl 52100 `"India"', add
label define fbpld_head_lbl 52110 `"Bangladesh"', add
label define fbpld_head_lbl 52120 `"Bhutan"', add
label define fbpld_head_lbl 52130 `"Burma (Myanmar)"', add
label define fbpld_head_lbl 52140 `"Pakistan"', add
label define fbpld_head_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define fbpld_head_lbl 52200 `"Iran"', add
label define fbpld_head_lbl 52300 `"Maldives"', add
label define fbpld_head_lbl 52400 `"Nepal"', add
label define fbpld_head_lbl 53000 `"Bahrain"', add
label define fbpld_head_lbl 53100 `"Cyprus"', add
label define fbpld_head_lbl 53200 `"Iraq"', add
label define fbpld_head_lbl 53210 `"Mesopotamia"', add
label define fbpld_head_lbl 53300 `"Iraq/Saudi Arabia"', add
label define fbpld_head_lbl 53400 `"Israel/Palestine"', add
label define fbpld_head_lbl 53410 `"Gaza Strip"', add
label define fbpld_head_lbl 53420 `"Palestine"', add
label define fbpld_head_lbl 53430 `"West Bank"', add
label define fbpld_head_lbl 53440 `"Israel"', add
label define fbpld_head_lbl 53500 `"Jordan"', add
label define fbpld_head_lbl 53600 `"Kuwait"', add
label define fbpld_head_lbl 53700 `"Lebanon"', add
label define fbpld_head_lbl 53800 `"Oman"', add
label define fbpld_head_lbl 53900 `"Qatar"', add
label define fbpld_head_lbl 54000 `"Saudi Arabia"', add
label define fbpld_head_lbl 54100 `"Syria"', add
label define fbpld_head_lbl 54200 `"Turkey"', add
label define fbpld_head_lbl 54210 `"European Turkey"', add
label define fbpld_head_lbl 54220 `"Asian Turkey"', add
label define fbpld_head_lbl 54300 `"United Arab Emirates"', add
label define fbpld_head_lbl 54400 `"Yemen Arab Republic (North)"', add
label define fbpld_head_lbl 54500 `"Yemen, PDR (South)"', add
label define fbpld_head_lbl 54600 `"Persian Gulf States, ns"', add
label define fbpld_head_lbl 54700 `"Middle East, ns"', add
label define fbpld_head_lbl 54800 `"Southwest Asia, nec/ns"', add
label define fbpld_head_lbl 54900 `"Asia Minor, ns"', add
label define fbpld_head_lbl 55000 `"South Asia, n.e.c."', add
label define fbpld_head_lbl 59900 `"Asia, nec/ns"', add
label define fbpld_head_lbl 60000 `"Africa"', add
label define fbpld_head_lbl 60010 `"Northern Africa"', add
label define fbpld_head_lbl 60011 `"Algeria"', add
label define fbpld_head_lbl 60012 `"Egypt/United Arab Rep"', add
label define fbpld_head_lbl 60013 `"Libya"', add
label define fbpld_head_lbl 60014 `"Morocco"', add
label define fbpld_head_lbl 60015 `"Sudan"', add
label define fbpld_head_lbl 60016 `"Tunisia"', add
label define fbpld_head_lbl 60017 `"Western Sahara"', add
label define fbpld_head_lbl 60019 `"North Africa, ns"', add
label define fbpld_head_lbl 60020 `"Benin"', add
label define fbpld_head_lbl 60021 `"Burkina Faso"', add
label define fbpld_head_lbl 60022 `"Gambia"', add
label define fbpld_head_lbl 60023 `"Ghana"', add
label define fbpld_head_lbl 60024 `"Guinea"', add
label define fbpld_head_lbl 60025 `"Guinea-Bissau"', add
label define fbpld_head_lbl 60026 `"Ivory Coast"', add
label define fbpld_head_lbl 60027 `"Liberia"', add
label define fbpld_head_lbl 60028 `"Mali"', add
label define fbpld_head_lbl 60029 `"Mauritania"', add
label define fbpld_head_lbl 60030 `"Niger"', add
label define fbpld_head_lbl 60031 `"Nigeria"', add
label define fbpld_head_lbl 60032 `"Senegal"', add
label define fbpld_head_lbl 60033 `"Sierra Leone"', add
label define fbpld_head_lbl 60034 `"Togo"', add
label define fbpld_head_lbl 60038 `"Western Africa, n.s."', add
label define fbpld_head_lbl 60039 `"French West Africa, ns"', add
label define fbpld_head_lbl 60040 `"British Indian Ocean Territory"', add
label define fbpld_head_lbl 60041 `"Burundi"', add
label define fbpld_head_lbl 60042 `"Comoros"', add
label define fbpld_head_lbl 60043 `"Djibouti"', add
label define fbpld_head_lbl 60044 `"Ethiopia"', add
label define fbpld_head_lbl 60045 `"Kenya"', add
label define fbpld_head_lbl 60046 `"Madagascar"', add
label define fbpld_head_lbl 60047 `"Malawi"', add
label define fbpld_head_lbl 60048 `"Mauritius"', add
label define fbpld_head_lbl 60049 `"Mozambique"', add
label define fbpld_head_lbl 60050 `"Reunion"', add
label define fbpld_head_lbl 60051 `"Rwanda"', add
label define fbpld_head_lbl 60052 `"Seychelles"', add
label define fbpld_head_lbl 60053 `"Somalia"', add
label define fbpld_head_lbl 60054 `"Tanzania"', add
label define fbpld_head_lbl 60055 `"Uganda"', add
label define fbpld_head_lbl 60056 `"Zambia"', add
label define fbpld_head_lbl 60057 `"Zimbabwe"', add
label define fbpld_head_lbl 60058 `"Bassas de India"', add
label define fbpld_head_lbl 60059 `"Europa"', add
label define fbpld_head_lbl 60060 `"Gloriosos"', add
label define fbpld_head_lbl 60061 `"Juan de Nova"', add
label define fbpld_head_lbl 60062 `"Mayotte"', add
label define fbpld_head_lbl 60063 `"Tromelin"', add
label define fbpld_head_lbl 60064 `"Eastern Africa, nec/ns"', add
label define fbpld_head_lbl 60065 `"Eritrea"', add
label define fbpld_head_lbl 60070 `"Central Africa"', add
label define fbpld_head_lbl 60071 `"Angola"', add
label define fbpld_head_lbl 60072 `"Cameroon"', add
label define fbpld_head_lbl 60073 `"Central African Republic"', add
label define fbpld_head_lbl 60074 `"Chad"', add
label define fbpld_head_lbl 60075 `"Congo"', add
label define fbpld_head_lbl 60076 `"Equatorial Guinea"', add
label define fbpld_head_lbl 60077 `"Gabon"', add
label define fbpld_head_lbl 60078 `"Sao Tome and Principe"', add
label define fbpld_head_lbl 60079 `"Zaire"', add
label define fbpld_head_lbl 60080 `"Central Africa, ns"', add
label define fbpld_head_lbl 60081 `"Equatorial Africa, ns"', add
label define fbpld_head_lbl 60082 `"French Equatorial Africa, ns"', add
label define fbpld_head_lbl 60090 `"Southern Africa"', add
label define fbpld_head_lbl 60091 `"Botswana"', add
label define fbpld_head_lbl 60092 `"Lesotho"', add
label define fbpld_head_lbl 60093 `"Namibia"', add
label define fbpld_head_lbl 60094 `"South Africa (Union of)"', add
label define fbpld_head_lbl 60095 `"Swaziland"', add
label define fbpld_head_lbl 60096 `"Southern Africa, n.s."', add
label define fbpld_head_lbl 60099 `"Africa, ns/nec"', add
label define fbpld_head_lbl 70000 `"Australia and New Zealand"', add
label define fbpld_head_lbl 70010 `"Australia"', add
label define fbpld_head_lbl 70011 `"Ashmore and Cartier Islands"', add
label define fbpld_head_lbl 70012 `"Coral Sea Islands Territory"', add
label define fbpld_head_lbl 70013 `"Christmas Island"', add
label define fbpld_head_lbl 70014 `"Cocos Islands"', add
label define fbpld_head_lbl 70020 `"New Zealand"', add
label define fbpld_head_lbl 71000 `"Pacific Islands"', add
label define fbpld_head_lbl 71010 `"New Caledonia"', add
label define fbpld_head_lbl 71012 `"Papua New Guinea"', add
label define fbpld_head_lbl 71013 `"Solomon Islands"', add
label define fbpld_head_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define fbpld_head_lbl 71016 `"Melanesia, ns"', add
label define fbpld_head_lbl 71017 `"Norfolk Islands"', add
label define fbpld_head_lbl 71018 `"Niue"', add
label define fbpld_head_lbl 71020 `"Cook Islands"', add
label define fbpld_head_lbl 71021 `"Fiji"', add
label define fbpld_head_lbl 71022 `"French Polynesia"', add
label define fbpld_head_lbl 71023 `"Tonga"', add
label define fbpld_head_lbl 71024 `"Wallis and Futuna Islands"', add
label define fbpld_head_lbl 71025 `"Western Samoa"', add
label define fbpld_head_lbl 71026 `"Pitcairn Island"', add
label define fbpld_head_lbl 71027 `"Tokelau"', add
label define fbpld_head_lbl 71028 `"Tuvalu"', add
label define fbpld_head_lbl 71029 `"Polynesia, n.s."', add
label define fbpld_head_lbl 71032 `"Kiribati"', add
label define fbpld_head_lbl 71033 `"Canton and Enderbury"', add
label define fbpld_head_lbl 71034 `"Nauru"', add
label define fbpld_head_lbl 71039 `"Micronesia, ns"', add
label define fbpld_head_lbl 71040 `"US Pacific Trust Territories"', add
label define fbpld_head_lbl 71041 `"Marshall Islands"', add
label define fbpld_head_lbl 71042 `"Micronesia"', add
label define fbpld_head_lbl 71043 `"Kosrae"', add
label define fbpld_head_lbl 71044 `"Pohnpei"', add
label define fbpld_head_lbl 71045 `"Truk"', add
label define fbpld_head_lbl 71046 `"Yap"', add
label define fbpld_head_lbl 71047 `"Northern Mariana Islands"', add
label define fbpld_head_lbl 71048 `"Palau"', add
label define fbpld_head_lbl 71049 `"Pacific Trust Terr, ns"', add
label define fbpld_head_lbl 71050 `"Clipperton Island"', add
label define fbpld_head_lbl 71090 `"Oceania, ns/nec"', add
label define fbpld_head_lbl 80000 `"Antarctica, ns/nec"', add
label define fbpld_head_lbl 80010 `"Bouvet Islands"', add
label define fbpld_head_lbl 80020 `"British Antarctic Terr."', add
label define fbpld_head_lbl 80030 `"Dronning Maud Land"', add
label define fbpld_head_lbl 80040 `"French Southern and Antarctic Lands"', add
label define fbpld_head_lbl 80050 `"Heard and McDonald Islands"', add
label define fbpld_head_lbl 90000 `"Abroad (unknown) or at sea"', add
label define fbpld_head_lbl 90010 `"Abroad, ns"', add
label define fbpld_head_lbl 90011 `"Abroad (US citizen)"', add
label define fbpld_head_lbl 90020 `"At sea"', add
label define fbpld_head_lbl 90021 `"At sea (US citizen)"', add
label define fbpld_head_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define fbpld_head_lbl 95000 `"Other n.e.c."', add
label define fbpld_head_lbl 99700 `"Unknown"', add
label define fbpld_head_lbl 99800 `"Illegible"', add
label define fbpld_head_lbl 99900 `"Missing/blank"', add
label values fbpld_head fbpld_head_lbl

label define fbpld_sp_lbl 00000 `"Not Applicable"'
label define fbpld_sp_lbl 00100 `"Alabama"', add
label define fbpld_sp_lbl 00200 `"Alaska"', add
label define fbpld_sp_lbl 00400 `"Arizona"', add
label define fbpld_sp_lbl 00500 `"Arkansas"', add
label define fbpld_sp_lbl 00600 `"California"', add
label define fbpld_sp_lbl 00800 `"Colorado"', add
label define fbpld_sp_lbl 00900 `"Connecticut"', add
label define fbpld_sp_lbl 01000 `"Delaware"', add
label define fbpld_sp_lbl 01100 `"District of Columbia"', add
label define fbpld_sp_lbl 01200 `"Florida"', add
label define fbpld_sp_lbl 01300 `"Georgia"', add
label define fbpld_sp_lbl 01500 `"Hawaii"', add
label define fbpld_sp_lbl 01600 `"Idaho"', add
label define fbpld_sp_lbl 01610 `"Idaho Territory"', add
label define fbpld_sp_lbl 01700 `"Illinois"', add
label define fbpld_sp_lbl 01800 `"Indiana"', add
label define fbpld_sp_lbl 01900 `"Iowa"', add
label define fbpld_sp_lbl 02000 `"Kansas"', add
label define fbpld_sp_lbl 02100 `"Kentucky"', add
label define fbpld_sp_lbl 02200 `"Louisiana"', add
label define fbpld_sp_lbl 02300 `"Maine"', add
label define fbpld_sp_lbl 02400 `"Maryland"', add
label define fbpld_sp_lbl 02500 `"Massachusetts"', add
label define fbpld_sp_lbl 02600 `"Michigan"', add
label define fbpld_sp_lbl 02700 `"Minnesota"', add
label define fbpld_sp_lbl 02800 `"Mississippi"', add
label define fbpld_sp_lbl 02900 `"Missouri"', add
label define fbpld_sp_lbl 03000 `"Montana"', add
label define fbpld_sp_lbl 03100 `"Nebraska"', add
label define fbpld_sp_lbl 03200 `"Nevada"', add
label define fbpld_sp_lbl 03300 `"New Hampshire"', add
label define fbpld_sp_lbl 03400 `"New Jersey"', add
label define fbpld_sp_lbl 03500 `"New Mexico"', add
label define fbpld_sp_lbl 03510 `"New Mexico Territory"', add
label define fbpld_sp_lbl 03600 `"New York"', add
label define fbpld_sp_lbl 03700 `"North Carolina"', add
label define fbpld_sp_lbl 03800 `"North Dakota"', add
label define fbpld_sp_lbl 03900 `"Ohio"', add
label define fbpld_sp_lbl 04000 `"Oklahoma"', add
label define fbpld_sp_lbl 04010 `"Indian Territory"', add
label define fbpld_sp_lbl 04100 `"Oregon"', add
label define fbpld_sp_lbl 04200 `"Pennsylvania"', add
label define fbpld_sp_lbl 04400 `"Rhode Island"', add
label define fbpld_sp_lbl 04500 `"South Carolina"', add
label define fbpld_sp_lbl 04600 `"South Dakota"', add
label define fbpld_sp_lbl 04610 `"Dakota Territory"', add
label define fbpld_sp_lbl 04700 `"Tennessee"', add
label define fbpld_sp_lbl 04800 `"Texas"', add
label define fbpld_sp_lbl 04900 `"Utah"', add
label define fbpld_sp_lbl 04910 `"Utah Territory"', add
label define fbpld_sp_lbl 05000 `"Vermont"', add
label define fbpld_sp_lbl 05100 `"Virginia"', add
label define fbpld_sp_lbl 05300 `"Washington"', add
label define fbpld_sp_lbl 05400 `"West Virginia"', add
label define fbpld_sp_lbl 05500 `"Wisconsin"', add
label define fbpld_sp_lbl 05600 `"Wyoming"', add
label define fbpld_sp_lbl 05610 `"Wyoming Territory"', add
label define fbpld_sp_lbl 09000 `"Native American"', add
label define fbpld_sp_lbl 09900 `"United States, ns"', add
label define fbpld_sp_lbl 10000 `"American Samoa"', add
label define fbpld_sp_lbl 10010 `"Samoa, 1940-1950"', add
label define fbpld_sp_lbl 10500 `"Guam"', add
label define fbpld_sp_lbl 11000 `"Puerto Rico"', add
label define fbpld_sp_lbl 11500 `"US Virgin Islands"', add
label define fbpld_sp_lbl 11510 `"St Croix"', add
label define fbpld_sp_lbl 11520 `"St. John"', add
label define fbpld_sp_lbl 11530 `"St Thomas"', add
label define fbpld_sp_lbl 12000 `"Other US Possessions"', add
label define fbpld_sp_lbl 12010 `"Johnston Atoll"', add
label define fbpld_sp_lbl 12020 `"Midway Islands"', add
label define fbpld_sp_lbl 12030 `"Wake Island"', add
label define fbpld_sp_lbl 12040 `"Other US Caribbean Islands"', add
label define fbpld_sp_lbl 12041 `"Navassa Island"', add
label define fbpld_sp_lbl 12050 `"Other US Pacific Is."', add
label define fbpld_sp_lbl 12051 `"Baker Island"', add
label define fbpld_sp_lbl 12052 `"Howland Island"', add
label define fbpld_sp_lbl 12053 `"Jarvis Island"', add
label define fbpld_sp_lbl 12054 `"Kingman Reef"', add
label define fbpld_sp_lbl 12055 `"Palmyra Atoll"', add
label define fbpld_sp_lbl 12056 `"Canton and Enderbury Island"', add
label define fbpld_sp_lbl 12090 `"US outlying areas, ns"', add
label define fbpld_sp_lbl 12091 `"US Possessions, ns"', add
label define fbpld_sp_lbl 12092 `"US territory, ns"', add
label define fbpld_sp_lbl 15000 `"Canada"', add
label define fbpld_sp_lbl 15010 `"English Canada"', add
label define fbpld_sp_lbl 15011 `"British Columbia"', add
label define fbpld_sp_lbl 15013 `"Alberta"', add
label define fbpld_sp_lbl 15015 `"Saskatchewan"', add
label define fbpld_sp_lbl 15017 `"Northwest"', add
label define fbpld_sp_lbl 15019 `"Ruperts Land"', add
label define fbpld_sp_lbl 15020 `"Manitoba"', add
label define fbpld_sp_lbl 15021 `"Red River"', add
label define fbpld_sp_lbl 15030 `"Ontario/Upper Canada"', add
label define fbpld_sp_lbl 15031 `"Upper Canada"', add
label define fbpld_sp_lbl 15032 `"Canada West"', add
label define fbpld_sp_lbl 15040 `"New Brunswick"', add
label define fbpld_sp_lbl 15042 `"Canada West"', add
label define fbpld_sp_lbl 15050 `"Nova Scotia"', add
label define fbpld_sp_lbl 15051 `"Cape Breton"', add
label define fbpld_sp_lbl 15052 `"Halifax"', add
label define fbpld_sp_lbl 15060 `"Prince Edward Island"', add
label define fbpld_sp_lbl 15070 `"Newfoundland"', add
label define fbpld_sp_lbl 15080 `"French Canada"', add
label define fbpld_sp_lbl 15081 `"Quebec"', add
label define fbpld_sp_lbl 15082 `"Lower Canada"', add
label define fbpld_sp_lbl 15083 `"Canada East"', add
label define fbpld_sp_lbl 15500 `"St Pierre and Miquelon"', add
label define fbpld_sp_lbl 16000 `"Atlantic Islands"', add
label define fbpld_sp_lbl 16010 `"Bermuda"', add
label define fbpld_sp_lbl 16020 `"Cape Verde"', add
label define fbpld_sp_lbl 16030 `"Falkland Islands"', add
label define fbpld_sp_lbl 16040 `"Greenland"', add
label define fbpld_sp_lbl 16050 `"St Helena and Ascension"', add
label define fbpld_sp_lbl 16060 `"Canary Islands"', add
label define fbpld_sp_lbl 19900 `"North America, n.s."', add
label define fbpld_sp_lbl 20000 `"Mexico"', add
label define fbpld_sp_lbl 21000 `"Central America"', add
label define fbpld_sp_lbl 21010 `"Belize/British Honduras"', add
label define fbpld_sp_lbl 21020 `"Costa Rica"', add
label define fbpld_sp_lbl 21030 `"El Salvador"', add
label define fbpld_sp_lbl 21040 `"Guatemala"', add
label define fbpld_sp_lbl 21050 `"Honduras"', add
label define fbpld_sp_lbl 21060 `"Nicaragua"', add
label define fbpld_sp_lbl 21070 `"Panama"', add
label define fbpld_sp_lbl 21071 `"Canal Zone"', add
label define fbpld_sp_lbl 21090 `"Central America, ns"', add
label define fbpld_sp_lbl 25000 `"Cuba"', add
label define fbpld_sp_lbl 26000 `"West Indies"', add
label define fbpld_sp_lbl 26010 `"Dominican Republic"', add
label define fbpld_sp_lbl 26020 `"Haiti"', add
label define fbpld_sp_lbl 26030 `"Jamaica"', add
label define fbpld_sp_lbl 26040 `"British West Indies"', add
label define fbpld_sp_lbl 26041 `"Anguilla"', add
label define fbpld_sp_lbl 26042 `"Antigua-Barbuda"', add
label define fbpld_sp_lbl 26043 `"Bahamas"', add
label define fbpld_sp_lbl 26044 `"Barbados"', add
label define fbpld_sp_lbl 26045 `"British Virgin Islands"', add
label define fbpld_sp_lbl 26046 `"Anegada"', add
label define fbpld_sp_lbl 26047 `"Cooper"', add
label define fbpld_sp_lbl 26048 `"Jost Van Dyke"', add
label define fbpld_sp_lbl 26049 `"Peter"', add
label define fbpld_sp_lbl 26050 `"Tortola"', add
label define fbpld_sp_lbl 26051 `"Virgin Gorda"', add
label define fbpld_sp_lbl 26052 `"Br. Virgin Islands, ns"', add
label define fbpld_sp_lbl 26053 `"Cayman Islands"', add
label define fbpld_sp_lbl 26054 `"Dominica"', add
label define fbpld_sp_lbl 26055 `"Grenada"', add
label define fbpld_sp_lbl 26056 `"Montserrat"', add
label define fbpld_sp_lbl 26057 `"St Kitts-Nevis"', add
label define fbpld_sp_lbl 26058 `"St Lucia"', add
label define fbpld_sp_lbl 26059 `"St Vincent"', add
label define fbpld_sp_lbl 26060 `"Trinidad and Tobago"', add
label define fbpld_sp_lbl 26061 `"Turks and Caicos"', add
label define fbpld_sp_lbl 26069 `"British West Indies, ns"', add
label define fbpld_sp_lbl 26070 `"Other West Indies"', add
label define fbpld_sp_lbl 26071 `"Aruba"', add
label define fbpld_sp_lbl 26072 `"Netherlands Antilles"', add
label define fbpld_sp_lbl 26073 `"Bonaire"', add
label define fbpld_sp_lbl 26074 `"Curacao"', add
label define fbpld_sp_lbl 26075 `"Dutch St. Maarten"', add
label define fbpld_sp_lbl 26076 `"Saba"', add
label define fbpld_sp_lbl 26077 `"St. Eustatius"', add
label define fbpld_sp_lbl 26079 `"Dutch Caribbean, ns"', add
label define fbpld_sp_lbl 26080 `"French St Maarten"', add
label define fbpld_sp_lbl 26081 `"Guadeloupe"', add
label define fbpld_sp_lbl 26082 `"Martinique"', add
label define fbpld_sp_lbl 26083 `"St. Barthelemy"', add
label define fbpld_sp_lbl 26089 `"French Caribbean, ns"', add
label define fbpld_sp_lbl 26090 `"Antilles, n.s."', add
label define fbpld_sp_lbl 26091 `"Caribbean, n.s. / n.e.c."', add
label define fbpld_sp_lbl 26092 `"Latin America, ns"', add
label define fbpld_sp_lbl 26093 `"Leeward Islands, ns"', add
label define fbpld_sp_lbl 26094 `"West Indies, ns"', add
label define fbpld_sp_lbl 26095 `"Winward Islands"', add
label define fbpld_sp_lbl 29900 `"Americas, ns"', add
label define fbpld_sp_lbl 30000 `"South America"', add
label define fbpld_sp_lbl 30005 `"Argentina"', add
label define fbpld_sp_lbl 30010 `"Bolivia"', add
label define fbpld_sp_lbl 30015 `"Brazil"', add
label define fbpld_sp_lbl 30020 `"Chile"', add
label define fbpld_sp_lbl 30025 `"Colombia"', add
label define fbpld_sp_lbl 30030 `"Ecuador"', add
label define fbpld_sp_lbl 30035 `"French Guiana"', add
label define fbpld_sp_lbl 30040 `"Guyana/British Guiana"', add
label define fbpld_sp_lbl 30045 `"Paraguay"', add
label define fbpld_sp_lbl 30050 `"Peru"', add
label define fbpld_sp_lbl 30055 `"Suriname"', add
label define fbpld_sp_lbl 30060 `"Uruguay"', add
label define fbpld_sp_lbl 30065 `"Venezuela"', add
label define fbpld_sp_lbl 30090 `"South America, ns"', add
label define fbpld_sp_lbl 30091 `"South and Central America, n.s."', add
label define fbpld_sp_lbl 40000 `"Denmark"', add
label define fbpld_sp_lbl 40010 `"Faroe Islands"', add
label define fbpld_sp_lbl 40100 `"Finland"', add
label define fbpld_sp_lbl 40200 `"Iceland"', add
label define fbpld_sp_lbl 40300 `"Lapland, ns"', add
label define fbpld_sp_lbl 40400 `"Norway"', add
label define fbpld_sp_lbl 40410 `"Svalbard and Jan Meyen"', add
label define fbpld_sp_lbl 40412 `"Jan Meyen"', add
label define fbpld_sp_lbl 40500 `"Sweden"', add
label define fbpld_sp_lbl 40600 `"Svalbard"', add
label define fbpld_sp_lbl 41000 `"England"', add
label define fbpld_sp_lbl 41010 `"Channel Islands"', add
label define fbpld_sp_lbl 41011 `"Guernsey"', add
label define fbpld_sp_lbl 41012 `"Jersey"', add
label define fbpld_sp_lbl 41020 `"Isle of Man"', add
label define fbpld_sp_lbl 41100 `"Scotland"', add
label define fbpld_sp_lbl 41200 `"Wales"', add
label define fbpld_sp_lbl 41300 `"United Kingdom, ns"', add
label define fbpld_sp_lbl 41400 `"Ireland"', add
label define fbpld_sp_lbl 41410 `"Northern Ireland"', add
label define fbpld_sp_lbl 41900 `"Northern Europe, ns"', add
label define fbpld_sp_lbl 42000 `"Belgium"', add
label define fbpld_sp_lbl 42100 `"France"', add
label define fbpld_sp_lbl 42110 `"Alsace-Lorraine"', add
label define fbpld_sp_lbl 42111 `"Alsace"', add
label define fbpld_sp_lbl 42112 `"Lorraine"', add
label define fbpld_sp_lbl 42200 `"Liechtenstein"', add
label define fbpld_sp_lbl 42300 `"Luxembourg"', add
label define fbpld_sp_lbl 42400 `"Monaco"', add
label define fbpld_sp_lbl 42500 `"Netherlands"', add
label define fbpld_sp_lbl 42600 `"Switzerland"', add
label define fbpld_sp_lbl 42900 `"Western Europe, ns"', add
label define fbpld_sp_lbl 43000 `"Albania"', add
label define fbpld_sp_lbl 43100 `"Andorra"', add
label define fbpld_sp_lbl 43200 `"Gibraltar"', add
label define fbpld_sp_lbl 43300 `"Greece"', add
label define fbpld_sp_lbl 43310 `"Dodecanese Islands"', add
label define fbpld_sp_lbl 43320 `"Turkey Greece"', add
label define fbpld_sp_lbl 43330 `"Macedonia"', add
label define fbpld_sp_lbl 43400 `"Italy"', add
label define fbpld_sp_lbl 43500 `"Malta"', add
label define fbpld_sp_lbl 43600 `"Portugal"', add
label define fbpld_sp_lbl 43610 `"Azores"', add
label define fbpld_sp_lbl 43620 `"Madeira Islands"', add
label define fbpld_sp_lbl 43630 `"Cape Verde Islands"', add
label define fbpld_sp_lbl 43640 `"St Miguel"', add
label define fbpld_sp_lbl 43700 `"San Marino"', add
label define fbpld_sp_lbl 43800 `"Spain"', add
label define fbpld_sp_lbl 43900 `"Vatican City"', add
label define fbpld_sp_lbl 44000 `"Southern Europe, ns"', add
label define fbpld_sp_lbl 45000 `"Austria"', add
label define fbpld_sp_lbl 45010 `"Austria-Hungary"', add
label define fbpld_sp_lbl 45020 `"Austria-Graz"', add
label define fbpld_sp_lbl 45030 `"Austria-Linz"', add
label define fbpld_sp_lbl 45040 `"Austria-Salzburg"', add
label define fbpld_sp_lbl 45050 `"Austria-Tyrol"', add
label define fbpld_sp_lbl 45060 `"Austria-Vienna"', add
label define fbpld_sp_lbl 45070 `"Austria-Kaernsten"', add
label define fbpld_sp_lbl 45080 `"Austria-Neustadt"', add
label define fbpld_sp_lbl 45100 `"Bulgaria"', add
label define fbpld_sp_lbl 45200 `"Czechsolovakia"', add
label define fbpld_sp_lbl 45210 `"Bohemia"', add
label define fbpld_sp_lbl 45211 `"Bohemia-Moravia"', add
label define fbpld_sp_lbl 45212 `"Slovakia"', add
label define fbpld_sp_lbl 45213 `"Czech Republic"', add
label define fbpld_sp_lbl 45300 `"Germany"', add
label define fbpld_sp_lbl 45301 `"Berlin"', add
label define fbpld_sp_lbl 45310 `"West Germany"', add
label define fbpld_sp_lbl 45311 `"Baden"', add
label define fbpld_sp_lbl 45312 `"Bavaria"', add
label define fbpld_sp_lbl 45313 `"Bremen"', add
label define fbpld_sp_lbl 45314 `"Braunschweig"', add
label define fbpld_sp_lbl 45315 `"Hamburg"', add
label define fbpld_sp_lbl 45316 `"Hanover"', add
label define fbpld_sp_lbl 45317 `"Hessen"', add
label define fbpld_sp_lbl 45318 `"Hesse-Nassau"', add
label define fbpld_sp_lbl 45319 `"Holstein"', add
label define fbpld_sp_lbl 45320 `"Lippe"', add
label define fbpld_sp_lbl 45321 `"Lubeck"', add
label define fbpld_sp_lbl 45322 `"Oldenburg"', add
label define fbpld_sp_lbl 45323 `"Rheinland"', add
label define fbpld_sp_lbl 45324 `"Schleswig"', add
label define fbpld_sp_lbl 45325 `"Schleswig-Holstein"', add
label define fbpld_sp_lbl 45326 `"Schwarzburg"', add
label define fbpld_sp_lbl 45327 `"Waldeck"', add
label define fbpld_sp_lbl 45328 `"West Berlin"', add
label define fbpld_sp_lbl 45329 `"Westphalia"', add
label define fbpld_sp_lbl 45330 `"Wurttemberg"', add
label define fbpld_sp_lbl 45331 `"Frankfurt"', add
label define fbpld_sp_lbl 45332 `"Saarland"', add
label define fbpld_sp_lbl 45333 `"Nordrhein-Westfalen"', add
label define fbpld_sp_lbl 45340 `"East Germany"', add
label define fbpld_sp_lbl 45341 `"Anhalt"', add
label define fbpld_sp_lbl 45342 `"Brandenburg"', add
label define fbpld_sp_lbl 45343 `"East Berlin"', add
label define fbpld_sp_lbl 45344 `"Mecklenburg"', add
label define fbpld_sp_lbl 45345 `"Sachsen-Altenburg"', add
label define fbpld_sp_lbl 45346 `"Sachsen-Coburg"', add
label define fbpld_sp_lbl 45347 `"Sachsen-Gotha"', add
label define fbpld_sp_lbl 45348 `"Sachsen-Meiningen"', add
label define fbpld_sp_lbl 45349 `"Sachsen-Weimar-Eisenach"', add
label define fbpld_sp_lbl 45350 `"Saxony"', add
label define fbpld_sp_lbl 45351 `"Schwerin"', add
label define fbpld_sp_lbl 45352 `"Strelitz"', add
label define fbpld_sp_lbl 45353 `"Thuringian States"', add
label define fbpld_sp_lbl 45360 `"Prussia, nec"', add
label define fbpld_sp_lbl 45361 `"Hohenzollern"', add
label define fbpld_sp_lbl 45362 `"Niedersachsen"', add
label define fbpld_sp_lbl 45400 `"Hungary"', add
label define fbpld_sp_lbl 45500 `"Poland"', add
label define fbpld_sp_lbl 45510 `"Austrian Poland"', add
label define fbpld_sp_lbl 45511 `"Galicia"', add
label define fbpld_sp_lbl 45520 `"German Poland"', add
label define fbpld_sp_lbl 45521 `"East Prussia"', add
label define fbpld_sp_lbl 45522 `"Pomerania"', add
label define fbpld_sp_lbl 45523 `"Posen"', add
label define fbpld_sp_lbl 45524 `"Prussian Poland"', add
label define fbpld_sp_lbl 45525 `"Silesia"', add
label define fbpld_sp_lbl 45526 `"West Prussia"', add
label define fbpld_sp_lbl 45530 `"Russian Poland"', add
label define fbpld_sp_lbl 45600 `"Romania"', add
label define fbpld_sp_lbl 45610 `"Transylvania"', add
label define fbpld_sp_lbl 45700 `"Yugoslavia"', add
label define fbpld_sp_lbl 45710 `"Croatia"', add
label define fbpld_sp_lbl 45720 `"Montenegro"', add
label define fbpld_sp_lbl 45730 `"Serbia"', add
label define fbpld_sp_lbl 45740 `"Bosnia"', add
label define fbpld_sp_lbl 45750 `"Dalmatia"', add
label define fbpld_sp_lbl 45760 `"Slovonia"', add
label define fbpld_sp_lbl 45770 `"Carniola"', add
label define fbpld_sp_lbl 45780 `"Slovenia"', add
label define fbpld_sp_lbl 45790 `"Kosovo"', add
label define fbpld_sp_lbl 45800 `"Central Europe, ns"', add
label define fbpld_sp_lbl 45900 `"Eastern Europe, ns"', add
label define fbpld_sp_lbl 46000 `"Estonia"', add
label define fbpld_sp_lbl 46100 `"Latvia"', add
label define fbpld_sp_lbl 46200 `"Lithuania"', add
label define fbpld_sp_lbl 46300 `"Baltic States, ns"', add
label define fbpld_sp_lbl 46500 `"Other USSR/Russia"', add
label define fbpld_sp_lbl 46510 `"Byelorussia"', add
label define fbpld_sp_lbl 46520 `"Moldavia"', add
label define fbpld_sp_lbl 46521 `"Bessarabia"', add
label define fbpld_sp_lbl 46530 `"Ukraine"', add
label define fbpld_sp_lbl 46540 `"Armenia"', add
label define fbpld_sp_lbl 46541 `"Azerbaijan"', add
label define fbpld_sp_lbl 46542 `"Republic of Georgia"', add
label define fbpld_sp_lbl 46543 `"Kazakhstan"', add
label define fbpld_sp_lbl 46544 `"Kirghizia"', add
label define fbpld_sp_lbl 46545 `"Tadzhik"', add
label define fbpld_sp_lbl 46546 `"Turkmenistan"', add
label define fbpld_sp_lbl 46547 `"Uzbekistan"', add
label define fbpld_sp_lbl 46548 `"Siberia"', add
label define fbpld_sp_lbl 46590 `"USSR, ns"', add
label define fbpld_sp_lbl 49900 `"Europe, nec/ns"', add
label define fbpld_sp_lbl 50000 `"China"', add
label define fbpld_sp_lbl 50010 `"Hong Kong"', add
label define fbpld_sp_lbl 50020 `"Macau"', add
label define fbpld_sp_lbl 50030 `"Mongolia"', add
label define fbpld_sp_lbl 50040 `"Taiwan"', add
label define fbpld_sp_lbl 50100 `"Japan"', add
label define fbpld_sp_lbl 50200 `"Korea"', add
label define fbpld_sp_lbl 50210 `"North Korea"', add
label define fbpld_sp_lbl 50220 `"South Korea"', add
label define fbpld_sp_lbl 50900 `"East Asia, n.s."', add
label define fbpld_sp_lbl 51000 `"Brunei"', add
label define fbpld_sp_lbl 51100 `"Cambodia (Kampuchea)"', add
label define fbpld_sp_lbl 51200 `"Indonesia"', add
label define fbpld_sp_lbl 51210 `"East Indies"', add
label define fbpld_sp_lbl 51220 `"East Timor"', add
label define fbpld_sp_lbl 51300 `"Laos"', add
label define fbpld_sp_lbl 51400 `"Malaysia"', add
label define fbpld_sp_lbl 51500 `"Philippines"', add
label define fbpld_sp_lbl 51600 `"Singapore"', add
label define fbpld_sp_lbl 51700 `"Thailand"', add
label define fbpld_sp_lbl 51800 `"Vietnam"', add
label define fbpld_sp_lbl 51900 `"Southeast Asia, ns"', add
label define fbpld_sp_lbl 51910 `"Indochina, ns"', add
label define fbpld_sp_lbl 52000 `"Afghanistan"', add
label define fbpld_sp_lbl 52100 `"India"', add
label define fbpld_sp_lbl 52110 `"Bangladesh"', add
label define fbpld_sp_lbl 52120 `"Bhutan"', add
label define fbpld_sp_lbl 52130 `"Burma (Myanmar)"', add
label define fbpld_sp_lbl 52140 `"Pakistan"', add
label define fbpld_sp_lbl 52150 `"Sri Lanka (Ceylon)"', add
label define fbpld_sp_lbl 52200 `"Iran"', add
label define fbpld_sp_lbl 52300 `"Maldives"', add
label define fbpld_sp_lbl 52400 `"Nepal"', add
label define fbpld_sp_lbl 53000 `"Bahrain"', add
label define fbpld_sp_lbl 53100 `"Cyprus"', add
label define fbpld_sp_lbl 53200 `"Iraq"', add
label define fbpld_sp_lbl 53210 `"Mesopotamia"', add
label define fbpld_sp_lbl 53300 `"Iraq/Saudi Arabia"', add
label define fbpld_sp_lbl 53400 `"Israel/Palestine"', add
label define fbpld_sp_lbl 53410 `"Gaza Strip"', add
label define fbpld_sp_lbl 53420 `"Palestine"', add
label define fbpld_sp_lbl 53430 `"West Bank"', add
label define fbpld_sp_lbl 53440 `"Israel"', add
label define fbpld_sp_lbl 53500 `"Jordan"', add
label define fbpld_sp_lbl 53600 `"Kuwait"', add
label define fbpld_sp_lbl 53700 `"Lebanon"', add
label define fbpld_sp_lbl 53800 `"Oman"', add
label define fbpld_sp_lbl 53900 `"Qatar"', add
label define fbpld_sp_lbl 54000 `"Saudi Arabia"', add
label define fbpld_sp_lbl 54100 `"Syria"', add
label define fbpld_sp_lbl 54200 `"Turkey"', add
label define fbpld_sp_lbl 54210 `"European Turkey"', add
label define fbpld_sp_lbl 54220 `"Asian Turkey"', add
label define fbpld_sp_lbl 54300 `"United Arab Emirates"', add
label define fbpld_sp_lbl 54400 `"Yemen Arab Republic (North)"', add
label define fbpld_sp_lbl 54500 `"Yemen, PDR (South)"', add
label define fbpld_sp_lbl 54600 `"Persian Gulf States, ns"', add
label define fbpld_sp_lbl 54700 `"Middle East, ns"', add
label define fbpld_sp_lbl 54800 `"Southwest Asia, nec/ns"', add
label define fbpld_sp_lbl 54900 `"Asia Minor, ns"', add
label define fbpld_sp_lbl 55000 `"South Asia, n.e.c."', add
label define fbpld_sp_lbl 59900 `"Asia, nec/ns"', add
label define fbpld_sp_lbl 60000 `"Africa"', add
label define fbpld_sp_lbl 60010 `"Northern Africa"', add
label define fbpld_sp_lbl 60011 `"Algeria"', add
label define fbpld_sp_lbl 60012 `"Egypt/United Arab Rep"', add
label define fbpld_sp_lbl 60013 `"Libya"', add
label define fbpld_sp_lbl 60014 `"Morocco"', add
label define fbpld_sp_lbl 60015 `"Sudan"', add
label define fbpld_sp_lbl 60016 `"Tunisia"', add
label define fbpld_sp_lbl 60017 `"Western Sahara"', add
label define fbpld_sp_lbl 60019 `"North Africa, ns"', add
label define fbpld_sp_lbl 60020 `"Benin"', add
label define fbpld_sp_lbl 60021 `"Burkina Faso"', add
label define fbpld_sp_lbl 60022 `"Gambia"', add
label define fbpld_sp_lbl 60023 `"Ghana"', add
label define fbpld_sp_lbl 60024 `"Guinea"', add
label define fbpld_sp_lbl 60025 `"Guinea-Bissau"', add
label define fbpld_sp_lbl 60026 `"Ivory Coast"', add
label define fbpld_sp_lbl 60027 `"Liberia"', add
label define fbpld_sp_lbl 60028 `"Mali"', add
label define fbpld_sp_lbl 60029 `"Mauritania"', add
label define fbpld_sp_lbl 60030 `"Niger"', add
label define fbpld_sp_lbl 60031 `"Nigeria"', add
label define fbpld_sp_lbl 60032 `"Senegal"', add
label define fbpld_sp_lbl 60033 `"Sierra Leone"', add
label define fbpld_sp_lbl 60034 `"Togo"', add
label define fbpld_sp_lbl 60038 `"Western Africa, n.s."', add
label define fbpld_sp_lbl 60039 `"French West Africa, ns"', add
label define fbpld_sp_lbl 60040 `"British Indian Ocean Territory"', add
label define fbpld_sp_lbl 60041 `"Burundi"', add
label define fbpld_sp_lbl 60042 `"Comoros"', add
label define fbpld_sp_lbl 60043 `"Djibouti"', add
label define fbpld_sp_lbl 60044 `"Ethiopia"', add
label define fbpld_sp_lbl 60045 `"Kenya"', add
label define fbpld_sp_lbl 60046 `"Madagascar"', add
label define fbpld_sp_lbl 60047 `"Malawi"', add
label define fbpld_sp_lbl 60048 `"Mauritius"', add
label define fbpld_sp_lbl 60049 `"Mozambique"', add
label define fbpld_sp_lbl 60050 `"Reunion"', add
label define fbpld_sp_lbl 60051 `"Rwanda"', add
label define fbpld_sp_lbl 60052 `"Seychelles"', add
label define fbpld_sp_lbl 60053 `"Somalia"', add
label define fbpld_sp_lbl 60054 `"Tanzania"', add
label define fbpld_sp_lbl 60055 `"Uganda"', add
label define fbpld_sp_lbl 60056 `"Zambia"', add
label define fbpld_sp_lbl 60057 `"Zimbabwe"', add
label define fbpld_sp_lbl 60058 `"Bassas de India"', add
label define fbpld_sp_lbl 60059 `"Europa"', add
label define fbpld_sp_lbl 60060 `"Gloriosos"', add
label define fbpld_sp_lbl 60061 `"Juan de Nova"', add
label define fbpld_sp_lbl 60062 `"Mayotte"', add
label define fbpld_sp_lbl 60063 `"Tromelin"', add
label define fbpld_sp_lbl 60064 `"Eastern Africa, nec/ns"', add
label define fbpld_sp_lbl 60065 `"Eritrea"', add
label define fbpld_sp_lbl 60070 `"Central Africa"', add
label define fbpld_sp_lbl 60071 `"Angola"', add
label define fbpld_sp_lbl 60072 `"Cameroon"', add
label define fbpld_sp_lbl 60073 `"Central African Republic"', add
label define fbpld_sp_lbl 60074 `"Chad"', add
label define fbpld_sp_lbl 60075 `"Congo"', add
label define fbpld_sp_lbl 60076 `"Equatorial Guinea"', add
label define fbpld_sp_lbl 60077 `"Gabon"', add
label define fbpld_sp_lbl 60078 `"Sao Tome and Principe"', add
label define fbpld_sp_lbl 60079 `"Zaire"', add
label define fbpld_sp_lbl 60080 `"Central Africa, ns"', add
label define fbpld_sp_lbl 60081 `"Equatorial Africa, ns"', add
label define fbpld_sp_lbl 60082 `"French Equatorial Africa, ns"', add
label define fbpld_sp_lbl 60090 `"Southern Africa"', add
label define fbpld_sp_lbl 60091 `"Botswana"', add
label define fbpld_sp_lbl 60092 `"Lesotho"', add
label define fbpld_sp_lbl 60093 `"Namibia"', add
label define fbpld_sp_lbl 60094 `"South Africa (Union of)"', add
label define fbpld_sp_lbl 60095 `"Swaziland"', add
label define fbpld_sp_lbl 60096 `"Southern Africa, n.s."', add
label define fbpld_sp_lbl 60099 `"Africa, ns/nec"', add
label define fbpld_sp_lbl 70000 `"Australia and New Zealand"', add
label define fbpld_sp_lbl 70010 `"Australia"', add
label define fbpld_sp_lbl 70011 `"Ashmore and Cartier Islands"', add
label define fbpld_sp_lbl 70012 `"Coral Sea Islands Territory"', add
label define fbpld_sp_lbl 70013 `"Christmas Island"', add
label define fbpld_sp_lbl 70014 `"Cocos Islands"', add
label define fbpld_sp_lbl 70020 `"New Zealand"', add
label define fbpld_sp_lbl 71000 `"Pacific Islands"', add
label define fbpld_sp_lbl 71010 `"New Caledonia"', add
label define fbpld_sp_lbl 71012 `"Papua New Guinea"', add
label define fbpld_sp_lbl 71013 `"Solomon Islands"', add
label define fbpld_sp_lbl 71014 `"Vanuatu (New Hebrides)"', add
label define fbpld_sp_lbl 71016 `"Melanesia, ns"', add
label define fbpld_sp_lbl 71017 `"Norfolk Islands"', add
label define fbpld_sp_lbl 71018 `"Niue"', add
label define fbpld_sp_lbl 71020 `"Cook Islands"', add
label define fbpld_sp_lbl 71021 `"Fiji"', add
label define fbpld_sp_lbl 71022 `"French Polynesia"', add
label define fbpld_sp_lbl 71023 `"Tonga"', add
label define fbpld_sp_lbl 71024 `"Wallis and Futuna Islands"', add
label define fbpld_sp_lbl 71025 `"Western Samoa"', add
label define fbpld_sp_lbl 71026 `"Pitcairn Island"', add
label define fbpld_sp_lbl 71027 `"Tokelau"', add
label define fbpld_sp_lbl 71028 `"Tuvalu"', add
label define fbpld_sp_lbl 71029 `"Polynesia, n.s."', add
label define fbpld_sp_lbl 71032 `"Kiribati"', add
label define fbpld_sp_lbl 71033 `"Canton and Enderbury"', add
label define fbpld_sp_lbl 71034 `"Nauru"', add
label define fbpld_sp_lbl 71039 `"Micronesia, ns"', add
label define fbpld_sp_lbl 71040 `"US Pacific Trust Territories"', add
label define fbpld_sp_lbl 71041 `"Marshall Islands"', add
label define fbpld_sp_lbl 71042 `"Micronesia"', add
label define fbpld_sp_lbl 71043 `"Kosrae"', add
label define fbpld_sp_lbl 71044 `"Pohnpei"', add
label define fbpld_sp_lbl 71045 `"Truk"', add
label define fbpld_sp_lbl 71046 `"Yap"', add
label define fbpld_sp_lbl 71047 `"Northern Mariana Islands"', add
label define fbpld_sp_lbl 71048 `"Palau"', add
label define fbpld_sp_lbl 71049 `"Pacific Trust Terr, ns"', add
label define fbpld_sp_lbl 71050 `"Clipperton Island"', add
label define fbpld_sp_lbl 71090 `"Oceania, ns/nec"', add
label define fbpld_sp_lbl 80000 `"Antarctica, ns/nec"', add
label define fbpld_sp_lbl 80010 `"Bouvet Islands"', add
label define fbpld_sp_lbl 80020 `"British Antarctic Terr."', add
label define fbpld_sp_lbl 80030 `"Dronning Maud Land"', add
label define fbpld_sp_lbl 80040 `"French Southern and Antarctic Lands"', add
label define fbpld_sp_lbl 80050 `"Heard and McDonald Islands"', add
label define fbpld_sp_lbl 90000 `"Abroad (unknown) or at sea"', add
label define fbpld_sp_lbl 90010 `"Abroad, ns"', add
label define fbpld_sp_lbl 90011 `"Abroad (US citizen)"', add
label define fbpld_sp_lbl 90020 `"At sea"', add
label define fbpld_sp_lbl 90021 `"At sea (US citizen)"', add
label define fbpld_sp_lbl 90022 `"At sea or abroad (U.S. citizen)"', add
label define fbpld_sp_lbl 95000 `"Other n.e.c."', add
label define fbpld_sp_lbl 99700 `"Unknown"', add
label define fbpld_sp_lbl 99800 `"Illegible"', add
label define fbpld_sp_lbl 99900 `"Missing/blank"', add
label values fbpld_sp fbpld_sp_lbl

label define citizen_head_lbl 0 `"N/A"'
label define citizen_head_lbl 1 `"Born abroad of American parents"', add
label define citizen_head_lbl 2 `"Naturalized citizen"', add
label define citizen_head_lbl 3 `"Not a citizen"', add
label define citizen_head_lbl 4 `"Not a citizen, but has received first papers"', add
label define citizen_head_lbl 5 `"Foreign born, citizenship status not reported"', add
label values citizen_head citizen_head_lbl

label define citizen_sp_lbl 0 `"N/A"'
label define citizen_sp_lbl 1 `"Born abroad of American parents"', add
label define citizen_sp_lbl 2 `"Naturalized citizen"', add
label define citizen_sp_lbl 3 `"Not a citizen"', add
label define citizen_sp_lbl 4 `"Not a citizen, but has received first papers"', add
label define citizen_sp_lbl 5 `"Foreign born, citizenship status not reported"', add
label values citizen_sp citizen_sp_lbl

label define higrade_head_lbl 00 `"N/A  (or None, 1980)"'
label define higrade_head_lbl 01 `"None"', add
label define higrade_head_lbl 02 `"Nursery school"', add
label define higrade_head_lbl 03 `"Kindergarten"', add
label define higrade_head_lbl 04 `"1st grade"', add
label define higrade_head_lbl 05 `"2nd grade"', add
label define higrade_head_lbl 06 `"3rd grade"', add
label define higrade_head_lbl 07 `"4th grade"', add
label define higrade_head_lbl 08 `"5th grade"', add
label define higrade_head_lbl 09 `"6th grade"', add
label define higrade_head_lbl 10 `"7th grade"', add
label define higrade_head_lbl 11 `"8th grade"', add
label define higrade_head_lbl 12 `"9th grade"', add
label define higrade_head_lbl 13 `"10th grade"', add
label define higrade_head_lbl 14 `"11th grade"', add
label define higrade_head_lbl 15 `"12th grade"', add
label define higrade_head_lbl 16 `"1st year"', add
label define higrade_head_lbl 17 `"2nd year"', add
label define higrade_head_lbl 18 `"3rd year"', add
label define higrade_head_lbl 19 `"4th year"', add
label define higrade_head_lbl 20 `"5th year or more (40-50)"', add
label define higrade_head_lbl 21 `"6th year or more (60,70)"', add
label define higrade_head_lbl 22 `"7th year"', add
label define higrade_head_lbl 23 `"8th year or more"', add
label values higrade_head higrade_head_lbl

label define higrade_sp_lbl 00 `"N/A  (or None, 1980)"'
label define higrade_sp_lbl 01 `"None"', add
label define higrade_sp_lbl 02 `"Nursery school"', add
label define higrade_sp_lbl 03 `"Kindergarten"', add
label define higrade_sp_lbl 04 `"1st grade"', add
label define higrade_sp_lbl 05 `"2nd grade"', add
label define higrade_sp_lbl 06 `"3rd grade"', add
label define higrade_sp_lbl 07 `"4th grade"', add
label define higrade_sp_lbl 08 `"5th grade"', add
label define higrade_sp_lbl 09 `"6th grade"', add
label define higrade_sp_lbl 10 `"7th grade"', add
label define higrade_sp_lbl 11 `"8th grade"', add
label define higrade_sp_lbl 12 `"9th grade"', add
label define higrade_sp_lbl 13 `"10th grade"', add
label define higrade_sp_lbl 14 `"11th grade"', add
label define higrade_sp_lbl 15 `"12th grade"', add
label define higrade_sp_lbl 16 `"1st year"', add
label define higrade_sp_lbl 17 `"2nd year"', add
label define higrade_sp_lbl 18 `"3rd year"', add
label define higrade_sp_lbl 19 `"4th year"', add
label define higrade_sp_lbl 20 `"5th year or more (40-50)"', add
label define higrade_sp_lbl 21 `"6th year or more (60,70)"', add
label define higrade_sp_lbl 22 `"7th year"', add
label define higrade_sp_lbl 23 `"8th year or more"', add
label values higrade_sp higrade_sp_lbl

label define higraded_head_lbl 000 `"N/A"'
label define higraded_head_lbl 010 `"None"', add
label define higraded_head_lbl 011 `"Did not finish nurs sch"', add
label define higraded_head_lbl 012 `"Attending nurs sch"', add
label define higraded_head_lbl 020 `"Nursery school"', add
label define higraded_head_lbl 021 `"Did not finish kindergart"', add
label define higraded_head_lbl 022 `"Attending kindergarten"', add
label define higraded_head_lbl 030 `"Kindergarten"', add
label define higraded_head_lbl 031 `"Did not finish 1st grade"', add
label define higraded_head_lbl 032 `"Attending 1st grade"', add
label define higraded_head_lbl 040 `"1st grade"', add
label define higraded_head_lbl 041 `"Did not finish 2nd grade"', add
label define higraded_head_lbl 042 `"Attending 2nd grade"', add
label define higraded_head_lbl 050 `"2nd grade"', add
label define higraded_head_lbl 051 `"Did not finish 3rd grade"', add
label define higraded_head_lbl 052 `"Attending 3rd grade"', add
label define higraded_head_lbl 060 `"3rd grade"', add
label define higraded_head_lbl 061 `"Did not finish 4th grade"', add
label define higraded_head_lbl 062 `"Attending 4th grade"', add
label define higraded_head_lbl 070 `"4th grade"', add
label define higraded_head_lbl 071 `"Did not finish 5th grade"', add
label define higraded_head_lbl 072 `"Attending 5th grade"', add
label define higraded_head_lbl 080 `"5th grade"', add
label define higraded_head_lbl 081 `"Did not finish 6th grade"', add
label define higraded_head_lbl 082 `"Attending 6th grade"', add
label define higraded_head_lbl 090 `"6th grade"', add
label define higraded_head_lbl 091 `"Did not finish 7th grade"', add
label define higraded_head_lbl 092 `"Attending 7th grade"', add
label define higraded_head_lbl 100 `"7th grade"', add
label define higraded_head_lbl 101 `"Did not finish 8th grade"', add
label define higraded_head_lbl 102 `"Attending 8th grade"', add
label define higraded_head_lbl 110 `"8th grade"', add
label define higraded_head_lbl 111 `"Did not finish 9th grade"', add
label define higraded_head_lbl 112 `"Attending 9th grade"', add
label define higraded_head_lbl 120 `"9th grade"', add
label define higraded_head_lbl 121 `"Did not finish 10th grade"', add
label define higraded_head_lbl 122 `"Attending 10th grade"', add
label define higraded_head_lbl 130 `"10th grade"', add
label define higraded_head_lbl 131 `"Did not finish 11th grade"', add
label define higraded_head_lbl 132 `"Attending 11th grade"', add
label define higraded_head_lbl 140 `"11th grade"', add
label define higraded_head_lbl 141 `"Did not finish 12th grade"', add
label define higraded_head_lbl 142 `"Attending 12th grade"', add
label define higraded_head_lbl 150 `"12th grade"', add
label define higraded_head_lbl 151 `"Did not finish 1st year college"', add
label define higraded_head_lbl 152 `"Attending 1st yesr college"', add
label define higraded_head_lbl 160 `"1st year of college"', add
label define higraded_head_lbl 161 `"Did not finish 2nd year of college"', add
label define higraded_head_lbl 162 `"Attending 2nd year of college"', add
label define higraded_head_lbl 170 `"2nd year of college"', add
label define higraded_head_lbl 171 `"Did not finish 3rd year of college"', add
label define higraded_head_lbl 172 `"Attending 3rd year of college"', add
label define higraded_head_lbl 180 `"3rd year of college"', add
label define higraded_head_lbl 181 `"Did not finish 4th year of college"', add
label define higraded_head_lbl 182 `"Attending 4th year of college"', add
label define higraded_head_lbl 190 `"4th year of college"', add
label define higraded_head_lbl 191 `"Did not finish 5th year of college"', add
label define higraded_head_lbl 192 `"Attending 5th year of college"', add
label define higraded_head_lbl 200 `"5th year or more of college (1940, 50)"', add
label define higraded_head_lbl 201 `"Did not finish 6th year of college"', add
label define higraded_head_lbl 202 `"Attending 6th year of college"', add
label define higraded_head_lbl 210 `"6th year or more of college (1960,70)"', add
label define higraded_head_lbl 211 `"Did not finish 7th year of college"', add
label define higraded_head_lbl 212 `"Attending 7th year of college"', add
label define higraded_head_lbl 220 `"7th year of college"', add
label define higraded_head_lbl 221 `"Did not finish 8th year of college"', add
label define higraded_head_lbl 222 `"Attending 8th year of college"', add
label define higraded_head_lbl 230 `"8th year or more of college"', add
label define higraded_head_lbl 999 `"Missing"', add
label values higraded_head higraded_head_lbl

label define higraded_sp_lbl 000 `"N/A"'
label define higraded_sp_lbl 010 `"None"', add
label define higraded_sp_lbl 011 `"Did not finish nurs sch"', add
label define higraded_sp_lbl 012 `"Attending nurs sch"', add
label define higraded_sp_lbl 020 `"Nursery school"', add
label define higraded_sp_lbl 021 `"Did not finish kindergart"', add
label define higraded_sp_lbl 022 `"Attending kindergarten"', add
label define higraded_sp_lbl 030 `"Kindergarten"', add
label define higraded_sp_lbl 031 `"Did not finish 1st grade"', add
label define higraded_sp_lbl 032 `"Attending 1st grade"', add
label define higraded_sp_lbl 040 `"1st grade"', add
label define higraded_sp_lbl 041 `"Did not finish 2nd grade"', add
label define higraded_sp_lbl 042 `"Attending 2nd grade"', add
label define higraded_sp_lbl 050 `"2nd grade"', add
label define higraded_sp_lbl 051 `"Did not finish 3rd grade"', add
label define higraded_sp_lbl 052 `"Attending 3rd grade"', add
label define higraded_sp_lbl 060 `"3rd grade"', add
label define higraded_sp_lbl 061 `"Did not finish 4th grade"', add
label define higraded_sp_lbl 062 `"Attending 4th grade"', add
label define higraded_sp_lbl 070 `"4th grade"', add
label define higraded_sp_lbl 071 `"Did not finish 5th grade"', add
label define higraded_sp_lbl 072 `"Attending 5th grade"', add
label define higraded_sp_lbl 080 `"5th grade"', add
label define higraded_sp_lbl 081 `"Did not finish 6th grade"', add
label define higraded_sp_lbl 082 `"Attending 6th grade"', add
label define higraded_sp_lbl 090 `"6th grade"', add
label define higraded_sp_lbl 091 `"Did not finish 7th grade"', add
label define higraded_sp_lbl 092 `"Attending 7th grade"', add
label define higraded_sp_lbl 100 `"7th grade"', add
label define higraded_sp_lbl 101 `"Did not finish 8th grade"', add
label define higraded_sp_lbl 102 `"Attending 8th grade"', add
label define higraded_sp_lbl 110 `"8th grade"', add
label define higraded_sp_lbl 111 `"Did not finish 9th grade"', add
label define higraded_sp_lbl 112 `"Attending 9th grade"', add
label define higraded_sp_lbl 120 `"9th grade"', add
label define higraded_sp_lbl 121 `"Did not finish 10th grade"', add
label define higraded_sp_lbl 122 `"Attending 10th grade"', add
label define higraded_sp_lbl 130 `"10th grade"', add
label define higraded_sp_lbl 131 `"Did not finish 11th grade"', add
label define higraded_sp_lbl 132 `"Attending 11th grade"', add
label define higraded_sp_lbl 140 `"11th grade"', add
label define higraded_sp_lbl 141 `"Did not finish 12th grade"', add
label define higraded_sp_lbl 142 `"Attending 12th grade"', add
label define higraded_sp_lbl 150 `"12th grade"', add
label define higraded_sp_lbl 151 `"Did not finish 1st year college"', add
label define higraded_sp_lbl 152 `"Attending 1st yesr college"', add
label define higraded_sp_lbl 160 `"1st year of college"', add
label define higraded_sp_lbl 161 `"Did not finish 2nd year of college"', add
label define higraded_sp_lbl 162 `"Attending 2nd year of college"', add
label define higraded_sp_lbl 170 `"2nd year of college"', add
label define higraded_sp_lbl 171 `"Did not finish 3rd year of college"', add
label define higraded_sp_lbl 172 `"Attending 3rd year of college"', add
label define higraded_sp_lbl 180 `"3rd year of college"', add
label define higraded_sp_lbl 181 `"Did not finish 4th year of college"', add
label define higraded_sp_lbl 182 `"Attending 4th year of college"', add
label define higraded_sp_lbl 190 `"4th year of college"', add
label define higraded_sp_lbl 191 `"Did not finish 5th year of college"', add
label define higraded_sp_lbl 192 `"Attending 5th year of college"', add
label define higraded_sp_lbl 200 `"5th year or more of college (1940, 50)"', add
label define higraded_sp_lbl 201 `"Did not finish 6th year of college"', add
label define higraded_sp_lbl 202 `"Attending 6th year of college"', add
label define higraded_sp_lbl 210 `"6th year or more of college (1960,70)"', add
label define higraded_sp_lbl 211 `"Did not finish 7th year of college"', add
label define higraded_sp_lbl 212 `"Attending 7th year of college"', add
label define higraded_sp_lbl 220 `"7th year of college"', add
label define higraded_sp_lbl 221 `"Did not finish 8th year of college"', add
label define higraded_sp_lbl 222 `"Attending 8th year of college"', add
label define higraded_sp_lbl 230 `"8th year or more of college"', add
label define higraded_sp_lbl 999 `"Missing"', add
label values higraded_sp higraded_sp_lbl

label define educ_head_lbl 00 `"N/A or no schooling"'
label define educ_head_lbl 01 `"Nursery school to grade 4"', add
label define educ_head_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_head_lbl 03 `"Grade 9"', add
label define educ_head_lbl 04 `"Grade 10"', add
label define educ_head_lbl 05 `"Grade 11"', add
label define educ_head_lbl 06 `"Grade 12"', add
label define educ_head_lbl 07 `"1 year of college"', add
label define educ_head_lbl 08 `"2 years of college"', add
label define educ_head_lbl 09 `"3 years of college"', add
label define educ_head_lbl 10 `"4 years of college"', add
label define educ_head_lbl 11 `"5+ years of college"', add
label values educ_head educ_head_lbl

label define educ_sp_lbl 00 `"N/A or no schooling"'
label define educ_sp_lbl 01 `"Nursery school to grade 4"', add
label define educ_sp_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_sp_lbl 03 `"Grade 9"', add
label define educ_sp_lbl 04 `"Grade 10"', add
label define educ_sp_lbl 05 `"Grade 11"', add
label define educ_sp_lbl 06 `"Grade 12"', add
label define educ_sp_lbl 07 `"1 year of college"', add
label define educ_sp_lbl 08 `"2 years of college"', add
label define educ_sp_lbl 09 `"3 years of college"', add
label define educ_sp_lbl 10 `"4 years of college"', add
label define educ_sp_lbl 11 `"5+ years of college"', add
label values educ_sp educ_sp_lbl

label define educd_head_lbl 000 `"N/A or no schooling"'
label define educd_head_lbl 001 `"N/A"', add
label define educd_head_lbl 002 `"No schooling completed"', add
label define educd_head_lbl 010 `"Nursery school to grade 4"', add
label define educd_head_lbl 011 `"Nursery school, preschool"', add
label define educd_head_lbl 012 `"Kindergarten"', add
label define educd_head_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_head_lbl 014 `"Grade 1"', add
label define educd_head_lbl 015 `"Grade 2"', add
label define educd_head_lbl 016 `"Grade 3"', add
label define educd_head_lbl 017 `"Grade 4"', add
label define educd_head_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_head_lbl 021 `"Grade 5 or 6"', add
label define educd_head_lbl 022 `"Grade 5"', add
label define educd_head_lbl 023 `"Grade 6"', add
label define educd_head_lbl 024 `"Grade 7 or 8"', add
label define educd_head_lbl 025 `"Grade 7"', add
label define educd_head_lbl 026 `"Grade 8"', add
label define educd_head_lbl 030 `"Grade 9"', add
label define educd_head_lbl 040 `"Grade 10"', add
label define educd_head_lbl 050 `"Grade 11"', add
label define educd_head_lbl 060 `"Grade 12"', add
label define educd_head_lbl 061 `"12th grade, no diploma"', add
label define educd_head_lbl 062 `"High school graduate or GED"', add
label define educd_head_lbl 063 `"Regular high school diploma"', add
label define educd_head_lbl 064 `"GED or alternative credential"', add
label define educd_head_lbl 065 `"Some college, but less than 1 year"', add
label define educd_head_lbl 070 `"1 year of college"', add
label define educd_head_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_head_lbl 080 `"2 years of college"', add
label define educd_head_lbl 081 `"Associate's degree, type not specified"', add
label define educd_head_lbl 082 `"Associate's degree, occupational program"', add
label define educd_head_lbl 083 `"Associate's degree, academic program"', add
label define educd_head_lbl 090 `"3 years of college"', add
label define educd_head_lbl 100 `"4 years of college"', add
label define educd_head_lbl 101 `"Bachelor's degree"', add
label define educd_head_lbl 110 `"5+ years of college"', add
label define educd_head_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_head_lbl 112 `"7 years of college"', add
label define educd_head_lbl 113 `"8+ years of college"', add
label define educd_head_lbl 114 `"Master's degree"', add
label define educd_head_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_head_lbl 116 `"Doctoral degree"', add
label define educd_head_lbl 999 `"Missing"', add
label values educd_head educd_head_lbl

label define educd_sp_lbl 000 `"N/A or no schooling"'
label define educd_sp_lbl 001 `"N/A"', add
label define educd_sp_lbl 002 `"No schooling completed"', add
label define educd_sp_lbl 010 `"Nursery school to grade 4"', add
label define educd_sp_lbl 011 `"Nursery school, preschool"', add
label define educd_sp_lbl 012 `"Kindergarten"', add
label define educd_sp_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_sp_lbl 014 `"Grade 1"', add
label define educd_sp_lbl 015 `"Grade 2"', add
label define educd_sp_lbl 016 `"Grade 3"', add
label define educd_sp_lbl 017 `"Grade 4"', add
label define educd_sp_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_sp_lbl 021 `"Grade 5 or 6"', add
label define educd_sp_lbl 022 `"Grade 5"', add
label define educd_sp_lbl 023 `"Grade 6"', add
label define educd_sp_lbl 024 `"Grade 7 or 8"', add
label define educd_sp_lbl 025 `"Grade 7"', add
label define educd_sp_lbl 026 `"Grade 8"', add
label define educd_sp_lbl 030 `"Grade 9"', add
label define educd_sp_lbl 040 `"Grade 10"', add
label define educd_sp_lbl 050 `"Grade 11"', add
label define educd_sp_lbl 060 `"Grade 12"', add
label define educd_sp_lbl 061 `"12th grade, no diploma"', add
label define educd_sp_lbl 062 `"High school graduate or GED"', add
label define educd_sp_lbl 063 `"Regular high school diploma"', add
label define educd_sp_lbl 064 `"GED or alternative credential"', add
label define educd_sp_lbl 065 `"Some college, but less than 1 year"', add
label define educd_sp_lbl 070 `"1 year of college"', add
label define educd_sp_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_sp_lbl 080 `"2 years of college"', add
label define educd_sp_lbl 081 `"Associate's degree, type not specified"', add
label define educd_sp_lbl 082 `"Associate's degree, occupational program"', add
label define educd_sp_lbl 083 `"Associate's degree, academic program"', add
label define educd_sp_lbl 090 `"3 years of college"', add
label define educd_sp_lbl 100 `"4 years of college"', add
label define educd_sp_lbl 101 `"Bachelor's degree"', add
label define educd_sp_lbl 110 `"5+ years of college"', add
label define educd_sp_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_sp_lbl 112 `"7 years of college"', add
label define educd_sp_lbl 113 `"8+ years of college"', add
label define educd_sp_lbl 114 `"Master's degree"', add
label define educd_sp_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_sp_lbl 116 `"Doctoral degree"', add
label define educd_sp_lbl 999 `"Missing"', add
label values educd_sp educd_sp_lbl

label define gradeatt_head_lbl 0 `"N/A"'
label define gradeatt_head_lbl 1 `"Nursery school/preschool"', add
label define gradeatt_head_lbl 2 `"Kindergarten"', add
label define gradeatt_head_lbl 3 `"Grade 1 to grade 4"', add
label define gradeatt_head_lbl 4 `"Grade 5 to grade 8"', add
label define gradeatt_head_lbl 5 `"Grade 9 to grade 12"', add
label define gradeatt_head_lbl 6 `"College undergraduate"', add
label define gradeatt_head_lbl 7 `"Graduate or professional school"', add
label values gradeatt_head gradeatt_head_lbl

label define gradeatt_sp_lbl 0 `"N/A"'
label define gradeatt_sp_lbl 1 `"Nursery school/preschool"', add
label define gradeatt_sp_lbl 2 `"Kindergarten"', add
label define gradeatt_sp_lbl 3 `"Grade 1 to grade 4"', add
label define gradeatt_sp_lbl 4 `"Grade 5 to grade 8"', add
label define gradeatt_sp_lbl 5 `"Grade 9 to grade 12"', add
label define gradeatt_sp_lbl 6 `"College undergraduate"', add
label define gradeatt_sp_lbl 7 `"Graduate or professional school"', add
label values gradeatt_sp gradeatt_sp_lbl

label define gradeattd_head_lbl 00 `"N/A"'
label define gradeattd_head_lbl 10 `"Nursery school/preschool"', add
label define gradeattd_head_lbl 20 `"Kindergarten"', add
label define gradeattd_head_lbl 30 `"Grade 1 to grade 4"', add
label define gradeattd_head_lbl 31 `"Grade 1"', add
label define gradeattd_head_lbl 32 `"Grade 2"', add
label define gradeattd_head_lbl 33 `"Grade 3"', add
label define gradeattd_head_lbl 34 `"Grade 4"', add
label define gradeattd_head_lbl 40 `"Grade 5 to grade 8"', add
label define gradeattd_head_lbl 41 `"Grade 5"', add
label define gradeattd_head_lbl 42 `"Grade 6"', add
label define gradeattd_head_lbl 43 `"Grade 7"', add
label define gradeattd_head_lbl 44 `"Grade 8"', add
label define gradeattd_head_lbl 50 `"Grade 9 to grade 12"', add
label define gradeattd_head_lbl 51 `"Grade 9"', add
label define gradeattd_head_lbl 52 `"Grade 10"', add
label define gradeattd_head_lbl 53 `"Grade 11"', add
label define gradeattd_head_lbl 54 `"Grade 12"', add
label define gradeattd_head_lbl 60 `"College undergraduate"', add
label define gradeattd_head_lbl 61 `"First year of college"', add
label define gradeattd_head_lbl 62 `"Second year of college"', add
label define gradeattd_head_lbl 63 `"Third year of college"', add
label define gradeattd_head_lbl 64 `"Fourth year of college"', add
label define gradeattd_head_lbl 70 `"Graduate or professional school"', add
label define gradeattd_head_lbl 71 `"Fifth year of college"', add
label define gradeattd_head_lbl 72 `"Sixth year of college"', add
label define gradeattd_head_lbl 73 `"Seventh year of college"', add
label define gradeattd_head_lbl 74 `"Eighth year of college"', add
label values gradeattd_head gradeattd_head_lbl

label define gradeattd_sp_lbl 00 `"N/A"'
label define gradeattd_sp_lbl 10 `"Nursery school/preschool"', add
label define gradeattd_sp_lbl 20 `"Kindergarten"', add
label define gradeattd_sp_lbl 30 `"Grade 1 to grade 4"', add
label define gradeattd_sp_lbl 31 `"Grade 1"', add
label define gradeattd_sp_lbl 32 `"Grade 2"', add
label define gradeattd_sp_lbl 33 `"Grade 3"', add
label define gradeattd_sp_lbl 34 `"Grade 4"', add
label define gradeattd_sp_lbl 40 `"Grade 5 to grade 8"', add
label define gradeattd_sp_lbl 41 `"Grade 5"', add
label define gradeattd_sp_lbl 42 `"Grade 6"', add
label define gradeattd_sp_lbl 43 `"Grade 7"', add
label define gradeattd_sp_lbl 44 `"Grade 8"', add
label define gradeattd_sp_lbl 50 `"Grade 9 to grade 12"', add
label define gradeattd_sp_lbl 51 `"Grade 9"', add
label define gradeattd_sp_lbl 52 `"Grade 10"', add
label define gradeattd_sp_lbl 53 `"Grade 11"', add
label define gradeattd_sp_lbl 54 `"Grade 12"', add
label define gradeattd_sp_lbl 60 `"College undergraduate"', add
label define gradeattd_sp_lbl 61 `"First year of college"', add
label define gradeattd_sp_lbl 62 `"Second year of college"', add
label define gradeattd_sp_lbl 63 `"Third year of college"', add
label define gradeattd_sp_lbl 64 `"Fourth year of college"', add
label define gradeattd_sp_lbl 70 `"Graduate or professional school"', add
label define gradeattd_sp_lbl 71 `"Fifth year of college"', add
label define gradeattd_sp_lbl 72 `"Sixth year of college"', add
label define gradeattd_sp_lbl 73 `"Seventh year of college"', add
label define gradeattd_sp_lbl 74 `"Eighth year of college"', add
label values gradeattd_sp gradeattd_sp_lbl

save "C:\\Users\\hussa\\Dropbox\\Research\\My Research Data and Ideas\\hispanic-last-names\\data\\datasets\\SyntheticParentsData.dta", replace
