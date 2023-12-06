#######################################################################
# Master script
#######################################################################

## Clear out existing environment
gc()
rm(list = ls()) 

mdir <- "~/Dropbox/Research/My Research Data and Ideas/hispanic-last-names"
datasets <- paste0(mdir,"/data/datasets")
raw <- paste0(mdir,"/data/raw")

mdir_git     <- "~/Documents/GiT/hispanic-last-names"
datasets_git <- paste0(mdir_git,"/data/datasets") 
raw_git      <- paste0(mdir_git,"/data/raw") 
tables_wd    <- paste0(mdir_git,"/output/tables") 
figures_wd   <- paste0(mdir_git,"/output/figures") 
programs     <- paste0(mdir_git,"/programs") 
thesis_tabs  <- paste0(mdir_git,"/my_paper/tables") 
thesis_plots <- paste0(mdir_git,"/my_paper/figure") 
add_health_data_dir <- "/Users/hhadah/Dropbox/Research/My Research Data and Ideas/Identification_Paper/Data/Datasets"
ACS_data  <- "/Users/hhadah/Documents/GiT/jmp-decomposition-replication/data/raw"

# pres_tabs <- paste0(mdir,"/presentations/jmp-presentation/tables")
# pres_plots <- paste0(mdir,"/presentations/jmp-presentation/figures")

# dissertation_wd <- paste0("/Users/hhadah/Documents/GiT/my_thesis/presentation/dissertation")
### run do files and scripts

# main scripts
source(file.path(programs,"01-packages-wds.r")) # set up package
stata(file.path(programs,"02-ACS-Synt-Parents-DoFile.do")) # run ACS do file
stata(file.path(programs,"03-CleaningDataDoFile.do")) # clean data
source(file.path(programs,"04-ACS-prep.r")) # prep data
stata(file.path(programs,"05-CPS-Do-File.do")) # CPS Do File
stata(file.path(programs,"06-CPS-DataCleanUpScript.do")) # CPS data cleaning
# stata(file.path(programs,"07-BySexAnalysis.do")) # by sex analysis
# stata(file.path(programs,"08-CoupleAnalysis.do")) # couple analysis
# stata(file.path(programs,"09-Regressions.do")) # regressions
source(file.path(programs,"10-merge-cps-acs.r")) # merge cps and acs
source(file.path(programs,"11-table-one-parent-types.R")) # table one
source(file.path(programs,"12-table-two-parent-types.R")) # table two
source(file.path(programs,"13-table-three-summary-stats.R")) # table three
# source(file.path(programs,"13a-table-three-summary-stats-mex.R")) # table three
# source(file.path(programs,"13b-table-three-summary-stats-nonmex.R")) # table three
source(file.path(programs,"14-table-three-summary-stats.R")) # table three
source(file.path(programs,"15-table-four-summary-stats.R")) # table four
source(file.path(programs,"16-table-five-regression.R")) # table five
source(file.path(programs,"17-table-six-regression.R")) # table six
source(file.path(programs,"18-table-seven-regression.R")) # table seven
source(file.path(programs,"19-table-eight-regression.R")) # table eight

# Send Message when code is done

textme(message = "👹 Back to work! You're not paid to run around and drink ☕ all day!")
