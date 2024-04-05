# qc_taxa ####
# bugs, only_mbss ####
test_that("qc_taxa, bugs, only_MBSS", {
  DF_User <- taxa_bugs_genus
  DF_Official <-  NULL   # NULL df_mt_bugs
  fun.Community <- "bugs"
  useMBSSTaxaInfo <- "only_MBSS"
  df_qc_taxa <- qc_taxa(DF_User, DF_Official, fun.Community, useMBSSTaxaInfo)
  # Copied expected output
  names_qc <- c("TAXON"
                , "INDEX.NAME"
                , "SITE"
                , "DATE"
                , "N_TAXA"
                , "N_GRIDS"
                , "EXCLUDE"
                 , "STRATA_R"
                 , "PHYLUM_NonOfficial"
                 , "CLASS_NonOfficial"
                 , "ORDER_NonOfficial"
                 , "FAMILY_NonOfficial"
                 , "GENUS_NonOfficial"
                 , "OTHER_TAXA_NonOfficial"
                 , "TRIBE_NonOfficial"
                 , "FFG_NonOfficial"
                 , "FAM_TV_NonOfficial"
                 , "HABIT_NonOfficial"
                 , "FINALTOLVAL07_NonOfficial"
                 , "FINALTOLVAL08"
                 , "PHYLUM"
                 , "CLASS"
                 , "ORDER"
                 , "FAMILY"
                 , "GENUS"
                 , "OTHER_TAXA"
                 , "TRIBE"
                 , "FFG"
                 , "FAM_TV"
                 , "HABIT"
                 , "FINALTOLVAL07"
                 , "COMMENT" )
  # test
  expect_equal(names(df_qc_taxa), names_qc)
})

# bugs, only_user ####
test_that("qc_taxa, bugs, only_user", {
  DF_User<- taxa_bugs_genus
  DF_Official <- NULL   # NULL df_mt_bugs
  fun.Community <- "bugs"
  useMBSSTaxaInfo <- "only_user"
  df_qc_taxa <- qc_taxa(DF_User, DF_Official, fun.Community, useMBSSTaxaInfo)
  # Copied expected output
  names_qc <- c("TAXON"
                , "INDEX.NAME"
                , "SITE"
                , "DATE"
                , "N_TAXA"
                , "N_GRIDS"
                , "EXCLUDE"
                , "STRATA_R"
                , "PHYLUM"
                , "CLASS"
                , "ORDER"
                , "FAMILY"
                , "GENUS"
                , "OTHER_TAXA"
                , "TRIBE"
                , "FFG"
                , "FAM_TV"
                , "HABIT"
                , "FINALTOLVAL07"
                , "FINALTOLVAL08"
                , "PHYLUM_Official"
                , "CLASS_Official"
                , "ORDER_Official"
                , "FAMILY_Official"
                , "GENUS_Official"
                , "OTHER_TAXA_Official"
                , "TRIBE_Official"
                , "FFG_Official"
                , "FAM_TV_Official"
                , "HABIT_Official"
                , "FINALTOLVAL07_Official"
                , "COMMENT" )
  # test
  expect_equal(names(df_qc_taxa), names_qc)
})

# bugs, add_new ####
test_that("qc_taxa, bugs, add_new", {
  DF_User<- taxa_bugs_genus
  DF_Official <- NULL   # NULL df_mt_bugs
  fun.Community <- "bugs"
  useMBSSTaxaInfo <- "add_new"
  df_qc_taxa <- qc_taxa(DF_User, DF_Official, fun.Community, useMBSSTaxaInfo)
  # Copied expected output
  names_qc <- c("TAXON"
                , "INDEX.NAME"
                , "SITE"
                , "DATE"
                , "N_TAXA"
                , "N_GRIDS"
                , "EXCLUDE"
                , "STRATA_R"
                , paste0(c("PHYLUM"
                            , "CLASS"
                            , "ORDER"
                            , "FAMILY"
                            , "GENUS"
                            , "OTHER_TAXA"
                            , "TRIBE"
                            , "FFG"
                            , "FAM_TV"
                            , "HABIT"
                            , "FINALTOLVAL07")
                         , "_NonOfficial")
                , "FINALTOLVAL08"
                , "PHYLUM"
                , "CLASS"
                , "ORDER"
                , "FAMILY"
                , "GENUS"
                , "OTHER_TAXA"
                , "TRIBE"
                , "FFG"
                , "FAM_TV"
                , "HABIT"
                , "FINALTOLVAL07"
                , "COMMENT"  )
  # test
  expect_equal(names(df_qc_taxa), names_qc)
})

