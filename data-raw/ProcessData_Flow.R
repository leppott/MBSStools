# Prepare data for example for FlowSum.R; FlowSum()
#
# Data provided by Matt Ashton (matthew.ashton@maryland.gov) at MBSS via email (20170407).
# tblSumFlow15.xls
#
# Attached is the discharge file. Sheet 1, columns A - F are what we export from Access data entry to Excel with
# that naming convention. Column G is the hand calculation to derive the area-velocity for each cell. Column H
# is the sum of area-velocity cells in the discharge transect. That observation for each site in Column H is
# transferred over into a column on Sheet 2 (perhaps a new data frame?) as discharge (m^3 / sec) for each site.
# The units of the discharge observation are then standardized to ft^3 / sec by multiplying it by 35.31467. Fairly
# straight forward to me, except for how to code the Nth observation aspect, since sites do not always have the same
# number of individual area-velocity observations.
#
# Erik.Leppo@tetratech.com
# 20170419
##############################

# 0. Prep####
# library(devtools)
# library(reshape)
library(readxl)
wd <- getwd()  # assume package root.
#library(XC95)
# assume wd is MBSStools

# 1. Get data and process#####
# 1.1. Import Data
myFile <- "tblSumFlow15.xls"
data.import <- read_excel(file.path(wd,"data-raw",myFile),sheet="AccessExport_fixed")
# 1.2. Process Data
## Cols to keep
head(data.import)
dim(data.import)
names(data.import)
data.keep <- data.import[,c(1:3,5:6)]
head(data.keep)
names(data.keep) <- c("SITEYR","ChannelNum","Lat_Loc_m","Depth_m","Velocity_m_s")
head(data.keep)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for use in package####
#
MBSS.flow <- data.keep
devtools::use_data(MBSS.flow)
#devtools::use_data(MBSS.flow, overwrite = T)


