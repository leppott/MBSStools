\name{shp_strata_fish}
\alias{shp_strata_fish}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("shp_strata_fish")}
\format{
  The format is:
Formal class 'SpatialLinesDataFrame' [package "sp"] with 4 slots
  ..@ data       :'data.frame':	792 obs. of  18 variables:
  .. ..$ ID       : chr [1:792] "CMOHDF05L10" "CMOHDF05L102" "CMOHDF05L104" "CMOHDF05L107" ...
  .. ..$ STR_ORDER: chr [1:792] "2" "1" "1" "1D" ...
  .. ..$ TIDAL    : chr [1:792] "NT" "NT" "NT" "NT" ...
  .. ..$ PSUSHORT : chr [1:792] "138" "131" "131" "131" ...
  .. ..$ PSU_NUM  : chr [1:792] "138" "131" "131" "131" ...
  .. ..$ PSUNAME  : chr [1:792] "Casselman River" "Wills Creek" "Wills Creek" "Wills Creek" ...
  .. ..$ MDE6DIGT : chr [1:792] "050202" "021410" "021410" "021410" ...
  .. ..$ MDE6NAME : chr [1:792] "YOUGHIOGHENY RIVER" "NORTH BRANCH POTOMAC RIVER" "NORTH BRANCH POTOMAC RIVER" "NORTH BRANCH POTOMAC RIVER" ...
  .. ..$ MDE8DIGT : chr [1:792] "05020204" "02141003" "02141003" "02141003" ...
  .. ..$ MDE8NAME : chr [1:792] "Casselman River" "Wills Creek" "Wills Creek" "Wills Creek" ...
  .. ..$ DNR12DIG : chr [1:792] "050202040038" "021410030100" "021410030100" "021410030101" ...
  .. ..$ COUNTY1  : chr [1:792] "Garrett" "Allegany" "Allegany" "Allegany" ...
  .. ..$ COUNTY2  : chr [1:792] NA NA NA NA ...
  .. ..$ LENGTH   : num [1:792] 36.3 2791.8 2200 2794.2 3085.3 ...
  .. ..$ BRAID    : chr [1:792] "N" "N" "N" "N" ...
  .. ..$ LENGTH_1 : num [1:792] 36.3 120.2 2200 2794.2 0 ...
  .. ..$ TYPE     : chr [1:792] "CW" "CW" "CW" "CW" ...
  .. ..$ BIOSCORE : chr [1:792] "n" "n" "n" "n" ...
  ..@ lines      :List of 792
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:2, 1:2] -79 -79 39.7 39.7
  .. .. .. ..@ ID   : chr "0"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:24, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "1"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:15, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "2"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "3"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:36, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "4"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:7, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "5"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.8 -78.8 -78.8 39.7 39.7 ...
  .. .. .. ..@ ID   : chr "6"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:6, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "7"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:11, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "8"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.9 -78.9 -78.9 39.7 39.7 ...
  .. .. .. ..@ ID   : chr "9"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:12, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "10"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:31, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "11"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:27, 1:2] -78.9 -78.9 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "12"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:32, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "13"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:17, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "14"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:37, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "15"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:19, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "16"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:16, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "17"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "18"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:9, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "19"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:9, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "20"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:6, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "21"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:5, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "22"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:2, 1:2] -78.9 -78.9 39.6 39.6
  .. .. .. ..@ ID   : chr "23"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:39, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "24"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "25"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:15, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "26"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:8, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "27"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:14, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "28"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:4, 1:2] -78.9 -78.9 -78.9 -78.9 39.6 ...
  .. .. .. ..@ ID   : chr "29"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:4, 1:2] -78.9 -78.9 -78.9 -78.9 39.6 ...
  .. .. .. ..@ ID   : chr "30"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.9 -78.9 -78.9 39.6 39.6 ...
  .. .. .. ..@ ID   : chr "31"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:5, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "32"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:2, 1:2] -78.9 -78.9 39.6 39.6
  .. .. .. ..@ ID   : chr "33"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:28, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "34"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:5, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "35"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:34, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "36"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "37"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:18, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "38"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "39"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:6, 1:2] -78.9 -78.9 -78.9 -79 -79 ...
  .. .. .. ..@ ID   : chr "40"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.9 -78.9 -78.9 39.6 39.6 ...
  .. .. .. ..@ ID   : chr "41"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:12, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "42"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:16, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "43"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:14, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "44"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:14, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "45"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:41, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "46"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:14, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "47"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:10, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "48"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:8, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "49"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:2, 1:2] -78.9 -78.9 39.6 39.6
  .. .. .. ..@ ID   : chr "50"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:20, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "51"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "52"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.9 -78.9 -78.9 39.6 39.6 ...
  .. .. .. ..@ ID   : chr "53"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:21, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "54"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:10, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "55"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:20, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "56"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:11, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "57"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:28, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "58"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:5, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "59"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:12, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "60"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:4, 1:2] -79 -79 -79 -79 39.6 ...
  .. .. .. ..@ ID   : chr "61"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -79 -79 -79 39.6 39.6 ...
  .. .. .. ..@ ID   : chr "62"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:10, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "63"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:8, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "64"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:8, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "65"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:13, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "66"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:8, 1:2] -78.9 -78.9 -78.9 -79 -79 ...
  .. .. .. ..@ ID   : chr "67"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:12, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "68"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:15, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "69"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:22, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "70"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:14, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "71"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:31, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "72"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:29, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "73"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:7, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "74"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:29, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "75"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:4, 1:2] -79 -79 -79 -79 39.5 ...
  .. .. .. ..@ ID   : chr "76"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:25, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "77"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:33, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "78"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -79 -79 -79 39.5 39.5 ...
  .. .. .. ..@ ID   : chr "79"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:24, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "80"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:18, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "81"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:9, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "82"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:12, 1:2] -79 -79 -79 -79 -79 ...
  .. .. .. ..@ ID   : chr "83"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:22, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "84"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:8, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "85"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:5, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "86"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:13, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "87"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.9 -78.9 -78.9 39.5 39.5 ...
  .. .. .. ..@ ID   : chr "88"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:6, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "89"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -79 -79 -79 39.6 39.6 ...
  .. .. .. ..@ ID   : chr "90"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:16, 1:2] -78.9 -78.9 -78.9 -78.9 -78.8 ...
  .. .. .. ..@ ID   : chr "91"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:2, 1:2] -78.9 -78.9 39.6 39.6
  .. .. .. ..@ ID   : chr "92"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:19, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "93"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:3, 1:2] -78.9 -78.9 -78.9 39.6 39.6 ...
  .. .. .. ..@ ID   : chr "94"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:30, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "95"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:6, 1:2] -78.9 -78.9 -78.9 -78.9 -78.9 ...
  .. .. .. ..@ ID   : chr "96"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:17, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "97"
  .. ..$ :Formal class 'Lines' [package "sp"] with 2 slots
  .. .. .. ..@ Lines:List of 1
  .. .. .. .. ..$ :Formal class 'Line' [package "sp"] with 1 slot
  .. .. .. .. .. .. ..@ coords: num [1:18, 1:2] -78.8 -78.8 -78.8 -78.8 -78.8 ...
  .. .. .. ..@ ID   : chr "98"
  .. .. [list output truncated]
  ..@ bbox       : num [1:2, 1:2] -79.5 39.2 -77.3 39.7
  .. ..- attr(*, "dimnames")=List of 2
  .. .. ..$ : chr [1:2] "x" "y"
  .. .. ..$ : chr [1:2] "min" "max"
  ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
  .. .. ..@ projargs: chr "+proj=longlat +datum=WGS84 +no_defs"
  .. .. ..$ comment: chr "GEOGCRS[\"unknown\",\n    DATUM[\"World Geodetic System 1984\",\n        ELLIPSOID[\"WGS 84\",6378137,298.25722"| __truncated__
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(shp_strata_fish)
## maybe str(shp_strata_fish) ; plot(shp_strata_fish) ...
}
\keyword{datasets}
