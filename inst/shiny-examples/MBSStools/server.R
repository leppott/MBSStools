#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Packages
library(shiny)
library(MBSStools)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # df_import ####
  output$df_import <- renderTable({
    # input$df_import will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.

    inFile <- input$fn_input

    if (is.null(inFile)){
      return(NULL)
    }

    read.csv(inFile$datapath, header = input$header,
             sep = input$sep, quote = input$quote)

    # read.table(file = inFile$datapath, header = input$header,
    #          sep = input$sep, quote = input$quote)
  })##output$df_import~END

  # b_CalcMetVal ####
  # Calculate IBI from df_import
  observeEvent(input$b_CalcMetVal, {
    #
    df_data <- 'df_import'

    if (is.null(df_data))
      return(NULL)

    df_data$Person <- "Erik"

    write.csv(df_data, "MetVal.csv")

    # could calculate values and score in a single step.
    # save each file

    # myIndex <- input$MMI
    # thresh <- MBSStools::metrics_scoring
    # myMetrics <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"])))
    #
    # myCommunity <- Community[match(myIndex, MMIs)]
    #
    # myMetric.Values <- metric.values(df_data, myCommunity, myMetrics)
    #
    # return(myMetric.Values)

  })##observeEvent~b_CalcIBI~END

  # df_metric_values ####
  output$df_metric_values <- renderTable({
    # input$df_metric_values will be NULL initially. After the user
    # calculates an IBI, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.

    inFile <- input$df_import

    if (is.null(inFile)){
      return(NULL)
    }

    myIndex <- input$MMI
    thresh <- MBSStools::metrics_scoring
    myMetrics <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"])))

    myCommunity <- Community[match(myIndex, MMIs)]

    myMetric.Values <- metric.values(inFile, myCommunity, myMetrics)

    return(myMetric.Values)

  })##output$df_import~END

  # df_metric_scores ####
  output$df_metric_scores <- renderTable({
    # input$df_metric_scores will be NULL initially. After the user
    # calculates an IBI, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.

    inFile <- input$df_metric_values

    if (is.null(inFile)){
      return(NULL)
    }

    myIndex <- input$MMI
    thresh <- MBSStools::metrics_scoring
    myMetrics <- as.character(droplevels(unique(thresh[thresh[,"Index.Name"]==myIndex,"Metric"])))

    myCommunity <- Community[match(myIndex, MMIs)]

    myData <- input$df_import

    myMetric.Scores <- metric.scores(inFile, myData, "INDEX.NAME", "STRATA_R", thresh)

    return(myMetric.Scores)

  })##output$df_import~END

  # b_download ####
  # Downloadable csv of selected dataset ----
  output$b_downloadData <- downloadHandler(
    # use index and date time as file name
    #myDateTime <- format(Sys.time(), "%Y%m%d_%H%M%S")




    filename = function() {
      paste(input$dataset, "_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
      # Save Values
      # Save Scores
      # Create Zip file
    }
  )##downloadData~END

})##shinyServer~END
