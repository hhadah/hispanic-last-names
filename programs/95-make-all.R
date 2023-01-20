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
tables_wd    <- paste0(mdir_git,"/output/tables")
figures_wd   <- paste0(mdir_git,"/output/figures")
programs     <- paste0(mdir_git,"/programs")
thesis_tabs  <- paste0(mdir_git,"/my_paper/tables")
thesis_plots <- paste0(mdir_git,"/my_paper/figure")
# pres_tabs <- paste0(mdir,"/presentations/jmp-presentation/tables")
# pres_plots <- paste0(mdir,"/presentations/jmp-presentation/figures")


### run do files and scripts

# main scripts
source(file.path(programs,"01-packages-wds.r")) # set up package

# Send Message

textme(message = "👹 Back to work! You're not paid to run around and drink ☕ all day!")