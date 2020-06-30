## ----install, eval=FALSE------------------------------------------------------
#  install.packages("devtools")
#  library(devtools)
#  install_github("leppott/MBSStools")

## ----install example 2, eval=FALSE--------------------------------------------
#  install.package("dplyr")

## ----IBI Fish, echo=TRUE------------------------------------------------------
# Metrics, Fish
library(MBSStools)
#(generate values then score)s
myIndex <- "MBSS.2005.Fish"
# Thresholds
thresh <- metrics_scoring
# get metric names for myIndex
(myMetrics.Fish <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"MetricName.Other"]))))
# Taxa Data
myDF.Fish <- taxa_fish
myMetric.Values.Fish <- metric.values(myDF.Fish, "fish", myMetrics.Fish, TRUE)
#View(myMetric.Values.Fish)
# SCORE
Metrics.Fish.Scores <- metric.scores(myMetric.Values.Fish, myMetrics.Fish, "Index.Name", "FIBISTRATA", thresh)
# View Results
knitr::kable(head(Metrics.Fish.Scores))

## ----IBI Ben MBSS, echo=TRUE--------------------------------------------------
# Metrics, Index, Benthic Macroinvertebrates, genus
# (generate values then scores)
myIndex <- "MBSS.2005.Bugs"
# Thresholds
thresh <- metrics_scoring
# get metric names for myIndex
(myMetrics.Bugs.MBSS <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"MetricName.Other"]))))
# Taxa Data
myDF.Bugs.MBSS <- taxa_bugs_genus
myMetric.Values.Bugs.MBSS <- metric.values(myDF.Bugs.MBSS, "bugs", myMetrics.Bugs.MBSS)
#View(myMetric.Values.Bugs.MBSS)
# SCORE
Metrics.Bugs.Scores.MBSS <- metric.scores(myMetric.Values.Bugs.MBSS, myMetrics.Bugs.MBSS, "INDEX.NAME", "STRATA_R", thresh)
# View Results
#View(Metrics.Bugs.Scores.MBSS)

# QC bug count
Metrics.Bugs.Scores.MBSS[Metrics.Bugs.Scores.MBSS[,"totind"]>120,"QC_Count"] <- "LARGE"
Metrics.Bugs.Scores.MBSS[Metrics.Bugs.Scores.MBSS[,"totind"]<60,"QC_Count"] <- "SMALL"
Metrics.Bugs.Scores.MBSS[is.na(Metrics.Bugs.Scores.MBSS[,"QC_Count"]),"QC_Count"] <- "OK"
# table of QC_Count
knitr::kable(head(Metrics.Bugs.Scores.MBSS))

## ----IBI Ben MSW, echo=TRUE---------------------------------------------------
# Metrics, MSW Index, Benthic Macroinvertebrates, family
myIndex <- "MSW.1999.Bugs"
# Thresholds
thresh <- metrics_scoring
# get metric names for myIndex
(myMetrics.Bugs.MSW <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"MetricName.Other"]))))
# Taxa Data
myDF.Bugs.MSW <- taxa_bugs_family
myMetric.Values.Bugs.MSW <- metric.values(myDF.Bugs.MSW, "bugs", myMetrics.Bugs.MSW)
#View(myMetric.Values.Bugs.MSW)
# SCORE
Metrics.Bugs.Scores.MSW <- metric.scores(myMetric.Values.Bugs.MSW, myMetrics.Bugs.MSW, "INDEX.NAME", "STRATA_R", thresh)
# View Results
knitr::kable(head(Metrics.Bugs.Scores.MSW))