# fish, only_mbss ####
test_that("qc_taxa, fish, only_MBSS", {
  DF_User<- taxa_fish
  DF_Official <- NULL  # NULL df_mt_fish
  fun.Community <- "fish"
  useMBSSTaxaInfo <- "only_MBSS"
  df_qc_taxa <- qc_taxa(DF_User, DF_Official, fun.Community, useMBSSTaxaInfo)
  # Copied expected output
  names_qc <- c("SPECIES"
                , "SITE"
                , "TOTAL"
                , "TYPE_NonOfficial"
                , "PTOLR_NonOfficial"
                , "NATIVE_MBSS"
                , "TROPHIC_MBSS"
                , "SILT_NonOfficial"
                , "PIRHALLA_NonOfficial"
                , "FIBISTRATA"
                , "ACREAGE"
                , "LEN_SAMP"
                , "AVWID"
                , "TOTBIOM"
                , "INDEX.NAME"
                , "TYPE"
                , "PTOLR"
                , "NATIVE"
                , "TROPHIC"
                , "SILT"
                , "PIRHALLA"
                , "DATE.ADDED"
                , "REASON"
                , "SOURCE"
                , "FAM"
                , "GENUS"
                , "SP_SCI"
                , "IN_KEY"
                , "APPROX_ID"  )
  # test
  expect_equal(names(df_qc_taxa), names_qc)
})

# fish, only_user ####
test_that("qc_taxa, fish, only_user", {
  DF_User<- taxa_fish
  DF_Official <- NULL  # NULL df_mt_fish
  fun.Community <- "fish"
  useMBSSTaxaInfo <- "only_user"
  df_qc_taxa <- qc_taxa(DF_User, DF_Official, fun.Community, useMBSSTaxaInfo)
  # Copied expected output
  names_qc <- c("SPECIES"
                , "SITE"
                , "TOTAL"
                , "TYPE"
                , "PTOLR"
                , "NATIVE_MBSS"
                , "TROPHIC_MBSS"
                , "SILT"
                , "PIRHALLA"
                , "FIBISTRATA"
                , "ACREAGE"
                , "LEN_SAMP"
                , "AVWID"
                , "TOTBIOM"
                , "INDEX.NAME"
                , "TYPE_Official"
                , "PTOLR_Official"
                , "NATIVE"
                , "TROPHIC"
                , "SILT_Official"
                , "PIRHALLA_Official"
                , "DATE.ADDED"
                , "REASON"
                , "SOURCE"
                , "FAM"
                , "GENUS"
                , "SP_SCI"
                , "IN_KEY"
                , "APPROX_ID"  )
  # test
  expect_equal(names(df_qc_taxa), names_qc)
})

# fish, add_new ####
test_that("qc_taxa, fish, add_new", {
  DF_User<- taxa_fish
  DF_Official <- NULL  # NULL df_mt_fish
  fun.Community <- "fish"
  useMBSSTaxaInfo <- "add_new"
  df_qc_taxa <- qc_taxa(DF_User, DF_Official, fun.Community, useMBSSTaxaInfo)
  # Copied expected output
  names_qc <- c("SPECIES"
                , "SITE"
                , "TOTAL"
                , "TYPE_NonOfficial"
                , "PTOLR_NonOfficial"
                , "NATIVE_MBSS"
                , "TROPHIC_MBSS"
                , "SILT_NonOfficial"
                , "PIRHALLA_NonOfficial"
                , "FIBISTRATA"
                , "ACREAGE"
                , "LEN_SAMP"
                , "AVWID"
                , "TOTBIOM"
                , "INDEX.NAME"
                , "TYPE"
                , "PTOLR"
                , "NATIVE"
                , "TROPHIC"
                , "SILT"
                , "PIRHALLA"
                , "DATE.ADDED"
                , "REASON"
                , "SOURCE"
                , "FAM"
                , "GENUS"
                , "SP_SCI"
                , "IN_KEY"
                , "APPROX_ID"   )
  # test
  expect_equal(names(df_qc_taxa), names_qc)
})
