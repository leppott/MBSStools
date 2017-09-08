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
#' # Fish Metrics (generate values then score)
#' myIndex <- "MBSS.2005.Fish"
#' # Thresholds
#' thresh <- metrics_scoring
#' # get metric names for myIndex
#' (myMetrics.Fish <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"]))))
#' # Taxa Data
#' myDF.Fish <- taxa_fish
#' Metrics.Fish <- metric.values(myDF.Fish, "SampleID", "fish", myMetrics.Fish, TRUE)
#' View(Metrics.Fish)
#' # SCORE
#' Metrics.Fish.Scores <- metric.scores(Metrics.Fish, myMetrics.Fish, "Index.Name", "FIBISTRATA", thresh)
#' # View Results
#' View(Metrics.Fish.Scores)
#'
# ## Load thresholds
# thresh <- metrics_scoring
# View(thresh)
# ## Define Index
# IndexName <- "MBSS.2005.Bugs"
#
# ## Score Single Value
# MetricName <- "nt_total"
# MetricValue <- 18
# IndexRegion <- "COASTAL"
# metric.scores(MetricName,MetricValue,IndexName,IndexRegion,thresh) # 3
#
# ## Score Data Frame of Values
# # get metrics to score
# (myMetrics <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==IndexName,"Metric"]))))
# for (i in myMetrics){##FOR.i.START
#   i.sc.nam <- paste0("Sc_",i)
#   i.val <- Metrics.Bugs[,i]
#   Metrics.Bugs[,i.sc.nam] <- metric.score(i,i.val,Metrics.Bugs$Index,Metrics.Bugs$Region,thresh)
#   #
# }##FOR.i.END
# #
# ## View Results
# View(Metrics.Bugs)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # QC
# library(dplyr)
# # get data
# myIndex <- "MBSS.2005.Fish"
# thresh <- metrics_scoring
# (myMetrics.Fish <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"]))))
# myDF.Fish <- taxa_fish
# # calc metrics
# Metrics.Fish <- metric.values(myDF.Fish, "SampleID", "fish", myMetrics.Fish, TRUE)
# # Loop Parts
# i <- myMetrics[1]
# i.sc.nam <- paste0("SC_",i)
# i.val <- Metrics.Fish[,i]
# # function parts
# MetricName <- i
# MetricValue <- i.val
# IndexName <- Metrics.Fish$Index.Name
# IndexRegion <- Metrics.Fish$FIBISTRATA
# Thresh <- thresh
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
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="COASTAL"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="EPIEDMONT"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="HIGHLAND"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="WARM"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Fish" & DF_Metrics[,IndexRegion]=="COLD"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/4
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Bugs" & DF_Metrics[,IndexRegion]=="COASTAL"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/7
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Bugs" & DF_Metrics[,IndexRegion]=="EPIEDMONT"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  myTF <- DF_Metrics[,IndexName]=="MBSS.2005.Bugs" & DF_Metrics[,IndexRegion]=="HIGHLAND"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/8
  myTF <- DF_Metrics[,IndexName]=="MSW.1998.Bugs" & DF_Metrics[,IndexRegion]=="CP"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/7
  myTF <- DF_Metrics[,IndexName]=="MSW.1998.Bugs" & DF_Metrics[,IndexRegion]=="NCP"
    DF_Metrics[,"IBI"][myTF,] <- DF_Metrics[myTF,"sum_IBI"]/6
  #
  # Return original DF with added columns
  return(DF_Metrics)
  #
}##FUNCTION.metric.score.END
