# PHI ####
test_that("PHI, results", {
  PHI <- PHIcalc(MBSS.PHI)
  # Copied from Excel
  PHI_Standard <- c(59.02141992
                    ,62.70434606
                    ,87.89842641
                    ,87.76676907
                    ,64.51221815
                    ,35.11039551
                    ,65.13186521
                    ,64.81162687
                    ,73.88938366
                    ,45.43697236
                    ,83.01430689
                    ,72.56593345
                    ,64.70419392
                    ,57.70709148
                    ,79.56090051
                    ,79.82200985
                    ,64.54673351
                    ,35.03014725
                    ,48.97443036
                    ,67.48214392
                    ,74.61018256
                    ,76.24030161
                    ,50.83878229
                    ,66.10352411
                    ,67.38694793
                    ,66.06673078
                    ,58.50039121
                    ,59.96818171
                    ,71.81628318
                    ,75.08006614
                    ,83.7658213
                    ,43.16264967
                    ,88.38162708
                    ,71.38502683
                    ,71.19146878
                    ,52.80064486
                    ,78.5033276
                    ,76.96106822
                    ,83.40991121
                    ,73.96606368
                    ,76.37779043
                    ,64.97853075
                    ,63.93758832
                    ,67.40145134
                    ,79.26681668
                    ,76.85635429
                    ,68.91275203
                    ,70.26499808
                    ,80.73456585
                    ,80.51961243
                    ,78.47654263
                    ,80.42801168
                    ,68.08530495
                    ,55.97642684
                    ,70.04267624
                    ,28.74663949
                    ,40.05033719
                    ,40.04995589
                    ,57.44740588
                    ,84.91456786)
  # test
  expect_equal(PHI$PHI, PHI_Standard)
})
