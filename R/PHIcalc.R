#' PHI Calculation
#'
#' Calculate MBSS Physical Habitat Index (PHI), Paul et al. 2003.
#'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Erik.Leppo@tetratech.com (EWL)
# 20170327
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @param fun.df Data frame of data to be processed.  Must include the columns specified in the parameter fun.names.
#' @param fun.names Column names; Optional. Defaults = c("SampID", "BioRegion", "Area_acres", "Remote_020", "Shading_0100", "EpiSub_020", "BankStab_020", "AvgRipWid_m50max", "InStrmHab_020", "InstrmWood_Num", "RiffQual_020", "Embedd_0100", "Erosn_ExtR_075", "Erosn_ExtL_075", "Erosn_SevR_03", "Erosn_SevL_03", "RoadDist_m")
# @param fun.SampID Unique identifier (Station/Site/Sample).
# @param fun.BioRegion Maryland Bioregion (Highlands, Piedmont, CoastalPlain).
# @param fun.PHICalcYear 1994 or 2000 (2000 is the default but can ).
# @param fun.Area_acres Watershed area (acres).
# @param fun.Remote_020 Remoteness (0-20) [1994 only, Replaces with Road Distance].
# @param fun.Shading_0100 Percent shading (0-100).
# @param fun.EpiSub_020 Epifaunal Substrate (0-20).
# @param fun.BankStab_020 Bank Stability (0-20) [1994 only, replaced with Erosion].
# @param fun.AvgRipWid_m50max Average riparian zone width (meters, maximum of 50).
# @param fun.InStrmHab_020 Instream habitat (0-20).
# @param fun.InstrmWood_Num Tally of instream wood (number).
# @param fun.RiffQual_020 Riffle quality (0-20).
# @param fun.Embedd_0100 Percent embeddedness (0-100).
# @param fun.Erosn_ExtR_075 Erosion, extent, right bank (0-75) [2000 only, replaces bank stability].
# @param fun.Erosn_ExtL_075 Erosion, extent, left bank (0-75) [2000 only, replaces bank stability].
# @param fun.Erosn_SevR_03 Erosion, severity, right bank (0-3) [2000 only, replaces bank stability].
# @param fun.Erosn_SevL_03 Erosion, severity, left bank (0-3) [2000 only, replaces bank stability].
# @param fun.RoadDist_m Distance to nearest road (meters) [2000 only, replaces remoteness].
#' @return Returns a dataframe of the original data with the metric scoring and PHI values.
#' @keywords MBSS, PHI
#' @examples
#' # calculate PHI
#' PHI <- PHIcalc(MBSS.PHI)
#' # examine data
#' View(PHI)
#' # Example Save file
#' #datetime <- format(Sys.time(),"%Y%m%d_%H%M%S")
#' #write.table(PHI,paste0("PHI_",datetime,".tab"),row.names=FALSE,sep="\t")
#' @export
PHIcalc <- function(fun.df,fun.names=c("SampID"
                                        , "BioRegion"
                                        , "Area_acres"
                                        , "Remote_020"
                                        , "Shading_0100"
                                        , "EpiSub_020"
                                        , "BankStab_020"
                                        , "AvgRipWid_m50max"
                                        , "InStrmHab_020"
                                        , "InstrmWood_Num"
                                        , "RiffQual_020"
                                        , "Embedd_0100"
                                        , "Erosn_ExtR_075"
                                        , "Erosn_ExtL_075"
                                        , "Erosn_SevR_03"
                                        , "Erosn_SevL_03"
                                        , "RoadDist_m")){
  # 0. QC ####
  # 0.1. QC column names
  # Define dataframe names
  names.default <- c("SampID"
                     , "BioRegion"
                     , "Area_acres"
                     , "Remote_020"
                     , "Shading_0100"
                     , "EpiSub_020"
                     , "BankStab_020"
                     , "AvgRipWid_m50max"
                     , "InStrmHab_020"
                     , "InstrmWood_Num"
                     , "RiffQual_020"
                     , "Embedd_0100"
                     , "Erosn_ExtR_075"
                     , "Erosn_ExtL_075"
                     , "Erosn_SevR_03"
                     , "Erosn_SevL_03"
                     , "RoadDist_m")
  # decide if use input names or default.
  # provided names in function call so if user does not provide the defaults are used.
  msg <- paste0("\n Incorrect number of column names provided (n=",length(fun.names),"). Default is 17.")
  try(if(length(fun.names)!=length(names.default)) stop(msg))
  # assign names
  names.df <- fun.names
  # create name parameters to be used in the code.
  name.SampID <- names.df[1]
  name.BioRegion <- names.df[2]
  name.Area_acres <- names.df[3]
  name.Remote_020 <- names.df[4]
  name.Shading_0100 <- names.df[5]
  name.EpiSub_020 <- names.df[6]
  name.BankStab_020 <- names.df[7]
  name.AvgRipWid_m50max <- names.df[8]
  name.InStrmHab_020 <- names.df[9]
  name.InstrmWood_Num <- names.df[10]
  name.RiffQual_020 <- names.df[11]
  name.Embedd_0100 <- names.df[12]
  name.Erosn_ExtR_075 <- names.df[13]
  name.Erosn_ExtL_075 <- names.df[14]
  name.Erosn_SevR_03 <- names.df[15]
  name.Erosn_SevL_03 <- names.df[16]
  name.RoadDist_m <- names.df[17]
  name.Erosn_SevR_02 <- "Erosn_SevR_02"
  name.Erosn_SevL_02 <- "Erosn_SevL_02"
  #
  # 0.2. Error Checking field boundaries ####
  # Not implemented.  For now PHI will calculate with NA data not contributing.
  # 20170428, ensure numeric values.  if not get error
  ## will still get error if have a real "character" value (but that is ok)
  fun.df[,names.df[3:17]] <- sapply(fun.df[,names.df[3:17]], as.numeric)
  #
  # 0.2.1. BioRegion (highlands, piedmont, coastalplain)
  # Don't need to check.  If not the proper names then no PHI will be calculated.
  # # 0.2.2. 0-3 parameters
  # name.Erosn_SevR_03
  # name.Erosn_SevL_03
  # # 0.2.3. 0-20 parameters
  # name.Remote_020
  # name.EpiSub_020
  # name.BankStab_020
  # name.InStrmHab_020
  # name.RiffQual_020
  # # 0.2.4. 0-50 parameters
  # name.AvgRipWid_m50max
  # # 0.2.5. 0-75 parameters
  # name.Erosn_ExtR_075
  # name.Erosn_ExtL_075
  # # 0.2.6. 0-100 parameters
  # name.Shading_0100
  # name.Embedd_0100
  #
  # 1.0. Data Manipulation.####
  # 1.1. Assign null (NA) values to extra columns
  fun.df[,"Erosn_SevR_02"] <- NA
  fun.df[,"Erosn_SevL_02"] <- NA
  fun.df[,"BANKSTAB1994"] <- NA
  fun.df[,"BANKSTAB2000"] <- NA
  fun.df[,"REMOTE1994"] <- NA
  fun.df[,"REMOTE2000"] <- NA
  name.PHI <- c("REMOTE", "SHADING", "EPI","BANKSTAB","RIPWID","INSTRHAB","WOOD","RIFFQUAL","EMBEDD")
  fun.df[,name.PHI] <- NA
  fun.df[,"PHI.denom"] <- NA
  # 1.2. Modify Values
  # Replace Severity Values for use in calculations
  fun.df[,name.Erosn_SevR_02] <- as.numeric(gsub(2,1.5,fun.df[,name.Erosn_SevR_03]))
  fun.df[,name.Erosn_SevR_02] <- as.numeric(gsub(3,2,fun.df[,name.Erosn_SevR_02]))
  fun.df[,name.Erosn_SevL_02] <- as.numeric(gsub(2,1.5,fun.df[,name.Erosn_SevL_03]))
  fun.df[,name.Erosn_SevL_02] <- as.numeric(gsub(3,2,fun.df[,name.Erosn_SevL_02]))
  #
  # 2.0. Score Metrics (n=3, different for each bioregion)####
  # 2.1. Highlands
  boo.BioRegion <- tolower(fun.df[,name.BioRegion])=="highlands"
    fun.df[,"REMOTE1994"][boo.BioRegion==TRUE] <- fun.df[,name.Remote_020][boo.BioRegion==TRUE]/20
    fun.df[,"REMOTE2000"][boo.BioRegion==TRUE] <- (sqrt(fun.df[,name.RoadDist_m][boo.BioRegion==TRUE])*0.733+0.615)/20
    fun.df[,"SHADING"][boo.BioRegion==TRUE] <- (asin(sqrt(fun.df[,name.Shading_0100][boo.BioRegion==TRUE]/100))-0.226)/1.171
    fun.df[,"EPI"][boo.BioRegion==TRUE] <- (fun.df[,name.EpiSub_020][boo.BioRegion==TRUE])/18
    fun.df[,"BANKSTAB1994"][boo.BioRegion==TRUE] <- (sqrt(fun.df[,name.BankStab_020][boo.BioRegion==TRUE]) - 1)/3.472
    fun.df[,"BANKSTAB2000"][boo.BioRegion==TRUE] <- (sqrt(((fun.df[,name.Erosn_ExtR_075][boo.BioRegion==TRUE]/(-15))*fun.df[,name.Erosn_SevR_02][boo.BioRegion==TRUE])+
                                                   ((fun.df[,name.Erosn_ExtL_075][boo.BioRegion==TRUE]/(-15))*fun.df[,name.Erosn_SevL_02][boo.BioRegion==TRUE]) + 20)-1)/3.472
    fun.df[,"RIPWID"][boo.BioRegion==TRUE] <- (fun.df[,name.AvgRipWid_m50max][boo.BioRegion==TRUE])/50
    fun.df[,"INSTRHAB"][boo.BioRegion==TRUE] <- NA
    fun.df[,"WOOD"][boo.BioRegion==TRUE] <- NA
    fun.df[,"RIFFQUAL"][boo.BioRegion==TRUE] <- NA
    fun.df[,"EMBEDD"][boo.BioRegion==TRUE] <- NA
    fun.df[,"PHI.denom"][boo.BioRegion==TRUE] <- 5
  #}
  # 2.2. Piedmont
   boo.BioRegion <- tolower(fun.df[,name.BioRegion])=="piedmont"
  # # if(tolower(fun.df[,name.Bioregion])=="piedmont") {
    fun.df[,"REMOTE1994"][boo.BioRegion==TRUE] <- fun.df[,name.Remote_020][boo.BioRegion==TRUE]/16
    fun.df[,"REMOTE2000"][boo.BioRegion==TRUE] <- (sqrt(fun.df[,name.RoadDist_m][boo.BioRegion==TRUE])*0.733+0.615)/16
    fun.df[,"SHADING"][boo.BioRegion==TRUE] <- ((asin(sqrt(fun.df[,name.Shading_0100][boo.BioRegion==TRUE]/100))-(1.7528-0.1990*(log10(fun.df[,name.Area_acres][boo.BioRegion==TRUE]))))+1.142)/1.405
    fun.df[,"EPI"][boo.BioRegion==TRUE] <- (fun.df[,name.EpiSub_020][boo.BioRegion==TRUE] - 1)/17
    fun.df[,"BANKSTAB1994"][boo.BioRegion==TRUE] <- (sqrt(fun.df[,name.BankStab_020][boo.BioRegion==TRUE]) - 1)/3.243
    fun.df[,"BANKSTAB2000"][boo.BioRegion==TRUE] <- (sqrt(((fun.df[,name.Erosn_ExtR_075][boo.BioRegion==TRUE]/(-15))*fun.df[,name.Erosn_SevR_02][boo.BioRegion==TRUE])+
                                                            ((fun.df[,name.Erosn_ExtL_075][boo.BioRegion==TRUE]/(-15))*fun.df[,name.Erosn_SevL_02][boo.BioRegion==TRUE]) + 20)-1)/3.243
    fun.df[,"RIPWID"][boo.BioRegion==TRUE] <- NA
    fun.df[,"INSTRHAB"][boo.BioRegion==TRUE] <- (fun.df[,name.InStrmHab_020][boo.BioRegion==TRUE]-(9.9876+1.5476*log10(fun.df[,name.Area_acres][boo.BioRegion==TRUE]))+12.805)/15.745
    fun.df[,"WOOD"][boo.BioRegion==TRUE] <- fun.df[,name.InstrmWood_Num][boo.BioRegion==TRUE]/12
    fun.df[,"RIFFQUAL"][boo.BioRegion==TRUE] <- (fun.df[,name.RiffQual_020][boo.BioRegion==TRUE]-(5.8467+2.4075*log10(fun.df[,name.Area_acres][boo.BioRegion==TRUE]))+16.252)/19.637
    fun.df[,"EMBEDD"][boo.BioRegion==TRUE] <- (100 - fun.df[,name.Embedd_0100][boo.BioRegion==TRUE])/90
    fun.df[,"PHI.denom"][boo.BioRegion==TRUE] <- 8
  # # }
  # 2.3. Coastal Plain
  boo.BioRegion <- tolower(fun.df[,name.BioRegion])=="coastalplain"
  # if(tolower(fun.df[,name.BioRegion])=="coastalplain") {
    fun.df[,"REMOTE1994"][boo.BioRegion==TRUE] <- fun.df[,name.Remote_020][boo.BioRegion==TRUE]/18.570
    fun.df[,"REMOTE2000"][boo.BioRegion==TRUE] <- (sqrt(fun.df[,name.RoadDist_m][boo.BioRegion==TRUE])*0.733+0.615)/18.570
    fun.df[,"SHADING"][boo.BioRegion==TRUE] <- (asin(sqrt(fun.df[,name.Shading_0100][boo.BioRegion==TRUE]/100))-0.226)/1.120
    fun.df[,"EPI"][boo.BioRegion==TRUE] <- (fun.df[,name.EpiSub_020][boo.BioRegion==TRUE]-(3.5233+2.5821*log10(fun.df[,name.Area_acres][boo.BioRegion==TRUE]))+13.199)/17.213
    fun.df[,"BANKSTAB1994"][boo.BioRegion==TRUE] <- sqrt(fun.df[,name.BankStab_020][boo.BioRegion==TRUE])/4.472
    fun.df[,"BANKSTAB2000"][boo.BioRegion==TRUE] <- (sqrt(((fun.df[,name.Erosn_ExtR_075][boo.BioRegion==TRUE]/(-15))*fun.df[,name.Erosn_SevR_02][boo.BioRegion==TRUE])+
                                                            ((fun.df[,name.Erosn_ExtL_075][boo.BioRegion==TRUE]/(-15))*fun.df[,name.Erosn_SevL_02][boo.BioRegion==TRUE]) + 20))/4.472
    fun.df[,"RIPWID"][boo.BioRegion==TRUE] <- NA
    fun.df[,"INSTRHAB"][boo.BioRegion==TRUE] <- (fun.df[,name.InStrmHab_020][boo.BioRegion==TRUE]-(0.5505+4.2475*log10(fun.df[,name.Area_acres][boo.BioRegion==TRUE]))+15.094)/18.023
    fun.df[,"WOOD"][boo.BioRegion==TRUE] <- (fun.df[,name.InstrmWood_Num][boo.BioRegion==TRUE]-(-12.24+8.8120*log10(fun.df[,name.Area_acres][boo.BioRegion==TRUE]))+28.903)/33.803
    fun.df[,"RIFFQUAL"][boo.BioRegion==TRUE] <- NA
    fun.df[,"EMBEDD"][boo.BioRegion==TRUE] <- NA
    fun.df[,"PHI.denom"][boo.BioRegion==TRUE] <- 6
  # }##IF.fun.Bioregion.END
  #
  # 3.0. More Data Manipulations (post scoring)####
  # 3.1.0. 1994 vs. 2000 parameters.  2000 is primary and used if not NA.  Else use 1994.
  # 3.1.1. REMOTE
  fun.df[,"REMOTE"] <- ifelse(is.na(fun.df[,"REMOTE2000"]),fun.df[,"REMOTE1994"],fun.df[,"REMOTE2000"])
  # 3.1.2. BANKSTAB
  fun.df[,"BANKSTAB"] <- ifelse(is.na(fun.df[,"BANKSTAB2000"]),fun.df[,"BANKSTAB1994"],fun.df[,"BANKSTAB2000"])
  # 3.2. Rescale from 0:1 to 0:100 and set min and max of 0 and 100
  fun.df[,name.PHI] <- apply(fun.df[,name.PHI],c(1,2), function(x) 100*max(0,min(1,x)))
  #
  # 4.0. Final PHI Score.  Sum Metrics and divide by the proper denominator####
  fun.df[,"PHI.sum"] <- rowSums(fun.df[,name.PHI],na.rm=TRUE)
  fun.df[,"PHI"] <- fun.df[,"PHI.sum"]/fun.df[,"PHI.denom"]
  #
  # 5.0. Return result dataframe####
  return(fun.df)
  #
}##fun.PHI.END
