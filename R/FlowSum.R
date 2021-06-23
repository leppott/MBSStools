#' Flow Sum Calculation
#'
#' Calculate flow from field measurements.  All measurements are in meters and
#' meters per second.
#' The final flow measurement is reports as cms and cubic feet per second (cfs).
#' Generates error message for blank (null) entries for inputs for Lateral
#' Location, Depth, and Velocity.
#' In addition it checks for samples with more than one channel but have the
#' same Channel Number.
#'
#' No special libraries are needed for this function.
#'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Erik.Leppo@tetratech.com (EWL)
# 20170419
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @param df Data frame of data to be processed.  Must include the columns
#' specified in the parameter df1.names.
#' @param df.names Column names; Optional. Defaults = c("SITEYR", "ChannelNum",
#' "Lat_Loc_m", "Depth_m", "Velocity_m_s")
#' @param returnType Returns the original data with cell velocity (cell) or a
#' summary table of the sample velocities (sample); "sample" is the default.
# @param SITEYR Unique identifier (Station/Site/Sample).
# @param SumFlowChannelNum channel number (always 1).
# @param Lat..Loc.m. Cross section profile distance measured in meters.
# @param Depth..m. Measured depth in meters.
# @param Velocity..m.s. Measured velocity in m/s.

#' @return Returns the requested dataframe; the original data with the discharge
#'  by cell or by sample (default).
#'
#' @examples
#' # calculate flow
#' flow.cell <- FlowSum(MBSS.flow, returnType = "cell")
#' flow.sample <- FlowSum(MBSS.flow)
#' # examine data
#' #View(flow.cell)
#' #View(flow.sample)
#' # Example Save file (tab delimited text file)
#' #datetime <- format(Sys.time(), "%Y%m%d_%H%M%S")
#' #myYear <- "15"
#' #write.table(flow.sample
#' #           , paste0("SumFlow", myYear, "_", datetime, ".tab")
#' #           , row.names=FALSE,sep="\t")
#'
#' @export
FlowSum <- function(df
                    , df.names = c("SITEYR"
                                  , "ChannelNum"
                                  , "Lat_Loc_m"
                                  , "Depth_m"
                                  , "Velocity_m_s")
                    , returnType = "sample") {
  # 0. QC ####
  df <- as.data.frame(df)
  # 0.1. QC column names
  # test names
  #names(df) %in% df.names
  msg <- paste0(c("The names in the data frame do not include all of the names
                  provided. ", df.names %in% names(df)))
  try(if(FALSE %in% (df.names %in% names(df))) stop(msg))
  # 0.2. Assign Names
  # create name parameters to be used in the code.
  name.SampID   <- df.names[1] # Sample ID (SITEYR)
  name.ChanNum  <- df.names[2] # Channel Number
  name.LatLoc   <- df.names[3] # Lateral Location (m)
  name.Depth    <- df.names[4] # Depth (m)
  name.Velocity <- df.names[5] # Velocity (m/s)
  name.Width    <- "Width_m"   # Width (m)
  name.DisCell  <- "Discharge_Cell_cms"
  name.Dis.cms  <- "Discharge_cms"
  name.Dis.cfs.calc <- "Discharge_cfs_calc"
  name.Dis.cfs  <- "Discharge_cfs"
  name.SampRep  <- "Samp_Rep"
  # 0.3. Error Checking on Inputs
  returnType  <- toupper(returnType)
  # 0.4. Potential errors in data
  data.calc <- df
  # Combine SampID and ChannelNum
  data.calc[,name.SampRep] <- paste0(data.calc[,name.SampID]
                                     , "_"
                                     , data.calc[, name.ChanNum])
  # 0.4.1. Check for blanks (Lat, Depth, Vel)
  msg.blank.LatLoc   <- paste0("There are blank entries in the data in column '"
                               ,name.LatLoc,"'. Please correct then retry.")
  msg.blank.Depth    <- paste0("There are blank entries in the data in column '"
                               ,name.Depth,"'. Please correct then retry.")
  msg.blank.Velocity <- paste0("There are blank entries in the data in column '"
                               ,name.Velocity,"'. Please correct then retry.")
  try(if(TRUE %in% is.na(data.calc[,name.LatLoc])) stop(msg.blank.LatLoc))
  try(if(TRUE %in% is.na(data.calc[,name.Depth])) stop(msg.blank.Depth))
  try(if(TRUE %in% is.na(data.calc[,name.Velocity])) stop(msg.blank.Velocity))
  # 0.4.2. Check for and stop if have duplicate Channels for a given SITEYR
  ## Find Samp_Rep with more than 1 zero for LatLoc
  Dist.zero <- data.calc[data.calc[,name.LatLoc]==0
                         , c(name.SampRep,name.LatLoc)]
  tbl.zero <- as.data.frame(table(Dist.zero[, name.SampRep]))
  dupChan <- as.vector(tbl.zero[tbl.zero[, 2] > 1, 1])
  # more than one entry and only the Samp_Rep
  # Number of SampRep and SampRep & LatLoc=0
  SampRep.calc <- length(unique(data.calc[,name.SampRep]))
  # Number of Unique SampReps in data
  SampRep.zero <- nrow(Dist.zero) # Number of SampRep and LatLoc=0
  # stop if lists aren't the same size
  msg.dupChan <- paste0("\n\nMore than one zero value for Lateral Distance ('"
  ,name.LatLoc,"').
\nThis indicates more than one channel ('",name.ChanNum,"') per sample ('"
,name.SampID,"'). Or an error in the data.
\nPlease correct then retry.  Sample and Channel IDs are presented below:
\n('",name.SampID,"' _ '",name.ChanNum,"') \n \n"
,paste0(dupChan,collapse="\n"))
  #try(if(SampRep.calc!=SampRep.zero) stop(msg.dupChan))
  # not right if min value is not zero
  try(if(sum(tbl.zero$Freq)!=nrow(tbl.zero)) stop(msg.dupChan))
  #
  # 1.0. Calculation ####
  # 1.1. Calculate Width by SampleID
  #http://stackoverflow.com/questions/14846547/
  # calculating-difference-row-values-by-group-in-r
  # move change c(0,diff(x)) to c(diff(x),0) to subtract previous not
  #following row.
  #data.calc$width <- ave(fun.df$Lat..Loc..m., fun.df$SITEYR
  # , FUN=function(x) c(diff(x),0))
  data.calc[,name.Width] <- stats::ave(data.calc[,name.LatLoc]
                                       , data.calc[,name.SampRep]
                                       , FUN=function(x) c(diff(x),0))
  # 1.2. Calculate Cell Flow
  data.calc[,name.DisCell] <- (data.calc[,name.Width] *
                                 data.calc[,name.Depth] *
                                 data.calc[,name.Velocity])
  #View(data.calc)
  # 1. 3. Summarize flow by SampID
  data.agg <- stats::aggregate(data.calc[,name.DisCell] ~
                                 data.calc[,name.SampID]
                               , data=data.calc
                               , FUN="sum")
  names(data.agg) <- c(name.SampID, name.Dis.cms)
  #names(data.agg)[names(data.agg)==name.DisCell] <- name.Dis.cms
  data.agg[,name.Dis.cfs.calc] <- 35.314 * data.agg[,name.Dis.cms]
  data.agg[,name.Dis.cfs] <- round(data.agg[, name.Dis.cfs.calc], 2)
  #View(data.agg)
  #
  # 2.0. Return result dataframe dependant upon returnType ####
  # only return "cell" if requested otherwise return "sample".
  if(returnType=="CELL") {##IF.returnType.START
    data.return <- data.calc
  } else {
    data.return <- data.agg
  }##IF.returnType.END
  #
  return(data.return)
  #
} ##FUN.FlowSum.END
