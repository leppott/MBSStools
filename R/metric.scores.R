#' Score metrics
#'
#' This function calculates metric scores based on a Thresholds data frame.
#' Can generate scores for 1/3/5 (ScoreRegime="135") for MD DNR MBSS FIBI and BIBI.
#'
#' The inputs and outputs have been designed to mimic those used by MBSS staff.
#'
#' The R library dplyr is needed for this function.
#
#' @param DF_Metrics Data frame of metric values (as columns), Index Name, and
#' Index Region (strata).
#' @param MetricNames Names of columns of metric values.
#' @param IndexName Nam of column with index (e.g., MBSS.2005.Bugs)
#' @param IndexRegion Name of column with relevant bioregion or site class
#' (e.g., COASTAL).
#' @param DF_Thresh Data frame of Scoring Thresholds (Index.Name, Index.Region,
#' Metric, Direction, Thresh.Lo, Thresh.Hi, ScoreRegime)
#' @return vector of scores
#' @examples
#' # Metrics, Fish
#' #(generate values then score)s
#' myIndex <- "MBSS.2005.Fish"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Fish <- as.character(droplevels(unique(thresh[thresh[,
#' "Index.Name"]==myIndex,"MetricName.Other"]))))
#' # Taxa Data
#' myDF.Fish <- taxa_fish
#' myMetric.Values.Fish <- metric.values(myDF.Fish, "fish", myMetrics.Fish,
#' TRUE)
#' View(myMetric.Values.Fish)
#' # SCORE
#' Metrics.Fish.Scores <- metric.scores(myMetric.Values.Fish, myMetrics.Fish,
#' "Index.Name", "FIBISTRATA", thresh)
#' # View Results
#' View(Metrics.Fish.Scores)
#' # Add Narrative
#' myBreaks <- c(1:5)
#' myLabels <- c("Very Poor", "Poor", "Fair", "Good")
#' Metrics.Fish.Scores$IBI_Nar <- cut(Metrics.Fish.Scores$IBI
#'                                    , breaks=myBreaks, labels=myLabels
#'                                    , include.lowest=TRUE, right=FALSE, ordered_result=TRUE)
#' # QC, IBI Numeric vs. Narrative
#' table(Metrics.Fish.Scores$IBI, Metrics.Fish.Scores$IBI_Nar, useNA="ifany")
#'
#' # Metrics, Index, Benthic Macroinvertebrates, genus
#' # (generate values then scores)
#' myIndex <- "MBSS.2005.Bugs"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Bugs.MBSS <- as.character(droplevels(unique(thresh[thresh[,
#' "Index.Name"]==myIndex,"MetricName.Other"]))))
#' # Taxa Data
#' myDF.Bugs.MBSS <- taxa_bugs_genus
#' myMetric.Values.Bugs.MBSS <- metric.values(myDF.Bugs.MBSS, "bugs",
#' myMetrics.Bugs.MBSS)
#' View(myMetric.Values.Bugs.MBSS)
#' # SCORE
#' Metrics.Bugs.Scores.MBSS <- metric.scores(myMetric.Values.Bugs.MBSS,
#' myMetrics.Bugs.MBSS, "INDEX.NAME", "STRATA_R", thresh)
#' # View Results
#' View(Metrics.Bugs.Scores.MBSS)
#' # Add Narrative
#' myBreaks <- c(1:5)
#' myLabels <- c("Very Poor", "Poor", "Fair", "Good")
#' Metrics.Bugs.Scores.MBSS$IBI_Nar <- cut(Metrics.Bugs.Scores.MBSS$IBI
#'                                    , breaks=myBreaks, labels=myLabels
#'                                    , include.lowest=TRUE, right=FALSE, ordered_result=TRUE)
#' # QC, IBI Numeric vs. Narrative
#' table(Metrics.Bugs.Scores.MBSS$IBI, Metrics.Bugs.Scores.MBSS$IBI_Nar, useNA="ifany")
#'
#' # QC bug count
#' Metrics.Bugs.Scores.MBSS[Metrics.Bugs.Scores.MBSS[,"totind"]>120,
#' "QC_Count"] <- "LARGE"
#' Metrics.Bugs.Scores.MBSS[Metrics.Bugs.Scores.MBSS[,"totind"]<60,
#' "QC_Count"] <- "SMALL"
#' Metrics.Bugs.Scores.MBSS[is.na(Metrics.Bugs.Scores.MBSS[,"QC_Count"]),
#' "QC_Count"] <- "OK"
#' # table of QC_Count
#' table(Metrics.Bugs.Scores.MBSS$QC_Count)
#'
#' # Metrics, MSW Index, Benthic Macroinvertebrates, family
#' myIndex <- "MSW.1999.Bugs"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Bugs.MSW <- as.character(droplevels(unique(thresh[thresh[,
#' "Index.Name"]==myIndex,"MetricName.Other"]))))
#' # Taxa Data
#' myDF.Bugs.MSW <- taxa_bugs_family
#' myMetric.Values.Bugs.MSW <- metric.values(myDF.Bugs.MSW, "bugs",
#' myMetrics.Bugs.MSW)
#' View(myMetric.Values.Bugs.MSW)
#' # SCORE
#' Metrics.Bugs.Scores.MSW <- metric.scores(myMetric.Values.Bugs.MSW,
#' myMetrics.Bugs.MSW, "INDEX.NAME", "STRATA_R", thresh)
#' # View Results
#' View(Metrics.Bugs.Scores.MSW)
#' # Add Narrative
#' myBreaks <- c(1:5)
#' myLabels <- c("Very Poor", "Poor", "Fair", "Good")
#' Metrics.Bugs.Scores.MSW$IBI_Nar <- cut(Metrics.Bugs.Scores.MSW$IBI
#'                                    , breaks=myBreaks, labels=myLabels
#'                                    , include.lowest=TRUE, right=FALSE, ordered_result=TRUE)
#' # QC, IBI Numeric vs. Narrative
#' table(Metrics.Bugs.Scores.MSW$IBI, Metrics.Bugs.Scores.MSW$IBI_Nar, useNA="ifany")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~
# QC
## FISH
# library(dplyr)
#
# DF_Metrics <- myMetric.Values.Fish
# MetricNames <- myMetrics.Fish
# IndexName <- "Index.Name"
# IndexRegion <- "FIBISTRATA"
# DF_Thresh <- thresh
# #
# a <- unique(as.matrix(DF_Metrics[,IndexName]))[1]
# b <- unique(as.matrix(DF_Metrics[,IndexRegion]))[1]
# c <- MetricNames[7]
# a
# b
# c
#
# x <- metric.scores(Metrics.Fish, myMetrics.Fish, "Index.Name",
# "FIBISTRATA", thresh)
#~~~~~~~~~
# library(dplyr)
# DF_Metrics <- Metrics.Bugs
# MetricNames <- myMetrics.Bugs
# IndexName <- "INDEX.NAME"
# IndexRegion <- "STRATA_R"
# DF_Thresh <- thresh
# #
# y <- metric.scores(Metrics.Bugs,myMetrics.Bugs, "INDEX.NAME","STRATA_R",
# thresh)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @export
metric.scores <- function(DF_Metrics, MetricNames, IndexName, IndexRegion, DF_Thresh) {##FUNCTION.metric.score.START
  #Define Inputs
  # @param MetricName metric abbreviation
  # @param MetricValue calculated metric value
  # @param IndexName name of scoring regime (e.g., MBSS Fish)
  # @param IndexRegion relevant bioregion or site class for given index
  # @param Thresh Data frame of Scoring Thresholds (Index.Name, Index.Region, Metric, Direction, Thresh.Lo, Thresh.Hi, ScoreRegime)
  #
  #if(missing(myRegion)) {print "Error; Missing 'region'."}
  #if(missing(myValue)) {print "Error; Missing 'value'."}
  #if(missing(myMetric)) {print "Error; Missing 'metric name'."}
  #
  boo_DEBUG <- FALSE
  if(boo_DEBUG==TRUE){##IF~boo_DEBUG~START
    # Fish
    DF_Metrics <- myMetric.Values.Fish
    MetricNames <- myMetrics.Fish
    IndexName <- "Index.Name"
    IndexRegion <- "FIBISTRATA"
    # Bugs
    DF_Metrics <- myMetric.Values.Bugs.MBSS
    MetricNames <- myMetrics.Bugs.MBSS
    IndexName <- "INDEX.NAME"
    IndexRegion <- "STRATA_R"
    #
    #
    DF_Thresh <- thresh
    #
    a <- unique(as.matrix(DF_Metrics[,IndexName]))[1]
    b <- unique(as.matrix(DF_Metrics[,IndexRegion]))[1]
    c <- MetricNames[3]
  }##IF~boo_DEBUG~END

  # Rename columns based
  if("Index.Name" %in% names(DF_Metrics)==FALSE){
    DF_Metrics[,"Index.Name"] <- DF_Metrics[,IndexName]
  }
  if("Index.Region" %in% names(DF_Metrics)==FALSE){
    DF_Metrics[,"Index.Region"] <- DF_Metrics[,IndexRegion]
  }

  # # # QC, Column Names
  # myFlds <- c("INDEX.NAME", "Index.Region", "Metric")
  # # Error check on fields
  # if (length(myFlds)!=sum(myFlds %in% names(DF_Thresh))) {
  #   myMsg <- paste0("Fields missing from input data frame.  Expecting: \n",paste(myFlds,sep="",collapse=", "),collapse="")
  #   stop(myMsg)
  # } ## IF ~ length ~ END
  #
  # Add "SCORE" columns for each metric
  Score.MetricNames <- paste0("SC_", MetricNames)
  DF_Metrics[, Score.MetricNames] <- 0
  #
  # Need to cycle based on Index (a), Region (b), and Metric (c)
  for (a in unique(as.matrix(DF_Metrics[,IndexName]))){##FOR.a.START
    for (b in unique(as.matrix(DF_Metrics[,IndexRegion]))) {##FOR.b.START
      for (c in MetricNames){##FOR.c.START
        # Thresholds (filter with dplyr)
        fun.Thresh.myMetric <- dplyr::filter(DF_Thresh, Index.Name==a & Index.Region==b & MetricName.Other==c)
        # QC
        #stopifnot(nrow(fun.Thresh.myMetric)==1)
        if(nrow(fun.Thresh.myMetric)!=1){
          #return(0)
          next
        }
        # thresholds
        fun.Lo          <- fun.Thresh.myMetric[,"Thresh.Lo"]
        fun.Hi          <- fun.Thresh.myMetric[,"Thresh.Hi"]
        fun.Direction   <- fun.Thresh.myMetric[,"Direction"]
        fun.ScoreRegime <- fun.Thresh.myMetric[,"ScoreRegime"]
        #
        # default value
        fun.Value <- DF_Metrics[,c]
        fun.Result <- fun.Value * 0  #default value of zero
        #
        #
        if(fun.ScoreRegime=="100"){##IF.scoring.START
          if(fun.Direction=="Decrease"){
            fun.Result <- median(c(0,100,100*((fun.Value-fun.Lo)/(fun.Hi-fun.Lo))))
          }else if (fun.Direction=="Increase") {
            fun.Result <- median(c(0,100,100*((fun.Hi-fun.Value)/(fun.Hi-fun.Lo))))
          }
        } else if(fun.ScoreRegime=="135"){
          if(fun.Direction=="Decrease") {
            fun.Result <- ifelse(fun.Value>=fun.Hi,5,ifelse(fun.Value<fun.Lo,1,3))
          } else if (fun.Direction=="Increase") {
            fun.Result <- ifelse(fun.Value<=fun.Lo,5,ifelse(fun.Value>fun.Hi,1,3))
          }
        } else if(is.na(fun.ScoreRegime)) {
          fun.Result <- 0
        } else {
          fun.Result <- 0
        }##IF.scoring.END
        #
        # Update input DF with matching values
        myTF <- DF_Metrics[,IndexName]==a & DF_Metrics[,IndexRegion]==b
        DF_Metrics[myTF,paste0("SC_",c)] <- fun.Result[myTF]
      }##FOR.c.END
    }##FOR.a.END
  }##FOR.b.END
  #

  # Convert to data frame
  DF_Metrics <- data.frame(DF_Metrics)


  # 2020-05-19
  # QC check for 0 organisms
  # MBSS gets a 1, Very Poor
  # Any metrics > 0 will be reset to 0

  if("TOTCNT" %in% names(DF_Metrics)){
    # FISH
    myTF <- DF_Metrics[, "TOTCNT"] == 0 & DF_Metrics[, Score.MetricNames] > 0
    myTF_zero_n <- sum(DF_Metrics[, "TOTCNT"] == 0)
    DF_Metrics[, Score.MetricNames][myTF] <- 1
    if(myTF_zero_n >0){
      msg_QC_NumOrg_Fish <- paste0("One or more fish samples (n = ", myTF_zero_n
                           , ") had zero organisms and was scored as a 1 (metrics and IBI).")
    message(msg_QC_NumOrg_Fish)
    }##IF ~ myTF_zero_n ~ END
  } else if("totind" %in% names(DF_Metrics)){
    # BUGS
    myTF_small <- DF_Metrics[, "totind"] < 60
    myTF_large <- DF_Metrics[, "totind"] > 120
    myTF_small_n <- sum(myTF_small)
    myTF_large_n <- sum(myTF_large)
    msg_QC_NumOrg_Bugs <- paste0("One or more bug samples had < 60 (n = ", myTF_small_n
                                 ,") or > 120 (n = ", myTF_large_n
                                 ,") organisms.\nThese samples should be further examined.")
    if((myTF_small_n + myTF_large_n) > 0) {message(msg_QC_NumOrg_Bugs)}
  }## IF ~ Score zero for no individuals ~ END


  # Score Final Index
  DF_Metrics[,"sum_IBI"] <- 0
  DF_Metrics[,"IBI"]     <- 0
  # sum all metrics
  DF_Metrics[,"sum_IBI"] <- rowSums(DF_Metrics[,Score.MetricNames])
  # divide by number of metrics for each region
  ## Fish
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Fish" & DF_Metrics[, IndexRegion] == "COASTAL"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Fish" & DF_Metrics[, IndexRegion] == "EPIEDMONT"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Fish" & DF_Metrics[, IndexRegion] == "HIGHLAND"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Fish" & DF_Metrics[, IndexRegion] == "COLD"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/4
  ## Bugs, Genus
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Bugs" & DF_Metrics[, IndexRegion] == "COASTAL"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/7
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Bugs" & DF_Metrics[, IndexRegion] == "EPIEDMONT"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName] == "MBSS.2005.Bugs" & DF_Metrics[, IndexRegion] == "HIGHLAND"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/8
  ## Bugs, Family
  myTF <- DF_Metrics[,IndexName] == "MSW.1999.Bugs" & DF_Metrics[, IndexRegion] == "CP"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/7
  myTF <- DF_Metrics[,IndexName] == "MSW.1999.Bugs" & DF_Metrics[, IndexRegion] == "NCP"
    DF_Metrics[, "IBI"][myTF] <- DF_Metrics[myTF, "sum_IBI"]/7
  #
  # Return original DF with added columns
  return(DF_Metrics)
  #
}##FUNCTION.metric.score.END
