# Prepare data for example for MMIcalc.R;
#
# Sample Taxa - Bugs - Genus
#
# Erik.Leppo@tetratech.com
# 20170601
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 0. Prep ####
# library(devtools)
wd <- getwd()
# assume wd is package root

# 1. Get data and Process #####
# 1.1. Import Data
myFile <- "taxa_bugs_genus.tab"
data.import <- read.delim(file.path(".","data-raw",myFile), stringsAsFactors = FALSE)
# 1.2. Process Data
View(data.import)
names(data.import)
dim(data.import)

# 20190501, Convert EXCLUDE from Y/NULL to TRUE/FALSE
str(data.import)
table(data.import$EXCLUDE, useNA = "ifany")
#data.import[, "EXCLUDE"] <- as.character(data.import[, "EXCLUDE"] )
data.import[data.import[, "EXCLUDE"]=="Y", "EXCLUDE"] <- TRUE
data.import[data.import[, "EXCLUDE"]=="",  "EXCLUDE"] <- FALSE
data.import[is.na(data.import[, "EXCLUDE"]), "EXCLUDE"] <- FALSE
table(data.import$EXCLUDE, useNA = "ifany")
data.import[, "EXCLUDE"] <- as.logical(data.import[, "EXCLUDE"] )
table(data.import$EXCLUDE, useNA = "ifany")
str(data.import)

# Date
data.import[, "DATE"] <- as.Date(data.import[, "DATE"], format="%d-%b-%y")
head(data.import) # 1st line should be 2016-03-21 (March 21, 2016)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for Use in Package ####
#
taxa_bugs_genus <- data.import
usethis::use_data(taxa_bugs_genus, overwrite = TRUE)


