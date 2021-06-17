#' @title Assign MBSS strata
#'
#' @description Assign MBSS strata (BIBI [bugs] and FIBI [fish]) using the MBSS
#' GIS shapefiles.
#'
#' @details The results of this function are **provisional** and not official.
#' Strata should be checked using GIS software (e.g., ArcGIS).
#' GPS coordinates with low accuracy can affect the assignment of the correct
#' strata.
#'
#' Input is a data frame with columns for latitude and longitude.  Coordinates
#' should be decimal degrees.  This function is intended for use in Maryland
#' (USA) so longitudes will be converted to negative values.
#'
#' Default point projection is:
#' "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
#'
#' Locations outside of the strata GIS shapefiles will be coded as 'NA'.
#'
#' The GIS shapefiles are available at:
#'
#' https://github.com/leppott/MBSStools_SupportFiles
#'
#' * BIBI, mbss_strata.shp
#'
#' * FIBI, mbss_strata_coldstreams.shp converted to mbss_strata_fibi.ship
#'
#' * BIBI, MSW, mbss_strata_msw.shp (from mbss_strata.shp)
#'
#' The FIBI shapefile was a line layer that has been converted to a polygon
#' layer using the catchment shapefile from NHDplus version 2 and clipped to the
#' boundaries of the BIBI shapefile.
#'
#' @param data Data frame
#' @param col_lat Column name for latitude.  Default = "lat"
#' @param col_lon Column name for longitude.  Default = "lon"
#'
#' @return Returns the input data frame with one column for each strata (bibi
#' , fibi, and msw).
#'
#' @examples
#' # random points
#' myN <- 250
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
#' table(data_strata$strata_bibi, data_strata$strata_fibi, useNA = "ifany")

#'
#' # Plot
#' \dontrun{
#' library(rgdal)
#'
#' ## subset sites
#' sites_CP <- data_strata[data_strata[, "strata_fibi"] == "Coastal", ]
#' sites_EP <- data_strata[data_strata[, "strata_fibi"] == "EPiedmont", ]
#' sites_Hi <- data_strata[data_strata[, "strata_fibi"] == "Highland", ]
#' sites_Cold <- data_strata[data_strata[, "strata_fibi"] == "Cold", ]
#'
#' ## Plot
#' plot(shp_strata_fish
#'      , col = "white"
#'      , border = "darkslategray"
#'      , lwd = 0.5)
#' pts_col <- "black"
#' pts_cex <- 1.0
#' pts_pch <- 21
#' pts_bg  <- c("gray", "green", "purple", "orange", "blue")
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
#' graphics::points(sites_EP[, col_lon]
#'               , sites_EP[, col_lat]
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
#'     , legend = c("NA", "Coastal", "EPiedmont", "Highland", "Coldwater")
#'     , col = pts_col
#'     , pch = pts_pch
#'     , pt.bg = pts_bg
#'     , cex = pts_cex
#'     , title = "Strata"
#'     , box.lty = 0
#'     , bg = "white")
#' title(main = "Assignment of MBSS strata"
#'       , sub = paste0(myN, " random points using MBSStools::strata()"))
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
                                                   , shp_strata_fish)
  strata_msw <- MazamaSpatialUtils::getSpatialData(data[, col_lon]
                                                    , data[, col_lat]
                                                    , shp_strata_msw)


  # Update Data ----
  data[, "strata_bibi"] <- strata_bugs[, "Strata"]
  data[, "strata_fibi"] <- strata_fish[, "Strata"]
  data[, "strata_msw"]  <- strata_msw[, "Strata"]

  # Post QC ----
  # Convert <NA> to NA
  #df_pts[df_pts == "<NA>"] <- NA

  # Return ----
  return(data)
  #
}##FUNCTION.END