## ----TaxaMaps, eval=FALSE-----------------------------------------------------
#  # Set Working Directory
#  wd <- getwd()
#  # Create Example Data if Needed
#  ## Create Directories
#  myDir.create <- file.path(wd,"Data")
#  ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
#  myDir.create <- file.path(wd,"GIS")
#  ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
#  myDir.create <- file.path(wd,"Maps")
#  ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
#  ## Create Data
#  ### Taxa Data
#  myFiles <- c("AllFish_95to16.xls", "TaxaMapsCrossWalk20170731.xlsx")
#  file.copy(file.path(path.package("MBSStools"),"extdata",myFiles),file.path(wd,"Data",myFiles))
#  ### GIS
#  unzip(file.path(path.package("MBSStools"),"extdata","MD_GIS.zip"),exdir=file.path(wd,"GIS"))

## ----TaxaMaps Input, echo=FALSE-----------------------------------------------
# library
library(readxl)

# data files
obs <- "AllFish_95to16.xls"
xWalk <- "TaxaMapsCrossWalk20170731.xlsx"

all.taxa <- system.file("extdata", obs, package = "MBSStools")
taxa.lu <- system.file("extdata", xWalk, package = "MBSStools")

# Read in Taxon observations
df.taxa.obs <- readxl::read_excel(all.taxa, sheet=1,col_names=TRUE,skip=0)
df.taxa.obs <- as.data.frame(df.taxa.obs)
df.taxa.obs[,1] <- tolower(df.taxa.obs[,1])
#df.taxa.obs <- as.data.frame(cbind(tolower(df.taxa.obs[,"TaxaName"]), df.taxa.obs[,2:3]))
colnames(df.taxa.obs)[1] <- "CommonName"

head(df.taxa.obs)

## ----TaxaMaps Crosswalk, echo=FALSE-------------------------------------------
# library
library(readxl)

# data files
obs <- "AllFish_95to16.xls"
xWalk <- "TaxaMapsCrossWalk20170731.xlsx"

all.taxa <- system.file("extdata", obs, package = "MBSStools")
taxa.lu <- system.file("extdata", xWalk, package = "MBSStools")

# Read in TaxaMapsCrossWalk.xlsx
df.lu.taxa <- readxl::read_excel(taxa.lu,sheet=1,col_names=TRUE,skip=0)
df.lu.taxa <- as.data.frame(df.lu.taxa[,c("CommonName","MapName")])
df.lu.taxa[,"CommonName"] <- tolower(df.lu.taxa[,"CommonName"])
# df.lu.taxa <- as.data.frame(cbind(tolower(df.lu.taxa[,"CommonName"]),df.lu.taxa[,"MapName"]))
# colnames(df.lu.taxa)[1:2] <- c("CommonName","MapName")

head(df.lu.taxa)


## ----TaxaMaps Example Code, eval=FALSE----------------------------------------
#  # Set Working Directory
#  wd <- getwd()
#  
#  # Inputs
#  Obs <- "AllFish_95to16.xls"
#  XWalk <- "TaxaMapsCrossWalk20170731.xlsx"
#  wd <- getwd()
#  
#  # Create maps
#  MapTaxaObs(Obs, XWalk, wd, onlymatches = FALSE)

## ----TaxaMap Brown Trout, echo=FALSE, results="hide", fig.show='hold', warnings=FALSE, eval=TRUE----
# example map.
# include only brown trout
# brntrout.png
# assume already created directories

## library
library(readxl)
library(rgdal)

# Set Working Directory
wd <- getwd()
# Create Example Data if Needed
## Create Directories
myDir.create <- file.path(wd,"Data")
ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
myDir.create <- file.path(wd,"GIS")
ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
myDir.create <- file.path(wd,"Maps")
ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
## Create Data
### Taxa Data
myFiles <- c("AllFish_95to16.xls", "TaxaMapsCrossWalk20170731.xlsx")
file.copy(file.path(path.package("MBSStools"),"extdata",myFiles),file.path(wd,"Data",myFiles))
### GIS
unzip(file.path(path.package("MBSStools"),"extdata","MD_GIS.zip"),exdir=file.path(wd,"GIS"))



# data files
obs <- "AllFish_95to16.xls"
xWalk <- "TaxaMapsCrossWalk20170731.xlsx"

