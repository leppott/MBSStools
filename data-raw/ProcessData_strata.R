# Prepare data for example for strata()
#
# Create RDA file from GIS shapefile
#
# Erik.Leppo@tetratech.com
# 20210615
##############################

# 0. Prep####
#library(rgdal)
#library(sp)
#library(MBSStools)

wd <- tempdir()
# assume working directory is MBSStools

# 1. Get data and process#####
# 1.1. GIS files
# utils::unzip(file.path(path.package("MBSStools"), "extdata", "MD_GIS_strata.zip")
#       , exdir = file.path(wd))

utils::unzip(file.path("inst", "extdata", "MD_GIS_strata.zip")
            , exdir = file.path(wd))


# 1.2. Process Data, Change Projection
dsn <- file.path(wd)
shp_strata_bugs <- rgdal::readOGR(dsn = dsn
                                  , layer = "mbss_strata"
                                  , verbose = TRUE)

shp_strata_fish<- rgdal::readOGR(dsn = dsn
                                 , layer = "mbss_strata_fibi"
                                 , verbose = TRUE)

shp_strata_msw <- rgdal::readOGR(dsn = dsn
                                  , layer = "mbss_strata_msw"
                                  , verbose = TRUE)


proj_wgs84 <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

shp_strata_bugs_wgs84 <- sp::spTransform(shp_strata_bugs
                                            , CRS = sp::CRS(proj_wgs84))
shp_strata_fish_wgs84 <- sp::spTransform(shp_strata_fish
                                            , CRS = sp::CRS(proj_wgs84))
shp_strata_msw_wgs84 <- sp::spTransform(shp_strata_msw
                                         , CRS = sp::CRS(proj_wgs84))


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Save as RDA for use in package####
#
shp_strata_bugs <- shp_strata_bugs_wgs84
usethis::use_data(shp_strata_bugs, overwrite = TRUE)
#
shp_strata_fish <- shp_strata_fish_wgs84
usethis::use_data(shp_strata_fish, overwrite = TRUE)
#
shp_strata_msw <- shp_strata_msw_wgs84
usethis::use_data(shp_strata_msw, overwrite = TRUE)

# Document
# promptData(shp_strata_bugs)
# promptData(shp_strata_fish)
