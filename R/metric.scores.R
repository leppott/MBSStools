#' Score metrics
#'
#' This function calculates metric scores based on a Thresholds data frame.
#' Can generate scores for 1/3/5 (ScoreRegime="135") or 0-100 (ScoreRegime="100").
#
#' @param DF_Metrics Data frame of metric values (as columns), Index Name, and Index Region (strata).
#' @param MetricNames Names of columns of metric values.
#' @param IndexName Nam of column with index (e.g., MBSS.2005.Bugs)
#' @param IndexRegion Name of column with relevant bioregion or site class (e.g., COASTAL).
#' @param DF_Thresh Data frame of Scoring Thresholds (Index.Name, Index.Region, Metric, Direction, Thresh.Lo, Thresh.Hi, ScoreRegime)
#' @return vector of scores
#' @examples
#' # Metrics, Fish
#' #(generate values then score)s
#' myIndex <- "MBSS.2005.Fish"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Fish <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"]))))
#' # Taxa Data
#' myDF.Fish <- taxa_fish
#' myMetric.Values.Fish <- metric.values(myDF.Fish, "fish", myMetrics.Fish, TRUE)
#' View(myMetric.Values.Fish)
#' # SCORE
#' Metrics.Fish.Scores <- metric.scores(myMetric.Values.Fish, myMetrics.Fish, "Index.Name", "FIBISTRATA", thresh)
#' # View Results
#' View(Metrics.Fish.Scores)
#'
#' # Metrics, Index, Benthic Macroinvertebrates, genus
#' # (generate values then scores)
#' myIndex <- "MBSS.2005.Bugs"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Bugs.MBSS <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"]))))
#' # Taxa Data
#' myDF.Bugs.MBSS <- taxa_bugs_genus
#' myMetric.Values.Bugs.MBSS <- metric.values(myDF.Bugs.MBSS, "bugs", myMetrics.Bugs.MBSS)
#' View(myMetric.Values.Bugs.MBSS)
#' # SCORE
#' Metrics.Bugs.Scores.MBSS <- metric.scores(myMetric.Values.Bugs.MBSS, myMetrics.Bugs.MBSS, "INDEX.NAME", "STRATA_R", thresh)
#' # View Results
#' View(Metrics.Bugs.Scores.MBSS)
#'
#' # QC bug count
#' Metrics.Bugs.Scores.MBSS[Metrics.Bugs.Scores.MBSS[,"totind"]>120,"QC_Count"] <- "LARGE"
#' Metrics.Bugs.Scores.MBSS[Metrics.Bugs.Scores.MBSS[,"totind"]<60,"QC_Count"] <- "SMALL"
#' Metrics.Bugs.Scores.MBSS[is.na(Metrics.Bugs.Scores.MBSS[,"QC_Count"]),"QC_Count"] <- "OK"
#' # table of QC_Count
#' table(Metrics.Bugs.Scores.MBSS$QC_Count)
#'
#' # Metrics, MSW Index, Benthic Macroinvertebrates, family
#' myIndex <- "MSW.1999.Bugs"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Bugs.MSW <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"]))))
#' # Taxa Data
#' myDF.Bugs.MSW <- taxa_bugs_family
#' myMetric.Values.Bugs.MSW <- metric.values(myDF.Bugs.MSW, "bugs", myMetrics.Bugs.MSW)
#' View(myMetric.Values.Bugs.MSW)
#' # SCORE
#' Metrics.Bugs.Scores.MSW <- metric.scores(myMetric.Values.Bugs.MSW, myMetrics.Bugs.MSW, "INDEX.NAME", "STRATA_R", thresh)
#' # View Results
#' View(Metrics.Bugs.Scores.MSW)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~
# QC
## FISH
# library(dplyr)
#
# DF_Metrics <- Metrics.Fish
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
# x <- metric.scores(Metrics.Fish, myMetrics.Fish, "Index.Name", "FIBISTRATA", thresh)
#~~~~~~~~~
# library(dplyr)
# DF_Metrics <- Metrics.Bugs
# MetricNames <- myMetrics.Bugs
# IndexName <- "INDEX.NAME"
# IndexRegion <- "STRATA_R"
# DF_Thresh <- thresh
# #
# y <- metric.scores(Metrics.Bugs,myMetrics.Bugs, "INDEX.NAME","STRATA_R",thresh)
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
  # QC, Column Names
  myFlds <- c("Index.Name", "Index.Region", "Metric")
  # Error check on fields
  if (length(myFlds)!=sum(myFlds %in% names(DF_Thresh))) {
    myMsg <- paste0("Fields missing from input data frame.  Expecting: \n",paste(myFlds,sep="",collapse=", "),collapse="")
    stop(myMsg)
  }
  #
  # Add "SCORE" columns for each metric
  Score.MetricNames <- paste0("SC_",MetricNames)
  DF_Metrics[,Score.MetricNames] <- 0
  #
  # Need to cycle based on Index (a), Region (b), and Metric (c)
  for (a in unique(as.matrix(DF_Metrics[,IndexName]))){##FOR.a.START
    for (b in unique(as.matrix(DF_Metrics[,IndexRegion]))) {##FOR.b.START
      for (c in MetricNames){##FOR.c.START
        # Thresholds (filter with dplyr)
        fun.Thresh.myMetric <- dplyr::filter(DF_Thresh, Index.Name==a & Index.Region==b & Metric==c)
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
  # Score Final Index
  DF_Metrics[,"sum_IBI"] <- 0
  DF_Metrics[,"IBI"]     <- 0
  # sum all metrics
  DF_Metrics[,"sum_IBI"] <- rowSums(DF_Metrics[,Score.MetricNames])
  # divide by number of metrics for each region
  ## Fish
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="COASTAL"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="EPIEDMONT"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="WARM"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="COLD"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/4
  ## Bugs, Genus
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Bugs" & DF_Metrics[,IndexRegion]=="COASTAL"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/7
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Bugs" & DF_Metrics[,IndexRegion]=="EPIEDMONT"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Bugs" & DF_Metrics[,IndexRegion]=="HIGHLAND"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/8
  ## Bugs, Family
  myTF <- DF_Metrics[,IndexName]=="MSW.1999.Bugs" & DF_Metrics[,IndexRegion]=="CP"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/7
  myTF <- DF_Metrics[,IndexName]=="MSW.1999.Bugs" & DF_Metrics[,IndexRegion]=="NCP"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/7
  #
  # Return original DF with added columns
  return(DF_Metrics)
  #
}##FUNCTION.metric.score.END