oldwd <- getwd()
setwd("..") #resets to vignette dir when run as code chunk
dirMain <- getwd()  
dirData = "Data"
dirGIS = "GIS"
verbose = TRUE
onlymatches = TRUE

all.taxa <- system.file("extdata", obs, package = "MBSStools")
taxa.lu <- system.file("extdata", xWalk, package = "MBSStools")

# Read in Taxon observations
df.taxa.obs <- readxl::read_excel(all.taxa,sheet=1,col_names=TRUE,skip=0)
df.taxa.obs <- as.data.frame(df.taxa.obs)
df.taxa.obs[,1] <- tolower(df.taxa.obs[,1])
#df.taxa.obs <- as.data.frame(cbind(tolower(df.taxa.obs[,"TaxaName"]), df.taxa.obs[,2:3]))
colnames(df.taxa.obs)[1] <- "CommonName"

## Trim to browntrout
df.taxa.obs <- df.taxa.obs[df.taxa.obs[,"CommonName"]=="brown trout",]


# Read in TaxaMapsCrossWalk.xlsx
df.lu.taxa <- readxl::read_excel(taxa.lu,sheet=1,col_names=TRUE,skip=0)
df.lu.taxa <- as.data.frame(df.lu.taxa[,c("CommonName","MapName")])
df.lu.taxa[,"CommonName"] <- tolower(df.lu.taxa[,"CommonName"])
# df.lu.taxa <- as.data.frame(cbind(tolower(df.lu.taxa[,"CommonName"]),df.lu.taxa[,"MapName"]))
# colnames(df.lu.taxa)[1:2] <- c("CommonName","MapName")

 # 4. Munge Data ####
# Compare TaxaName to CommonName
taxa.names <- as.vector(df.lu.taxa[,"CommonName"])
matches <- as.vector(df.taxa.obs[,"CommonName"]) %in% taxa.names
df.taxa.nomatch <- as.data.frame(unique(sort(df.taxa.obs[,"CommonName"][!matches])))
colnames(df.taxa.nomatch)[1] <- "CommonName"
df.taxa.match <- as.data.frame(unique(sort(df.taxa.obs[,"CommonName"][matches])))
colnames(df.taxa.match)[1] <- "CommonName"

#if (onlymatches == TRUE) {
    # Create a data frame of common names and filenames for matching taxa
    map.taxa <- subset(df.lu.taxa, CommonName %in% df.taxa.match[,"CommonName"],
                       select = c(CommonName,MapName))

# 5. Mapping ####
ppi <- 72
#dsn<-paste(dirMain,dirGIS,sep="/")
dsn <- file.path(dirMain, dirGIS)
state     <- rgdal::readOGR(dsn = dsn, layer = "MD_State_Boundary", verbose=verbose)
coastline <- rgdal::readOGR(dsn = dsn, layer = "MD_Coast_Hydrology", verbose=verbose)
counties  <- rgdal::readOGR(dsn = dsn, layer = "MD_Boundary_County_Detailed", verbose=verbose)

i<-1

