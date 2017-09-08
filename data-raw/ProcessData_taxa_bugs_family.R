# Prepare data for example for MMIcalc.R;
#
# Sample Taxa - Bugs - Family
# genus data rolled up to family
#
# Erik.Leppo@tetratech.com
# 20170816
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 0. Prep ####
# library(devtools)
wd <- getwd()
# assume wd is package root

# 1. Get data and Process #####
# 1.1. Import Data
myFile <- "taxa_bugs_family.tab"
data.import <- read.delim(file.path(".","data-raw",myFile))
# 1.2. Process Data
View(data.import)
names(data.import)
dim(data.import)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for Use in Package ####
#
taxa_bugs_family <- data.import
devtools::use_data(taxa_bugs_family, overwrite = TRUE)


