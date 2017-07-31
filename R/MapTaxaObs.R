#' Taxa Observation Maps
#'
#' Map taxonomic observations in Maryland.  Inputs are 3 GIS shapefiles
#' (State, County, and Hydrology) for Maryland, Observations (taxa names and Lat/Longs), and
#' a crosswalk table of taxa names and map names.  Input files are assumed to be Excel with the data on the first worksheet.
#' Requires the packages readxl and rgdal.
#' The example data is fish but can be used for benthic macroinvertebrates as well.
#' Maps are output as PNG.  There is a flag for "only" matches between the data and the crosswalk table (this is the default).
#' There is also a "verbose" flag for printing status messages to the user (this is the default).
#' Tests for existence of Data, GIS directories and required files. On failure,
#' stops and prints missing directories/files to screen.
#'
#' @param obs Excel file containing 3 columns: TaxaName, Latitude83, Longitude83
#' @param xWalk Crosswalk (Excel file) of taxa names between taxa name in occurence file and file name outputs for maps.
#' Three columns (CommonName, Species, MapName).
#' @param dirMain Path for folder containing obs and xwalk. Optional. Default = getwd().
#' @param onlymatches Flag for mapping obs taxa matching xwalk taxa, or all taxa. Optional. Default = TRUE.
#' @param dirData Subdirectory of "dir" specified above with data files.  Default = "Data"
#' @param dirGIS Subdirectory of "dir" specified above with GIS files.  Default = "GIS"
#' @param dirMaps Subdirectory of "dir" specified above for map outputs.  Default = "Maps"
#' @param verbose Boolean value for including feedback to the user that the script is working.  Default = TRUE.
#' @return Saves the maps and a dataframe of observed taxa not matching xwalk taxa to the dirMaps folder.
#' @keywords MBSS, taxa, map
#' @examples
#' # Set Working Directory
#' wd <- getwd()
#' # Create Example Data if Needed
#' ## Create Directories
#' myDir.create <- file.path(wd,"Data")
#' ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
#' myDir.create <- file.path(wd,"GIS")
#' ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
#' myDir.create <- file.path(wd,"Maps")
#' ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory already exists")
#' ## Create Data
#' ### Taxa Data
#' myFiles <- c("AllFish_95to16.xls", "TaxaMapsCrossWalk20170731.xlsx")
#' file.copy(file.path(path.package("MBSStools"),"extdata",myFiles),file.path(wd,"Data",myFiles))
#' ### GIS
#' unzip(file.path(path.package("MBSStools"),"extdata","MD_GIS.zip"),exdir=file.path(wd,"GIS"))
#'
#' # Inputs
#' Obs <- "AllFish_95to16.xls"
#' XWalk <- "TaxaMapsCrossWalk20170731.xlsx"
#' wd <- getwd()
#'
#' # Create maps
#' MapTaxaObs(Obs, XWalk, wd)
#
#' @export
MapTaxaObs <- function(obs, xWalk, dirMain = getwd(), onlymatches = TRUE
                       , dirData = "Data", dirGIS = "GIS", dirMaps = "Maps"
                       , verbose = TRUE
                       ) {##FUNCTION.MapTaxaObs.START
    # # # # 0. QC
    # obs <- "AllFish_95to16.xls"
    # xWalk <- "TaxaMapsCrossWalk2.xlsx"
    # dirMain <- getwd()
    # onlymatches <- TRUE
    # dirData <- "data"
    # dirGIS <- "GIS"
    # dirMaps <- "Maps"
    # verbose <- TRUE
    # i <- 1

    # 1. Define Parameters ####
    #mainDir <- dir
    if (verbose==TRUE) {
      message(dirMain)
      #flush.console()
    }
    # dataDir<-"Data"
    # gisDir<-"GIS"
    # mapDir<-"Maps"

    sh.state  <- "MD_State_Boundary.shp"
    sh.coast  <- "MD_Coast_Hydrology.shp"
    sh.county <- "MD_Boundary_County_Detailed.shp"

    all.taxa <- paste(dirMain,dirData,obs,sep="/")
    taxa.lu <- paste(dirMain,dirData,xWalk,sep="/")

    # 2. Testing ####
    # Test for existence of required data subdirectory and data files
    fl.files <-"\n"
    if (!file_test("-d", file.path(dirMain, dirData))) {##IF.dirData.START
        if (file_test("-f", file.path(dirMain, dirData))) {
            fl.files <- paste(fl.files, "Path can't be created because a file with that name already exists.", sep = "\n")
        } else {
            fl.files <- paste(fl.files, "Data subdirectory does not exist.", sep = "\n")
        }
    } else {
        if (!file_test("-f", file.path(dirMain, dirData, obs))) {
            fl.files <- paste(fl.files, "Observation file does not exist.", sep="\n")
        }
        if (!file_test("-f", file.path(dirMain, dirData, xWalk))) {
            fl.files <- paste(fl.files, "Crosswalk file does not exist.",sep = "\n")
        }
    }##IF.dirData.END

    # Test for existence of required data subdirectory and data files
    if (!file_test("-d", file.path(dirMain, dirGIS))) {##IF.dirGIS.START
        if (file_test("-f", file.path(dirMain, dirGIS))) {
            fl.files <- paste(fl.files, "Path can't be created because a file with that name already exists.", sep = "\n")
        } else {
            fl.files <- paste(fl.files, "GIS subdirectory does not exist.", sep = "\n")
        }
    } else {
        if (!file_test("-f", file.path(dirMain, dirGIS, sh.state))) {
            fl.files <- paste(fl.files, "State boundary shapefile does not exist.", sep = "\n")
        }
        if (!file_test("-f", file.path(dirMain, dirGIS, sh.coast))) {
            fl.files <- paste(fl.files, "Coast boundary shapefile does not exist.", sep = "\n")
        }
        if (!file_test("-f", file.path(dirMain, dirGIS, sh.county))) {
            fl.files <- paste(fl.files, "County boundary shapefile does not exist.", sep = "\n")
        }
    }##IF.dirGIS.END

    if (fl.files != "\n") {##IF.!=.START
        stop(fl.files)
    }##IF.!=.END

    # Make the Maps subdirectory if it doesn't exist
    if (!file_test("-d", file.path(dirMain, dirMaps))) {##IF.dirMaps.START
        if (file_test("-f", file.path(dirMain, dirMaps))) {
            stop("Path can't be created because a file with that name already exists.")
        } else {
            dir.create(file.path(dirMain, dirMaps))
        }
    }##IF.dirMaps.END

    # 3. Read Data ####
    # Read in Taxon observations
    df.taxa.obs <- readxl::read_excel(all.taxa,sheet=1,col_names=TRUE,skip=0)
    df.taxa.obs <- as.data.frame(df.taxa.obs)
    df.taxa.obs[,1] <- tolower(df.taxa.obs[,1])
    #df.taxa.obs <- as.data.frame(cbind(tolower(df.taxa.obs[,"TaxaName"]), df.taxa.obs[,2:3]))
    colnames(df.taxa.obs)[1] <- "CommonName"

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

    if (onlymatches == TRUE) {
        # Create a data frame of common names and filenames for matching taxa
        map.taxa <- subset(df.lu.taxa, CommonName %in% df.taxa.match[,"CommonName"],
                           select = c(CommonName,MapName))
    } else {
        map.taxa.match <- subset(df.lu.taxa, CommonName %in% df.taxa.match[,"CommonName"],
                            select = c(CommonName,MapName))
        taxa.nomatch <- subset(df.taxa.obs, CommonName %in% df.taxa.nomatch[,"CommonName"],
                            select = CommonName)
        map.taxa.nomatch <- as.data.frame(unique(sort(taxa.nomatch$CommonName)))
        map.taxa.nomatch <- cbind(map.taxa.nomatch, as.data.frame(paste0("zzz_",
                            #gsub("(\\s+)","",map.taxa.nomatch[,1]),".png")))
                            gsub("(\\s+)","",map.taxa.nomatch[,1]))))
        colnames(map.taxa.nomatch) <- c("CommonName","MapName")
        map.taxa <- rbind(map.taxa.match, map.taxa.nomatch)
    }

    # 5. Mapping ####
    ppi <- 72
    #dsn<-paste(dirMain,dirGIS,sep="/")
    dsn <- file.path(dirMain, dirGIS)
    state     <- rgdal::readOGR(dsn = dsn, layer = "MD_State_Boundary", verbose=verbose)
    coastline <- rgdal::readOGR(dsn = dsn, layer = "MD_Coast_Hydrology", verbose=verbose)
    counties  <- rgdal::readOGR(dsn = dsn, layer = "MD_Boundary_County_Detailed", verbose=verbose)

    for (i in 1:nrow(map.taxa)) {##FOR.i.START
      taxon <- as.character(map.taxa$CommonName[i])
      filename <- map.taxa$MapName[i]
      df.taxon.sites <- subset(df.taxa.obs, df.taxa.obs[,"CommonName"]==taxon)
      df.taxon.sites <- subset(df.taxon.sites, !is.na(df.taxon.sites["Latitude83"]))
      ##PLOT.START
      png(file=paste0("Maps/",filename,".png"), width=8.5*ppi,height=5.5*ppi,
          pointsize=12, bg="white")
        plot(state, col="white", border="gray")
        plot(coastline, add = TRUE, col="light blue", border=FALSE)
        plot(counties, add = TRUE, col="white", border="darkslategray", lwd=0.5)
        #xy <- df.taxon.sites[,2:3]
        proj.sites <- rgdal::project(cbind(df.taxon.sites$Longitude83,df.taxon.sites$Latitude83),
                              "+proj=lcc +lat_1=39.45 +lat_2=38.3 +lat_0=37.66666666666666 +lon_0=-77
                +x_0=400000 +y_0=0 +datum=NAD83 +units=m +no_defs")
        points(proj.sites[,1], proj.sites[,2], pch=21, col="black", bg="green", cex=1.0)
      dev.off()
      # user feedback
      if (verbose==TRUE) {##IF.verbose.START
        message(paste0("Saving map ",i," of ",nrow(map.taxa),"; ",taxon,"."))
        #flush.console()
      }##IF.verbose.END
      ##PLOT.END
    }##FOR.i.END
    #
    # 6. Clean up ####
    # Number on Non-Matches
    n.nomatch <- nrow(df.taxa.nomatch)
    # Save Non-Matches and inform user
    if (n.nomatch==0) {
      message(paste0("There are no non-matching taxa names."))
    } else {
      file.output <- paste0("Maps/Taxa.NoMatch.csv")
      write.csv(df.taxa.nomatch, file.output)
      message(paste0("There are ",n.nomatch," non-matching taxa names.  The non-matches are saved in a table with the maps."))
      #
    }
    #
}##FUNCTION.MapTaxaObs.END



