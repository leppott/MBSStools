#' @title Assign MBSS strata
#'
#' @description Assign MBSS strata (bugs and fish) using the official MBSS GIS
#' shapefiles.
#'
#' Input is a data frame with columns for latitude and longitude.
#'
#' It is assumed this function is being used in the northern and western
#' hemispheres (i.e., US).  Longitudes will be converted to negative values.
#'
#' Locations outside of the input GIS shapefile (e.g., Maryland) will be coded
#' as 'NA'.
#'
#' * BIBI
#'
#'     + mbss_strata
#'
#' * FIBI
#'
#'     + mbss_strata_coldstreams
#'
#' Default point projection is:
#' "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
#'
#' @details The Shiny app based on the R package MBSStools is included in the R
#' package. This function launches that app.
#'
#' @param data Data frame
#' @param col_lat Column name for latitude.  Default = "lat"
#' @param col_lon Column name for longitude.  Default = "lon"
#'
#' @return Returns the input data frame with one column for each strata (bugs
#' and fish).
#'
#' @examples
#' # random points
#' myN <- 100
#' latitude <- runif(myN, min = 37+53/60, max = 39+43/60)
#' longitude <- runif(myN, min = -(79+29/60), max = -(75+3/60))
#'
#' data <- as.data.frame(cbind(longitude, latitude))
#' col_lat <- "latitude"
#' col_lon <- "longitude"
#'
#' # Run Function
#' data_strata <- strata(data, col_lat, col_lon)
#'
#' # View Results
#' head(data_strata)
#' table(data_strata$strata_bugs, data_strata$strata_fish, useNA = "ifany")

#'
#' # Plot
#' \dontrun{
#' library(rgdal)
#'
#' ## subset sites
#' sites_CP <- data_strata[data_strata[, "strata_fish"] == "Coastal", ]
#' sites_Pd <- data_strata[data_strata[, "strata_fish"] == "Piedmont", ]
#' sites_Hi <- data_strata[data_strata[, "strata_fish"] == "Highlands", ]
#' sites_Cold <- data_strata[data_strata[, "strata_fish"] == "Cold", ]
#'
#' ## Plot
#' plot(shp_strata_bugs
#'      , col = "white"
#'      , border = "darkslategray"
#'      , lwd = 0.5)
#' # plot(shp_strata_fish
#' #      , add = TRUE
#' #      , col = "white"
#' #      , border = "red"
#' #      , lwd = 0.25)
#' pts_col <- "black"
#' pts_cex <- 1.0
#' pts_pch <- 21
#' pts_bg  <- c("gray", "green", "blue", "purple", "yellow")
#' graphics::points(data[, col_lon]
#'                , data[, col_lat]
#'                , pch = pts_pch
#'                , col = pts_col
#'                , bg = pts_bg[1]
#'                , cex = pts_cex)
#' graphics::points(sites_CP[, col_lon]
#'               , sites_CP[, col_lat]
#'               , pch = pts_pch
#'               , col = pts_col
#'               , bg = pts_bg[2]
#'               , cex = pts_cex)
#' graphics::points(sites_Pd[, col_lon]
#'               , sites_Pd[, col_lat]
#'               , pch = pts_pch
#'               , col = pts_col
#'               , bg = pts_bg[3]
#'               , cex = pts_cex)
#' graphics::points(sites_Hi[, col_lon]
#'                , sites_Hi[, col_lat]
#'               , pch = pts_pch
#'               , col = pts_col
#'               , bg = pts_bg[4]
#'               , cex = pts_cex)
#' graphics::points(sites_Cold[, col_lon]
#'               , sites_Cold[, col_lat]
#'               , pch = pts_pch
#'               , col = pts_col
#'               , bg = pts_bg[5]
#'               , cex = pts_cex)
#' legend("bottomleft"
#'     , legend = c("NA", "Coastal", "Piedmont", "Highlands", "Coldwater")
#'     , col = pts_col
#'     , pch = pts_pch
#'     , pt.bg = pts_bg
#'     , cex = pts_cex
#'     , title = "Strata"
#'     , box.lty = 0
#'     , bg = "white")
#' }
#
#' @export
strata <- function(data
                   , col_lat = "lat"
                   , col_lon = "long") {
  #
  # QC ----
  ## convert longitude to negative values long <- -(abs(foo))
  data[data[, col_lon] > 0, col_lon] <- -data[data[, col_lon] > 0, col_lon]

  # Get Strata ----
  proj_wgs84 <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

  strata_bugs <- MazamaSpatialUtils::getSpatialData(data[, col_lon]
                                                   , data[, col_lat]
                                                   , shp_strata_bugs)
  strata_fish <- MazamaSpatialUtils::getSpatialData(data[, col_lon]
                                                   , data[, col_lat]
                                                   , shp_strata_bugs)


  # Update Data ----
  data[, "strata_bugs"] <- strata_bugs[, "Strata"]
  data[, "strata_fish"] <- strata_fish[, "Strata"]

  # Post QC ----
  # Convert <NA> to NA
  #df_pts[df_pts == "<NA>"] <- NA

  # Return ----
  return(data)
  #
}##FUNCTION.END
