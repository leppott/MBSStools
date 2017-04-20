#' Flow Sum Calculation
#'
#' Calculate flow from field measurements.  All measurements are in meters and meters per second.
#' The final flow measurement is reports as cms and cubic feet per second (cfs).
#'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Erik.Leppo@tetratech.com (EWL)
# 20170419
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @param df Data frame of data to be processed.  Must include the columns specified in the parameter df1.names.
#' @param df.names Column names; Optional. Defaults = c("SITEYR", "ChannelNum", "Lat_Loc_m", "Depth_m", "Velocity_m_s")
#' @param returnType Returns the original data with cell velocity (cell) or a summary table of the sample velocities (sample); "sample" is the default.
# @param SITEYR Unique identifier (Station/Site/Sample).
# @param SumFlowChannelNum channel number (always 1).
# @param Lat..Loc.m. Cross section profile distance measured in meters.
# @param Depth..m. Measured depth in meters.
# @param Velocity..m.s. Measured velocity in m/s.
#' @return Returns the requested dataframe; the original data with the area velocity by cell or by sample (default).
#' @keywords MBSS, flow
#' @examples
#' #open data
#' data.flow <-MBSS.flow
#' #data.flow <- load("./data/MBSS.flow.rda")
#' # names
#' # calculate flow
#' flow.cell <- FlowSum(data.flow,returnType="cell")
#' flow.sample <- FlowSum(data.flow)
#' # examine data
#' View(flow.cell)
#' View(flow.sample)
#' # Save file (tab delimited text file)
#' datetime <- format(Sys.time(),"%Y%m%d_%H%M%S")
#' myYear <- "15"
#' write.table(flow.sample,paste0("SumFlow",myYear,"_",datetime,".tab"),row.names=FALSE,sep="\t")
#' @export
FlowSum <- function(df, df.names = c("SITEYR"
                                     , "ChannelNum"
                                     , "Lat_Loc_m"
                                     , "Depth_m"
                                     , "Velocity_m_s"), returnType = "sample"){##FUN.FlowSum.START
  # 0. QC ####
  # 0.1. QC column names
  # test names
  #names(df) %in% df.names
  msg <- paste0(c("The names in the data frame do not include all of the names provided. ",names(df) %in% df.names))
  try(if(FALSE %in% (names(df) %in% df.names)) stop(msg))
  # 0.2. Assign Names
  # create name parameters to be used in the code.
  name.SampID   <- df.names[1]
  name.ChanNum  <- df.names[2]
  name.LatLoc   <- df.names[3]
  name.Depth    <- df.names[4]
  name.Velocity <- df.names[5]
  name.Width    <- "Width_m"
  name.VelCell  <- "Vel_Cell_cms"
  name.Vel.cms  <- "Vel_cms"
  name.Vel.cfs.calc <- "Vel_cfs_calc"
  name.Vel.cfs  <- "Vel_cfs"
  name.SampRep  <- "Samp_Rep"
  # 0.3. Error Checking on Inputs
  returnType  <- toupper(returnType)
  #
  # 1.0. Calculation ####
  data.calc <- df
  # Combine SampID and ChannelNum
  data.calc[,name.SampRep] <- paste0(data.calc[,name.SampID],"_",data.calc[,name.ChanNum])
  # 1.1. Calculate Width by SampleID
  #http://stackoverflow.com/questions/14846547/calculating-difference-row-values-by-group-in-r
  # move change c(0,diff(x)) to c(diff(x),0) to subtract previous not following row.
  #data.calc$width <- ave(fun.df$Lat..Loc..m., fun.df$SITEYR, FUN=function(x) c(diff(x),0))
  data.calc[,name.Width] <- ave(data.calc[,name.LatLoc], data.calc[,name.SampRep], FUN=function(x) c(diff(x),0))
  # 1.2. Calculate Cell Flow
  data.calc[,name.VelCell] <- with(data.calc, data.calc[,name.Width] * data.calc[,name.Depth] * data.calc[,name.Velocity])
  #View(data.calc)
  # 1. 3. Summarize flow by SampID
  data.agg <- aggregate(data.calc[,name.VelCell] ~ data.calc[,name.SampID], data=data.calc, FUN="sum")
  names(data.agg) <- c(name.SampID, name.Vel.cms)
  #names(data.agg)[names(data.agg)==name.VelCell] <- name.Vel.cms
  data.agg[,name.Vel.cfs.calc] <- 35.314*data.agg[,name.Vel.cms]
  data.agg[,name.Vel.cfs] <- round(data.agg[,name.Vel.cfs.calc],2)
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
}##FUN.FlowSum.END
