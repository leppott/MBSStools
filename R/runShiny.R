#' @title run MBSStools Shiny Example
#'
#' @description Launches Shiny app for MBSStools.
#'
#' @details The Shiny app based on the R package MBSStools is included in the R
#' package. This function launches that app.
#'
#' The Shiny app is online at:
#' https://leppott.shinyapps.io/MBSStools
#'
#' @examples
#' \dontrun{
#' # Run Function
#' runShiny()
#' }
#
#' @export
runShiny <- function(){##FUNCTION.START
  #
  appDir <- system.file("shiny-examples", "MBSStools", package = "MBSStools")
  #
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `MBSStools`."
         , call. = FALSE)
  }
  #
  shiny::runApp(appDir, display.mode = "normal")
  #
}##FUNCTION.END
