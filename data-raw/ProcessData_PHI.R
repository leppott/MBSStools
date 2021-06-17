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
myFile <- "PHI_Worksheet_from_MP_Leppo20170329.xls"
data.import <- read_excel(file.path(".", "inst", "extdata", myFile)
                          , sheet="R_Data"
                          , skip=4)
# 1.2. Process Data
View(data.import)
## Cols to keep
names(data.import)
names(data.import)[1:20]
data.keep <- data.import[1:60,1:20] # only 60 rows of data (20170427)

# Munge
# 20210617, EWL
# Change strata to be consistent with MBSS database and metric.scores()
names(data.keep)[names(data.keep) == "BioRegion"] <- "Strata"
data.keep[data.keep[, "Strata"] == "Highlands", "Strata"] <- "Highland"
data.keep[data.keep[, "Strata"] == "Piedmont", "Strata"] <- "EPiedmont"
data.keep[data.keep[, "Strata"] == "CoastalPlain", "Strata"] <- "Coastal"

# QC check
dim(data.import)
dim(data.keep)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for use in package####
#
MBSS.PHI <- data.keep
usethis::use_data(MBSS.PHI, overwrite = TRUE)