taxon <- as.character(map.taxa$CommonName[i])


  filename <- map.taxa$MapName[i]
  df.taxon.sites <- subset(df.taxa.obs, df.taxa.obs[,"CommonName"]==taxon)
  df.taxon.sites <- subset(df.taxon.sites, !is.na(df.taxon.sites["Latitude83"]))

  
  plot(state, col="white", border="gray")
    plot(coastline, add = TRUE, col="light blue", border=FALSE)
    plot(counties, add = TRUE, col="white", border="darkslategray", lwd=0.5)
    #xy <- df.taxon.sites[,2:3]
    proj.sites <- rgdal::project(cbind(df.taxon.sites$Longitude83,df.taxon.sites$Latitude83),
                          "+proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77
            +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs")
    points(proj.sites[,1], proj.sites[,2], pch=21, col="black", bg="green", cex=1.0)
        
        
 #reset old working directory
 #setwd <- oldwd

## ----Discharge, eval=FALSE----------------------------------------------------
#  library(MBSStools)
#  # data
#  MBSS.flow <- MBSS.flow
#  # calculate flow
#  flow.cell <- FlowSum(MBSS.flow, returnType="cell")
#  flow.sample <- FlowSum(MBSS.flow)
#  # examine data
#  View(flow.cell)
#  View(flow.sample)
#  # Example Save file (tab delimited text file)
#  datetime <- format(Sys.time(),"%Y%m%d_%H%M%S")
#  myYear <- "15"
#  write.table(flow.sample,paste0("SumFlow",myYear,"_",datetime,".tab"),row.names=FALSE,sep="\t")

## ----Ion Ref, echo=FALSE, results='asis'--------------------------------------
knitr::kable(MBSS.Ion.Ref)

## ----Ion Data, eval=TRUE, echo=FALSE, results='asis'--------------------------
knitr::kable(head(MBSS.Ion.Data))

## ----Ion Example, echo=TRUE, results='asis', warnings=FALSE-------------------
library(MBSStools)
# Load Data
data.ion <- MBSS.Ion.Data
# Load Reference Table
ref.ion <- MBSS.Ion.Ref
# Calculate Percent Contribution by Ion (data table only)
contrib.ion <- IonContrib(data.ion)
#knitr::kable(head(contrib.ion))

## ----Ion Results and Charts, echo=TRUE, results="hide", fig.show='hold'-------
# Load Data
data.ion <- MBSS.Ion.Data
# Load Reference Table
ref.ion <- MBSS.Ion.Ref
# Calculate Percent Contribution by Ion (data table only)
contrib.ion <- IonContrib(data.ion)
#View(contrib.ion)
# Calculate Percent Contribution by Ion (data table and reference table)
contrib.ion.2 <- IonContrib(data.ion, ref.ion)
#View(contrib.ion.2)
# Calculate Percent Contribution by Ion (data table, reference table, and conductivity values)
# ## add dummy conductivity values for each sample
# myCond <- "Cond"
# data.ion[,myCond] <- 4000
# contrib.ion.3 <- IonContrib(data.ion, ref.ion, myCond)
# View(contrib.ion.3)
# Save Results (use write.table())
# Plot Results
myIons <- c("Chloride (mg/L)", "Bromide (mg/L)", "Nitrate-N (mg/L)", "Sulfate (mg/L)", "Sodium (mg/L)",
     "Potassium (mg/L)", "Magnesium (mg/L)",  "Calcium (mg/L)" )
myIons.Contrib <- paste0("PctContrib.",myIons)
mySite <- "BELK-101-X"
data.plot <- subset(contrib.ion, contrib.ion[,"Site"]==mySite, select=c("Site","Cond.Total",myIons.Contrib,myIons))
## Plot, one site (with cond value)
dotchart(as.numeric(as.vector(data.plot[,myIons.Contrib])), labels=myIons, main=mySite, xlab="Percent Contribution", pch=19, pt.cex=1.2)
mtext(paste0("Conductivity (uS/cm) = ",round(data.plot[,"Cond.Total"],1)))
## Plot all sites using panel.dotplot() in the lattice package
#
## Plot as a horizontal bar plot
# need to change margins to fit labels
#par(mai=c(1,2,1,1))
barplot(as.numeric(as.vector(data.plot[,myIons.Contrib])), names.arg=myIons, main=mySite, xlab="Percent Contribution"
       , axes=TRUE, horiz=TRUE, las=1)
mtext(paste0("Conductivity (uS/cm) = ",round(data.plot[,"Cond.Total"],1)))

## ----PHI Input, echo=FALSE, results='asis'------------------------------------
x <- MBSS.PHI
knitr::kable(head(x))

## ----PHI Results, echo=TRUE---------------------------------------------------
library(MBSStools)
# data
myData <- MBSS.PHI
# calculate PHI
PHI <- PHIcalc(myData)
knitr::kable(head(PHI))

## ----runShiny, echo=TRUE, eval=FALSE------------------------------------------
#  library(MBSStools)
#  runShiny()

