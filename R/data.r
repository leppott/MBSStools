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
#' @title GIS shapefile, MBSS strata, bugs
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
# shp_strata_fish ----
#'
#' @title GIS shapefile, MBSS strata, fish
#'
#' @description A shapefile with polygons for Maryland for MBSS strata for fish.
#' Used with strata function.
#'
#' @format{
#'The format is:
#'  Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#'..@ data       :'data.frame':	4 obs. of  5 variables:
#'  .. ..$ FID_mbss_s: chr [1:4] "0" "1" "2" "2"
#'.. ..$ AREA      : num [1:4] 2.02e+10 4.76e+09 5.09e+09 1.95e+09
#'.. ..$ PERIMETER : num [1:4] 709260 406242 2095620 1377190
#'.. ..$ PROVINCES_: chr [1:4] "6" "1" "2" "0"
#'.. ..$ Strata    : chr [1:4] "Coastal" "Piedmont" "Highlands" "Cold"
#'..@ polygons   :List of 4
#'.. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#'.. .. .. ..@ Polygons :List of 1
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -76.2 38.6
#'.. .. .. .. .. .. ..@ area   : num 2.09
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:9585, 1:2] -77.1 -77.1 -77.1 -77.1 -77.1 ...
#'.. .. .. ..@ plotOrder: int 1
#'.. .. .. ..@ labpt    : num [1:2] -76.2 38.6
#'.. .. .. ..@ ID       : chr "0"
#'.. .. .. ..@ area     : num 2.09
#'.. .. .. ..$ comment: chr "0"
#'.. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#'.. .. .. ..@ Polygons :List of 1
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -76.7 39.4
#'.. .. .. .. .. .. ..@ area   : num 0.498
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:5258, 1:2] -75.8 -75.8 -75.8 -75.8 -75.8 ...
#'.. .. .. ..@ plotOrder: int 1
#'.. .. .. ..@ labpt    : num [1:2] -76.7 39.4
#'.. .. .. ..@ ID       : chr "1"
#'.. .. .. ..@ area     : num 0.498
#'.. .. .. ..$ comment: chr "0"
#'.. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#'.. .. .. ..@ Polygons :List of 77
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.000139
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:108, 1:2] -79.4 -79.5 -79.5 -79.5 -79.5 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.7
#'.. .. .. .. .. .. ..@ area   : num 2.16e-11
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.4 -79.4 -79.4 -79.4 39.7 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.00645
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:2389, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.7
#'.. .. .. .. .. .. ..@ area   : num 1.25e-13
#'.. .. .. .. .. .. ..@ hole   : logi TRUE
#'.. .. .. .. .. .. ..@ ringDir: int -1
#'.. .. .. .. .. .. ..@ coords : num [1:6, 1:2] -79.3 -79.3 -79.3 -79.3 -79.3 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.3 39.7
#'.. .. .. .. .. .. ..@ area   : num 4.79e-12
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.3 -79.3 -79.3 -79.3 -79.3 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.3 39.7
#'.. .. .. .. .. .. ..@ area   : num 2.05e-12
#'.. .. .. .. .. .. ..@ hole   : logi TRUE
#'.. .. .. .. .. .. ..@ ringDir: int -1
#'.. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.3 -79.3 -79.3 -79.3 39.7 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.3 39.7
#'.. .. .. .. .. .. ..@ area   : num 8.2e-05
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:88, 1:2] -79.3 -79.3 -79.3 -79.3 -79.3 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#'.. .. .. .. .. .. ..@ area   : num 1.89e-12
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.000185
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:128, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.00271
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:920, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.000496
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:295, 1:2] -79 -79 -79 -79 -79 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.000112
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:117, 1:2] -79 -79 -79 -79 -79 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -78.9 39.7
#'.. .. .. .. .. .. ..@ area   : num 8.06e-05
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:101, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -77.6 39.5
#'.. .. .. .. .. .. ..@ area   : num 0.484
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:19267, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -78.7 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.000258
#'.. .. .. .. .. .. ..@ hole   : logi TRUE
#'.. .. .. .. .. .. ..@ ringDir: int -1
#'.. .. .. .. .. .. ..@ coords : num [1:200, 1:2] -78.7 -78.7 -78.7 -78.7 -78.7 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -78.9 39.7
#'.. .. .. .. .. .. ..@ area   : num 8.33e-13
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -78.9 -78.9 -78.9 -78.9 39.7 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -78.9 39.7
#'.. .. .. .. .. .. ..@ area   : num 1.97e-09
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -78.9 -78.9 -78.9 -78.9 39.7 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -78.8 39.7
#'.. .. .. .. .. .. ..@ area   : num 0.000108
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:187, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -78.7 39.7
#'.. .. .. .. .. .. ..@ area   : num 1.42e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:33, 1:2] -78.7 -78.7 -78.7 -78.7 -78.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.7 39.7
#' .. .. .. .. .. .. ..@ area   : num 8.62e-13
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -78.7 -78.7 -78.7 -78.7 39.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.7 39.7
#' .. .. .. .. .. .. ..@ area   : num 1.08e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:21, 1:2] -78.7 -78.7 -78.7 -78.7 -78.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.8 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.000117
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:170, 1:2] -79 -79 -79 -79 -79 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.7
#' .. .. .. .. .. .. ..@ area   : num 1.26e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.5 -79.5 -79.5 -79.5 39.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.7
#' .. .. .. .. .. .. ..@ area   : num 5.91e-09
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.5 -79.5 -79.5 -79.5 39.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.7
#' .. .. .. .. .. .. ..@ area   : num 4.37e-07
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:10, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.7
#' .. .. .. .. .. .. ..@ area   : num 1.43e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:37, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.00188
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:734, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.7
#' .. .. .. .. .. .. ..@ area   : num 8.54e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:92, 1:2] -79 -79 -79 -79 -79 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.3 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.3 -79.3 -79.3 -79.3 -79.3 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.5
#' .. .. .. .. .. .. ..@ area   : num 0.0131
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:10066, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.5
#' .. .. .. .. .. .. ..@ area   : num 0.0197
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5451, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.6
#' .. .. .. .. .. .. ..@ area   : num 6.01e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:73, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.6
#' .. .. .. .. .. .. ..@ area   : num 5.96e-07
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:11, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.6
#' .. .. .. .. .. .. ..@ area   : num 8.79e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:110, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.6
#' .. .. .. .. .. .. ..@ area   : num 9.44e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.9 39.6
#' .. .. .. .. .. .. ..@ area   : num 9.43e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.5
#' .. .. .. .. .. .. ..@ area   : num 9.43e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79 -79 -79 -79 -79 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 6.24e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:110, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 9.43e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 2.86e-06
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:23, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.5
#' .. .. .. .. .. .. ..@ area   : num 9.43e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 5.04e-10
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.5 -79.5 -79.5 -79.5 39.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 3.57e-06
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:18, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 1.04e-07
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 1.18e-12
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.5 -79.5 -79.5 -79.5 39.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.4 39.5
#' .. .. .. .. .. .. ..@ area   : num 9.42e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.4 -77.4 -77.4 -77.4 -77.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.5
#' .. .. .. .. .. .. ..@ area   : num 9.42e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79 -79 -79 -79 -79 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 9.42e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.4
#' .. .. .. .. .. .. ..@ area   : num 2.39e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:8, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.4
#' .. .. .. .. .. .. ..@ area   : num 0.00111
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:1694, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 0.000315
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:265, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.3 39.4
#' .. .. .. .. .. .. ..@ area   : num 4.51e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:108, 1:2] -79.3 -79.3 -79.3 -79.3 -79.3 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.42e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.41e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.41e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.41e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 2.01e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:46, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.41e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.42e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.4 -77.4 -77.4 -77.4 -77.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 3.7e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:70, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.4
#' .. .. .. .. .. .. ..@ area   : num 9.41e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 7.7e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:89, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.4
#' .. .. .. .. .. .. ..@ area   : num 0.000319
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:258, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.3
#' .. .. .. .. .. .. ..@ area   : num 0.00242
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4812, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.3
#' .. .. .. .. .. .. ..@ area   : num 0.000111
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:112, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.3
#' .. .. .. .. .. .. ..@ area   : num 6.54e-07
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:14, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.3
#' .. .. .. .. .. .. ..@ area   : num 5.88e-07
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:10, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.3
#' .. .. .. .. .. .. ..@ area   : num 0.000131
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:147, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.2
#' .. .. .. .. .. .. ..@ area   : num 2.41e-09
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4, 1:2] -79.5 -79.5 -79.5 -79.5 39.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.2
#' .. .. .. .. .. .. ..@ area   : num 2.12e-06
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:19, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. ..@ plotOrder: int [1:77] 14 37 36 3 10 71 28 57 11 70 ...
#' .. .. .. ..@ labpt    : num [1:2] -77.6 39.5
#' .. .. .. ..@ ID       : chr "2"
#' .. .. .. ..@ area     : num 0.534
#' .. .. .. ..$ comment: chr "0 0 0 0 0 0 0 0 0 0 0 0 0 0 14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 "| __truncated__
#' .. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#' .. .. .. ..@ Polygons :List of 21
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.5
#' .. .. .. .. .. .. ..@ area   : num 0.163
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:17088, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 0.000315
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:269, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.3 39.4
#' .. .. .. .. .. .. ..@ area   : num 4.51e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:108, 1:2] -79.3 -79.3 -79.3 -79.3 -79.3 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 2.03e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:54, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 3.7e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:70, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.4
#' .. .. .. .. .. .. ..@ area   : num 7.7e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:89, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.1 39.6
#' .. .. .. .. .. .. ..@ area   : num 6.01e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:73, 1:2] -79.1 -79.1 -79.1 -79.1 -79.1 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.00188
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:742, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.7
#' .. .. .. .. .. .. ..@ area   : num 8.54e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:92, 1:2] -79 -79 -79 -79 -79 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.000117
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:170, 1:2] -79 -79 -79 -79 -79 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.7
#' .. .. .. .. .. .. ..@ area   : num 5.22e-05
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:109, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.8 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.00475
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:1325, 1:2] -78.9 -78.9 -78.8 -78.8 -78.8 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.7 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.00388
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:1012, 1:2] -78.7 -78.7 -78.7 -78.7 -78.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.6
#' .. .. .. .. .. .. ..@ area   : num 0.0293
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:4142, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 6.25e-05
#' .. .. .. .. .. .. ..@ hole   : logi TRUE
#' .. .. .. .. .. .. ..@ ringDir: int -1
#' .. .. .. .. .. .. ..@ coords : num [1:114, 1:2] -77.5 -77.5 -77.5 -77.5 -77.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -78.7 39.7
#' .. .. .. .. .. .. ..@ area   : num 0.000258
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:200, 1:2] -78.7 -78.7 -78.7 -78.7 -78.7 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.2 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.2 -79.2 -79.2 -79.2 -79.2 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.6 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.6 -77.6 -77.6 -77.6 -77.6 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -77.6 39.7
#' .. .. .. .. .. .. ..@ area   : num 9.45e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -77.6 -77.6 -77.6 -77.6 -77.6 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.5 39.5
#' .. .. .. .. .. .. ..@ area   : num 0.00577
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:1048, 1:2] -79.5 -79.5 -79.5 -79.5 -79.5 ...
#' .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#' .. .. .. .. .. .. ..@ labpt  : num [1:2] -79.4 39.2
#' .. .. .. .. .. .. ..@ area   : num 9.39e-08
#' .. .. .. .. .. .. ..@ hole   : logi FALSE
#' .. .. .. .. .. .. ..@ ringDir: int 1
#' .. .. .. .. .. .. ..@ coords : num [1:5, 1:2] -79.4 -79.4 -79.4 -79.4 -79.4 ...
#' .. .. .. ..@ plotOrder: int [1:21] 1 14 20 12 13 8 2 16 10 9 ...
#' .. .. .. ..@ labpt    : num [1:2] -79.2 39.5
#' .. .. .. ..@ ID       : chr "3"
#' .. .. .. ..@ area     : num 0.207
#' .. .. .. ..$ comment: chr "0 1 1 1 1 1 1 1 1 1 0 0 0 0 14 0 0 0 0 0 0"
#' ..@ plotOrder  : int [1:4] 1 3 2 4
#' ..@ bbox       : num [1:2, 1:2] -79.5 37.9 -75 39.7
#' .. ..- attr(*, "dimnames")=List of 2
#' .. .. ..$ : chr [1:2] "x" "y"
#' .. .. ..$ : chr [1:2] "min" "max"
#' ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
#' .. .. ..@ projargs: chr "+proj=longlat +datum=WGS84 +no_defs"
#' .. .. ..$ comment: chr "GEOGCRS[\"unknown\",    DATUM[\"World Geodetic System 1984\",        ELLIPSOID[\"WGS 84\",6378137,298.25722"| __truncated__
#' ..$ comment: chr "TRUE"
#'}
#'
#' @source MBSS, manipulated mbss_strata_coldstreams with NHD+ v2 to get polygon
#' layer.  Then union with mbss_strata.
"shp_strata_fish"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# shp_strata_msw----
#'
#' @title GIS shapefile, MBSS (MSW) strata, bugs
#'
#' @description A shapefile with polygons for Maryland for MBSS strata for MSW.
#' Used with strata function.
#'
#' @format{
#'The format is:
#'  Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#'..@ data       :'data.frame':	2 obs. of  4 variables:
#'  .. ..$ AREA      : num [1:2] 2.02e+10 1.18e+10
#'.. ..$ PERIMETER : num [1:2] 709260 989089
#'.. ..$ PROVINCES_: chr [1:2] "-2" "-1"
#'.. ..$ Strata    : chr [1:2] "CP" "NCP"
#'..@ polygons   :List of 2
#'.. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#'.. .. .. ..@ Polygons :List of 1
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -76.2 38.6
#'.. .. .. .. .. .. ..@ area   : num 2.09
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:9585, 1:2] -77.1 -77.1 -77.1 -77.1 -77.1 ...
#'.. .. .. ..@ plotOrder: int 1
#'.. .. .. ..@ labpt    : num [1:2] -76.2 38.6
#'.. .. .. ..@ ID       : chr "0"
#'.. .. .. ..@ area     : num 2.09
#'.. .. .. ..$ comment: chr "0"
#'.. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#'.. .. .. ..@ Polygons :List of 1
#'.. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#'.. .. .. .. .. .. ..@ labpt  : num [1:2] -77.5 39.5
#'.. .. .. .. .. .. ..@ area   : num 1.24
#'.. .. .. .. .. .. ..@ hole   : logi FALSE
#'.. .. .. .. .. .. ..@ ringDir: int 1
#'.. .. .. .. .. .. ..@ coords : num [1:24274, 1:2] -79 -79 -79 -79 -79 ...
#'.. .. .. ..@ plotOrder: int 1
#'.. .. .. ..@ labpt    : num [1:2] -77.5 39.5
#'.. .. .. ..@ ID       : chr "1"
#'.. .. .. ..@ area     : num 1.24
#'.. .. .. ..$ comment: chr "0"
#'..@ plotOrder  : int [1:2] 1 2
#'..@ bbox       : num [1:2, 1:2] -79.5 37.9 -75 39.7
#'.. ..- attr(*, "dimnames")=List of 2
#'.. .. ..$ : chr [1:2] "x" "y"
#'.. .. ..$ : chr [1:2] "min" "max"
#'..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
#'.. .. ..@ projargs: chr "+proj=longlat +datum=WGS84 +no_defs"
#'.. .. ..$ comment: chr "GEOGCRS[\"unknown\",    DATUM[\"World Geodetic System 1984\",        ELLIPSOID[\"WGS 84\",6378137,298.25722"| __truncated__
#'..$ comment: chr "TRUE"
#'}
#'
#' @source MBSS, manipulated mbss_strata for only two strata (NCP and CP).
"shp_strata_msw"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
