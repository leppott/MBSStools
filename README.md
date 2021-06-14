README-MBSStools
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

    #> Last Update: 2021-06-14 15:39:48

Suite of tools for data manipulation and calculations for Maryland DNR
MBSS program.

## Badges

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/leppott/MBSStools/graphs/commit-activity)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)

[![License: GPL (&gt;=
3)](https://img.shields.io/badge/license-GPL%20(%3E=%203)-blue.svg)](https://cran.r-project.org/web/licenses/GPL%20(%3E=%203))

[![CodeFactor](https://www.codefactor.io/repository/github/leppott/MBSStools/badge)](https://www.codefactor.io/repository/github/leppott/MBSStools)
[![codecov](https://codecov.io/gh/leppott/MBSStools/branch/master/graph/badge.svg)](https://codecov.io/gh/leppott/MBSStools)
[![R-CMD-check](https://github.com/leppott/MBSStools/workflows/R-CMD-check/badge.svg)](https://github.com/leppott/MBSStools/actions)

[![GitHub
issues](https://img.shields.io/github/issues/leppott/MBSStools.svg)](https://GitHub.com/leppott/MBSStools/issues/)

[![GitHub
release](https://img.shields.io/github/release/leppott/MBSStools.svg)](https://GitHub.com/leppott/MBSStools/releases/)
[![Github all
releases](https://img.shields.io/github/downloads/leppott/MBSStools/total.svg)](https://GitHub.com/leppott/MBSStools/releases/)

## Installation

To install the current version of this package use the code below to
install from GitHub. The use of “force = TRUE” ensures the package is
installed even if already present. If the package `remotes` is missing
the code below will install it. Vigenettes are not insalled by default.
The use of “build\_vignettes = TRUE” will install the vignettes.

``` r
if(!require(remotes)){install.packages("remotes")}  #install if needed
install_github("leppott/MBSStools", force=TRUE, build_vignettes = TRUE)
```

## Purpose

To aid MBSS staff with calculations and data manipulations.

## Status

Stable. Minor updates planned in FY2021.

## Usage

By MBSS staff or those using MBSS data.

## Documentation

Included Vignette and install guide.
