# Prepare data for example for MMIcalc.R;
#
# Sample Taxa - Fish
#
# Erik.Leppo@tetratech.com
# 20170601
# 20170907, modify file for just MBSS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 0. Prep ####
# library(devtools)
wd <- getwd()
# assume wd is package root

# 1. Get data and Process #####
# 1.1. Import Data
myFile <- "taxa_fish.tab"
data.import <- read.delim(file.path(".","data-raw",myFile))
# 1.2. Process Data
View(data.import)
names(data.import)
dim(data.import)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for Use in Package ####
#
taxa_fish <- data.import
devtools::use_data(taxa_fish, overwrite = TRUE)


