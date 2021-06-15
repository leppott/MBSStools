#' MBSS.PHI
#'
#' MBSS Physical Habitat Index (PHI) data.
#'
#' @source PHI worksheet (Excel) master file from Paul et al. 2003_MBSS
#' (ea-03-4_phi).
#' @format a data frame with 81 observations and 20 variables:
#'
#'
"MBSS.PHI"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' MBSS.flow
#'
#' MBSS flow data.
#'
#' @source Example flow data for 2015
#' @format a data frame with 2,686 observations and 5 variables:
#'
#'
"MBSS.flow"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' MBSS.Ion.Data
#'
#' MBSS ion example data.
#'
#' @source December 2106 data
#' @format a data frame with 41 observations and 14 variables:
#'
#'
"MBSS.Ion.Data"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' MBSS.Ion.Ref
#'
#' MBSS ion reference data.  Used for calculating percent contribution of an ion
#'  to overall sample conductivity.
#'
#' @source Reference values for ion contribution calculations.
#' @format a data frame with 13 observations and 8 variables:
#'
#'
"MBSS.Ion.Ref"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' metrics_scoring
#'
#' MBSS IBI scoring information.  Used for scoring metrics in BIBI and FIBI.
#'
#' @source Reference scoring thresholds for BIBI and FIBI, Southerland et al.
#' 2005.
#' @format a dataframe with 69 observations and 8 variables:
#'
#'
"metrics_scoring"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' taxa_fish
#'
#' MBSS fish taxa information from 2016.  Used as example for calculating
#' metrics and index.
#' One additional "No Fish Observed" sampled added for testing.
#'
#' @source MBSS 2016 fish data.
#' @format a dataframe with 1694 observations and 15 variables:
#'
#'
"taxa_fish"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' taxa_bugs_genus
#'
#' MBSS benthic macroinvertebrate genus taxa information from 2016.  Used as
#' example for calculating metrics and index.
#'
#' @source MBSS 2016 benthic macroinvertebrate genus data.
#' @format a dataframe with 5066 observations and 20 variables:
#'
#'
"taxa_bugs_genus"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' taxa_bugs_family
#'
#' MSW benthic macroinvertebrate family taxa information from MBSS 2016 data.
#' Used as example for calculating metrics and index.
#'
#' @source MBSS 2016 benthic macroinvertebrate saved as MSW family data.
#' @format a dataframe with 2749 observations and 20 variables:
#'
#'
"taxa_bugs_family"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# shp_strata_bugs ----
#' @title GIS shapefile, MBSS strata bugs
#'
#' @description A shapefile with polygons for Maryland for MBSS strata for bugs.
#' Used with strata function.
#'
#' @format Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#' \describe{
#' ..@ data       :'data.frame':	3 obs. of  4 variables:
#' .. ..$ AREA      : num [1:3] 2.02e+10 0.00 0.00
#' .. ..$ PERIMETER : num [1:3] 708922 0 0
#' .. ..$ PROVINCES_: int [1:3] 6 1 2
#' .. ..$ Strata    : chr [1:3] "Coastal" "Piedmont" "Highlands"
#' ..@ polygons   :List of 3
#' .. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#' .. .. .. ..@ Polygons :List of 1
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -76.2 38.6
#' .. .. .. .. .. .. ..@ area   : num 2.09
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:9585, 1:2] -77.1 -77.1 -77.1 -77.1 -77.1 ...
#' .. .. .. ..@ plotOrder: int 1
#' .. .. .. ..@ labpt    : num [1:2] -76.2 38.6
#' .. .. .. ..@ ID       : chr "0"
#' .. .. .. ..@ area     : num 2.09
#' .. .. .. ..$ comment: chr "0"
#' .. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#' .. .. .. ..@ Polygons :List of 1
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -76.7 39.4
#' .. .. .. .. .. .. ..@ area   : num 0.498
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5258, 1:2] -75.8 -75.8 -75.8 -75.8 -75.8 ...
#' .. .. .. ..@ plotOrder: int 1
#' .. .. .. ..@ labpt    : num [1:2] -76.7 39.4
#' .. .. .. ..@ ID       : chr "1"
#' .. .. .. ..@ area     : num 0.498
#' .. .. .. ..$ comment: chr "0"
#' .. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#' .. .. .. ..@ Polygons :List of 1
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.1 39.5
#' .. .. .. .. .. .. ..@ area   : num 0.738
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:22165, 1:2] -76.9 -76.9 -76.9 -76.9 -76.9 ...
#' .. .. .. ..@ plotOrder: int 1
#' .. .. .. ..@ labpt    : num [1:2] -78.1 39.5
#' .. .. .. ..@ ID       : chr "2"
#' .. .. .. ..@ area     : num 0.738
#' .. .. .. ..$ comment: chr "0"
#' ..@ plotOrder  : int [1:3] 1 3 2
#' ..@ bbox       : num [1:2, 1:2] -79.5 37.9 -75 39.7
#' .. ..- attr(*, "dimnames")=List of 2
#' .. .. ..$ : chr [1:2] "x" "y"
#' #' .. .. ..$ : chr [1:2] "min" "max"
#' ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
#' .. .. ..@ projargs: chr "+proj=longlat +datum=WGS84 +no_defs"
#' .. .. ..$ comment: chr "GEOGCRS[\"unknown\",    DATUM[\"World Geodetic System 1984\",        ELLIPSOID[\"WGS 84\",6378137,298.25722"| __truncated__
#' ..$ comment: chr "TRUE"
#' }
#'
#' @source MBSS staff, mbss_strata.shp
"shp_strata_bugs"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
