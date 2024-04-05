# Prepare data for example for MMIcalc.R;
#
# Scoring Thresholds
# MBSS - bugs and fish, Southerland et al. 2005
# MSW  - bugs (family level), Stribling et al. 1998
#
# Erik.Leppo@tetratech.com
# 20170601
# 20170907, MBSS fish metric names
# 20240405, Tomas, update Fam BIBI due to > vs. >= for upper threshold
# to avoid scientific notation import with column classes specified
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 0. Prep ####
# library(devtools)
wd <- getwd()
# assume wd is package root

# 1. Get data and Process #####
# 1.1. Import Data
myFile <- "metrics.scoring.tab"
myClasses <- c(rep("character", 4), rep("numeric", 2), rep("character", 2))
data.import <- read.delim(file.path("data-raw", myFile), colClasses = myClasses)
# ignore NAs introduced by coercion
# 1.2. Process Data
View(data.import)
names(data.import)
dim(data.import)
str(data.import)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for Use in Package ####
#
metrics_scoring <- data.import
usethis::use_data(metrics_scoring, overwrite = TRUE)


