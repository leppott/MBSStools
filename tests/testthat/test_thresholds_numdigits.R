# Thresholds, Num Digits, Index ----
## Borrowed from BioMonTools pacakge then modified, 20240405
test_that("thresholds, num digits, index", {
  # Packages
  # no extras neeeded

  # Thresholds
  df_thresh_metric <- metrics_scoring

  # Number of Characters (as character)
  metric_thresh_lo <- nchar(as.character(df_thresh_metric$Thresh_Lo))
  metric_thresh_hi <- nchar(as.character(df_thresh_metric$Thresh_Hi))

  # Number of "bad" entries
  # Max is 11 (MBSS)
  digmax <- 11
  # after that is most likely a floating point error that needs correction
  metric_thresh_lo_nbad  <- sum(metric_thresh_lo > digmax, na.rm = TRUE)
  metric_thresh_hi_nbad  <- sum(metric_thresh_hi > digmax, na.rm = TRUE)

  # Find those rows in Excel with errors
  which(metric_thresh_lo  %in% metric_thresh_lo[metric_thresh_lo > digmax])
  which(metric_thresh_hi  %in% metric_thresh_hi[metric_thresh_hi > digmax])

  # test
  testthat::expect_true(metric_thresh_lo_nbad == 0)
  testthat::expect_true(metric_thresh_hi_nbad == 0)

  # Easiest to View df and find visually
 # View(df_thresh_metric)

})## Test ~ thresholds, num digits ~ END

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
