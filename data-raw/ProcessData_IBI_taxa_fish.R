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

# 20190501, Convert EXCLUDE from Y/NULL to TRUE/FALSE
str(data.import)
table(data.import$EXCLUDE, useNA = "ifany")
data.import[,"EXCLUDE"] <- as.character(data.import[,"EXCLUDE"] )
data.import[data.import[,"EXCLUDE"]=="Y", ] <- "TRUE"
data.import[data.import[,"EXCLUDE"]=="", ] <- "FALSE"
data.import[is.na(data.import[,"EXCLUDE"]), ] <- "FALSE"
table(data.import$EXCLUDE, useNA = "ifany")
data.import[,"EXCLUDE"] <- as.logical(data.import[,"EXCLUDE"] )
table(data.import$EXCLUDE, useNA = "ifany")
str(data.import)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for Use in Package ####
#
taxa_fish <- data.import
usethis::use_data(taxa_fish, overwrite = TRUE)


