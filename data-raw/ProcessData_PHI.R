# Prepare data for example for PHI.R; PHIcalc()
#
# From PHI Worksheet_from MP (Erik20170329).xls
#
# Erik.Leppo@tetratech.com
# 20170419
##############################

# 0. Prep####
# library(devtools)
# library(reshape)
library(readxl)
wd <- getwd()
#library(XC95)
# assume wd is MBSStools

# 1. Get data and process#####
# 1.1. Import Data
myFile <- "PHI Worksheet_from MP (Erik20170329).xls"
data.import <- read_excel(file.path(wd,"inst","extdata",myFile),sheet="R_Data",skip=4)
# 1.2. Process Data
View(data.import)
## Cols to keep
names(data.import)
names(data.import)[1:20]
data.keep <- data.import[1:60,1:20] # only 60 rows of data (20170427)
# QC check
dim(data.import)
dim(data.keep)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for use in package####
#
MBSS.PHI <- data.keep
devtools::use_data(MBSS.PHI)


