# Shiny Global File

# Packages
library(shiny)
library(MBSStools)

# Drop-down boxes
#MMIs <- c("BIBI_genus", "BIBI_family", "FIBI")
#MMIs <- c("BIBI_MBSS", "BIBI_MSW", "FIBI")
MMIs <- c("MBSS.2005.Fish", "MBSS.2005.Bugs", "MSW.1999.Bugs")
Community <- c("fish", "bugs", "bugs")

# File Size
# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 10MB.
options(shiny.maxRequestSize = 10*1024^2)

