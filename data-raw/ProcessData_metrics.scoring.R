# Prepare data for example for MMIcalc.R;
#
# Scoring Thresholds
# MBSS - bugs and fish, Southerland et al. 2005
# MSW  - bugs (family level), Stribling et al. 1998
#
# Erik.Leppo@tetratech.com
# 20170601
# 20170907, MBSS fish metric names
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 0. Prep ####
# library(devtools)
wd <- getwd()
# assume wd is package root

# 1. Get data and Process #####
# 1.1. Import Data
myFile <- "metrics.scoring.tab"
data.import <- read.delim(file.path(".","data-raw",myFile))
# 1.2. Process Data
View(data.import)
names(data.import)
dim(data.import)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for Use in Package ####
#
metrics_scoring <- data.import
devtools::use_data(metrics_scoring, overwrite = TRUE)


