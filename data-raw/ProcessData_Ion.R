# Prepare data for example for Ion.R; IonContrib()
#
# From provided data and from reference table Excel files
#
# Erik.Leppo@tetratech.com
# 20170609
##############################

# 0. Prep####
library(readxl)
wd <- getwd()
# assume wd is MBSStools

# 1. Get data and process#####
# 1.1. Import Data
myFile <- "December 2016 - Salt Results - Final.xlsx"
data.import.data <- read_excel(file.path(wd,"data-raw",myFile),sheet="Sheet1")
#
myFile <- "IonMatrixRefVals.xlsx"
data.import.ref <- read_excel(file.path(wd,"data-raw",myFile),sheet="reftable")

# # 1.2. Process Data
# View(data.import)
# ## Cols to keep
# names(data.import)
# names(data.import)[1:20]
# data.keep <- data.import[1:60,1:20] # only 60 rows of data (20170427)
# # QC check
# dim(data.import)
# dim(data.keep)
View(data.import.data)
View(data.import.ref)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for use in package####
#
MBSS.Ion.Data <- data.import.data
devtools::use_data(MBSS.Ion.Data, overwrite = TRUE)
#
MBSS.Ion.Ref <- data.import.ref
devtools::use_data(MBSS.Ion.Ref, overwrite = TRUE)

