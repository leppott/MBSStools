#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Packages
library(shiny)
library(MBSStools)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("MBSStools, IBI Calculator"),

  # SideBar
  sidebarLayout(
    sidebarPanel(
      h3("1. Load File")
      , fileInput('fn_input', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      )##fileInput~END
      , tags$hr()
      , checkboxInput('header', 'Header', TRUE)
      , radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ',')
      , radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"')
      , tags$hr()
      , h3("2. Calculate IBI")
      , selectInput("MMI", "Select an IBI to calculate:",
                    choices=MMIs)
      , actionButton("b_CalcMetVal", "Calculate Metric Values")
      , actionButton("b_CalcMetSc", "Calculate Metric Scores")
      , tags$hr()
      , h3("3. Download Results")

      # Button
      , p("Select button to download zip file with results.")
      , downloadButton("b_downloadData", "Download")


    )##sidebarPanel~END
    , mainPanel(
        tabsetPanel(type="tabs"
                    , tabPanel("Directions")
                    , tabPanel("Data, Import"
                               , tableOutput('df_import'))
                    , tabPanel("Data, Metric Values"
                               , tableOutput('df_metric_values'))
                    , tabPanel("Data, Metric Scores"
                               , tableOutput('df_metric_scores'))
        )##tabsetPanel~END
    )##mainPanel~END

  )##sidebarLayout~END

))##shinyUI~END
